# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2017_03_01
  module Models
    #
    # Inbound NAT pool of the load balancer.
    #
    class InboundNatPool < SubResource

      include MsRestAzure

      # @return [SubResource] A reference to frontend IP addresses.
      attr_accessor :frontend_ipconfiguration

      # @return [TransportProtocol] The transport protocol for the endpoint.
      # Possible values are: 'Udp' or 'Tcp'. Possible values include: 'Udp',
      # 'Tcp'
      attr_accessor :protocol

      # @return [Integer] The first port number in the range of external ports
      # that will be used to provide Inbound Nat to NICs associated with a load
      # balancer. Acceptable values range between 1 and 65534.
      attr_accessor :frontend_port_range_start

      # @return [Integer] The last port number in the range of external ports
      # that will be used to provide Inbound Nat to NICs associated with a load
      # balancer. Acceptable values range between 1 and 65535.
      attr_accessor :frontend_port_range_end

      # @return [Integer] The port used for internal connections on the
      # endpoint. Acceptable values are between 1 and 65535.
      attr_accessor :backend_port

      # @return [String] Gets the provisioning state of the PublicIP resource.
      # Possible values are: 'Updating', 'Deleting', and 'Failed'.
      attr_accessor :provisioning_state

      # @return [String] The name of the resource that is unique within a
      # resource group. This name can be used to access the resource.
      attr_accessor :name

      # @return [String] A unique read-only string that changes whenever the
      # resource is updated.
      attr_accessor :etag


      #
      # Mapper for InboundNatPool class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'InboundNatPool',
          type: {
            name: 'Composite',
            class_name: 'InboundNatPool',
            model_properties: {
              id: {
                client_side_validation: true,
                required: false,
                serialized_name: 'id',
                type: {
                  name: 'String'
                }
              },
              frontend_ipconfiguration: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.frontendIPConfiguration',
                type: {
                  name: 'Composite',
                  class_name: 'SubResource'
                }
              },
              protocol: {
                client_side_validation: true,
                required: true,
                serialized_name: 'properties.protocol',
                type: {
                  name: 'String'
                }
              },
              frontend_port_range_start: {
                client_side_validation: true,
                required: true,
                serialized_name: 'properties.frontendPortRangeStart',
                type: {
                  name: 'Number'
                }
              },
              frontend_port_range_end: {
                client_side_validation: true,
                required: true,
                serialized_name: 'properties.frontendPortRangeEnd',
                type: {
                  name: 'Number'
                }
              },
              backend_port: {
                client_side_validation: true,
                required: true,
                serialized_name: 'properties.backendPort',
                type: {
                  name: 'Number'
                }
              },
              provisioning_state: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.provisioningState',
                type: {
                  name: 'String'
                }
              },
              name: {
                client_side_validation: true,
                required: false,
                serialized_name: 'name',
                type: {
                  name: 'String'
                }
              },
              etag: {
                client_side_validation: true,
                required: false,
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
