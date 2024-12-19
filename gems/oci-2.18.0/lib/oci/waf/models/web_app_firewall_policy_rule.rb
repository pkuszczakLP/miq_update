# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Base schema for WebAppFirewallPolicyRules, including properties common to all of them.
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class Waf::Models::WebAppFirewallPolicyRule
    TYPE_ENUM = [
      TYPE_ACCESS_CONTROL = 'ACCESS_CONTROL'.freeze,
      TYPE_PROTECTION = 'PROTECTION'.freeze,
      TYPE_REQUEST_RATE_LIMITING = 'REQUEST_RATE_LIMITING'.freeze
    ].freeze

    CONDITION_LANGUAGE_ENUM = [
      CONDITION_LANGUAGE_JMESPATH = 'JMESPATH'.freeze
    ].freeze

    # **[Required]** Type of WebAppFirewallPolicyRule.
    # @return [String]
    attr_reader :type

    # **[Required]** Rule name. Must be unique within the module.
    # @return [String]
    attr_accessor :name

    # The language used to parse condition from field `condition`. Available languages:
    #
    # * **JMESPATH** an extended JMESPath language syntax.
    #
    # @return [String]
    attr_reader :condition_language

    # An expression that determines whether or not the rule action should be executed.
    #
    # @return [String]
    attr_accessor :condition

    # **[Required]** References action by name from actions defined in WebAppFirewallPolicy.
    # @return [String]
    attr_accessor :action_name

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'type',
        'name': :'name',
        'condition_language': :'conditionLanguage',
        'condition': :'condition',
        'action_name': :'actionName'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'String',
        'name': :'String',
        'condition_language': :'String',
        'condition': :'String',
        'action_name': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'type'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::Waf::Models::ProtectionRule' if type == 'PROTECTION'
      return 'OCI::Waf::Models::RequestRateLimitingRule' if type == 'REQUEST_RATE_LIMITING'
      return 'OCI::Waf::Models::AccessControlRule' if type == 'ACCESS_CONTROL'

      # TODO: Log a warning when the subtype is not found.
      'OCI::Waf::Models::WebAppFirewallPolicyRule'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :type The value to assign to the {#type} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :condition_language The value to assign to the {#condition_language} property
    # @option attributes [String] :condition The value to assign to the {#condition} property
    # @option attributes [String] :action_name The value to assign to the {#action_name} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.type = attributes[:'type'] if attributes[:'type']

      self.name = attributes[:'name'] if attributes[:'name']

      self.condition_language = attributes[:'conditionLanguage'] if attributes[:'conditionLanguage']
      self.condition_language = "JMESPATH" if condition_language.nil? && !attributes.key?(:'conditionLanguage') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :conditionLanguage and :condition_language' if attributes.key?(:'conditionLanguage') && attributes.key?(:'condition_language')

      self.condition_language = attributes[:'condition_language'] if attributes[:'condition_language']
      self.condition_language = "JMESPATH" if condition_language.nil? && !attributes.key?(:'conditionLanguage') && !attributes.key?(:'condition_language') # rubocop:disable Style/StringLiterals

      self.condition = attributes[:'condition'] if attributes[:'condition']

      self.action_name = attributes[:'actionName'] if attributes[:'actionName']

      raise 'You cannot provide both :actionName and :action_name' if attributes.key?(:'actionName') && attributes.key?(:'action_name')

      self.action_name = attributes[:'action_name'] if attributes[:'action_name']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] type Object to be assigned
    def type=(type)
      raise "Invalid value for 'type': this must be one of the values in TYPE_ENUM." if type && !TYPE_ENUM.include?(type)

      @type = type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] condition_language Object to be assigned
    def condition_language=(condition_language)
      raise "Invalid value for 'condition_language': this must be one of the values in CONDITION_LANGUAGE_ENUM." if condition_language && !CONDITION_LANGUAGE_ENUM.include?(condition_language)

      @condition_language = condition_language
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        type == other.type &&
        name == other.name &&
        condition_language == other.condition_language &&
        condition == other.condition &&
        action_name == other.action_name
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
      [type, name, condition_language, condition, action_name].hash
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
