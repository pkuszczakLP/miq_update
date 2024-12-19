# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Returns a parser agnostic breakdown of a query string for client query string introspection.
  #
  class LogAnalytics::Models::ParseQueryOutput
    # **[Required]** Display string formatted by query builder of user specified query string.
    #
    # @return [String]
    attr_accessor :display_query_string

    # **[Required]** Internal string formatted by query builder of user specified query string.
    #
    # @return [String]
    attr_accessor :internal_query_string

    # List of columns returned by the specified query string as result output.
    #
    # @return [Array<OCI::LogAnalytics::Models::AbstractColumn>]
    attr_accessor :columns

    # Operation response time.
    #
    # @return [Integer]
    attr_accessor :response_time_in_ms

    # List of querylanguage command descriptors, describing the specfied query string.
    #
    # @return [Array<OCI::LogAnalytics::Models::AbstractCommandDescriptor>]
    attr_accessor :commands

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'display_query_string': :'displayQueryString',
        'internal_query_string': :'internalQueryString',
        'columns': :'columns',
        'response_time_in_ms': :'responseTimeInMs',
        'commands': :'commands'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'display_query_string': :'String',
        'internal_query_string': :'String',
        'columns': :'Array<OCI::LogAnalytics::Models::AbstractColumn>',
        'response_time_in_ms': :'Integer',
        'commands': :'Array<OCI::LogAnalytics::Models::AbstractCommandDescriptor>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :display_query_string The value to assign to the {#display_query_string} property
    # @option attributes [String] :internal_query_string The value to assign to the {#internal_query_string} property
    # @option attributes [Array<OCI::LogAnalytics::Models::AbstractColumn>] :columns The value to assign to the {#columns} property
    # @option attributes [Integer] :response_time_in_ms The value to assign to the {#response_time_in_ms} property
    # @option attributes [Array<OCI::LogAnalytics::Models::AbstractCommandDescriptor>] :commands The value to assign to the {#commands} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.display_query_string = attributes[:'displayQueryString'] if attributes[:'displayQueryString']

      raise 'You cannot provide both :displayQueryString and :display_query_string' if attributes.key?(:'displayQueryString') && attributes.key?(:'display_query_string')

      self.display_query_string = attributes[:'display_query_string'] if attributes[:'display_query_string']

      self.internal_query_string = attributes[:'internalQueryString'] if attributes[:'internalQueryString']

      raise 'You cannot provide both :internalQueryString and :internal_query_string' if attributes.key?(:'internalQueryString') && attributes.key?(:'internal_query_string')

      self.internal_query_string = attributes[:'internal_query_string'] if attributes[:'internal_query_string']

      self.columns = attributes[:'columns'] if attributes[:'columns']

      self.response_time_in_ms = attributes[:'responseTimeInMs'] if attributes[:'responseTimeInMs']

      raise 'You cannot provide both :responseTimeInMs and :response_time_in_ms' if attributes.key?(:'responseTimeInMs') && attributes.key?(:'response_time_in_ms')

      self.response_time_in_ms = attributes[:'response_time_in_ms'] if attributes[:'response_time_in_ms']

      self.commands = attributes[:'commands'] if attributes[:'commands']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        display_query_string == other.display_query_string &&
        internal_query_string == other.internal_query_string &&
        columns == other.columns &&
        response_time_in_ms == other.response_time_in_ms &&
        commands == other.commands
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
      [display_query_string, internal_query_string, columns, response_time_in_ms, commands].hash
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
