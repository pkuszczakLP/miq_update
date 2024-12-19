# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2020_06_01
  module Models
    #
    # Properties of a rule.
    #
    class FirewallPolicyRule

      include MsRestAzure

      @@discriminatorMap = Hash.new
      @@discriminatorMap["ApplicationRule"] = "ApplicationRule"
      @@discriminatorMap["NatRule"] = "NatRule"
      @@discriminatorMap["NetworkRule"] = "NetworkRule"

      def initialize
        @ruleType = "FirewallPolicyRule"
      end

      attr_accessor :ruleType

      # @return [String] Name of the rule.
      attr_accessor :name

      # @return [String] Description of the rule.
      attr_accessor :description


      #
      # Mapper for FirewallPolicyRule class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'FirewallPolicyRule',
          type: {
            name: 'Composite',
            polymorphic_discriminator: 'ruleType',
            uber_parent: 'FirewallPolicyRule',
            class_name: 'FirewallPolicyRule',
            model_properties: {
              name: {
                client_side_validation: true,
                required: false,
                serialized_name: 'name',
                type: {
                  name: 'String'
                }
              },
              description: {
                client_side_validation: true,
                required: false,
                serialized_name: 'description',
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
