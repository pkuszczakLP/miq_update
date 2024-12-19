class ManageIQ::Providers::Ovirt::Inventory::Collector::TargetCollection < ManageIQ::Providers::Ovirt::Inventory::Collector
  # TODO: review the changes here and find common parts with ManageIQ::Providers::Ovirt::InfraManager::Inventory::Strategies::V4
  include Vmdb::Logging

  def initialize(_manager, _target)
    super
    parse_targets!
    infer_related_ems_refs!

    # Reset the target cache, so we can access new targets inside
    target.manager_refs_by_association_reset
  end

  def clusters
    return @clusters if @clusters.present? || references(:clusters).blank?

    manager.with_provider_connection do |connection|
      references(:clusters).each do |ems_ref|
        @clusters << connection.system_service.clusters_service.cluster_service(uuid_from_ems_ref(ems_ref)).get
      rescue OvirtSDK4::Error # when 404
        nil
      end
    end

    @clusters
  end

  def networks
    if references(:vms).present? || references(:templates).present?
      return @collect_networks ||= collect_networks
    end

    nets = []
    return nets if references(:networks).blank?

    manager.with_provider_connection do |connection|
      references(:networks).each do |ems_ref|
        nets << connection.system_service.networks_service.network_service(uuid_from_ems_ref(ems_ref)).get
      rescue OvirtSDK4::Error # when 404
        nil
      end
    end

    nets
  end

  def collect_vnic_profiles
    if references(:vms).present? || references(:templates).present?
      return super
    end

    vnics = []
    return vnics if references(:vnic_profiles).blank?

    manager.with_provider_connection do |connection|
      references(:vnic_profiles).each do |ems_ref|
        vnics << connection.system_service.vnic_profiles_service.vnic_profile_service(uuid_from_ems_ref(ems_ref)).get
      rescue OvirtSDK4::Error # when 404
        nil
      end
    end

    vnics
  end

  def storagedomains
    domains = []
    return domains if references(:storagedomains).blank?

    manager.with_provider_connection do |connection|
      references(:storagedomains).each do |ems_ref|
        domains << connection.system_service.storage_domains_service.storage_domain_service(uuid_from_ems_ref(ems_ref)).get
      rescue OvirtSDK4::Error # when 404
        nil
      end
    end

    domains
  end

  def datacenters
    dcs = []
    return dcs if references(:datacenters).blank?

    manager.with_provider_connection do |connection|
      references(:datacenters).each do |ems_ref|
        dcs << connection.system_service.data_centers_service.data_center_service(uuid_from_ems_ref(ems_ref)).get
      rescue OvirtSDK4::Error # when 404
        nil
      end
    end

    dcs
  end

  def datacenter_by_cluster_id
    @datacenter_by_cluster_id ||= begin
      clusters.each_with_object({}) do |cluster, hash|
        hash[cluster.id] = cluster.dig(:data_center, :id)
      end
    end
  end

  def hosts
    return @hosts unless @hosts.empty?

    @hosts = manager.with_provider_connection do |connection|
      references(:hosts).map do |ems_ref|
        connection.system_service.hosts_service.host_service(uuid_from_ems_ref(ems_ref)).get
      rescue OvirtSDK4::Error # when 404
        nil
      end.compact
    end
  end

  def vms
    if @vms.blank?
      @vms = manager.with_provider_connection do |connection|
        select_vms(references(:vms)).map do |ems_ref|
          connection.system_service.vms_service.vm_service(uuid_from_ems_ref(ems_ref)).get
        rescue OvirtSDK4::Error # when 404
          nil
        end
      end
    end
    @vms
  end

  def select_vms(references_lst)
    references_lst.select { |ref| ref.include?('vms') }
  end

  def select_templates(references_lst)
    references_lst.select { |ref| ref.include?('templates') }
  end

  def templates
    t = []
    return t if select_templates(references(:vms)).blank?

    manager.with_provider_connection do |connection|
      select_templates(references(:vms)).each do |ems_ref|
        # returns OvirtSDK4::List
        t << connection.system_service.templates_service.template_service(uuid_from_ems_ref(ems_ref)).get
      rescue OvirtSDK4::Error # when 404
        nil
      end
    end

    t
  end

  def advertised_images
    []
  end

  def parse_targets!
    target.targets.each do |t|
      case t
      when VmOrTemplate
        add_target!(:vms, t.ems_ref)
      when Host
        add_target!(:hosts, t.ems_ref)
      end
    end
  end

  def infer_related_ems_refs!
    unless references(:vms).blank?
      infer_related_vm_ems_refs_db!
      infer_related_vm_ems_refs_api!
    end

    unless references(:hosts).blank?
      infer_related_host_ems_refs_db!
      infer_related_host_ems_refs_api!
    end
  end

  def infer_related_vm_ems_refs_db!
    changed_vms = manager.vms_and_templates.where(:ems_ref => references(:vms))

    changed_vms.each do |vm|
      unless vm.ems_cluster.nil?
        # when we target new vm
        add_target!(:ems_clusters, vm.ems_cluster.ems_ref)
        add_target!(:datacenters, vm.parent_datacenter.ems_ref)
      end

      vm.storages.collect(&:ems_ref).compact.each { |ems_ref| add_target!(:storagedomains, ems_ref) } unless vm.storages.nil?
      add_target!(:templates, vm.ems_ref)
    end
  end

  def infer_related_vm_ems_refs_api!
    vms_and_templates = Array(vms) + Array(templates)
    vms_and_templates.compact.each do |vm|
      clusters = collect_clusters
      clusters.each do |c|
        add_target!(:clusters, ems_ref_from_sdk(c))
        if c.id == vm.cluster&.id
          add_target!(:datacenters, ems_ref_from_sdk(c.data_center))
        end
      end

      disks = collect_attached_disks(vm)
      disks.each do |disk|
        Array.wrap(disk.storage_domains).each do |sd|
          add_target!(:storagedomains, ems_ref_from_sdk(sd))
        end
      end
      add_target!(:templates, ems_ref_from_sdk(vm))
    end
  end

  def infer_related_host_ems_refs_db!
    changed_hosts = manager.hosts.where(:ems_ref => references(:hosts))

    changed_hosts.each do |host|
      add_target!(:clusters, uuid_from_target(host.ems_cluster))
      host.storages.each do |storage|
        add_target!(:storagedomains, storage.ems_ref)
      end
      host.switches.each do |switch|
        add_target!(:switches, switch.uid_ems)
      end
    end
  end

  def infer_related_host_ems_refs_api!
    hosts.each do |host|
      add_target!(:clusters, host.cluster.id)
      manager.with_provider_connection do |connection|
        connection.follow_link(host.network_attachments).each do |attachment|
          add_target!(:switches, attachment.network.id)
        end
      end
    end
  end

  private

  def uuid_from_target(target)
    uuid_from_ems_ref(target.ems_ref)
  end

  def uuid_from_ems_ref(ems_ref)
    URI(ems_ref).path.split('/').last
  end

  def ems_ref_from_sdk(object)
    ManageIQ::Providers::Ovirt::InfraManager.make_ems_ref(object.href)
  end
end
