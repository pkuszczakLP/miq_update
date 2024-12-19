module ManageIQ::Providers::Redhat::InfraManager::Provision::Configuration::Network
  def configure_network_adapters
    configure_dialog_nic
    requested_vnics = options[:networks]

    if requested_vnics.nil?
      _log.info "NIC settings will be inherited from the template."
      return
    end

    ems = destination.ext_management_system
    ems.ovirt_services.configure_vnics(requested_vnics, destination_vnics, dest_cluster, destination)
  end

  # TODO: Move this into EMS Refresh
  def get_mac_address_of_nic_on_requested_vlan
    args = {
      :value_of_vlan_option => get_option(:vlan),
      :dest_cluster         => dest_cluster,
      :destination          => destination
    }
    source.ext_management_system.ovirt_services.get_mac_address_of_nic_on_requested_vlan(args)
  end

  private

  def destination_vnics
    # Nics are not always ordered in the XML response
    @destination_vnics ||= nics.sort_by(&:name)
  end

  def nics
    destination.ext_management_system.ovirt_services.nics_for_vm(destination)
  end

  def configure_dialog_nic
    vlan = get_option(:vlan)
    return if vlan.blank? || vlan == '<Template>'
    options[:networks] ||= []
    options[:networks][0] ||= begin
      _log.info("vlan: #{vlan.inspect}")
      {:network => vlan, :mac_address => get_option_last(:mac_address)}
    end
  end
end
