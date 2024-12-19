# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Generic field defining all attributes common to all querylanguage fields.
  #
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class LogAnalytics::Models::AbstractField
    NAME_ENUM = [
      NAME_FIELD = 'FIELD'.freeze,
      NAME_FIELDS = 'FIELDS'.freeze,
      NAME_FUNCTION = 'FUNCTION'.freeze,
      NAME_SORT = 'SORT'.freeze,
      NAME_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    VALUE_TYPE_ENUM = [
      VALUE_TYPE_BOOLEAN = 'BOOLEAN'.freeze,
      VALUE_TYPE_STRING = 'STRING'.freeze,
      VALUE_TYPE_DOUBLE = 'DOUBLE'.freeze,
      VALUE_TYPE_FLOAT = 'FLOAT'.freeze,
      VALUE_TYPE_LONG = 'LONG'.freeze,
      VALUE_TYPE_INTEGER = 'INTEGER'.freeze,
      VALUE_TYPE_TIMESTAMP = 'TIMESTAMP'.freeze,
      VALUE_TYPE_FACET = 'FACET'.freeze,
      VALUE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Field type classification.
    #
    # @return [String]
    attr_reader :name

    # Field display name - will be alias if field is renamed by queryStrng.
    #
    # @return [String]
    attr_accessor :display_name

    # Field denoting if this is a declaration of the field in the queryString.
    #
    # @return [BOOLEAN]
    attr_accessor :is_declared

    # Same as displayName unless field renamed in which case this will hold the original display names for the field
    # across all renames.
    #
    # @return [Array<String>]
    attr_accessor :original_display_names

    # Internal identifier for the field.
    #
    # @return [String]
    attr_accessor :internal_name

    # Field denoting field data type.
    #
    # @return [String]
    attr_reader :value_type

    # Identifies if this field can be used as a grouping field in any grouping command.
    #
    # @return [BOOLEAN]
    attr_accessor :is_groupable

    # Identifies if this field format is a duration.
    #
    # @return [BOOLEAN]
    attr_accessor :is_duration

    # Alias of field if renamed by queryStrng.
    #
    # @return [String]
    attr_accessor :_alias

    # Query used to derive this field if specified.
    #
    # @return [String]
    attr_accessor :filter_query_string

    # Field denoting field unit type.
    #
    # @return [String]
    attr_accessor :unit_type

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
        'unit_type': :'unitType'
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
        'unit_type': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'name'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::LogAnalytics::Models::FieldsAddRemoveField' if type == 'FIELDS'
      return 'OCI::LogAnalytics::Models::FunctionField' if type == 'FUNCTION'
      return 'OCI::LogAnalytics::Models::Field' if type == 'FIELD'
      return 'OCI::LogAnalytics::Models::SortField' if type == 'SORT'

      # TODO: Log a warning when the subtype is not found.
      'OCI::LogAnalytics::Models::AbstractField'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [BOOLEAN] :is_declared The value to assign to the {#is_declared} property
    # @option attributes [Array<String>] :original_display_names The value to assign to the {#original_display_names} property
    # @option attributes [String] :internal_name The value to assign to the {#internal_name} property
    # @option attributes [String] :value_type The value to assign to the {#value_type} property
    # @option attributes [BOOLEAN] :is_groupable The value to assign to the {#is_groupable} property
    # @option attributes [BOOLEAN] :is_duration The value to assign to the {#is_duration} property
    # @option attributes [String] :_alias The value to assign to the {#_alias} property
    # @option attributes [String] :filter_query_string The value to assign to the {#filter_query_string} property
    # @option attributes [String] :unit_type The value to assign to the {#unit_type} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.is_declared = attributes[:'isDeclared'] unless attributes[:'isDeclared'].nil?

      raise 'You cannot provide both :isDeclared and :is_declared' if attributes.key?(:'isDeclared') && attributes.key?(:'is_declared')

      self.is_declared = attributes[:'is_declared'] unless attributes[:'is_declared'].nil?

      self.original_display_names = attributes[:'originalDisplayNames'] if attributes[:'originalDisplayNames']

      raise 'You cannot provide both :originalDisplayNames and :original_display_names' if attributes.key?(:'originalDisplayNames') && attributes.key?(:'original_display_names')

      self.original_display_names = attributes[:'original_display_names'] if attributes[:'original_display_names']

      self.internal_name = attributes[:'internalName'] if attributes[:'internalName']

      raise 'You cannot provide both :internalName and :internal_name' if attributes.key?(:'internalName') && attributes.key?(:'internal_name')

      self.internal_name = attributes[:'internal_name'] if attributes[:'internal_name']

      self.value_type = attributes[:'valueType'] if attributes[:'valueType']

      raise 'You cannot provide both :valueType and :value_type' if attributes.key?(:'valueType') && attributes.key?(:'value_type')

      self.value_type = attributes[:'value_type'] if attributes[:'value_type']

      self.is_groupable = attributes[:'isGroupable'] unless attributes[:'isGroupable'].nil?

      raise 'You cannot provide both :isGroupable and :is_groupable' if attributes.key?(:'isGroupable') && attributes.key?(:'is_groupable')

      self.is_groupable = attributes[:'is_groupable'] unless attributes[:'is_groupable'].nil?

      self.is_duration = attributes[:'isDuration'] unless attributes[:'isDuration'].nil?

      raise 'You cannot provide both :isDuration and :is_duration' if attributes.key?(:'isDuration') && attributes.key?(:'is_duration')

      self.is_duration = attributes[:'is_duration'] unless attributes[:'is_duration'].nil?

      self._alias = attributes[:'alias'] if attributes[:'alias']

      raise 'You cannot provide both :alias and :_alias' if attributes.key?(:'alias') && attributes.key?(:'_alias')

      self._alias = attributes[:'_alias'] if attributes[:'_alias']

      self.filter_query_string = attributes[:'filterQueryString'] if attributes[:'filterQueryString']

      raise 'You cannot provide both :filterQueryString and :filter_query_string' if attributes.key?(:'filterQueryString') && attributes.key?(:'filter_query_string')

      self.filter_query_string = attributes[:'filter_query_string'] if attributes[:'filter_query_string']

      self.unit_type = attributes[:'unitType'] if attributes[:'unitType']

      raise 'You cannot provide both :unitType and :unit_type' if attributes.key?(:'unitType') && attributes.key?(:'unit_type')

      self.unit_type = attributes[:'unit_type'] if attributes[:'unit_type']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] name Object to be assigned
    def name=(name)
      # rubocop:disable Style/ConditionalAssignment
      if name && !NAME_ENUM.include?(name)
        OCI.logger.debug("Unknown value for 'name' [" + name + "]. Mapping to 'NAME_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @name = NAME_UNKNOWN_ENUM_VALUE
      else
        @name = name
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] value_type Object to be assigned
    def value_type=(value_type)
      # rubocop:disable Style/ConditionalAssignment
      if value_type && !VALUE_TYPE_ENUM.include?(value_type)
        OCI.logger.debug("Unknown value for 'value_type' [" + value_type + "]. Mapping to 'VALUE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @value_type = VALUE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @value_type = value_type
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
        unit_type == other.unit_type
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
      [name, display_name, is_declared, original_display_names, internal_name, value_type, is_groupable, is_duration, _alias, filter_query_string, unit_type].hash
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
