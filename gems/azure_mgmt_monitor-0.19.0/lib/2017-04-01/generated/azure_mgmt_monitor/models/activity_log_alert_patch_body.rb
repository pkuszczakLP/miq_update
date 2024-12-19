# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Monitor::Mgmt::V2017_04_01
  module Models
    #
    # An activity log alert object for the body of patch operations.
    #
    class ActivityLogAlertPatchBody

      include MsRestAzure

      # @return [Hash{String => String}] Resource tags
      attr_accessor :tags

      # @return [Boolean] Indicates whether this activity log alert is enabled.
      # If an activity log alert is not enabled, then none of its actions will
      # be activated. Default value: true .
      attr_accessor :enabled


      #
      # Mapper for ActivityLogAlertPatchBody class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'ActivityLogAlertPatchBody',
          type: {
            name: 'Composite',
            class_name: 'ActivityLogAlertPatchBody',
            model_properties: {
              tags: {
                client_side_validation: true,
                required: false,
                serialized_name: 'tags',
                type: {
                  name: 'Dictionary',
                  value: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'StringElementType',
                      type: {
                        name: 'String'
                      }
                  }
                }
              },
              enabled: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.enabled',
                default_value: true,
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
