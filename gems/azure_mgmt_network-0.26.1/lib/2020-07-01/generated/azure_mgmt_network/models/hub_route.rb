# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2020_07_01
  module Models
    #
    # RouteTable route.
    #
    class HubRoute

      include MsRestAzure

      # @return [String] The name of the Route that is unique within a
      # RouteTable. This name can be used to access this route.
      attr_accessor :name

      # @return [String] The type of destinations (eg: CIDR, ResourceId,
      # Service).
      attr_accessor :destination_type

      # @return [Array<String>] List of all destinations.
      attr_accessor :destinations

      # @return [String] The type of next hop (eg: ResourceId).
      attr_accessor :next_hop_type

      # @return [String] NextHop resource ID.
      attr_accessor :next_hop


      #
      # Mapper for HubRoute class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'HubRoute',
          type: {
            name: 'Composite',
            class_name: 'HubRoute',
            model_properties: {
              name: {
                client_side_validation: true,
                required: true,
                serialized_name: 'name',
                type: {
                  name: 'String'
                }
              },
              destination_type: {
                client_side_validation: true,
                required: true,
                serialized_name: 'destinationType',
                type: {
                  name: 'String'
                }
              },
              destinations: {
                client_side_validation: true,
                required: true,
                serialized_name: 'destinations',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'StringElementType',
                      type: {
                        name: 'String'
                      }
                  }
                }
              },
              next_hop_type: {
                client_side_validation: true,
                required: true,
                serialized_name: 'nextHopType',
                type: {
                  name: 'String'
                }
              },
              next_hop: {
                client_side_validation: true,
                required: true,
                serialized_name: 'nextHop',
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
