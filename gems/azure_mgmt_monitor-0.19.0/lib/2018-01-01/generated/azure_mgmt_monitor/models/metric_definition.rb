# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Monitor::Mgmt::V2018_01_01
  module Models
    #
    # Metric definition class specifies the metadata for a metric.
    #
    class MetricDefinition

      include MsRestAzure

      # @return [Boolean] Flag to indicate whether the dimension is required.
      attr_accessor :is_dimension_required

      # @return [String] the resource identifier of the resource that emitted
      # the metric.
      attr_accessor :resource_id

      # @return [String] the namespace the metric belongs to.
      attr_accessor :namespace

      # @return [LocalizableString] the name and the display name of the
      # metric, i.e. it is a localizable string.
      attr_accessor :name

      # @return [Unit] the unit of the metric. Possible values include:
      # 'Count', 'Bytes', 'Seconds', 'CountPerSecond', 'BytesPerSecond',
      # 'Percent', 'MilliSeconds', 'ByteSeconds', 'Unspecified', 'Cores',
      # 'MilliCores', 'NanoCores', 'BitsPerSecond'
      attr_accessor :unit

      # @return [AggregationType] the primary aggregation type value defining
      # how to use the values for display. Possible values include: 'None',
      # 'Average', 'Count', 'Minimum', 'Maximum', 'Total'
      attr_accessor :primary_aggregation_type

      # @return [Array<AggregationType>] the collection of what aggregation
      # types are supported.
      attr_accessor :supported_aggregation_types

      # @return [Array<MetricAvailability>] the collection of what aggregation
      # intervals are available to be queried.
      attr_accessor :metric_availabilities

      # @return [String] the resource identifier of the metric definition.
      attr_accessor :id

      # @return [Array<LocalizableString>] the name and the display name of the
      # dimension, i.e. it is a localizable string.
      attr_accessor :dimensions


      #
      # Mapper for MetricDefinition class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'MetricDefinition',
          type: {
            name: 'Composite',
            class_name: 'MetricDefinition',
            model_properties: {
              is_dimension_required: {
                client_side_validation: true,
                required: false,
                serialized_name: 'isDimensionRequired',
                type: {
                  name: 'Boolean'
                }
              },
              resource_id: {
                client_side_validation: true,
                required: false,
                serialized_name: 'resourceId',
                type: {
                  name: 'String'
                }
              },
              namespace: {
                client_side_validation: true,
                required: false,
                serialized_name: 'namespace',
                type: {
                  name: 'String'
                }
              },
              name: {
                client_side_validation: true,
                required: false,
                serialized_name: 'name',
                type: {
                  name: 'Composite',
                  class_name: 'LocalizableString'
                }
              },
              unit: {
                client_side_validation: true,
                required: false,
                serialized_name: 'unit',
                type: {
                  name: 'Enum',
                  module: 'Unit'
                }
              },
              primary_aggregation_type: {
                client_side_validation: true,
                required: false,
                serialized_name: 'primaryAggregationType',
                type: {
                  name: 'Enum',
                  module: 'AggregationType'
                }
              },
              supported_aggregation_types: {
                client_side_validation: true,
                required: false,
                serialized_name: 'supportedAggregationTypes',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'AggregationTypeElementType',
                      type: {
                        name: 'Enum',
                        module: 'AggregationType'
                      }
                  }
                }
              },
              metric_availabilities: {
                client_side_validation: true,
                required: false,
                serialized_name: 'metricAvailabilities',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'MetricAvailabilityElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'MetricAvailability'
                      }
                  }
                }
              },
              id: {
                client_side_validation: true,
                required: false,
                serialized_name: 'id',
                type: {
                  name: 'String'
                }
              },
              dimensions: {
                client_side_validation: true,
                required: false,
                serialized_name: 'dimensions',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'LocalizableStringElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'LocalizableString'
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
