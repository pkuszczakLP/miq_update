# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'
require_relative 'abstract_field'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Field outlining queryString sort command fields and their corresponding sort order.
  #
  class LogAnalytics::Models::SortField < LogAnalytics::Models::AbstractField
    DIRECTION_ENUM = [
      DIRECTION_ASCENDING = 'ASCENDING'.freeze,
      DIRECTION_DESCENDING = 'DESCENDING'.freeze,
      DIRECTION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # Sort order for the field specified in the queryString.
    #
    # @return [String]
    attr_reader :direction

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'display_name': :'displayName',
        'is_declared': :'isDeclared',
        'original_display_names': :'originalDisplayNames',
        'internal_name': :'internalName',
        'value_type': :'valueType',
        'is_groupable': :'isGroupable',
        'is_duration': :'isDuration',
        '_alias': :'alias',
        'filter_query_string': :'filterQueryString',
        'unit_type': :'unitType',
        'direction': :'direction'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'display_name': :'String',
        'is_declared': :'BOOLEAN',
        'original_display_names': :'Array<String>',
        'internal_name': :'String',
        'value_type': :'String',
        'is_groupable': :'BOOLEAN',
        'is_duration': :'BOOLEAN',
        '_alias': :'String',
        'filter_query_string': :'String',
        'unit_type': :'String',
        'direction': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :display_name The value to assign to the {OCI::LogAnalytics::Models::AbstractField#display_name #display_name} proprety
    # @option attributes [BOOLEAN] :is_declared The value to assign to the {OCI::LogAnalytics::Models::AbstractField#is_declared #is_declared} proprety
    # @option attributes [Array<String>] :original_display_names The value to assign to the {OCI::LogAnalytics::Models::AbstractField#original_display_names #original_display_names} proprety
    # @option attributes [String] :internal_name The value to assign to the {OCI::LogAnalytics::Models::AbstractField#internal_name #internal_name} proprety
    # @option attributes [String] :value_type The value to assign to the {OCI::LogAnalytics::Models::AbstractField#value_type #value_type} proprety
    # @option attributes [BOOLEAN] :is_groupable The value to assign to the {OCI::LogAnalytics::Models::AbstractField#is_groupable #is_groupable} proprety
    # @option attributes [BOOLEAN] :is_duration The value to assign to the {OCI::LogAnalytics::Models::AbstractField#is_duration #is_duration} proprety
    # @option attributes [String] :_alias The value to assign to the {OCI::LogAnalytics::Models::AbstractField#_alias #_alias} proprety
    # @option attributes [String] :filter_query_string The value to assign to the {OCI::LogAnalytics::Models::AbstractField#filter_query_string #filter_query_string} proprety
    # @option attributes [String] :unit_type The value to assign to the {OCI::LogAnalytics::Models::AbstractField#unit_type #unit_type} proprety
    # @option attributes [String] :direction The value to assign to the {#direction} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['name'] = 'SORT'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.direction = attributes[:'direction'] if attributes[:'direction']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] direction Object to be assigned
    def direction=(direction)
      # rubocop:disable Style/ConditionalAssignment
      if direction && !DIRECTION_ENUM.include?(direction)
        OCI.logger.debug("Unknown value for 'direction' [" + direction + "]. Mapping to 'DIRECTION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @direction = DIRECTION_UNKNOWN_ENUM_VALUE
      else
        @direction = direction
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        name == other.name &&
        display_name == other.display_name &&
        is_declared == other.is_declared &&
        original_display_names == other.original_display_names &&
        internal_name == other.internal_name &&
        value_type == other.value_type &&
        is_groupable == other.is_groupable &&
        is_duration == other.is_duration &&
        _alias == other._alias &&
        filter_query_string == other.filter_query_string &&
        unit_type == other.unit_type &&
        direction == other.direction
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
      [name, display_name, is_declared, original_display_names, internal_name, value_type, is_groupable, is_duration, _alias, filter_query_string, unit_type, direction].hash
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
