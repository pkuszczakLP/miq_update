# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Monitor::Mgmt::V2015_05_01
  module Models
    #
    # Work item configuration list result.
    #
    class WorkItemConfigurationsListResult

      include MsRestAzure

      # @return [Array<WorkItemConfiguration>] An array of work item
      # configurations.
      attr_accessor :value


      #
      # Mapper for WorkItemConfigurationsListResult class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'WorkItemConfigurationsListResult',
          type: {
            name: 'Composite',
            class_name: 'WorkItemConfigurationsListResult',
            model_properties: {
              value: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'value',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'WorkItemConfigurationElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'WorkItemConfiguration'
                      }
                  }
                }
              }
            }
          }
        }
      end
    end
  end
end
