# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'abstract_column'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Column containing query results produced by the query language classify command.
  #
  class LogAnalytics::Models::ClassifyColumn < LogAnalytics::Models::AbstractColumn
    # A list of fields specified in the classify command in the query string.
    #
    # @return [Array<String>]
    attr_accessor :classify_field_names

    # Count of nulls found in each of the fields specified in the classify command in the query string.
    #
    # @return [Array<Integer>]
    attr_accessor :classify_field_null_count

    # Count of anomalies for each timeseries datapoint.
    #
    # @return [Array<Integer>]
    attr_accessor :classify_anomaly_interval_counts

    # Column descriptors for the classify result.
    #
    # @return [Array<OCI::LogAnalytics::Models::AbstractColumn>]
    attr_accessor :classify_columns

    # Results of the classify command.
    #
    # @return [Array<Hash<String, Object>>]
    attr_accessor :classify_result

    # Column descriptors of fields with strong correlation with the classify fields.
    #
    # @return [Array<OCI::LogAnalytics::Models::AbstractColumn>]
    attr_accessor :classify_correlate_columns

    # Correlation results of the classify command.
    #
    # @return [Array<Hash<String, Object>>]
    attr_accessor :classify_correlate_result

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'type',
        'display_name': :'displayName',
        'sub_system': :'subSystem',
        'values': :'values',
        'is_list_of_values': :'isListOfValues',
        'is_multi_valued': :'isMultiValued',
        'is_case_sensitive': :'isCaseSensitive',
        'is_groupable': :'isGroupable',
        'is_evaluable': :'isEvaluable',
        'value_type': :'valueType',
        'original_display_name': :'originalDisplayName',
        'internal_name': :'internalName',
        'classify_field_names': :'classifyFieldNames',
        'classify_field_null_count': :'classifyFieldNullCount',
        'classify_anomaly_interval_counts': :'classifyAnomalyIntervalCounts',
        'classify_columns': :'classifyColumns',
        'classify_result': :'classifyResult',
        'classify_correlate_columns': :'classifyCorrelateColumns',
        'classify_correlate_result': :'classifyCorrelateResult'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'String',
        'display_name': :'String',
        'sub_system': :'String',
        'values': :'Array<OCI::LogAnalytics::Models::FieldValue>',
        'is_list_of_values': :'BOOLEAN',
        'is_multi_valued': :'BOOLEAN',
        'is_case_sensitive': :'BOOLEAN',
        'is_groupable': :'BOOLEAN',
        'is_evaluable': :'BOOLEAN',
        'value_type': :'String',
        'original_display_name': :'String',
        'internal_name': :'String',
        'classify_field_names': :'Array<String>',
        'classify_field_null_count': :'Array<Integer>',
        'classify_anomaly_interval_counts': :'Array<Integer>',
        'classify_columns': :'Array<OCI::LogAnalytics::Models::AbstractColumn>',
        'classify_result': :'Array<Hash<String, Object>>',
        'classify_correlate_columns': :'Array<OCI::LogAnalytics::Models::AbstractColumn>',
        'classify_correlate_result': :'Array<Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :display_name The value to assign to the {OCI::LogAnalytics::Models::AbstractColumn#display_name #display_name} proprety
    # @option attributes [String] :sub_system The value to assign to the {OCI::LogAnalytics::Models::AbstractColumn#sub_system #sub_system} proprety
    # @option attributes [Array<OCI::LogAnalytics::Models::FieldValue>] :values The value to assign to the {OCI::LogAnalytics::Models::AbstractColumn#values #values} proprety
    # @option attributes [BOOLEAN] :is_list_of_values The value to assign to the {OCI::LogAnalytics::Models::AbstractColumn#is_list_of_values #is_list_of_values} proprety
    # @option attributes [BOOLEAN] :is_multi_valued The value to assign to the {OCI::LogAnalytics::Models::AbstractColumn#is_multi_valued #is_multi_valued} proprety
    # @option attributes [BOOLEAN] :is_case_sensitive The value to assign to the {OCI::LogAnalytics::Models::AbstractColumn#is_case_sensitive #is_case_sensitive} proprety
    # @option attributes [BOOLEAN] :is_groupable The value to assign to the {OCI::LogAnalytics::Models::AbstractColumn#is_groupable #is_groupable} proprety
    # @option attributes [BOOLEAN] :is_evaluable The value to assign to the {OCI::LogAnalytics::Models::AbstractColumn#is_evaluable #is_evaluable} proprety
    # @option attributes [String] :value_type The value to assign to the {OCI::LogAnalytics::Models::AbstractColumn#value_type #value_type} proprety
    # @option attributes [String] :original_display_name The value to assign to the {OCI::LogAnalytics::Models::AbstractColumn#original_display_name #original_display_name} proprety
    # @option attributes [String] :internal_name The value to assign to the {OCI::LogAnalytics::Models::AbstractColumn#internal_name #internal_name} proprety
    # @option attributes [Array<String>] :classify_field_names The value to assign to the {#classify_field_names} property
    # @option attributes [Array<Integer>] :classify_field_null_count The value to assign to the {#classify_field_null_count} property
    # @option attributes [Array<Integer>] :classify_anomaly_interval_counts The value to assign to the {#classify_anomaly_interval_counts} property
    # @option attributes [Array<OCI::LogAnalytics::Models::AbstractColumn>] :classify_columns The value to assign to the {#classify_columns} property
    # @option attributes [Array<Hash<String, Object>>] :classify_result The value to assign to the {#classify_result} property
    # @option attributes [Array<OCI::LogAnalytics::Models::AbstractColumn>] :classify_correlate_columns The value to assign to the {#classify_correlate_columns} property
    # @option attributes [Array<Hash<String, Object>>] :classify_correlate_result The value to assign to the {#classify_correlate_result} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['type'] = 'CLASSIFY_COLUMN'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.classify_field_names = attributes[:'classifyFieldNames'] if attributes[:'classifyFieldNames']

      raise 'You cannot provide both :classifyFieldNames and :classify_field_names' if attributes.key?(:'classifyFieldNames') && attributes.key?(:'classify_field_names')

      self.classify_field_names = attributes[:'classify_field_names'] if attributes[:'classify_field_names']

      self.classify_field_null_count = attributes[:'classifyFieldNullCount'] if attributes[:'classifyFieldNullCount']

      raise 'You cannot provide both :classifyFieldNullCount and :classify_field_null_count' if attributes.key?(:'classifyFieldNullCount') && attributes.key?(:'classify_field_null_count')

      self.classify_field_null_count = attributes[:'classify_field_null_count'] if attributes[:'classify_field_null_count']

      self.classify_anomaly_interval_counts = attributes[:'classifyAnomalyIntervalCounts'] if attributes[:'classifyAnomalyIntervalCounts']

      raise 'You cannot provide both :classifyAnomalyIntervalCounts and :classify_anomaly_interval_counts' if attributes.key?(:'classifyAnomalyIntervalCounts') && attributes.key?(:'classify_anomaly_interval_counts')

      self.classify_anomaly_interval_counts = attributes[:'classify_anomaly_interval_counts'] if attributes[:'classify_anomaly_interval_counts']

      self.classify_columns = attributes[:'classifyColumns'] if attributes[:'classifyColumns']

      raise 'You cannot provide both :classifyColumns and :classify_columns' if attributes.key?(:'classifyColumns') && attributes.key?(:'classify_columns')

      self.classify_columns = attributes[:'classify_columns'] if attributes[:'classify_columns']

      self.classify_result = attributes[:'classifyResult'] if attributes[:'classifyResult']

      raise 'You cannot provide both :classifyResult and :classify_result' if attributes.key?(:'classifyResult') && attributes.key?(:'classify_result')

      self.classify_result = attributes[:'classify_result'] if attributes[:'classify_result']

      self.classify_correlate_columns = attributes[:'classifyCorrelateColumns'] if attributes[:'classifyCorrelateColumns']

      raise 'You cannot provide both :classifyCorrelateColumns and :classify_correlate_columns' if attributes.key?(:'classifyCorrelateColumns') && attributes.key?(:'classify_correlate_columns')

      self.classify_correlate_columns = attributes[:'classify_correlate_columns'] if attributes[:'classify_correlate_columns']

      self.classify_correlate_result = attributes[:'classifyCorrelateResult'] if attributes[:'classifyCorrelateResult']

      raise 'You cannot provide both :classifyCorrelateResult and :classify_correlate_result' if attributes.key?(:'classifyCorrelateResult') && attributes.key?(:'classify_correlate_result')

      self.classify_correlate_result = attributes[:'classify_correlate_result'] if attributes[:'classify_correlate_result']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        type == other.type &&
        display_name == other.display_name &&
        sub_system == other.sub_system &&
        values == other.values &&
        is_list_of_values == other.is_list_of_values &&
        is_multi_valued == other.is_multi_valued &&
        is_case_sensitive == other.is_case_sensitive &&
        is_groupable == other.is_groupable &&
        is_evaluable == other.is_evaluable &&
        value_type == other.value_type &&
        original_display_name == other.original_display_name &&
        internal_name == other.internal_name &&
        classify_field_names == other.classify_field_names &&
        classify_field_null_count == other.classify_field_null_count &&
        classify_anomaly_interval_counts == other.classify_anomaly_interval_counts &&
        classify_columns == other.classify_columns &&
        classify_result == other.classify_result &&
        classify_correlate_columns == other.classify_correlate_columns &&
        classify_correlate_result == other.classify_correlate_result
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
      [type, display_name, sub_system, values, is_list_of_values, is_multi_valued, is_case_sensitive, is_groupable, is_evaluable, value_type, original_display_name, internal_name, classify_field_names, classify_field_null_count, classify_anomaly_interval_counts, classify_columns, classify_result, classify_correlate_columns, classify_correlate_result].hash
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
