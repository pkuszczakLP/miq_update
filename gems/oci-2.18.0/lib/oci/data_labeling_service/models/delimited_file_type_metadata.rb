# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'text_file_type_metadata'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Metadata of delimited files.
  class DataLabelingService::Models::DelimitedFileTypeMetadata < DataLabelingService::Models::TextFileTypeMetadata
    # The name of a selected column.
    # @return [String]
    attr_accessor :column_name

    # **[Required]** The index of a selected column. This is a zero-based index.
    # @return [Integer]
    attr_accessor :column_index

    # A column delimiter
    # @return [String]
    attr_accessor :column_delimiter

    # A line delimiter.
    # @return [String]
    attr_accessor :line_delimiter

    # An escape character.
    # @return [String]
    attr_accessor :escape_character

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'format_type': :'formatType',
        'column_name': :'columnName',
        'column_index': :'columnIndex',
        'column_delimiter': :'columnDelimiter',
        'line_delimiter': :'lineDelimiter',
        'escape_character': :'escapeCharacter'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'format_type': :'String',
        'column_name': :'String',
        'column_index': :'Integer',
        'column_delimiter': :'String',
        'line_delimiter': :'String',
        'escape_character': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :column_name The value to assign to the {#column_name} property
    # @option attributes [Integer] :column_index The value to assign to the {#column_index} property
    # @option attributes [String] :column_delimiter The value to assign to the {#column_delimiter} property
    # @option attributes [String] :line_delimiter The value to assign to the {#line_delimiter} property
    # @option attributes [String] :escape_character The value to assign to the {#escape_character} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['formatType'] = 'DELIMITED'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.column_name = attributes[:'columnName'] if attributes[:'columnName']

      raise 'You cannot provide both :columnName and :column_name' if attributes.key?(:'columnName') && attributes.key?(:'column_name')

      self.column_name = attributes[:'column_name'] if attributes[:'column_name']

      self.column_index = attributes[:'columnIndex'] if attributes[:'columnIndex']

      raise 'You cannot provide both :columnIndex and :column_index' if attributes.key?(:'columnIndex') && attributes.key?(:'column_index')

      self.column_index = attributes[:'column_index'] if attributes[:'column_index']

      self.column_delimiter = attributes[:'columnDelimiter'] if attributes[:'columnDelimiter']
      self.column_delimiter = "," if column_delimiter.nil? && !attributes.key?(:'columnDelimiter') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :columnDelimiter and :column_delimiter' if attributes.key?(:'columnDelimiter') && attributes.key?(:'column_delimiter')

      self.column_delimiter = attributes[:'column_delimiter'] if attributes[:'column_delimiter']
      self.column_delimiter = "," if column_delimiter.nil? && !attributes.key?(:'columnDelimiter') && !attributes.key?(:'column_delimiter') # rubocop:disable Style/StringLiterals

      self.line_delimiter = attributes[:'lineDelimiter'] if attributes[:'lineDelimiter']

      raise 'You cannot provide both :lineDelimiter and :line_delimiter' if attributes.key?(:'lineDelimiter') && attributes.key?(:'line_delimiter')

      self.line_delimiter = attributes[:'line_delimiter'] if attributes[:'line_delimiter']

      self.escape_character = attributes[:'escapeCharacter'] if attributes[:'escapeCharacter']

      raise 'You cannot provide both :escapeCharacter and :escape_character' if attributes.key?(:'escapeCharacter') && attributes.key?(:'escape_character')

      self.escape_character = attributes[:'escape_character'] if attributes[:'escape_character']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        format_type == other.format_type &&
        column_name == other.column_name &&
        column_index == other.column_index &&
        column_delimiter == other.column_delimiter &&
        line_delimiter == other.line_delimiter &&
        escape_character == other.escape_character
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
      [format_type, column_name, column_index, column_delimiter, line_delimiter, escape_character].hash
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