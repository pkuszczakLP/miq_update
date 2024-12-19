# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2020_05_01
  module Models
    #
    # Request body of the CheckPrivateLinkServiceVisibility API service call.
    #
    class CheckPrivateLinkServiceVisibilityRequest

      include MsRestAzure

      # @return [String] The alias of the private link service.
      attr_accessor :private_link_service_alias


      #
      # Mapper for CheckPrivateLinkServiceVisibilityRequest class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'CheckPrivateLinkServiceVisibilityRequest',
          type: {
            name: 'Composite',
            class_name: 'CheckPrivateLinkServiceVisibilityRequest',
            model_properties: {
              private_link_service_alias: {
                client_side_validation: true,
                required: false,
                serialized_name: 'privateLinkServiceAlias',
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
