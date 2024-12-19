# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2020_07_01
  module Models
    #
    # DDoS custom policy properties.
    #
    class ProtocolCustomSettingsFormat

      include MsRestAzure

      # @return [DdosCustomPolicyProtocol] The protocol for which the DDoS
      # protection policy is being customized. Possible values include: 'Tcp',
      # 'Udp', 'Syn'
      attr_accessor :protocol

      # @return [String] The customized DDoS protection trigger rate.
      attr_accessor :trigger_rate_override

      # @return [String] The customized DDoS protection source rate.
      attr_accessor :source_rate_override

      # @return [DdosCustomPolicyTriggerSensitivityOverride] The customized
      # DDoS protection trigger rate sensitivity degrees. High: Trigger rate
      # set with most sensitivity w.r.t. normal traffic. Default: Trigger rate
      # set with moderate sensitivity w.r.t. normal traffic. Low: Trigger rate
      # set with less sensitivity w.r.t. normal traffic. Relaxed: Trigger rate
      # set with least sensitivity w.r.t. normal traffic. Possible values
      # include: 'Relaxed', 'Low', 'Default', 'High'
      attr_accessor :trigger_sensitivity_override


      #
      # Mapper for ProtocolCustomSettingsFormat class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'ProtocolCustomSettingsFormat',
          type: {
            name: 'Composite',
            class_name: 'ProtocolCustomSettingsFormat',
            model_properties: {
              protocol: {
                client_side_validation: true,
                required: false,
                serialized_name: 'protocol',
                type: {
                  name: 'String'
                }
              },
              trigger_rate_override: {
                client_side_validation: true,
                required: false,
                serialized_name: 'triggerRateOverride',
                type: {
                  name: 'String'
                }
              },
              source_rate_override: {
                client_side_validation: true,
                required: false,
                serialized_name: 'sourceRateOverride',
                type: {
                  name: 'String'
                }
              },
              trigger_sensitivity_override: {
                client_side_validation: true,
                required: false,
                serialized_name: 'triggerSensitivityOverride',
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
