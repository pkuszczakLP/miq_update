# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Resources::Mgmt::V2020_06_01
  module Models
    #
    # Information from validate template deployment response.
    #
    class DeploymentValidateResult

      include MsRestAzure

      # @return [ErrorResponse] The deployment validation error.
      attr_accessor :error

      # @return [DeploymentPropertiesExtended] The template deployment
      # properties.
      attr_accessor :properties


      #
      # Mapper for DeploymentValidateResult class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'DeploymentValidateResult',
          type: {
            name: 'Composite',
            class_name: 'DeploymentValidateResult',
            model_properties: {
              error: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'error',
                type: {
                  name: 'Composite',
                  class_name: 'ErrorResponse'
                }
              },
              properties: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties',
                type: {
                  name: 'Composite',
                  class_name: 'DeploymentPropertiesExtended'
                }
              }
            }
          }
        }
      end
    end
  end
end
