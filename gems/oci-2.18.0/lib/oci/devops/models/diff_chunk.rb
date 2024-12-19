# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details about a group of changes.
  class Devops::Models::DiffChunk
    # Line number in base version where changes begin.
    # @return [Integer]
    attr_accessor :base_line

    # Number of lines chunk spans in base version.
    # @return [Integer]
    attr_accessor :base_span

    # Line number in target version where changes begin.
    # @return [Integer]
    attr_accessor :target_line

    # Number of lines chunk spans in target version.
    # @return [Integer]
    attr_accessor :target_span

    # List of difference section.
    # @return [Array<OCI::Devops::Models::DiffSection>]
    attr_accessor :diff_sections

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'base_line': :'baseLine',
        'base_span': :'baseSpan',
        'target_line': :'targetLine',
        'target_span': :'targetSpan',
        'diff_sections': :'diffSections'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'base_line': :'Integer',
        'base_span': :'Integer',
        'target_line': :'Integer',
        'target_span': :'Integer',
        'diff_sections': :'Array<OCI::Devops::Models::DiffSection>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :base_line The value to assign to the {#base_line} property
    # @option attributes [Integer] :base_span The value to assign to the {#base_span} property
    # @option attributes [Integer] :target_line The value to assign to the {#target_line} property
    # @option attributes [Integer] :target_span The value to assign to the {#target_span} property
    # @option attributes [Array<OCI::Devops::Models::DiffSection>] :diff_sections The value to assign to the {#diff_sections} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.base_line = attributes[:'baseLine'] if attributes[:'baseLine']

      raise 'You cannot provide both :baseLine and :base_line' if attributes.key?(:'baseLine') && attributes.key?(:'base_line')

      self.base_line = attributes[:'base_line'] if attributes[:'base_line']

      self.base_span = attributes[:'baseSpan'] if attributes[:'baseSpan']

      raise 'You cannot provide both :baseSpan and :base_span' if attributes.key?(:'baseSpan') && attributes.key?(:'base_span')

      self.base_span = attributes[:'base_span'] if attributes[:'base_span']

      self.target_line = attributes[:'targetLine'] if attributes[:'targetLine']

      raise 'You cannot provide both :targetLine and :target_line' if attributes.key?(:'targetLine') && attributes.key?(:'target_line')

      self.target_line = attributes[:'target_line'] if attributes[:'target_line']

      self.target_span = attributes[:'targetSpan'] if attributes[:'targetSpan']

      raise 'You cannot provide both :targetSpan and :target_span' if attributes.key?(:'targetSpan') && attributes.key?(:'target_span')

      self.target_span = attributes[:'target_span'] if attributes[:'target_span']

      self.diff_sections = attributes[:'diffSections'] if attributes[:'diffSections']

      raise 'You cannot provide both :diffSections and :diff_sections' if attributes.key?(:'diffSections') && attributes.key?(:'diff_sections')

      self.diff_sections = attributes[:'diff_sections'] if attributes[:'diff_sections']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        base_line == other.base_line &&
        base_span == other.base_span &&
        target_line == other.target_line &&
        target_span == other.target_span &&
        diff_sections == other.diff_sections
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
      [base_line, base_span, target_line, target_span, diff_sections].hash
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
