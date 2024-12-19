module ManageIQ::Providers::Lenovo
  class Inventory::Parser::ComponentParser::GuestDevice < Inventory::Parser::ComponentParser
    # Mapping between fields inside [Hash] Guest Device to a [Hash] with symbols as keys
    GUEST_DEVICE = {
      :manufacturer           => 'manufacturer',
      :field_replaceable_unit => 'FRU',
      :controller_type        => 'class',
      :uid_ems                => :uid_ems,
      :device_name            => :device_name,
      :device_type            => :device_type,
      :firmwares              => nil, #:firmwares,
      :location               => :location
    }.freeze

    #
    # Mounts a Guest Device
    #
    # @param [Hash] guest_device - a raw device that needs to be parsed
    #
    def parse_guest_device(guest_device)
      parse(guest_device, GUEST_DEVICE)
    end

    private

    def uid_ems(device)
      device['uuid'] || "#{device['pciBusNumber']}#{device['pciDeviceNumber']}"
    end

    def device_name(device)
      device['productName'] ? device['productName'] : device['name']
    end

    def device_type(_device)
      'guest_device'
    end

    def build_firmwares(device, inventory_object)
      firmwares = device['firmware']

      parent_collection_name = inventory_object&.inventory_collection&.association
      inventory_collection_name = case parent_collection_name
                                  when :physical_server_network_devices then :physical_server_network_device_firmwares
                                  when :physical_server_storage_adapters then :physical_server_storage_adapter_firmwares
                                  else raise "Unknown parent inventory collection (#{parent_collection_name})"
                                  end
      if firmwares.present?
        versions = firmwares.collect { |fw| fw['version'] }.join(', ')
        firmware = firmwares.first
        firmware['version'] = versions
        components(:firmwares).build(firmware,
                                     inventory_collection_name,
                                     {:belongs_to => :guest_device,
                                      :object     => inventory_object},
                                     device)
      end
    end

    def location(device)
      device['slotNumber'] ? "Bay #{device['slotNumber']}" : nil
    end
  end
end
