# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Typeahead results
  #
  class LogAnalytics::Models::SuggestOutput
    # **[Required]** Character position suggestion should be placed in queryString provided as input.
    #
    # @return [Integer]
    attr_accessor :position

    # Context specific list of querylanguage commands if input is seeking command suggestions.
    #
    # @return [Array<String>]
    attr_accessor :commands

    # Context specific list of querylanguage fields / columns if input is seeking field / column suggestions.
    #
    # @return [Array<String>]
    attr_accessor :fields

    # Context specific list of field values if input is seeking field value suggestions.
    #
    # @return [Array<String>]
    attr_accessor :field_values

    # Context specific list of terms / phrases if input is seeking terms / phrase suggestions.
    #
    # @return [Array<String>]
    attr_accessor :terms

    # Context specific list of querylanguage command options if input is seeking command option suggestions.
    #
    # @return [Array<String>]
    attr_accessor :options

    # Context specific list of querylanguage querystring examples if input is seeking queryString example suggestions.
    #
    # @return [Array<String>]
    attr_accessor :examples

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'position': :'position',
        'commands': :'commands',
        'fields': :'fields',
        'field_values': :'fieldValues',
        'terms': :'terms',
        'options': :'options',
        'examples': :'examples'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'position': :'Integer',
        'commands': :'Array<String>',
        'fields': :'Array<String>',
        'field_values': :'Array<String>',
        'terms': :'Array<String>',
        'options': :'Array<String>',
        'examples': :'Array<String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :position The value to assign to the {#position} property
    # @option attributes [Array<String>] :commands The value to assign to the {#commands} property
    # @option attributes [Array<String>] :fields The value to assign to the {#fields} property
    # @option attributes [Array<String>] :field_values The value to assign to the {#field_values} property
    # @option attributes [Array<String>] :terms The value to assign to the {#terms} property
    # @option attributes [Array<String>] :options The value to assign to the {#options} property
    # @option attributes [Array<String>] :examples The value to assign to the {#examples} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.position = attributes[:'position'] if attributes[:'position']

      self.commands = attributes[:'commands'] if attributes[:'commands']

      self.fields = attributes[:'fields'] if attributes[:'fields']

      self.field_values = attributes[:'fieldValues'] if attributes[:'fieldValues']

      raise 'You cannot provide both :fieldValues and :field_values' if attributes.key?(:'fieldValues') && attributes.key?(:'field_values')

      self.field_values = attributes[:'field_values'] if attributes[:'field_values']

      self.terms = attributes[:'terms'] if attributes[:'terms']

      self.options = attributes[:'options'] if attributes[:'options']

      self.examples = attributes[:'examples'] if attributes[:'examples']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        position == other.position &&
        commands == other.commands &&
        fields == other.fields &&
        field_values == other.field_values &&
        terms == other.terms &&
        options == other.options &&
        examples == other.examples
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
      [position, commands, fields, field_values, terms, options, examples].hash
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
