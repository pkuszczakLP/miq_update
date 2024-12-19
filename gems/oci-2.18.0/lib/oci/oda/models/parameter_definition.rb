# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A parameter to a resource.
  class Oda::Models::ParameterDefinition
    TYPE_ENUM = [
      TYPE_STRING = 'STRING'.freeze,
      TYPE_URI = 'URI'.freeze,
      TYPE_URL = 'URL'.freeze,
      TYPE_NUMBER = 'NUMBER'.freeze,
      TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    DIRECTION_ENUM = [
      DIRECTION_INPUT = 'INPUT'.freeze,
      DIRECTION_OUTPUT = 'OUTPUT'.freeze,
      DIRECTION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The name of the parameter
    # @return [String]
    attr_accessor :name

    # **[Required]** Enumerated parameter type.
    # @return [String]
    attr_reader :type

    # Description of the parameter.
    # @return [String]
    attr_accessor :description

    # Is this parameter required. Ignored for parameters with direction = OUTPUT.
    # @return [BOOLEAN]
    attr_accessor :is_required

    # Is the data for this parameter sensitive (e.g. should the data be hidden in UI, encrypted if stored, etc.)
    # @return [BOOLEAN]
    attr_accessor :is_sensitive

    # Default value for the parameter.
    # @return [String]
    attr_accessor :default_value

    # Used for character string types such as STRING to constrain the length of the value
    # @return [Integer]
    attr_accessor :min_length

    # Used for character string types such as STRING to constrain the length of the value
    # @return [Integer]
    attr_accessor :max_length

    # Regular expression used to validate the value of a string type such as STRING
    # @return [String]
    attr_accessor :pattern

    # Is this parameter an input parameter, output parameter, or both?
    # @return [String]
    attr_reader :direction

    # A forward-slash-delimited 'path' in an imaginary hierarchy, at which this parameter's UI widgets should be placed
    # @return [String]
    attr_accessor :ui_placement_hint

    # Any configuration needed to help the resource type process this parameter (e.g. link to manifest, etc.).
    # @return [Object]
    attr_accessor :resource_type_metadata

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'type': :'type',
        'description': :'description',
        'is_required': :'isRequired',
        'is_sensitive': :'isSensitive',
        'default_value': :'defaultValue',
        'min_length': :'minLength',
        'max_length': :'maxLength',
        'pattern': :'pattern',
        'direction': :'direction',
        'ui_placement_hint': :'uiPlacementHint',
        'resource_type_metadata': :'resourceTypeMetadata'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'type': :'String',
        'description': :'String',
        'is_required': :'BOOLEAN',
        'is_sensitive': :'BOOLEAN',
        'default_value': :'String',
        'min_length': :'Integer',
        'max_length': :'Integer',
        'pattern': :'String',
        'direction': :'String',
        'ui_placement_hint': :'String',
        'resource_type_metadata': :'Object'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :type The value to assign to the {#type} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [BOOLEAN] :is_required The value to assign to the {#is_required} property
    # @option attributes [BOOLEAN] :is_sensitive The value to assign to the {#is_sensitive} property
    # @option attributes [String] :default_value The value to assign to the {#default_value} property
    # @option attributes [Integer] :min_length The value to assign to the {#min_length} property
    # @option attributes [Integer] :max_length The value to assign to the {#max_length} property
    # @option attributes [String] :pattern The value to assign to the {#pattern} property
    # @option attributes [String] :direction The value to assign to the {#direction} property
    # @option attributes [String] :ui_placement_hint The value to assign to the {#ui_placement_hint} property
    # @option attributes [Object] :resource_type_metadata The value to assign to the {#resource_type_metadata} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.type = attributes[:'type'] if attributes[:'type']

      self.description = attributes[:'description'] if attributes[:'description']

      self.is_required = attributes[:'isRequired'] unless attributes[:'isRequired'].nil?

      raise 'You cannot provide both :isRequired and :is_required' if attributes.key?(:'isRequired') && attributes.key?(:'is_required')

      self.is_required = attributes[:'is_required'] unless attributes[:'is_required'].nil?

      self.is_sensitive = attributes[:'isSensitive'] unless attributes[:'isSensitive'].nil?

      raise 'You cannot provide both :isSensitive and :is_sensitive' if attributes.key?(:'isSensitive') && attributes.key?(:'is_sensitive')

      self.is_sensitive = attributes[:'is_sensitive'] unless attributes[:'is_sensitive'].nil?

      self.default_value = attributes[:'defaultValue'] if attributes[:'defaultValue']

      raise 'You cannot provide both :defaultValue and :default_value' if attributes.key?(:'defaultValue') && attributes.key?(:'default_value')

      self.default_value = attributes[:'default_value'] if attributes[:'default_value']

      self.min_length = attributes[:'minLength'] if attributes[:'minLength']

      raise 'You cannot provide both :minLength and :min_length' if attributes.key?(:'minLength') && attributes.key?(:'min_length')

      self.min_length = attributes[:'min_length'] if attributes[:'min_length']

      self.max_length = attributes[:'maxLength'] if attributes[:'maxLength']

      raise 'You cannot provide both :maxLength and :max_length' if attributes.key?(:'maxLength') && attributes.key?(:'max_length')

      self.max_length = attributes[:'max_length'] if attributes[:'max_length']

      self.pattern = attributes[:'pattern'] if attributes[:'pattern']

      self.direction = attributes[:'direction'] if attributes[:'direction']

      self.ui_placement_hint = attributes[:'uiPlacementHint'] if attributes[:'uiPlacementHint']

      raise 'You cannot provide both :uiPlacementHint and :ui_placement_hint' if attributes.key?(:'uiPlacementHint') && attributes.key?(:'ui_placement_hint')

      self.ui_placement_hint = attributes[:'ui_placement_hint'] if attributes[:'ui_placement_hint']

      self.resource_type_metadata = attributes[:'resourceTypeMetadata'] if attributes[:'resourceTypeMetadata']

      raise 'You cannot provide both :resourceTypeMetadata and :resource_type_metadata' if attributes.key?(:'resourceTypeMetadata') && attributes.key?(:'resource_type_metadata')

      self.resource_type_metadata = attributes[:'resource_type_metadata'] if attributes[:'resource_type_metadata']
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
        type == other.type &&
        description == other.description &&
        is_required == other.is_required &&
        is_sensitive == other.is_sensitive &&
        default_value == other.default_value &&
        min_length == other.min_length &&
        max_length == other.max_length &&
        pattern == other.pattern &&
        direction == other.direction &&
        ui_placement_hint == other.ui_placement_hint &&
        resource_type_metadata == other.resource_type_metadata
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
      [name, type, description, is_required, is_sensitive, default_value, min_length, max_length, pattern, direction, ui_placement_hint, resource_type_metadata].hash
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
