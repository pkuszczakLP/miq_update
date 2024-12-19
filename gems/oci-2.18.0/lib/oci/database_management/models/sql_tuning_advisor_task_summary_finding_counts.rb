# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The number of findings in the SQL Tuning Advisor summary report.
  class DatabaseManagement::Models::SqlTuningAdvisorTaskSummaryFindingCounts
    # **[Required]** The number of distinct SQL statements with recommended SQL profiles.
    # @return [Integer]
    attr_accessor :recommended_sql_profile

    # **[Required]** The number of distinct SQL statements with implemented SQL profiles.
    # @return [Integer]
    attr_accessor :implemented_sql_profile

    # **[Required]** The number of distinct SQL statements with index recommendations.
    # @return [Integer]
    attr_accessor :index

    # **[Required]** The number of distinct SQL statements with restructured SQL recommendations.
    # @return [Integer]
    attr_accessor :restructure

    # **[Required]** The number of distinct SQL statements with stale or missing optimizer statistics recommendations.
    # @return [Integer]
    attr_accessor :statistics

    # **[Required]** The number of distinct SQL statements with alternative plan recommendations.
    # @return [Integer]
    attr_accessor :alternate_plan

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'recommended_sql_profile': :'recommendedSqlProfile',
        'implemented_sql_profile': :'implementedSqlProfile',
        'index': :'index',
        'restructure': :'restructure',
        'statistics': :'statistics',
        'alternate_plan': :'alternatePlan'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'recommended_sql_profile': :'Integer',
        'implemented_sql_profile': :'Integer',
        'index': :'Integer',
        'restructure': :'Integer',
        'statistics': :'Integer',
        'alternate_plan': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :recommended_sql_profile The value to assign to the {#recommended_sql_profile} property
    # @option attributes [Integer] :implemented_sql_profile The value to assign to the {#implemented_sql_profile} property
    # @option attributes [Integer] :index The value to assign to the {#index} property
    # @option attributes [Integer] :restructure The value to assign to the {#restructure} property
    # @option attributes [Integer] :statistics The value to assign to the {#statistics} property
    # @option attributes [Integer] :alternate_plan The value to assign to the {#alternate_plan} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.recommended_sql_profile = attributes[:'recommendedSqlProfile'] if attributes[:'recommendedSqlProfile']

      raise 'You cannot provide both :recommendedSqlProfile and :recommended_sql_profile' if attributes.key?(:'recommendedSqlProfile') && attributes.key?(:'recommended_sql_profile')

      self.recommended_sql_profile = attributes[:'recommended_sql_profile'] if attributes[:'recommended_sql_profile']

      self.implemented_sql_profile = attributes[:'implementedSqlProfile'] if attributes[:'implementedSqlProfile']

      raise 'You cannot provide both :implementedSqlProfile and :implemented_sql_profile' if attributes.key?(:'implementedSqlProfile') && attributes.key?(:'implemented_sql_profile')

      self.implemented_sql_profile = attributes[:'implemented_sql_profile'] if attributes[:'implemented_sql_profile']

      self.index = attributes[:'index'] if attributes[:'index']

      self.restructure = attributes[:'restructure'] if attributes[:'restructure']

      self.statistics = attributes[:'statistics'] if attributes[:'statistics']

      self.alternate_plan = attributes[:'alternatePlan'] if attributes[:'alternatePlan']

      raise 'You cannot provide both :alternatePlan and :alternate_plan' if attributes.key?(:'alternatePlan') && attributes.key?(:'alternate_plan')

      self.alternate_plan = attributes[:'alternate_plan'] if attributes[:'alternate_plan']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        recommended_sql_profile == other.recommended_sql_profile &&
        implemented_sql_profile == other.implemented_sql_profile &&
        index == other.index &&
        restructure == other.restructure &&
        statistics == other.statistics &&
        alternate_plan == other.alternate_plan
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
      [recommended_sql_profile, implemented_sql_profile, index, restructure, statistics, alternate_plan].hash
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
