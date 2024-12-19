# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Compute::Mgmt::V2020_10_01_preview
  module Models
    #
    # Instance view status.
    #
    class ResourceInstanceViewStatus

      include MsRestAzure

      # @return [String] The status code.
      attr_accessor :code

      # @return [String] The short localizable label for the status.
      attr_accessor :display_status

      # @return [String] The detailed status message, including for alerts and
      # error messages.
      attr_accessor :message

      # @return [DateTime] The time of the status.
      attr_accessor :time

      # @return [StatusLevelTypes] The level code. Possible values include:
      # 'Info', 'Warning', 'Error'
      attr_accessor :level


      #
      # Mapper for ResourceInstanceViewStatus class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'ResourceInstanceViewStatus',
          type: {
            name: 'Composite',
            class_name: 'ResourceInstanceViewStatus',
            model_properties: {
              code: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'code',
                type: {
                  name: 'String'
                }
              },
              display_status: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'displayStatus',
                type: {
                  name: 'String'
                }
              },
              message: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'message',
                type: {
                  name: 'String'
                }
              },
              time: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'time',
                type: {
                  name: 'DateTime'
                }
              },
              level: {
                client_side_validation: true,
                required: false,
                serialized_name: 'level',
                type: {
                  name: 'Enum',
                  module: 'StatusLevelTypes'
                }
              }
            }
          }
        }
      end
    end
  end
end