# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2020_07_01
  module Models
    #
    # AzureFirewall NAT Rule Collection Action.
    #
    class AzureFirewallNatRCAction

      include MsRestAzure

      # @return [AzureFirewallNatRCActionType] The type of action. Possible
      # values include: 'Snat', 'Dnat'
      attr_accessor :type


      #
      # Mapper for AzureFirewallNatRCAction class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'AzureFirewallNatRCAction',
          type: {
            name: 'Composite',
            class_name: 'AzureFirewallNatRCAction',
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
