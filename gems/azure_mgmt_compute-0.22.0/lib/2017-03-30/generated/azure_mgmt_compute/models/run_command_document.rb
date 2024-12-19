# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Compute::Mgmt::V2017_03_30
  module Models
    #
    # Describes the properties of a Run Command.
    #
    class RunCommandDocument < RunCommandDocumentBase

      include MsRestAzure

      # @return [Array<String>] The script to be executed.
      attr_accessor :script

      # @return [Array<RunCommandParameterDefinition>] The parameters used by
      # the script.
      attr_accessor :parameters


      #
      # Mapper for RunCommandDocument class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'RunCommandDocument',
          type: {
            name: 'Composite',
            class_name: 'RunCommandDocument',
            model_properties: {
              schema: {
                client_side_validation: true,
                required: true,
                serialized_name: '$schema',
                type: {
                  name: 'String'
                }
              },
              id: {
                client_side_validation: true,
                required: true,
                serialized_name: 'id',
                type: {
                  name: 'String'
                }
              },
              os_type: {
                client_side_validation: true,
                required: true,
                serialized_name: 'osType',
                type: {
                  name: 'Enum',
                  module: 'OperatingSystemTypes'
                }
              },
              label: {
                client_side_validation: true,
                required: true,
                serialized_name: 'label',
                type: {
                  name: 'String'
                }
              },
              description: {
                client_side_validation: true,
                required: true,
                serialized_name: 'description',
                type: {
                  name: 'String'
                }
              },
              script: {
                client_side_validation: true,
                required: true,
                serialized_name: 'script',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'StringElementType',
                      type: {
                        name: 'String'
                      }
                  }
                }
              },
              parameters: {
                client_side_validation: true,
                required: false,
                serialized_name: 'parameters',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'RunCommandParameterDefinitionElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'RunCommandParameterDefinition'
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
