# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2019_04_01
  module Models
    #
    # The information of an AutoApprovedPrivateLinkService.
    #
    class AutoApprovedPrivateLinkService

      include MsRestAzure

      # @return [String] The id of the private link service resource.
      attr_accessor :private_link_service


      #
      # Mapper for AutoApprovedPrivateLinkService class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'AutoApprovedPrivateLinkService',
          type: {
            name: 'Composite',
            class_name: 'AutoApprovedPrivateLinkService',
            model_properties: {
              private_link_service: {
                client_side_validation: true,
                required: false,
                serialized_name: 'privateLinkService',
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
