# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2019_12_01
  module Models
    #
    # Virtual Network Tap resource.
    #
    class VirtualNetworkTap < Resource

      include MsRestAzure

      # @return [Array<NetworkInterfaceTapConfiguration>] Specifies the list of
      # resource IDs for the network interface IP configuration that needs to
      # be tapped.
      attr_accessor :network_interface_tap_configurations

      # @return [String] The resource GUID property of the virtual network tap
      # resource.
      attr_accessor :resource_guid

      # @return [ProvisioningState] The provisioning state of the virtual
      # network tap resource. Possible values include: 'Succeeded', 'Updating',
      # 'Deleting', 'Failed'
      attr_accessor :provisioning_state

      # @return [NetworkInterfaceIPConfiguration] The reference to the private
      # IP Address of the collector nic that will receive the tap.
      attr_accessor :destination_network_interface_ipconfiguration

      # @return [FrontendIPConfiguration] The reference to the private IP
      # address on the internal Load Balancer that will receive the tap.
      attr_accessor :destination_load_balancer_front_end_ipconfiguration

      # @return [Integer] The VXLAN destination port that will receive the
      # tapped traffic.
      attr_accessor :destination_port

      # @return [String] A unique read-only string that changes whenever the
      # resource is updated.
      attr_accessor :etag


      #
      # Mapper for VirtualNetworkTap class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'VirtualNetworkTap',
          type: {
            name: 'Composite',
            class_name: 'VirtualNetworkTap',
            model_properties: {
              id: {
                client_side_validation: true,
                required: false,
                serialized_name: 'id',
                type: {
                  name: 'String'
                }
              },
              name: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'name',
                type: {
                  name: 'String'
                }
              },
              type: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'type',
                type: {
                  name: 'String'
                }
              },
              location: {
                client_side_validation: true,
                required: false,
                serialized_name: 'location',
                type: {
                  name: 'String'
                }
              },
              tags: {
                client_side_validation: true,
                required: false,
                serialized_name: 'tags',
                type: {
                  name: 'Dictionary',
                  value: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'StringElementType',
                      type: {
                        name: 'String'
                      }
                  }
                }
              },
              network_interface_tap_configurations: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'properties.networkInterfaceTapConfigurations',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'NetworkInterfaceTapConfigurationElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'NetworkInterfaceTapConfiguration'
                      }
                  }
                }
              },
              resource_guid: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'properties.resourceGuid',
                type: {
                  name: 'String'
                }
              },
              provisioning_state: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'properties.provisioningState',
                type: {
                  name: 'String'
                }
              },
              destination_network_interface_ipconfiguration: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.destinationNetworkInterfaceIPConfiguration',
                type: {
                  name: 'Composite',
                  class_name: 'NetworkInterfaceIPConfiguration'
                }
              },
              destination_load_balancer_front_end_ipconfiguration: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.destinationLoadBalancerFrontEndIPConfiguration',
                type: {
                  name: 'Composite',
                  class_name: 'FrontendIPConfiguration'
                }
              },
              destination_port: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.destinationPort',
                type: {
                  name: 'Number'
                }
              },
              etag: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'etag',
                type: {
                  name: 'String'
                }
              }
            }
          }
        }
      end
    end
  end
end
