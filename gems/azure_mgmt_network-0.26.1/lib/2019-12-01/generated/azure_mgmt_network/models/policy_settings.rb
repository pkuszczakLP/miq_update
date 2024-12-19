# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2019_12_01
  module Models
    #
    # Defines contents of a web application firewall global configuration.
    #
    class PolicySettings

      include MsRestAzure

      # @return [WebApplicationFirewallEnabledState] The state of the policy.
      # Possible values include: 'Disabled', 'Enabled'
      attr_accessor :state

      # @return [WebApplicationFirewallMode] The mode of the policy. Possible
      # values include: 'Prevention', 'Detection'
      attr_accessor :mode

      # @return [Boolean] Whether to allow WAF to check request Body.
      attr_accessor :request_body_check

      # @return [Integer] Maximum request body size in Kb for WAF.
      attr_accessor :max_request_body_size_in_kb

      # @return [Integer] Maximum file upload size in Mb for WAF.
      attr_accessor :file_upload_limit_in_mb


      #
      # Mapper for PolicySettings class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'PolicySettings',
          type: {
            name: 'Composite',
            class_name: 'PolicySettings',
            model_properties: {
              state: {
                client_side_validation: true,
                required: false,
                serialized_name: 'state',
                type: {
                  name: 'String'
                }
              },
              mode: {
                client_side_validation: true,
                required: false,
                serialized_name: 'mode',
                type: {
                  name: 'String'
                }
              },
              request_body_check: {
                client_side_validation: true,
                required: false,
                serialized_name: 'requestBodyCheck',
                type: {
                  name: 'Boolean'
                }
              },
              max_request_body_size_in_kb: {
                client_side_validation: true,
                required: false,
                serialized_name: 'maxRequestBodySizeInKb',
                constraints: {
                  InclusiveMaximum: 128,
                  InclusiveMinimum: 8
                },
                type: {
                  name: 'Number'
                }
              },
              file_upload_limit_in_mb: {
                client_side_validation: true,
                required: false,
                serialized_name: 'fileUploadLimitInMb',
                constraints: {
                  InclusiveMinimum: 0
                },
                type: {
                  name: 'Number'
                }
              }
            }
          }
        }
      end
    end
  end
end
