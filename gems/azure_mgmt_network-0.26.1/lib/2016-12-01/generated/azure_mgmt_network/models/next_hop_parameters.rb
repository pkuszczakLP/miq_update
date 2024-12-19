# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2016_12_01
  module Models
    #
    # Parameters that define the source and destination endpoint.
    #
    class NextHopParameters

      include MsRestAzure

      # @return [String] The resource identifier of the target resource against
      # which the action is to be performed.
      attr_accessor :target_resource_id

      # @return [String] The source IP address.
      attr_accessor :source_ipaddress

      # @return [String] The destination IP address.
      attr_accessor :destination_ipaddress

      # @return [String] The NIC ID. (If VM has multiple NICs and IP forwarding
      # is enabled on any of the nics, then this parameter must be specified.
      # Otherwise optional).
      attr_accessor :target_nic_resource_id


      #
      # Mapper for NextHopParameters class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'NextHopParameters',
          type: {
            name: 'Composite',
            class_name: 'NextHopParameters',
            model_properties: {
              target_resource_id: {
                client_side_validation: true,
                required: true,
                serialized_name: 'targetResourceId',
                type: {
                  name: 'String'
                }
              },
              source_ipaddress: {
                client_side_validation: true,
                required: true,
                serialized_name: 'sourceIPAddress',
                type: {
                  name: 'String'
                }
              },
              destination_ipaddress: {
                client_side_validation: true,
                required: true,
                serialized_name: 'destinationIPAddress',
                type: {
                  name: 'String'
                }
              },
              target_nic_resource_id: {
                client_side_validation: true,
                required: false,
                serialized_name: 'targetNicResourceId',
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
