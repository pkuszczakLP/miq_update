# Copyright (c) 2018-2019 VMware, Inc.  All Rights Reserved.
# SPDX-License-Identifier: MIT

# DO NOT MODIFY. THIS CODE IS GENERATED. CHANGES WILL BE OVERWRITTEN.

# vcenter - VMware vCenter Server provides a centralized platform for managing your VMware vSphere environments


require 'date'

module VSphereAutomation
  module VCenter
    class VcenterVmTemplateLibraryItemsEthernetInfoNetworkBackingType
    
    STANDARD_PORTGROUP = "STANDARD_PORTGROUP".freeze
    HOST_DEVICE = "HOST_DEVICE".freeze
    DISTRIBUTED_PORTGROUP = "DISTRIBUTED_PORTGROUP".freeze
    OPAQUE_NETWORK = "OPAQUE_NETWORK".freeze

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      constantValues = VcenterVmTemplateLibraryItemsEthernetInfoNetworkBackingType.constants.select { |c| VcenterVmTemplateLibraryItemsEthernetInfoNetworkBackingType::const_get(c) == value }
      raise "Invalid ENUM value #{value} for class #VcenterVmTemplateLibraryItemsEthernetInfoNetworkBackingType" if constantValues.empty?
      value
    end
  end
  end
end
