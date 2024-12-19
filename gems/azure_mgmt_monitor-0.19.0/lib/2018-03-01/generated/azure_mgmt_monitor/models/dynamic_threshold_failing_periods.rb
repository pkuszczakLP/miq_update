# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Monitor::Mgmt::V2018_03_01
  module Models
    #
    # The minimum number of violations required within the selected lookback
    # time window required to raise an alert.
    #
    class DynamicThresholdFailingPeriods

      include MsRestAzure

      # @return [Float] The number of aggregated lookback points. The lookback
      # time window is calculated based on the aggregation granularity
      # (windowSize) and the selected number of aggregated points.
      attr_accessor :number_of_evaluation_periods

      # @return [Float] The number of violations to trigger an alert. Should be
      # smaller or equal to numberOfEvaluationPeriods.
      attr_accessor :min_failing_periods_to_alert


      #
      # Mapper for DynamicThresholdFailingPeriods class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'DynamicThresholdFailingPeriods',
          type: {
            name: 'Composite',
            class_name: 'DynamicThresholdFailingPeriods',
            model_properties: {
              number_of_evaluation_periods: {
                client_side_validation: true,
                required: true,
                serialized_name: 'numberOfEvaluationPeriods',
                type: {
                  name: 'Double'
                }
              },
              min_failing_periods_to_alert: {
                client_side_validation: true,
                required: true,
                serialized_name: 'minFailingPeriodsToAlert',
                type: {
                  name: 'Double'
                }
              }
            }
          }
        }
      end
    end
  end
end
