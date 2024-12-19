class ManageIQ::Providers::Ovirt::Inventory::Collector::InfraManager < ManageIQ::Providers::Ovirt::Inventory::Collector
  def collected_inventory
    @collected_inventory ||= manager.class::Inventory.new(:ems => manager).refresh
  end

  def clusters
    collected_inventory[:cluster]
  end

  def networks
    collected_inventory[:network]
  end

  def storagedomains
    collected_inventory[:storage]
  end

  def datacenters
    collected_inventory[:datacenter]
  end

  def datacenter_by_cluster_id
    @datacenter_by_cluster_id ||= begin
      clusters.each_with_object({}) do |cluster, hash|
        hash[cluster.id] = cluster.dig(:data_center, :id)
      end
    end
  end

  def hosts
    collected_inventory[:host]
  end

  def vms
    collected_inventory[:vm]
  end

  def templates
    collected_inventory[:template]
  end

  def advertised_images
    manager.ovirt_services.advertised_images
  end

  def collect_networks
    collected_inventory[:network]
  end

  def collect_vnic_profiles
    collected_inventory[:vnic_profile]
  end

  def collect_host_nics(host)
    host.nics
  end

  def collect_cluster_for_host(host)
    cluster_id = host.cluster.id
    clusters.detect { |c| c.id == cluster_id }
  end

  def collect_datacenter_for_cluster(cluster)
    collected_inventory[:datacenter].detect { |dc| dc.id == cluster.data_center.id }
  end

  def collect_dc_domains(data_center)
    data_center.storage_domains
  end

  def collect_host_stats(host)
    host.statistics
  end

  def collect_attached_disks(vm)
    vm.disks
  end

  def collect_vm_devices(vm)
    vm.reported_devices
  end

  def collect_nics(vm)
    vm.nics
  end

  def collect_snapshots(vm)
    vm.snapshots
  end
end
