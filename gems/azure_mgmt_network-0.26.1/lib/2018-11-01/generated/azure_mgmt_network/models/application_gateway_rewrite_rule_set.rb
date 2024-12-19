# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2018_11_01
  module Models
    #
    # Rewrite rule set of an application gateway.
    #
    class ApplicationGatewayRewriteRuleSet < SubResource

      include MsRestAzure

      # @return [Array<ApplicationGatewayRewriteRule>] Rewrite rules in the
      # rewrite rule set.
      attr_accessor :rewrite_rules

      # @return [String] Provisioning state of the rewrite rule set resource.
      # Possible values are: 'Updating', 'Deleting', and 'Failed'.
      attr_accessor :provisioning_state

      # @return [String] Name of the rewrite rule set that is unique within an
      # Application Gateway.
      attr_accessor :name

      # @return [String] A unique read-only string that changes whenever the
      # resource is updated.
      attr_accessor :etag


      #
      # Mapper for ApplicationGatewayRewriteRuleSet class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'ApplicationGatewayRewriteRuleSet',
          type: {
            name: 'Composite',
            class_name: 'ApplicationGatewayRewriteRuleSet',
            model_properties: {
              id: {
                client_side_validation: true,
                required: false,
                serialized_name: 'id',
                type: {
                  name: 'String'
                }
              },
              rewrite_rules: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.rewriteRules',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'ApplicationGatewayRewriteRuleElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'ApplicationGatewayRewriteRule'
                      }
                  }
                }
              },
              provisioning_state: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'properties.provisioningState',
                type: {
                  name: 'String'
                }
              },
              name: {
                client_side_validation: true,
                required: false,
                serialized_name: 'name',
                type: {
                  name: 'String'
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
