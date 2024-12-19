# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2020_08_01
  module Models
    #
    # The visibility list of the private link service.
    #
    class PrivateLinkServicePropertiesVisibility < ResourceSet

      include MsRestAzure


      #
      # Mapper for PrivateLinkServicePropertiesVisibility class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'PrivateLinkServiceProperties_visibility',
          type: {
            name: 'Composite',
            class_name: 'PrivateLinkServicePropertiesVisibility',
            model_properties: {
              subscriptions: {
                client_side_validation: true,
                required: false,
                serialized_name: 'subscriptions',
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
              }
            }
          }
        }
      end
    end
  end
end
