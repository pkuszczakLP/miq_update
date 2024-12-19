# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'abstract_command_descriptor'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Command descriptor for querylanguage CLUSTERCOMPARE command.
  #
  class LogAnalytics::Models::ClusterCompareCommandDescriptor < LogAnalytics::Models::AbstractCommandDescriptor
    # To shift time range of main query backwards using a relative time expression e.g -24hrs. E.g compare against the previous 24 hrs.
    #
    # @return [String]
    attr_accessor :time_shift

    # Start time to apply to base line query if specified.
    #
    # @return [Integer]
    attr_accessor :time_start

    # End time to apply to base line query if specified.
    #
    # @return [Integer]
    attr_accessor :time_end

    # Option to calculate trends of each cluster if specified.
    #
    # @return [BOOLEAN]
    attr_accessor :should_include_trends

    # Option to control the size of buckets in the histogram e.g 8hrs  - each bar other than first and last should represent 8hr time span. Will be adjusted to a larger span if time range is very large.
    #
    # @return [String]
    attr_accessor :span

    # Query to use to compute base line to compare top level query results against to identify differences if specified.
    #
    # @return [String]
    attr_accessor :baseline_query

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'display_query_string': :'displayQueryString',
        'internal_query_string': :'internalQueryString',
        'category': :'category',
        'referenced_fields': :'referencedFields',
        'declared_fields': :'declaredFields',
        'time_shift': :'timeShift',
        'time_start': :'timeStart',
        'time_end': :'timeEnd',
        'should_include_trends': :'shouldIncludeTrends',
        'span': :'span',
        'baseline_query': :'baselineQuery'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'display_query_string': :'String',
        'internal_query_string': :'String',
        'category': :'String',
        'referenced_fields': :'Array<OCI::LogAnalytics::Models::AbstractField>',
        'declared_fields': :'Array<OCI::LogAnalytics::Models::AbstractField>',
        'time_shift': :'String',
        'time_start': :'Integer',
        'time_end': :'Integer',
        'should_include_trends': :'BOOLEAN',
        'span': :'String',
        'baseline_query': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :display_query_string The value to assign to the {OCI::LogAnalytics::Models::AbstractCommandDescriptor#display_query_string #display_query_string} proprety
    # @option attributes [String] :internal_query_string The value to assign to the {OCI::LogAnalytics::Models::AbstractCommandDescriptor#internal_query_string #internal_query_string} proprety
    # @option attributes [String] :category The value to assign to the {OCI::LogAnalytics::Models::AbstractCommandDescriptor#category #category} proprety
    # @option attributes [Array<OCI::LogAnalytics::Models::AbstractField>] :referenced_fields The value to assign to the {OCI::LogAnalytics::Models::AbstractCommandDescriptor#referenced_fields #referenced_fields} proprety
    # @option attributes [Array<OCI::LogAnalytics::Models::AbstractField>] :declared_fields The value to assign to the {OCI::LogAnalytics::Models::AbstractCommandDescriptor#declared_fields #declared_fields} proprety
    # @option attributes [String] :time_shift The value to assign to the {#time_shift} property
    # @option attributes [Integer] :time_start The value to assign to the {#time_start} property
    # @option attributes [Integer] :time_end The value to assign to the {#time_end} property
    # @option attributes [BOOLEAN] :should_include_trends The value to assign to the {#should_include_trends} property
    # @option attributes [String] :span The value to assign to the {#span} property
    # @option attributes [String] :baseline_query The value to assign to the {#baseline_query} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['name'] = 'CLUSTER_COMPARE'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.time_shift = attributes[:'timeShift'] if attributes[:'timeShift']

      raise 'You cannot provide both :timeShift and :time_shift' if attributes.key?(:'timeShift') && attributes.key?(:'time_shift')

      self.time_shift = attributes[:'time_shift'] if attributes[:'time_shift']

      self.time_start = attributes[:'timeStart'] if attributes[:'timeStart']

      raise 'You cannot provide both :timeStart and :time_start' if attributes.key?(:'timeStart') && attributes.key?(:'time_start')

      self.time_start = attributes[:'time_start'] if attributes[:'time_start']

      self.time_end = attributes[:'timeEnd'] if attributes[:'timeEnd']

      raise 'You cannot provide both :timeEnd and :time_end' if attributes.key?(:'timeEnd') && attributes.key?(:'time_end')

      self.time_end = attributes[:'time_end'] if attributes[:'time_end']

      self.should_include_trends = attributes[:'shouldIncludeTrends'] unless attributes[:'shouldIncludeTrends'].nil?
      self.should_include_trends = false if should_include_trends.nil? && !attributes.key?(:'shouldIncludeTrends') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :shouldIncludeTrends and :should_include_trends' if attributes.key?(:'shouldIncludeTrends') && attributes.key?(:'should_include_trends')

      self.should_include_trends = attributes[:'should_include_trends'] unless attributes[:'should_include_trends'].nil?
      self.should_include_trends = false if should_include_trends.nil? && !attributes.key?(:'shouldIncludeTrends') && !attributes.key?(:'should_include_trends') # rubocop:disable Style/StringLiterals

      self.span = attributes[:'span'] if attributes[:'span']

      self.baseline_query = attributes[:'baselineQuery'] if attributes[:'baselineQuery']

      raise 'You cannot provide both :baselineQuery and :baseline_query' if attributes.key?(:'baselineQuery') && attributes.key?(:'baseline_query')

      self.baseline_query = attributes[:'baseline_query'] if attributes[:'baseline_query']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        name == other.name &&
        display_query_string == other.display_query_string &&
        internal_query_string == other.internal_query_string &&
        category == other.category &&
        referenced_fields == other.referenced_fields &&
        declared_fields == other.declared_fields &&
        time_shift == other.time_shift &&
        time_start == other.time_start &&
        time_end == other.time_end &&
        should_include_trends == other.should_include_trends &&
        span == other.span &&
        baseline_query == other.baseline_query
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
      [name, display_query_string, internal_query_string, category, referenced_fields, declared_fields, time_shift, time_start, time_end, should_include_trends, span, baseline_query].hash
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
