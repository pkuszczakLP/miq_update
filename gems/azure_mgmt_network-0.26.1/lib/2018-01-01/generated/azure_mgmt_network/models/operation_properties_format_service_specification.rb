# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2018_01_01
  module Models
    #
    # Specification of the service.
    #
    class OperationPropertiesFormatServiceSpecification

      include MsRestAzure

      # @return [Array<MetricSpecification>] Operation service specification.
      attr_accessor :metric_specifications

      # @return [Array<LogSpecification>] Operation log specification.
      attr_accessor :log_specifications


      #
      # Mapper for OperationPropertiesFormatServiceSpecification class as Ruby
      # Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'OperationPropertiesFormat_serviceSpecification',
          type: {
            name: 'Composite',
            class_name: 'OperationPropertiesFormatServiceSpecification',
            model_properties: {
              metric_specifications: {
                client_side_validation: true,
                required: false,
                serialized_name: 'metricSpecifications',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'MetricSpecificationElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'MetricSpecification'
                      }
                  }
                }
              },
              log_specifications: {
                client_side_validation: true,
                required: false,
                serialized_name: 'logSpecifications',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'LogSpecificationElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'LogSpecification'
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
