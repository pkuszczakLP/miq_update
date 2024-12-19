# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Compute::Mgmt::V2019_12_01
  module Models
    #
    # The properties describe the recommended machine configuration for this
    # Image Definition. These properties are updatable.
    #
    class RecommendedMachineConfiguration

      include MsRestAzure

      # @return [ResourceRange]
      attr_accessor :v_cpus

      # @return [ResourceRange]
      attr_accessor :memory


      #
      # Mapper for RecommendedMachineConfiguration class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'RecommendedMachineConfiguration',
          type: {
            name: 'Composite',
            class_name: 'RecommendedMachineConfiguration',
            model_properties: {
              v_cpus: {
                client_side_validation: true,
                required: false,
                serialized_name: 'vCPUs',
                type: {
                  name: 'Composite',
                  class_name: 'ResourceRange'
                }
              },
              memory: {
                client_side_validation: true,
                required: false,
                serialized_name: 'memory',
                type: {
                  name: 'Composite',
                  class_name: 'ResourceRange'
                }
              }
            }
          }
        }
      end
    end
  end
end
