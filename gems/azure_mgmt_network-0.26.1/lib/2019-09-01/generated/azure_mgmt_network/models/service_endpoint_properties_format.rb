# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2019_09_01
  module Models
    #
    # The service endpoint properties.
    #
    class ServiceEndpointPropertiesFormat

      include MsRestAzure

      # @return [String] The type of the endpoint service.
      attr_accessor :service

      # @return [Array<String>] A list of locations.
      attr_accessor :locations

      # @return [ProvisioningState] The provisioning state of the service
      # endpoint resource. Possible values include: 'Succeeded', 'Updating',
      # 'Deleting', 'Failed'
      attr_accessor :provisioning_state


      #
      # Mapper for ServiceEndpointPropertiesFormat class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'ServiceEndpointPropertiesFormat',
          type: {
            name: 'Composite',
            class_name: 'ServiceEndpointPropertiesFormat',
            model_properties: {
              service: {
                client_side_validation: true,
                required: false,
                serialized_name: 'service',
                type: {
                  name: 'String'
                }
              },
              locations: {
                client_side_validation: true,
                required: false,
                serialized_name: 'locations',
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
              provisioning_state: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'provisioningState',
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
