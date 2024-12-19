# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The template of the tag definition. This object includes necessary details to create the provided standard tag definition.
  class Identity::Models::StandardTagDefinitionTemplate
    TYPE_ENUM = [
      TYPE_ENUM_VALUE = 'ENUM'.freeze,
      TYPE_STRING = 'STRING'.freeze,
      TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    ENUM_MUTABILITY_ENUM = [
      ENUM_MUTABILITY_IMMUTABLE = 'IMMUTABLE'.freeze,
      ENUM_MUTABILITY_MUTABLE = 'MUTABLE'.freeze,
      ENUM_MUTABILITY_APPENDABLE = 'APPENDABLE'.freeze,
      ENUM_MUTABILITY_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The default description of the tag namespace that users can use to create the tag definition
    # @return [String]
    attr_accessor :description

    # **[Required]** The name of this standard tag definition
    # @return [String]
    attr_accessor :tag_definition_name

    # **[Required]** The type of tag definition. Enum or string.
    # @return [String]
    attr_reader :type

    # List of possible values. An optional parameter that will be present if the type of definition is enum.
    # @return [Array<String>]
    attr_accessor :possible_values

    # **[Required]** Is the tag a cost tracking tag. Default will be false as cost tracking tags have been deprecated
    # @return [BOOLEAN]
    attr_accessor :is_cost_tracking

    # The mutability of the possible values list for enum tags. This will default to IMMUTABLE for string value tags
    # @return [String]
    attr_reader :enum_mutability

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'description': :'description',
        'tag_definition_name': :'tagDefinitionName',
        'type': :'type',
        'possible_values': :'possibleValues',
        'is_cost_tracking': :'isCostTracking',
        'enum_mutability': :'enumMutability'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'description': :'String',
        'tag_definition_name': :'String',
        'type': :'String',
        'possible_values': :'Array<String>',
        'is_cost_tracking': :'BOOLEAN',
        'enum_mutability': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :tag_definition_name The value to assign to the {#tag_definition_name} property
    # @option attributes [String] :type The value to assign to the {#type} property
    # @option attributes [Array<String>] :possible_values The value to assign to the {#possible_values} property
    # @option attributes [BOOLEAN] :is_cost_tracking The value to assign to the {#is_cost_tracking} property
    # @option attributes [String] :enum_mutability The value to assign to the {#enum_mutability} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.description = attributes[:'description'] if attributes[:'description']

      self.tag_definition_name = attributes[:'tagDefinitionName'] if attributes[:'tagDefinitionName']

      raise 'You cannot provide both :tagDefinitionName and :tag_definition_name' if attributes.key?(:'tagDefinitionName') && attributes.key?(:'tag_definition_name')

      self.tag_definition_name = attributes[:'tag_definition_name'] if attributes[:'tag_definition_name']

      self.type = attributes[:'type'] if attributes[:'type']

      self.possible_values = attributes[:'possibleValues'] if attributes[:'possibleValues']

      raise 'You cannot provide both :possibleValues and :possible_values' if attributes.key?(:'possibleValues') && attributes.key?(:'possible_values')

      self.possible_values = attributes[:'possible_values'] if attributes[:'possible_values']

      self.is_cost_tracking = attributes[:'isCostTracking'] unless attributes[:'isCostTracking'].nil?

      raise 'You cannot provide both :isCostTracking and :is_cost_tracking' if attributes.key?(:'isCostTracking') && attributes.key?(:'is_cost_tracking')

      self.is_cost_tracking = attributes[:'is_cost_tracking'] unless attributes[:'is_cost_tracking'].nil?

      self.enum_mutability = attributes[:'enumMutability'] if attributes[:'enumMutability']

      raise 'You cannot provide both :enumMutability and :enum_mutability' if attributes.key?(:'enumMutability') && attributes.key?(:'enum_mutability')

      self.enum_mutability = attributes[:'enum_mutability'] if attributes[:'enum_mutability']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] type Object to be assigned
    def type=(type)
      # rubocop:disable Style/ConditionalAssignment
      if type && !TYPE_ENUM.include?(type)
        OCI.logger.debug("Unknown value for 'type' [" + type + "]. Mapping to 'TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @type = TYPE_UNKNOWN_ENUM_VALUE
      else
        @type = type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] enum_mutability Object to be assigned
    def enum_mutability=(enum_mutability)
      # rubocop:disable Style/ConditionalAssignment
      if enum_mutability && !ENUM_MUTABILITY_ENUM.include?(enum_mutability)
        OCI.logger.debug("Unknown value for 'enum_mutability' [" + enum_mutability + "]. Mapping to 'ENUM_MUTABILITY_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @enum_mutability = ENUM_MUTABILITY_UNKNOWN_ENUM_VALUE
      else
        @enum_mutability = enum_mutability
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        description == other.description &&
        tag_definition_name == other.tag_definition_name &&
        type == other.type &&
        possible_values == other.possible_values &&
        is_cost_tracking == other.is_cost_tracking &&
        enum_mutability == other.enum_mutability
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
      [description, tag_definition_name, type, possible_values, is_cost_tracking, enum_mutability].hash
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
