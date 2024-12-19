# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # LogAnalyticsSourceExtendedFieldDefinition
  class LogAnalytics::Models::LogAnalyticsSourceExtendedFieldDefinition
    # @return [OCI::LogAnalytics::Models::LogAnalyticsField]
    attr_accessor :field

    # The regular expression.
    # @return [String]
    attr_accessor :display_regular_expression

    # An array of extended fields.
    # @return [Array<OCI::LogAnalytics::Models::LogAnalyticsExtendedField>]
    attr_accessor :extended_fields

    # The base field internal name.
    # @return [String]
    attr_accessor :base_field_name

    # The base field log text.
    # @return [String]
    attr_accessor :base_field_log_text

    # The conditional data type.
    # @return [String]
    attr_accessor :condition_data_type

    # The onditional field.
    # @return [String]
    attr_accessor :condition_field

    # The conditional operator.
    # @return [String]
    attr_accessor :condition_operator

    # The conditional value.
    # @return [String]
    attr_accessor :condition_value

    # The converted regular expression.
    # @return [String]
    attr_accessor :converted_regular_expression

    # A flag inidcating whether or not the extended definition is enabled.
    #
    # @return [BOOLEAN]
    attr_accessor :is_enabled

    # The extended field definition unique identifier.
    # @return [Integer]
    attr_accessor :extended_field_definition_id

    # The system flag.  A value of false denotes a custom, or user
    # defined object.  A value of true denotes a built in object.
    #
    # @return [BOOLEAN]
    attr_accessor :is_system

    # The regular expression.
    # @return [String]
    attr_accessor :regular_expression

    # The source unique identifier.
    # @return [Integer]
    attr_accessor :source_id

    # The last updated date.
    # @return [DateTime]
    attr_accessor :time_updated

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'field': :'field',
        'display_regular_expression': :'displayRegularExpression',
        'extended_fields': :'extendedFields',
        'base_field_name': :'baseFieldName',
        'base_field_log_text': :'baseFieldLogText',
        'condition_data_type': :'conditionDataType',
        'condition_field': :'conditionField',
        'condition_operator': :'conditionOperator',
        'condition_value': :'conditionValue',
        'converted_regular_expression': :'convertedRegularExpression',
        'is_enabled': :'isEnabled',
        'extended_field_definition_id': :'extendedFieldDefinitionId',
        'is_system': :'isSystem',
        'regular_expression': :'regularExpression',
        'source_id': :'sourceId',
        'time_updated': :'timeUpdated'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'field': :'OCI::LogAnalytics::Models::LogAnalyticsField',
        'display_regular_expression': :'String',
        'extended_fields': :'Array<OCI::LogAnalytics::Models::LogAnalyticsExtendedField>',
        'base_field_name': :'String',
        'base_field_log_text': :'String',
        'condition_data_type': :'String',
        'condition_field': :'String',
        'condition_operator': :'String',
        'condition_value': :'String',
        'converted_regular_expression': :'String',
        'is_enabled': :'BOOLEAN',
        'extended_field_definition_id': :'Integer',
        'is_system': :'BOOLEAN',
        'regular_expression': :'String',
        'source_id': :'Integer',
        'time_updated': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [OCI::LogAnalytics::Models::LogAnalyticsField] :field The value to assign to the {#field} property
    # @option attributes [String] :display_regular_expression The value to assign to the {#display_regular_expression} property
    # @option attributes [Array<OCI::LogAnalytics::Models::LogAnalyticsExtendedField>] :extended_fields The value to assign to the {#extended_fields} property
    # @option attributes [String] :base_field_name The value to assign to the {#base_field_name} property
    # @option attributes [String] :base_field_log_text The value to assign to the {#base_field_log_text} property
    # @option attributes [String] :condition_data_type The value to assign to the {#condition_data_type} property
    # @option attributes [String] :condition_field The value to assign to the {#condition_field} property
    # @option attributes [String] :condition_operator The value to assign to the {#condition_operator} property
    # @option attributes [String] :condition_value The value to assign to the {#condition_value} property
    # @option attributes [String] :converted_regular_expression The value to assign to the {#converted_regular_expression} property
    # @option attributes [BOOLEAN] :is_enabled The value to assign to the {#is_enabled} property
    # @option attributes [Integer] :extended_field_definition_id The value to assign to the {#extended_field_definition_id} property
    # @option attributes [BOOLEAN] :is_system The value to assign to the {#is_system} property
    # @option attributes [String] :regular_expression The value to assign to the {#regular_expression} property
    # @option attributes [Integer] :source_id The value to assign to the {#source_id} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.field = attributes[:'field'] if attributes[:'field']

      self.display_regular_expression = attributes[:'displayRegularExpression'] if attributes[:'displayRegularExpression']

      raise 'You cannot provide both :displayRegularExpression and :display_regular_expression' if attributes.key?(:'displayRegularExpression') && attributes.key?(:'display_regular_expression')

      self.display_regular_expression = attributes[:'display_regular_expression'] if attributes[:'display_regular_expression']

      self.extended_fields = attributes[:'extendedFields'] if attributes[:'extendedFields']

      raise 'You cannot provide both :extendedFields and :extended_fields' if attributes.key?(:'extendedFields') && attributes.key?(:'extended_fields')

      self.extended_fields = attributes[:'extended_fields'] if attributes[:'extended_fields']

      self.base_field_name = attributes[:'baseFieldName'] if attributes[:'baseFieldName']

      raise 'You cannot provide both :baseFieldName and :base_field_name' if attributes.key?(:'baseFieldName') && attributes.key?(:'base_field_name')

      self.base_field_name = attributes[:'base_field_name'] if attributes[:'base_field_name']

      self.base_field_log_text = attributes[:'baseFieldLogText'] if attributes[:'baseFieldLogText']

      raise 'You cannot provide both :baseFieldLogText and :base_field_log_text' if attributes.key?(:'baseFieldLogText') && attributes.key?(:'base_field_log_text')

      self.base_field_log_text = attributes[:'base_field_log_text'] if attributes[:'base_field_log_text']

      self.condition_data_type = attributes[:'conditionDataType'] if attributes[:'conditionDataType']

      raise 'You cannot provide both :conditionDataType and :condition_data_type' if attributes.key?(:'conditionDataType') && attributes.key?(:'condition_data_type')

      self.condition_data_type = attributes[:'condition_data_type'] if attributes[:'condition_data_type']

      self.condition_field = attributes[:'conditionField'] if attributes[:'conditionField']

      raise 'You cannot provide both :conditionField and :condition_field' if attributes.key?(:'conditionField') && attributes.key?(:'condition_field')

      self.condition_field = attributes[:'condition_field'] if attributes[:'condition_field']

      self.condition_operator = attributes[:'conditionOperator'] if attributes[:'conditionOperator']

      raise 'You cannot provide both :conditionOperator and :condition_operator' if attributes.key?(:'conditionOperator') && attributes.key?(:'condition_operator')

      self.condition_operator = attributes[:'condition_operator'] if attributes[:'condition_operator']

      self.condition_value = attributes[:'conditionValue'] if attributes[:'conditionValue']

      raise 'You cannot provide both :conditionValue and :condition_value' if attributes.key?(:'conditionValue') && attributes.key?(:'condition_value')

      self.condition_value = attributes[:'condition_value'] if attributes[:'condition_value']

      self.converted_regular_expression = attributes[:'convertedRegularExpression'] if attributes[:'convertedRegularExpression']

      raise 'You cannot provide both :convertedRegularExpression and :converted_regular_expression' if attributes.key?(:'convertedRegularExpression') && attributes.key?(:'converted_regular_expression')

      self.converted_regular_expression = attributes[:'converted_regular_expression'] if attributes[:'converted_regular_expression']

      self.is_enabled = attributes[:'isEnabled'] unless attributes[:'isEnabled'].nil?

      raise 'You cannot provide both :isEnabled and :is_enabled' if attributes.key?(:'isEnabled') && attributes.key?(:'is_enabled')

      self.is_enabled = attributes[:'is_enabled'] unless attributes[:'is_enabled'].nil?

      self.extended_field_definition_id = attributes[:'extendedFieldDefinitionId'] if attributes[:'extendedFieldDefinitionId']

      raise 'You cannot provide both :extendedFieldDefinitionId and :extended_field_definition_id' if attributes.key?(:'extendedFieldDefinitionId') && attributes.key?(:'extended_field_definition_id')

      self.extended_field_definition_id = attributes[:'extended_field_definition_id'] if attributes[:'extended_field_definition_id']

      self.is_system = attributes[:'isSystem'] unless attributes[:'isSystem'].nil?

      raise 'You cannot provide both :isSystem and :is_system' if attributes.key?(:'isSystem') && attributes.key?(:'is_system')

      self.is_system = attributes[:'is_system'] unless attributes[:'is_system'].nil?

      self.regular_expression = attributes[:'regularExpression'] if attributes[:'regularExpression']

      raise 'You cannot provide both :regularExpression and :regular_expression' if attributes.key?(:'regularExpression') && attributes.key?(:'regular_expression')

      self.regular_expression = attributes[:'regular_expression'] if attributes[:'regular_expression']

      self.source_id = attributes[:'sourceId'] if attributes[:'sourceId']

      raise 'You cannot provide both :sourceId and :source_id' if attributes.key?(:'sourceId') && attributes.key?(:'source_id')

      self.source_id = attributes[:'source_id'] if attributes[:'source_id']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        field == other.field &&
        display_regular_expression == other.display_regular_expression &&
        extended_fields == other.extended_fields &&
        base_field_name == other.base_field_name &&
        base_field_log_text == other.base_field_log_text &&
        condition_data_type == other.condition_data_type &&
        condition_field == other.condition_field &&
        condition_operator == other.condition_operator &&
        condition_value == other.condition_value &&
        converted_regular_expression == other.converted_regular_expression &&
        is_enabled == other.is_enabled &&
        extended_field_definition_id == other.extended_field_definition_id &&
        is_system == other.is_system &&
        regular_expression == other.regular_expression &&
        source_id == other.source_id &&
        time_updated == other.time_updated
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
      [field, display_regular_expression, extended_fields, base_field_name, base_field_log_text, condition_data_type, condition_field, condition_operator, condition_value, converted_regular_expression, is_enabled, extended_field_definition_id, is_system, regular_expression, source_id, time_updated].hash
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
