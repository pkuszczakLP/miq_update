# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Compute::Mgmt::V2020_06_01
  module Models
    #
    # Describes a virtual machine scale set network profile.
    #
    class VirtualMachineScaleSetUpdateNetworkProfile

      include MsRestAzure

      # @return [ApiEntityReference] A reference to a load balancer probe used
      # to determine the health of an instance in the virtual machine scale
      # set. The reference will be in the form:
      # '/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/{loadBalancerName}/probes/{probeName}'.
      attr_accessor :health_probe

      # @return [Array<VirtualMachineScaleSetUpdateNetworkConfiguration>] The
      # list of network configurations.
      attr_accessor :network_interface_configurations


      #
      # Mapper for VirtualMachineScaleSetUpdateNetworkProfile class as Ruby
      # Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'VirtualMachineScaleSetUpdateNetworkProfile',
          type: {
            name: 'Composite',
            class_name: 'VirtualMachineScaleSetUpdateNetworkProfile',
            model_properties: {
              health_probe: {
                client_side_validation: true,
                required: false,
                serialized_name: 'healthProbe',
                type: {
                  name: 'Composite',
                  class_name: 'ApiEntityReference'
                }
              },
              network_interface_configurations: {
                client_side_validation: true,
                required: false,
                serialized_name: 'networkInterfaceConfigurations',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'VirtualMachineScaleSetUpdateNetworkConfigurationElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'VirtualMachineScaleSetUpdateNetworkConfiguration'
                      }
                  }
                }
              }
            }
          }
        }
      end
    end
  end
end
