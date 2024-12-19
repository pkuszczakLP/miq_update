# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2020_05_01
  module Models
    #
    # Network Virtual Appliance Sku Properties.
    #
    class BreakOutCategoryPolicies

      include MsRestAzure

      # @return [Boolean] Flag to control breakout of o365 allow category.
      attr_accessor :allow

      # @return [Boolean] Flag to control breakout of o365 optimize category.
      attr_accessor :optimize

      # @return [Boolean] Flag to control breakout of o365 default category.
      attr_accessor :default


      #
      # Mapper for BreakOutCategoryPolicies class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'BreakOutCategoryPolicies',
          type: {
            name: 'Composite',
            class_name: 'BreakOutCategoryPolicies',
            model_properties: {
              allow: {
                client_side_validation: true,
                required: false,
                serialized_name: 'allow',
                type: {
                  name: 'Boolean'
                }
              },
              optimize: {
                client_side_validation: true,
                required: false,
                serialized_name: 'optimize',
                type: {
                  name: 'Boolean'
                }
              },
              default: {
                client_side_validation: true,
                required: false,
                serialized_name: 'default',
                type: {
                  name: 'Boolean'
                }
              }
            }
          }
        }
      end
    end
  end
end
