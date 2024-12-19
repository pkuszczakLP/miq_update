# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Forecast results from the selected time period.
  class Opsi::Models::SummarizeDatabaseInsightResourceForecastTrendAggregation
    RESOURCE_METRIC_ENUM = [
      RESOURCE_METRIC_CPU = 'CPU'.freeze,
      RESOURCE_METRIC_STORAGE = 'STORAGE'.freeze,
      RESOURCE_METRIC_IO = 'IO'.freeze,
      RESOURCE_METRIC_MEMORY = 'MEMORY'.freeze,
      RESOURCE_METRIC_MEMORY_PGA = 'MEMORY_PGA'.freeze,
      RESOURCE_METRIC_MEMORY_SGA = 'MEMORY_SGA'.freeze,
      RESOURCE_METRIC_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    USAGE_UNIT_ENUM = [
      USAGE_UNIT_CORES = 'CORES'.freeze,
      USAGE_UNIT_GB = 'GB'.freeze,
      USAGE_UNIT_MBPS = 'MBPS'.freeze,
      USAGE_UNIT_IOPS = 'IOPS'.freeze,
      USAGE_UNIT_PERCENT = 'PERCENT'.freeze,
      USAGE_UNIT_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    PATTERN_ENUM = [
      PATTERN_LINEAR = 'LINEAR'.freeze,
      PATTERN_MONTHLY_SEASONS = 'MONTHLY_SEASONS'.freeze,
      PATTERN_MONTHLY_AND_YEARLY_SEASONS = 'MONTHLY_AND_YEARLY_SEASONS'.freeze,
      PATTERN_WEEKLY_SEASONS = 'WEEKLY_SEASONS'.freeze,
      PATTERN_WEEKLY_AND_MONTHLY_SEASONS = 'WEEKLY_AND_MONTHLY_SEASONS'.freeze,
      PATTERN_WEEKLY_MONTHLY_AND_YEARLY_SEASONS = 'WEEKLY_MONTHLY_AND_YEARLY_SEASONS'.freeze,
      PATTERN_WEEKLY_AND_YEARLY_SEASONS = 'WEEKLY_AND_YEARLY_SEASONS'.freeze,
      PATTERN_YEARLY_SEASONS = 'YEARLY_SEASONS'.freeze,
      PATTERN_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The start timestamp that was passed into the request.
    # @return [DateTime]
    attr_accessor :time_interval_start

    # **[Required]** The end timestamp that was passed into the request.
    # @return [DateTime]
    attr_accessor :time_interval_end

    # **[Required]** Defines the type of resource metric (example: CPU, STORAGE)
    #
    # @return [String]
    attr_reader :resource_metric

    # **[Required]** Displays usage unit ( CORES, GB)
    #
    # @return [String]
    attr_reader :usage_unit

    # **[Required]** Time series patterns used in the forecasting.
    # @return [String]
    attr_reader :pattern

    # **[Required]** The name of tablespace.
    # @return [String]
    attr_accessor :tablespace_name

    # **[Required]** Time series data used for the forecast analysis.
    # @return [Array<OCI::Opsi::Models::HistoricalDataItem>]
    attr_accessor :historical_data

    # **[Required]** Time series data result of the forecasting analysis.
    # @return [Array<OCI::Opsi::Models::ProjectedDataItem>]
    attr_accessor :projected_data

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'time_interval_start': :'timeIntervalStart',
        'time_interval_end': :'timeIntervalEnd',
        'resource_metric': :'resourceMetric',
        'usage_unit': :'usageUnit',
        'pattern': :'pattern',
        'tablespace_name': :'tablespaceName',
        'historical_data': :'historicalData',
        'projected_data': :'projectedData'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'time_interval_start': :'DateTime',
        'time_interval_end': :'DateTime',
        'resource_metric': :'String',
        'usage_unit': :'String',
        'pattern': :'String',
        'tablespace_name': :'String',
        'historical_data': :'Array<OCI::Opsi::Models::HistoricalDataItem>',
        'projected_data': :'Array<OCI::Opsi::Models::ProjectedDataItem>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [DateTime] :time_interval_start The value to assign to the {#time_interval_start} property
    # @option attributes [DateTime] :time_interval_end The value to assign to the {#time_interval_end} property
    # @option attributes [String] :resource_metric The value to assign to the {#resource_metric} property
    # @option attributes [String] :usage_unit The value to assign to the {#usage_unit} property
    # @option attributes [String] :pattern The value to assign to the {#pattern} property
    # @option attributes [String] :tablespace_name The value to assign to the {#tablespace_name} property
    # @option attributes [Array<OCI::Opsi::Models::HistoricalDataItem>] :historical_data The value to assign to the {#historical_data} property
    # @option attributes [Array<OCI::Opsi::Models::ProjectedDataItem>] :projected_data The value to assign to the {#projected_data} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.time_interval_start = attributes[:'timeIntervalStart'] if attributes[:'timeIntervalStart']

      raise 'You cannot provide both :timeIntervalStart and :time_interval_start' if attributes.key?(:'timeIntervalStart') && attributes.key?(:'time_interval_start')

      self.time_interval_start = attributes[:'time_interval_start'] if attributes[:'time_interval_start']

      self.time_interval_end = attributes[:'timeIntervalEnd'] if attributes[:'timeIntervalEnd']

      raise 'You cannot provide both :timeIntervalEnd and :time_interval_end' if attributes.key?(:'timeIntervalEnd') && attributes.key?(:'time_interval_end')

      self.time_interval_end = attributes[:'time_interval_end'] if attributes[:'time_interval_end']

      self.resource_metric = attributes[:'resourceMetric'] if attributes[:'resourceMetric']

      raise 'You cannot provide both :resourceMetric and :resource_metric' if attributes.key?(:'resourceMetric') && attributes.key?(:'resource_metric')

      self.resource_metric = attributes[:'resource_metric'] if attributes[:'resource_metric']

      self.usage_unit = attributes[:'usageUnit'] if attributes[:'usageUnit']

      raise 'You cannot provide both :usageUnit and :usage_unit' if attributes.key?(:'usageUnit') && attributes.key?(:'usage_unit')

      self.usage_unit = attributes[:'usage_unit'] if attributes[:'usage_unit']

      self.pattern = attributes[:'pattern'] if attributes[:'pattern']

      self.tablespace_name = attributes[:'tablespaceName'] if attributes[:'tablespaceName']

      raise 'You cannot provide both :tablespaceName and :tablespace_name' if attributes.key?(:'tablespaceName') && attributes.key?(:'tablespace_name')

      self.tablespace_name = attributes[:'tablespace_name'] if attributes[:'tablespace_name']

      self.historical_data = attributes[:'historicalData'] if attributes[:'historicalData']

      raise 'You cannot provide both :historicalData and :historical_data' if attributes.key?(:'historicalData') && attributes.key?(:'historical_data')

      self.historical_data = attributes[:'historical_data'] if attributes[:'historical_data']

      self.projected_data = attributes[:'projectedData'] if attributes[:'projectedData']

      raise 'You cannot provide both :projectedData and :projected_data' if attributes.key?(:'projectedData') && attributes.key?(:'projected_data')

      self.projected_data = attributes[:'projected_data'] if attributes[:'projected_data']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] resource_metric Object to be assigned
    def resource_metric=(resource_metric)
      # rubocop:disable Style/ConditionalAssignment
      if resource_metric && !RESOURCE_METRIC_ENUM.include?(resource_metric)
        OCI.logger.debug("Unknown value for 'resource_metric' [" + resource_metric + "]. Mapping to 'RESOURCE_METRIC_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @resource_metric = RESOURCE_METRIC_UNKNOWN_ENUM_VALUE
      else
        @resource_metric = resource_metric
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] usage_unit Object to be assigned
    def usage_unit=(usage_unit)
      # rubocop:disable Style/ConditionalAssignment
      if usage_unit && !USAGE_UNIT_ENUM.include?(usage_unit)
        OCI.logger.debug("Unknown value for 'usage_unit' [" + usage_unit + "]. Mapping to 'USAGE_UNIT_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @usage_unit = USAGE_UNIT_UNKNOWN_ENUM_VALUE
      else
        @usage_unit = usage_unit
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] pattern Object to be assigned
    def pattern=(pattern)
      # rubocop:disable Style/ConditionalAssignment
      if pattern && !PATTERN_ENUM.include?(pattern)
        OCI.logger.debug("Unknown value for 'pattern' [" + pattern + "]. Mapping to 'PATTERN_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @pattern = PATTERN_UNKNOWN_ENUM_VALUE
      else
        @pattern = pattern
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        time_interval_start == other.time_interval_start &&
        time_interval_end == other.time_interval_end &&
        resource_metric == other.resource_metric &&
        usage_unit == other.usage_unit &&
        pattern == other.pattern &&
        tablespace_name == other.tablespace_name &&
        historical_data == other.historical_data &&
        projected_data == other.projected_data
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines

    # @see the `==` method
    # @param [Object] other the other object to be compared
    def eql?(other)
      self == other
    end

    # rubocop:disable Metrics/AbcSize, Layout/EmptyLines


    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [time_interval_start, time_interval_end, resource_metric, usage_unit, pattern, tablespace_name, historical_data, projected_data].hash
    end
    # rubocop:enable Metrics/AbcSize, Layout/EmptyLines

    # rubocop:disable Metrics/AbcSize, Layout/EmptyLines


    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)

      self.class.swagger_types.each_pair do |key, type|
        if type =~ /^Array<(.*)>/i
          # check to ensure the input is an array given that the the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            public_method("#{key}=").call(
              attributes[self.class.attribute_map[key]]
                .map { |v| OCI::Internal::Util.convert_to_type(Regexp.last_match(1), v) }
            )
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          public_method("#{key}=").call(
            OCI::Internal::Util.convert_to_type(type, attributes[self.class.attribute_map[key]])
          )
        end
        # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end
    # rubocop:enable Metrics/AbcSize, Layout/EmptyLines

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = public_method(attr).call
        next if value.nil? && !instance_variable_defined?("@#{attr}")

        hash[param] = _to_hash(value)
      end
      hash
    end

    private

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end
  end
end
# rubocop:enable Lint/UnneededCopDisableDirective, Metrics/LineLength