# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # LogAnalyticsExtendedField
  class LogAnalytics::Models::LogAnalyticsExtendedField
    # @return [OCI::LogAnalytics::Models::LogAnalyticsField]
    attr_accessor :field

    # @return [OCI::LogAnalytics::Models::LogAnalyticsSourceExtendedFieldDefinition]
    attr_accessor :extended_field_definition

    # The extended field unique identifier.
    # @return [Integer]
    attr_accessor :extended_field_definition_id

    # The field internal name
    # @return [String]
    attr_accessor :field_name

    # The field internal display name.
    # @return [String]
    attr_accessor :field_display_name

    # The saved regular expression name.
    # @return [String]
    attr_accessor :saved_regular_expression_name

    # The extended field unique identifier.
    # @return [Integer]
    attr_accessor :extended_field_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'field': :'field',
        'extended_field_definition': :'extendedFieldDefinition',
        'extended_field_definition_id': :'extendedFieldDefinitionId',
        'field_name': :'fieldName',
        'field_display_name': :'fieldDisplayName',
        'saved_regular_expression_name': :'savedRegularExpressionName',
        'extended_field_id': :'extendedFieldId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'field': :'OCI::LogAnalytics::Models::LogAnalyticsField',
        'extended_field_definition': :'OCI::LogAnalytics::Models::LogAnalyticsSourceExtendedFieldDefinition',
        'extended_field_definition_id': :'Integer',
        'field_name': :'String',
        'field_display_name': :'String',
        'saved_regular_expression_name': :'String',
        'extended_field_id': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [OCI::LogAnalytics::Models::LogAnalyticsField] :field The value to assign to the {#field} property
    # @option attributes [OCI::LogAnalytics::Models::LogAnalyticsSourceExtendedFieldDefinition] :extended_field_definition The value to assign to the {#extended_field_definition} property
    # @option attributes [Integer] :extended_field_definition_id The value to assign to the {#extended_field_definition_id} property
    # @option attributes [String] :field_name The value to assign to the {#field_name} property
    # @option attributes [String] :field_display_name The value to assign to the {#field_display_name} property
    # @option attributes [String] :saved_regular_expression_name The value to assign to the {#saved_regular_expression_name} property
    # @option attributes [Integer] :extended_field_id The value to assign to the {#extended_field_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.field = attributes[:'field'] if attributes[:'field']

      self.extended_field_definition = attributes[:'extendedFieldDefinition'] if attributes[:'extendedFieldDefinition']

      raise 'You cannot provide both :extendedFieldDefinition and :extended_field_definition' if attributes.key?(:'extendedFieldDefinition') && attributes.key?(:'extended_field_definition')

      self.extended_field_definition = attributes[:'extended_field_definition'] if attributes[:'extended_field_definition']

      self.extended_field_definition_id = attributes[:'extendedFieldDefinitionId'] if attributes[:'extendedFieldDefinitionId']

      raise 'You cannot provide both :extendedFieldDefinitionId and :extended_field_definition_id' if attributes.key?(:'extendedFieldDefinitionId') && attributes.key?(:'extended_field_definition_id')

      self.extended_field_definition_id = attributes[:'extended_field_definition_id'] if attributes[:'extended_field_definition_id']

      self.field_name = attributes[:'fieldName'] if attributes[:'fieldName']

      raise 'You cannot provide both :fieldName and :field_name' if attributes.key?(:'fieldName') && attributes.key?(:'field_name')

      self.field_name = attributes[:'field_name'] if attributes[:'field_name']

      self.field_display_name = attributes[:'fieldDisplayName'] if attributes[:'fieldDisplayName']

      raise 'You cannot provide both :fieldDisplayName and :field_display_name' if attributes.key?(:'fieldDisplayName') && attributes.key?(:'field_display_name')

      self.field_display_name = attributes[:'field_display_name'] if attributes[:'field_display_name']

      self.saved_regular_expression_name = attributes[:'savedRegularExpressionName'] if attributes[:'savedRegularExpressionName']

      raise 'You cannot provide both :savedRegularExpressionName and :saved_regular_expression_name' if attributes.key?(:'savedRegularExpressionName') && attributes.key?(:'saved_regular_expression_name')

      self.saved_regular_expression_name = attributes[:'saved_regular_expression_name'] if attributes[:'saved_regular_expression_name']

      self.extended_field_id = attributes[:'extendedFieldId'] if attributes[:'extendedFieldId']

      raise 'You cannot provide both :extendedFieldId and :extended_field_id' if attributes.key?(:'extendedFieldId') && attributes.key?(:'extended_field_id')

      self.extended_field_id = attributes[:'extended_field_id'] if attributes[:'extended_field_id']
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
        extended_field_definition == other.extended_field_definition &&
        extended_field_definition_id == other.extended_field_definition_id &&
        field_name == other.field_name &&
        field_display_name == other.field_display_name &&
        saved_regular_expression_name == other.saved_regular_expression_name &&
        extended_field_id == other.extended_field_id
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
      [field, extended_field_definition, extended_field_definition_id, field_name, field_display_name, saved_regular_expression_name, extended_field_id].hash
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
