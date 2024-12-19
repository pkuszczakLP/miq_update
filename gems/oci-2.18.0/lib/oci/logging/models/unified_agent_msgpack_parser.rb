# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'unified_agent_parser'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # msgpack parser.
  class Logging::Models::UnifiedAgentMsgpackParser < Logging::Models::UnifiedAgentParser
    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'parser_type': :'parserType',
        'field_time_key': :'fieldTimeKey',
        'types': :'types',
        'null_value_pattern': :'nullValuePattern',
        'is_null_empty_string': :'isNullEmptyString',
        'is_estimate_current_event': :'isEstimateCurrentEvent',
        'is_keep_time_key': :'isKeepTimeKey',
        'timeout_in_milliseconds': :'timeoutInMilliseconds'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'parser_type': :'String',
        'field_time_key': :'String',
        'types': :'Hash<String, String>',
        'null_value_pattern': :'String',
        'is_null_empty_string': :'BOOLEAN',
        'is_estimate_current_event': :'BOOLEAN',
        'is_keep_time_key': :'BOOLEAN',
        'timeout_in_milliseconds': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :field_time_key The value to assign to the {OCI::Logging::Models::UnifiedAgentParser#field_time_key #field_time_key} proprety
    # @option attributes [Hash<String, String>] :types The value to assign to the {OCI::Logging::Models::UnifiedAgentParser#types #types} proprety
    # @option attributes [String] :null_value_pattern The value to assign to the {OCI::Logging::Models::UnifiedAgentParser#null_value_pattern #null_value_pattern} proprety
    # @option attributes [BOOLEAN] :is_null_empty_string The value to assign to the {OCI::Logging::Models::UnifiedAgentParser#is_null_empty_string #is_null_empty_string} proprety
    # @option attributes [BOOLEAN] :is_estimate_current_event The value to assign to the {OCI::Logging::Models::UnifiedAgentParser#is_estimate_current_event #is_estimate_current_event} proprety
    # @option attributes [BOOLEAN] :is_keep_time_key The value to assign to the {OCI::Logging::Models::UnifiedAgentParser#is_keep_time_key #is_keep_time_key} proprety
    # @option attributes [Integer] :timeout_in_milliseconds The value to assign to the {OCI::Logging::Models::UnifiedAgentParser#timeout_in_milliseconds #timeout_in_milliseconds} proprety
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['parserType'] = 'MSGPACK'

      super(attributes)
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        parser_type == other.parser_type &&
        field_time_key == other.field_time_key &&
        types == other.types &&
        null_value_pattern == other.null_value_pattern &&
        is_null_empty_string == other.is_null_empty_string &&
        is_estimate_current_event == other.is_estimate_current_event &&
        is_keep_time_key == other.is_keep_time_key &&
        timeout_in_milliseconds == other.timeout_in_milliseconds
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
      [parser_type, field_time_key, types, null_value_pattern, is_null_empty_string, is_estimate_current_event, is_keep_time_key, timeout_in_milliseconds].hash
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
