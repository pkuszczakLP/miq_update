# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The filter object for query usage.
  class UsageApi::Models::Filter
    OPERATOR_ENUM = [
      OPERATOR_AND = 'AND'.freeze,
      OPERATOR_NOT = 'NOT'.freeze,
      OPERATOR_OR = 'OR'.freeze,
      OPERATOR_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The filter operator. Example: 'AND', 'OR', 'NOT'.
    # @return [String]
    attr_reader :operator

    # The dimensions to filter on.
    # @return [Array<OCI::UsageApi::Models::Dimension>]
    attr_accessor :dimensions

    # The tags to filter on.
    # @return [Array<OCI::UsageApi::Models::Tag>]
    attr_accessor :tags

    # The nested filter object.
    # @return [Array<OCI::UsageApi::Models::Filter>]
    attr_accessor :filters

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'operator': :'operator',
        'dimensions': :'dimensions',
        'tags': :'tags',
        'filters': :'filters'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'operator': :'String',
        'dimensions': :'Array<OCI::UsageApi::Models::Dimension>',
        'tags': :'Array<OCI::UsageApi::Models::Tag>',
        'filters': :'Array<OCI::UsageApi::Models::Filter>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :operator The value to assign to the {#operator} property
    # @option attributes [Array<OCI::UsageApi::Models::Dimension>] :dimensions The value to assign to the {#dimensions} property
    # @option attributes [Array<OCI::UsageApi::Models::Tag>] :tags The value to assign to the {#tags} property
    # @option attributes [Array<OCI::UsageApi::Models::Filter>] :filters The value to assign to the {#filters} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.operator = attributes[:'operator'] if attributes[:'operator']

      self.dimensions = attributes[:'dimensions'] if attributes[:'dimensions']

      self.tags = attributes[:'tags'] if attributes[:'tags']

      self.filters = attributes[:'filters'] if attributes[:'filters']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] operator Object to be assigned
    def operator=(operator)
      # rubocop:disable Style/ConditionalAssignment
      if operator && !OPERATOR_ENUM.include?(operator)
        OCI.logger.debug("Unknown value for 'operator' [" + operator + "]. Mapping to 'OPERATOR_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @operator = OPERATOR_UNKNOWN_ENUM_VALUE
      else
        @operator = operator
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        operator == other.operator &&
        dimensions == other.dimensions &&
        tags == other.tags &&
        filters == other.filters
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
      [operator, dimensions, tags, filters].hash
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
