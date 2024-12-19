# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'
require_relative 'projection_rule'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The type list rule that defines how fields are projected.
  class DataIntegration::Models::TypeListRule < DataIntegration::Models::ProjectionRule
    MATCHING_STRATEGY_ENUM = [
      MATCHING_STRATEGY_NAME_OR_TAGS = 'NAME_OR_TAGS'.freeze,
      MATCHING_STRATEGY_TAGS_ONLY = 'TAGS_ONLY'.freeze,
      MATCHING_STRATEGY_NAME_ONLY = 'NAME_ONLY'.freeze,
      MATCHING_STRATEGY_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    RULE_TYPE_ENUM = [
      RULE_TYPE_INCLUDE = 'INCLUDE'.freeze,
      RULE_TYPE_EXCLUDE = 'EXCLUDE'.freeze,
      RULE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # Specifies whether to skip remaining rules when a match is found.
    # @return [BOOLEAN]
    attr_accessor :is_skip_remaining_rules_on_match

    # Reference to a typed object. This can be either a key value to an object within the document, a shall referenced to a `TypedObject`, or a full `TypedObject` definition.
    # @return [Object]
    attr_accessor :scope

    # Specifies whether to cascade or not.
    # @return [BOOLEAN]
    attr_accessor :is_cascade

    # The pattern matching strategy.
    # @return [String]
    attr_reader :matching_strategy

    # Specifies if the rule is case sensitive.
    # @return [BOOLEAN]
    attr_accessor :is_case_sensitive

    # The rule type.
    # @return [String]
    attr_reader :rule_type

    # An arry of types.
    # @return [Array<Object>]
    attr_accessor :types

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'model_type': :'modelType',
        'key': :'key',
        'model_version': :'modelVersion',
        'parent_ref': :'parentRef',
        'is_java_regex_syntax': :'isJavaRegexSyntax',
        'config_values': :'configValues',
        'object_status': :'objectStatus',
        'description': :'description',
        'is_skip_remaining_rules_on_match': :'isSkipRemainingRulesOnMatch',
        'scope': :'scope',
        'is_cascade': :'isCascade',
        'matching_strategy': :'matchingStrategy',
        'is_case_sensitive': :'isCaseSensitive',
        'rule_type': :'ruleType',
        'types': :'types'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'model_type': :'String',
        'key': :'String',
        'model_version': :'String',
        'parent_ref': :'OCI::DataIntegration::Models::ParentReference',
        'is_java_regex_syntax': :'BOOLEAN',
        'config_values': :'OCI::DataIntegration::Models::ConfigValues',
        'object_status': :'Integer',
        'description': :'String',
        'is_skip_remaining_rules_on_match': :'BOOLEAN',
        'scope': :'Object',
        'is_cascade': :'BOOLEAN',
        'matching_strategy': :'String',
        'is_case_sensitive': :'BOOLEAN',
        'rule_type': :'String',
        'types': :'Array<Object>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :key The value to assign to the {OCI::DataIntegration::Models::ProjectionRule#key #key} proprety
    # @option attributes [String] :model_version The value to assign to the {OCI::DataIntegration::Models::ProjectionRule#model_version #model_version} proprety
    # @option attributes [OCI::DataIntegration::Models::ParentReference] :parent_ref The value to assign to the {OCI::DataIntegration::Models::ProjectionRule#parent_ref #parent_ref} proprety
    # @option attributes [BOOLEAN] :is_java_regex_syntax The value to assign to the {OCI::DataIntegration::Models::ProjectionRule#is_java_regex_syntax #is_java_regex_syntax} proprety
    # @option attributes [OCI::DataIntegration::Models::ConfigValues] :config_values The value to assign to the {OCI::DataIntegration::Models::ProjectionRule#config_values #config_values} proprety
    # @option attributes [Integer] :object_status The value to assign to the {OCI::DataIntegration::Models::ProjectionRule#object_status #object_status} proprety
    # @option attributes [String] :description The value to assign to the {OCI::DataIntegration::Models::ProjectionRule#description #description} proprety
    # @option attributes [BOOLEAN] :is_skip_remaining_rules_on_match The value to assign to the {#is_skip_remaining_rules_on_match} property
    # @option attributes [Object] :scope The value to assign to the {#scope} property
    # @option attributes [BOOLEAN] :is_cascade The value to assign to the {#is_cascade} property
    # @option attributes [String] :matching_strategy The value to assign to the {#matching_strategy} property
    # @option attributes [BOOLEAN] :is_case_sensitive The value to assign to the {#is_case_sensitive} property
    # @option attributes [String] :rule_type The value to assign to the {#rule_type} property
    # @option attributes [Array<Object>] :types The value to assign to the {#types} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['modelType'] = 'TYPE_LIST_RULE'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.is_skip_remaining_rules_on_match = attributes[:'isSkipRemainingRulesOnMatch'] unless attributes[:'isSkipRemainingRulesOnMatch'].nil?

      raise 'You cannot provide both :isSkipRemainingRulesOnMatch and :is_skip_remaining_rules_on_match' if attributes.key?(:'isSkipRemainingRulesOnMatch') && attributes.key?(:'is_skip_remaining_rules_on_match')

      self.is_skip_remaining_rules_on_match = attributes[:'is_skip_remaining_rules_on_match'] unless attributes[:'is_skip_remaining_rules_on_match'].nil?

      self.scope = attributes[:'scope'] if attributes[:'scope']

      self.is_cascade = attributes[:'isCascade'] unless attributes[:'isCascade'].nil?

      raise 'You cannot provide both :isCascade and :is_cascade' if attributes.key?(:'isCascade') && attributes.key?(:'is_cascade')

      self.is_cascade = attributes[:'is_cascade'] unless attributes[:'is_cascade'].nil?

      self.matching_strategy = attributes[:'matchingStrategy'] if attributes[:'matchingStrategy']

      raise 'You cannot provide both :matchingStrategy and :matching_strategy' if attributes.key?(:'matchingStrategy') && attributes.key?(:'matching_strategy')

      self.matching_strategy = attributes[:'matching_strategy'] if attributes[:'matching_strategy']

      self.is_case_sensitive = attributes[:'isCaseSensitive'] unless attributes[:'isCaseSensitive'].nil?

      raise 'You cannot provide both :isCaseSensitive and :is_case_sensitive' if attributes.key?(:'isCaseSensitive') && attributes.key?(:'is_case_sensitive')

      self.is_case_sensitive = attributes[:'is_case_sensitive'] unless attributes[:'is_case_sensitive'].nil?

      self.rule_type = attributes[:'ruleType'] if attributes[:'ruleType']

      raise 'You cannot provide both :ruleType and :rule_type' if attributes.key?(:'ruleType') && attributes.key?(:'rule_type')

      self.rule_type = attributes[:'rule_type'] if attributes[:'rule_type']

      self.types = attributes[:'types'] if attributes[:'types']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] matching_strategy Object to be assigned
    def matching_strategy=(matching_strategy)
      # rubocop:disable Style/ConditionalAssignment
      if matching_strategy && !MATCHING_STRATEGY_ENUM.include?(matching_strategy)
        OCI.logger.debug("Unknown value for 'matching_strategy' [" + matching_strategy + "]. Mapping to 'MATCHING_STRATEGY_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @matching_strategy = MATCHING_STRATEGY_UNKNOWN_ENUM_VALUE
      else
        @matching_strategy = matching_strategy
      end
      # rubocop:enable Style/ConditionalAssignment
    end

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
        model_type == other.model_type &&
        key == other.key &&
        model_version == other.model_version &&
        parent_ref == other.parent_ref &&
        is_java_regex_syntax == other.is_java_regex_syntax &&
        config_values == other.config_values &&
        object_status == other.object_status &&
        description == other.description &&
        is_skip_remaining_rules_on_match == other.is_skip_remaining_rules_on_match &&
        scope == other.scope &&
        is_cascade == other.is_cascade &&
        matching_strategy == other.matching_strategy &&
        is_case_sensitive == other.is_case_sensitive &&
        rule_type == other.rule_type &&
        types == other.types
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
      [model_type, key, model_version, parent_ref, is_java_regex_syntax, config_values, object_status, description, is_skip_remaining_rules_on_match, scope, is_cascade, matching_strategy, is_case_sensitive, rule_type, types].hash
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