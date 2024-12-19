# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2020_08_01
  module Models
    #
    # Properties of the FirewallPolicyFilterRuleCollectionAction.
    #
    class FirewallPolicyFilterRuleCollectionAction

      include MsRestAzure

      # @return [FirewallPolicyFilterRuleCollectionActionType] The type of
      # action. Possible values include: 'Allow', 'Deny'
      attr_accessor :type


      #
      # Mapper for FirewallPolicyFilterRuleCollectionAction class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'FirewallPolicyFilterRuleCollectionAction',
          type: {
            name: 'Composite',
            class_name: 'FirewallPolicyFilterRuleCollectionAction',
            model_properties: {
              type: {
                client_side_validation: true,
                required: false,
                serialized_name: 'type',
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
