module ManageIQ::Providers::Lenovo
  class Inventory::Parser::ComponentParser::PhysicalStorage < Inventory::Parser::ComponentParser
    # Mapping between fields inside a [XClarityClient::Storage] to a [Hash] with symbols of PhysicalStorage fields
    PHYSICAL_STORAGE = {
      :name                 => 'name',
      :uid_ems              => 'uuid',
      :ems_ref              => 'uuid',
      :access_state         => 'accessState',
      :overall_health_state => 'overallHealthState',
      :drive_bays           => 'driveBays',
      :enclosures           => 'enclosureCount',
      :canister_slots       => 'canisterSlots',
      :type                 => :type,
      :health_state         => :health_state,
      :physical_disks       => nil,
      :canisters            => {
        :computer_system => {
          :hardware => {
            :firmwares     => nil,
            :guest_devices => nil
          }
        }
      },
      :asset_detail         => {
        :product_name     => 'productName',
        :machine_type     => 'machineType',
        :model            => 'model',
        :serial_number    => 'serialNumber',
        :contact          => 'contact',
        :description      => 'description',
        :location         => 'location.location',
        :room             => 'location.room',
        :rack_name        => 'location.rack',
        :lowest_rack_unit => 'location.lowestRackUnit',
      },
    }.freeze

    #
    # @param [XClarityClient::Storage] storage_xclarity
    # @param [InventoryObject] rack - parsed physical rack data
    # @param [InventoryObject] chassis - parsed physical chassis data
    #
    # @return [InventoryObject]
    #
    def build(storage_xclarity, rack = nil, chassis = nil)
      properties = parse_physical_storage(storage_xclarity)

      total_space = get_total_space(storage_xclarity)
      properties[:total_space] = total_space.zero? ? nil : total_space.gigabytes

      add_parent(properties, :belongs_to => :physical_rack, :object => rack) if rack
      add_parent(properties, :belongs_to => :physical_chassis, :object => chassis) if chassis

      storage = @persister.physical_storages.build(properties)

      build_associations(storage, storage_xclarity)

      storage
    end

    #
    # Parse a storage into a hash
    #
    # @param [XClarityClient::Storage] storage_xclarity
    #
    # @return [Hash] containing the physical storage information
    #
    def parse_physical_storage(storage_xclarity)
      result = parse(storage_xclarity, PHYSICAL_STORAGE)

      result
    end

    private

    def build_associations(storage, storage_xclarity)
      build_physical_disks(storage, storage_xclarity)
      build_canisters(storage, storage_xclarity)
      build_asset_detail(storage, storage_xclarity)
    end

    def build_physical_disks(storage, storage_xclarity)
      build_drivers_inside_multi_enclosures(storage, storage_xclarity) if storage_xclarity.enclosures.present?
    end

    def build_drivers_inside_multi_enclosures(storage, storage_xclarity)
      enclosures = storage_xclarity.enclosures
      enclosures.each do |enclosure|
        build_drivers_inside_single_enclosure(enclosure, storage)
      end
    end

    def build_drivers_inside_single_enclosure(enclosure, storage)
      driver_index = 0
      enclosure['drives'].each do |driver|
        components(:physical_disks).build(driver, driver_index.to_s, storage)
        driver_index += 1
      end
    end

    def build_canisters(storage, storage_xclarity)
      components(:canisters).build(storage_xclarity,
                                   :belongs_to => :physical_storage,
                                   :object     => storage)
    end

    def build_asset_detail(storage, storage_xclarity)
      super(storage, storage_xclarity, PHYSICAL_STORAGE[:asset_detail])
    end

    def get_total_space(storage_xclarity)
      total_space = 0
      components = storage_xclarity.canisters.presence || storage_xclarity.enclosures.presence
      if components.present?
        total_space = components(:physical_disks).total_space(components)
      end
      total_space
    end

    def type(_storage)
      'ManageIQ::Providers::Lenovo::PhysicalInfraManager::PhysicalStorage'
    end

    def health_state(storage)
      HEALTH_STATE_MAP[storage.cmmHealthState.nil? ? storage.cmmHealthState : storage.cmmHealthState.downcase]
    end
  end
end
