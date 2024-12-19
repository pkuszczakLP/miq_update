# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2019_08_01
  module Models
    #
    # Results of IP flow verification on the target resource.
    #
    class VerificationIPFlowResult

      include MsRestAzure

      # @return [Access] Indicates whether the traffic is allowed or denied.
      # Possible values include: 'Allow', 'Deny'
      attr_accessor :access

      # @return [String] Name of the rule. If input is not matched against any
      # security rule, it is not displayed.
      attr_accessor :rule_name


      #
      # Mapper for VerificationIPFlowResult class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'VerificationIPFlowResult',
          type: {
            name: 'Composite',
            class_name: 'VerificationIPFlowResult',
            model_properties: {
              access: {
                client_side_validation: true,
                required: false,
                serialized_name: 'access',
                type: {
                  name: 'String'
                }
              },
              rule_name: {
                client_side_validation: true,
                required: false,
                serialized_name: 'ruleName',
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
