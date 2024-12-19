# Copyright (c) 2018-2019 VMware, Inc.  All Rights Reserved.
# SPDX-License-Identifier: MIT

# DO NOT MODIFY. THIS CODE IS GENERATED. CHANGES WILL BE OVERWRITTEN.

# appliance - The vCenter Server Appliance is a preconfigured Linux-based virtual machine optimized for running vCenter Server and associated services.


require 'date'

module VSphereAutomation
  module Appliance
    class ApplianceNetworkingProxyServerStatus
    
    REACHABLE = "SERVER_REACHABLE".freeze
    UNREACHABLE = "SERVER_UNREACHABLE".freeze

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      constantValues = ApplianceNetworkingProxyServerStatus.constants.select { |c| ApplianceNetworkingProxyServerStatus::const_get(c) == value }
      raise "Invalid ENUM value #{value} for class #ApplianceNetworkingProxyServerStatus" if constantValues.empty?
      value
    end
  end
  end
end
