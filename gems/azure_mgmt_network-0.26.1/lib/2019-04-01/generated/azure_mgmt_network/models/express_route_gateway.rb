# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2019_04_01
  module Models
    #
    # ExpressRoute gateway resource.
    #
    class ExpressRouteGateway < Resource

      include MsRestAzure

      # @return [ExpressRouteGatewayPropertiesAutoScaleConfiguration]
      # Configuration for auto scaling.
      attr_accessor :auto_scale_configuration

      # @return [Array<ExpressRouteConnection>] List of ExpressRoute
      # connections to the ExpressRoute gateway.
      attr_accessor :express_route_connections

      # @return [ProvisioningState] The provisioning state of the resource.
      # Possible values include: 'Succeeded', 'Updating', 'Deleting', 'Failed'
      attr_accessor :provisioning_state

      # @return [VirtualHubId] The Virtual Hub where the ExpressRoute gateway
      # is or will be deployed.
      attr_accessor :virtual_hub

      # @return [String] A unique read-only string that changes whenever the
      # resource is updated.
      attr_accessor :etag


      #
      # Mapper for ExpressRouteGateway class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'ExpressRouteGateway',
          type: {
            name: 'Composite',
            class_name: 'ExpressRouteGateway',
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
              auto_scale_configuration: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.autoScaleConfiguration',
                type: {
                  name: 'Composite',
                  class_name: 'ExpressRouteGatewayPropertiesAutoScaleConfiguration'
                }
              },
              express_route_connections: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'properties.expressRouteConnections',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'ExpressRouteConnectionElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'ExpressRouteConnection'
                      }
                  }
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
              virtual_hub: {
                client_side_validation: true,
                required: true,
                serialized_name: 'properties.virtualHub',
                type: {
                  name: 'Composite',
                  class_name: 'VirtualHubId'
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
