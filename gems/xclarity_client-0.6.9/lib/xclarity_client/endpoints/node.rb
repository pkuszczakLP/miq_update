module XClarityClient
  class Node < Endpoints::XclarityEndpoint
    BASE_URI = '/nodes'.freeze

    LIST_NAME = 'nodeList'.freeze

    POWER_ACTIONS = %i(
      powerOn
      powerOffSoftGraceful
      powerOff
      powerCycleSoftGrace
      powerCycleSoft
      bootToF1
    ).freeze

    LED_STATES = %w(
      Blinking
      On
      Off
    ).freeze

    attr_accessor :accessState, :activationKeys, :addinCards, :addinCardSlots, :arch, :backedBy, :bladeState, :bladeState_health,
                  :bladeState_string, :bootMode, :bootOrder, :cmmDisplayName, :cmmHealthState, :complexID, :contact, :dataHandle,
                  :description, :displayName, :dnsHostnames, :domainName, :driveBays, :drives, :embeddedHypervisorPresence, :encapsulation,
                  :enclosure_form_factor, :errorFields, :excludedHealthState, :expansionCards, :expansionCardSlots, :expansionProducts,
                  :expansionProductType, :faceplateIDs, :fans, :firmware, :flashStorage, :FQDN, :FRU, :fruNumber, :fruSerialNumber, :hasOS, :height,
                  :hostMacAddresses, :hostname, :ipAddresses, :ipInterfaces, :ipv4Addresses, :ipv6Addresses, :isConnectionTrusted, :isITME, :isRemotePresenceEnabled,
                  :isScalable, :lanOverUsb, :lanOverUsbPortForwardingModes, :leds, :location, :m2Presence, :macAddress, :machineType, :managementPorts, :manufacturer,
                  :manufacturerId, :memoryModules, :memorySlots, :mgmtProcIPaddress, :mgmtProcType, :model, :name, :nist, :onboardPciDevices, :overallHealthState, :parent,
                  :parentComplexID, :parentPartitionUUID, :partitionEnabled, :partitionID, :partNumber, :password, :pciCapabilities, :pciDevices, :physicalID, :ports,
                  :posID, :powerAllocation, :powerCappingPolicy, :powerStatus, :powerSupplies, :processors, :processorSlots, :productId, :productName, :raidSettings,
                  :recoveryPassword, :secureBootMode, :serialNumber, :server_type, :slots, :status, :subSlots, :subType, :thinkServerFru, :tlsVersion, :type, :uri,
                  :userDescription, :username, :uuid, :vnicMode, :vpdID, :securityDescriptor, :primary, :logicalID, :FeaturesOnDemand,
                  :canisterSlots, :canisters, :userDefinedName, :management_processor_type
  end
end
