# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Information regarding how/what row reduction methods will be applied. If this property is not present or is null, then it means row reduction is not applied.
  class AiAnomalyDetection::Models::RowReductionDetails
    REDUCTION_METHOD_ENUM = [
      REDUCTION_METHOD_DELETE_ROW = 'DELETE_ROW'.freeze,
      REDUCTION_METHOD_AVERAGE_ROW = 'AVERAGE_ROW'.freeze,
      REDUCTION_METHOD_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** A boolean value to indicate if row reduction is applied
    # @return [BOOLEAN]
    attr_accessor :is_reduction_enabled

    # **[Required]** A percentage to reduce data size down to on top of original data
    # @return [Float]
    attr_accessor :reduction_percentage

    # **[Required]** Method for row reduction:
    #   * DELETE_ROW - delete rows with equal intervals
    #   * AVERAGE_ROW - average multiple rows to one row
    #
    # @return [String]
    attr_reader :reduction_method

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'is_reduction_enabled': :'isReductionEnabled',
        'reduction_percentage': :'reductionPercentage',
        'reduction_method': :'reductionMethod'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'is_reduction_enabled': :'BOOLEAN',
        'reduction_percentage': :'Float',
        'reduction_method': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [BOOLEAN] :is_reduction_enabled The value to assign to the {#is_reduction_enabled} property
    # @option attributes [Float] :reduction_percentage The value to assign to the {#reduction_percentage} property
    # @option attributes [String] :reduction_method The value to assign to the {#reduction_method} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.is_reduction_enabled = attributes[:'isReductionEnabled'] unless attributes[:'isReductionEnabled'].nil?

      raise 'You cannot provide both :isReductionEnabled and :is_reduction_enabled' if attributes.key?(:'isReductionEnabled') && attributes.key?(:'is_reduction_enabled')

      self.is_reduction_enabled = attributes[:'is_reduction_enabled'] unless attributes[:'is_reduction_enabled'].nil?

      self.reduction_percentage = attributes[:'reductionPercentage'] if attributes[:'reductionPercentage']

      raise 'You cannot provide both :reductionPercentage and :reduction_percentage' if attributes.key?(:'reductionPercentage') && attributes.key?(:'reduction_percentage')

      self.reduction_percentage = attributes[:'reduction_percentage'] if attributes[:'reduction_percentage']

      self.reduction_method = attributes[:'reductionMethod'] if attributes[:'reductionMethod']

      raise 'You cannot provide both :reductionMethod and :reduction_method' if attributes.key?(:'reductionMethod') && attributes.key?(:'reduction_method')

      self.reduction_method = attributes[:'reduction_method'] if attributes[:'reduction_method']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] reduction_method Object to be assigned
    def reduction_method=(reduction_method)
      # rubocop:disable Style/ConditionalAssignment
      if reduction_method && !REDUCTION_METHOD_ENUM.include?(reduction_method)
        OCI.logger.debug("Unknown value for 'reduction_method' [" + reduction_method + "]. Mapping to 'REDUCTION_METHOD_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @reduction_method = REDUCTION_METHOD_UNKNOWN_ENUM_VALUE
      else
        @reduction_method = reduction_method
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        is_reduction_enabled == other.is_reduction_enabled &&
        reduction_percentage == other.reduction_percentage &&
        reduction_method == other.reduction_method
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
      [is_reduction_enabled, reduction_percentage, reduction_method].hash
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