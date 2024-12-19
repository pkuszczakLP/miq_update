# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Violation
  class LogAnalytics::Models::Violation
    RULE_TYPE_ENUM = [
      RULE_TYPE_WARN = 'WARN'.freeze,
      RULE_TYPE_ERROR = 'ERROR'.freeze,
      RULE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The indices associated with regular expression violations.
    # @return [Array<OCI::LogAnalytics::Models::Indexes>]
    attr_accessor :indexes

    # The rule description.
    # @return [String]
    attr_accessor :rule_description

    # The rule name.
    # @return [String]
    attr_accessor :rule_name

    # The rule remediation.
    # @return [String]
    attr_accessor :rule_remediation

    # The rule type.  Either WARN or ERROR.
    # @return [String]
    attr_reader :rule_type

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'indexes': :'indexes',
        'rule_description': :'ruleDescription',
        'rule_name': :'ruleName',
        'rule_remediation': :'ruleRemediation',
        'rule_type': :'ruleType'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'indexes': :'Array<OCI::LogAnalytics::Models::Indexes>',
        'rule_description': :'String',
        'rule_name': :'String',
        'rule_remediation': :'String',
        'rule_type': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Array<OCI::LogAnalytics::Models::Indexes>] :indexes The value to assign to the {#indexes} property
    # @option attributes [String] :rule_description The value to assign to the {#rule_description} property
    # @option attributes [String] :rule_name The value to assign to the {#rule_name} property
    # @option attributes [String] :rule_remediation The value to assign to the {#rule_remediation} property
    # @option attributes [String] :rule_type The value to assign to the {#rule_type} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.indexes = attributes[:'indexes'] if attributes[:'indexes']

      self.rule_description = attributes[:'ruleDescription'] if attributes[:'ruleDescription']

      raise 'You cannot provide both :ruleDescription and :rule_description' if attributes.key?(:'ruleDescription') && attributes.key?(:'rule_description')

      self.rule_description = attributes[:'rule_description'] if attributes[:'rule_description']

      self.rule_name = attributes[:'ruleName'] if attributes[:'ruleName']

      raise 'You cannot provide both :ruleName and :rule_name' if attributes.key?(:'ruleName') && attributes.key?(:'rule_name')

      self.rule_name = attributes[:'rule_name'] if attributes[:'rule_name']

      self.rule_remediation = attributes[:'ruleRemediation'] if attributes[:'ruleRemediation']

      raise 'You cannot provide both :ruleRemediation and :rule_remediation' if attributes.key?(:'ruleRemediation') && attributes.key?(:'rule_remediation')

      self.rule_remediation = attributes[:'rule_remediation'] if attributes[:'rule_remediation']

      self.rule_type = attributes[:'ruleType'] if attributes[:'ruleType']

      raise 'You cannot provide both :ruleType and :rule_type' if attributes.key?(:'ruleType') && attributes.key?(:'rule_type')

      self.rule_type = attributes[:'rule_type'] if attributes[:'rule_type']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] rule_type Object to be assigned
    def rule_type=(rule_type)
      # rubocop:disable Style/ConditionalAssignment
      if rule_type && !RULE_TYPE_ENUM.include?(rule_type)
        OCI.logger.debug("Unknown value for 'rule_type' [" + rule_type + "]. Mapping to 'RULE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @rule_type = RULE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @rule_type = rule_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        indexes == other.indexes &&
        rule_description == other.rule_description &&
        rule_name == other.rule_name &&
        rule_remediation == other.rule_remediation &&
        rule_type == other.rule_type
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
      [indexes, rule_description, rule_name, rule_remediation, rule_type].hash
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
