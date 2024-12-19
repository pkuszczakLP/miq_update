# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'
require_relative 'field_map'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A map of rule patterns.
  class DataIntegration::Models::RuleBasedFieldMap < DataIntegration::Models::FieldMap
    MAP_TYPE_ENUM = [
      MAP_TYPE_MAPBYNAME = 'MAPBYNAME'.freeze,
      MAP_TYPE_MAPBYPOSITION = 'MAPBYPOSITION'.freeze,
      MAP_TYPE_MAPBYPATTERN = 'MAPBYPATTERN'.freeze,
      MAP_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The object key.
    # @return [String]
    attr_accessor :key

    # The object's model version.
    # @return [String]
    attr_accessor :model_version

    # @return [OCI::DataIntegration::Models::ParentReference]
    attr_accessor :parent_ref

    # @return [OCI::DataIntegration::Models::ConfigValues]
    attr_accessor :config_values

    # mapType
    # @return [String]
    attr_reader :map_type

    # The pattern to map from.
    # @return [String]
    attr_accessor :from_pattern

    # The pattern to map to.
    # @return [String]
    attr_accessor :to_pattern

    # Specifies whether the rule uses a java regex syntax.
    # @return [BOOLEAN]
    attr_accessor :is_java_regex_syntax

    # The status of an object that can be set to value 1 for shallow references across objects, other values reserved.
    # @return [Integer]
    attr_accessor :object_status

    # @return [OCI::DataIntegration::Models::RuleTypeConfig]
    attr_accessor :from_rule_config

    # @return [OCI::DataIntegration::Models::RuleTypeConfig]
    attr_accessor :to_rule_config

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'model_type': :'modelType',
        'description': :'description',
        'key': :'key',
        'model_version': :'modelVersion',
        'parent_ref': :'parentRef',
        'config_values': :'configValues',
        'map_type': :'mapType',
        'from_pattern': :'fromPattern',
        'to_pattern': :'toPattern',
        'is_java_regex_syntax': :'isJavaRegexSyntax',
        'object_status': :'objectStatus',
        'from_rule_config': :'fromRuleConfig',
        'to_rule_config': :'toRuleConfig'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'model_type': :'String',
        'description': :'String',
        'key': :'String',
        'model_version': :'String',
        'parent_ref': :'OCI::DataIntegration::Models::ParentReference',
        'config_values': :'OCI::DataIntegration::Models::ConfigValues',
        'map_type': :'String',
        'from_pattern': :'String',
        'to_pattern': :'String',
        'is_java_regex_syntax': :'BOOLEAN',
        'object_status': :'Integer',
        'from_rule_config': :'OCI::DataIntegration::Models::RuleTypeConfig',
        'to_rule_config': :'OCI::DataIntegration::Models::RuleTypeConfig'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :description The value to assign to the {OCI::DataIntegration::Models::FieldMap#description #description} proprety
    # @option attributes [String] :key The value to assign to the {#key} property
    # @option attributes [String] :model_version The value to assign to the {#model_version} property
    # @option attributes [OCI::DataIntegration::Models::ParentReference] :parent_ref The value to assign to the {#parent_ref} property
    # @option attributes [OCI::DataIntegration::Models::ConfigValues] :config_values The value to assign to the {#config_values} property
    # @option attributes [String] :map_type The value to assign to the {#map_type} property
    # @option attributes [String] :from_pattern The value to assign to the {#from_pattern} property
    # @option attributes [String] :to_pattern The value to assign to the {#to_pattern} property
    # @option attributes [BOOLEAN] :is_java_regex_syntax The value to assign to the {#is_java_regex_syntax} property
    # @option attributes [Integer] :object_status The value to assign to the {#object_status} property
    # @option attributes [OCI::DataIntegration::Models::RuleTypeConfig] :from_rule_config The value to assign to the {#from_rule_config} property
    # @option attributes [OCI::DataIntegration::Models::RuleTypeConfig] :to_rule_config The value to assign to the {#to_rule_config} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['modelType'] = 'RULE_BASED_FIELD_MAP'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.key = attributes[:'key'] if attributes[:'key']

      self.model_version = attributes[:'modelVersion'] if attributes[:'modelVersion']

      raise 'You cannot provide both :modelVersion and :model_version' if attributes.key?(:'modelVersion') && attributes.key?(:'model_version')

      self.model_version = attributes[:'model_version'] if attributes[:'model_version']

      self.parent_ref = attributes[:'parentRef'] if attributes[:'parentRef']

      raise 'You cannot provide both :parentRef and :parent_ref' if attributes.key?(:'parentRef') && attributes.key?(:'parent_ref')

      self.parent_ref = attributes[:'parent_ref'] if attributes[:'parent_ref']

      self.config_values = attributes[:'configValues'] if attributes[:'configValues']

      raise 'You cannot provide both :configValues and :config_values' if attributes.key?(:'configValues') && attributes.key?(:'config_values')

      self.config_values = attributes[:'config_values'] if attributes[:'config_values']

      self.map_type = attributes[:'mapType'] if attributes[:'mapType']

      raise 'You cannot provide both :mapType and :map_type' if attributes.key?(:'mapType') && attributes.key?(:'map_type')

      self.map_type = attributes[:'map_type'] if attributes[:'map_type']

      self.from_pattern = attributes[:'fromPattern'] if attributes[:'fromPattern']

      raise 'You cannot provide both :fromPattern and :from_pattern' if attributes.key?(:'fromPattern') && attributes.key?(:'from_pattern')

      self.from_pattern = attributes[:'from_pattern'] if attributes[:'from_pattern']

      self.to_pattern = attributes[:'toPattern'] if attributes[:'toPattern']

      raise 'You cannot provide both :toPattern and :to_pattern' if attributes.key?(:'toPattern') && attributes.key?(:'to_pattern')

      self.to_pattern = attributes[:'to_pattern'] if attributes[:'to_pattern']

      self.is_java_regex_syntax = attributes[:'isJavaRegexSyntax'] unless attributes[:'isJavaRegexSyntax'].nil?

      raise 'You cannot provide both :isJavaRegexSyntax and :is_java_regex_syntax' if attributes.key?(:'isJavaRegexSyntax') && attributes.key?(:'is_java_regex_syntax')

      self.is_java_regex_syntax = attributes[:'is_java_regex_syntax'] unless attributes[:'is_java_regex_syntax'].nil?

      self.object_status = attributes[:'objectStatus'] if attributes[:'objectStatus']

      raise 'You cannot provide both :objectStatus and :object_status' if attributes.key?(:'objectStatus') && attributes.key?(:'object_status')

      self.object_status = attributes[:'object_status'] if attributes[:'object_status']

      self.from_rule_config = attributes[:'fromRuleConfig'] if attributes[:'fromRuleConfig']

      raise 'You cannot provide both :fromRuleConfig and :from_rule_config' if attributes.key?(:'fromRuleConfig') && attributes.key?(:'from_rule_config')

      self.from_rule_config = attributes[:'from_rule_config'] if attributes[:'from_rule_config']

      self.to_rule_config = attributes[:'toRuleConfig'] if attributes[:'toRuleConfig']

      raise 'You cannot provide both :toRuleConfig and :to_rule_config' if attributes.key?(:'toRuleConfig') && attributes.key?(:'to_rule_config')

      self.to_rule_config = attributes[:'to_rule_config'] if attributes[:'to_rule_config']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] map_type Object to be assigned
    def map_type=(map_type)
      # rubocop:disable Style/ConditionalAssignment
      if map_type && !MAP_TYPE_ENUM.include?(map_type)
        OCI.logger.debug("Unknown value for 'map_type' [" + map_type + "]. Mapping to 'MAP_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @map_type = MAP_TYPE_UNKNOWN_ENUM_VALUE
      else
        @map_type = map_type
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
        description == other.description &&
        key == other.key &&
        model_version == other.model_version &&
        parent_ref == other.parent_ref &&
        config_values == other.config_values &&
        map_type == other.map_type &&
        from_pattern == other.from_pattern &&
        to_pattern == other.to_pattern &&
        is_java_regex_syntax == other.is_java_regex_syntax &&
        object_status == other.object_status &&
        from_rule_config == other.from_rule_config &&
        to_rule_config == other.to_rule_config
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
      [model_type, description, key, model_version, parent_ref, config_values, map_type, from_pattern, to_pattern, is_java_regex_syntax, object_status, from_rule_config, to_rule_config].hash
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