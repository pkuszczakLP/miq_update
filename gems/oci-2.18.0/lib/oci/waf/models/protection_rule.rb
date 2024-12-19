# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'
require_relative 'web_app_firewall_policy_rule'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Rule that represents Request/Response Protection.
  # Only actions of the following types are allowed to be referenced in this rule:
  #  * CHECK
  #  * RETURN_HTTP_RESPONSE
  #
  class Waf::Models::ProtectionRule < Waf::Models::WebAppFirewallPolicyRule
    # **[Required]** An ordered list that references OCI-managed protection capabilities.
    # Referenced protection capabilities are not necessarily executed in order of appearance. Their execution order
    # is decided at runtime for improved performance.
    # The array cannot contain entries with the same pair of capability key and version more than once.
    #
    # @return [Array<OCI::Waf::Models::ProtectionCapability>]
    attr_accessor :protection_capabilities

    # @return [OCI::Waf::Models::ProtectionCapabilitySettings]
    attr_accessor :protection_capability_settings

    # Enables/disables body inspection for this protection rule.
    # Only Protection Rules in RequestProtection can have this option enabled. Response body inspection will
    # be available at a later date.
    #
    # @return [BOOLEAN]
    attr_accessor :is_body_inspection_enabled

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'type',
        'name': :'name',
        'condition_language': :'conditionLanguage',
        'condition': :'condition',
        'action_name': :'actionName',
        'protection_capabilities': :'protectionCapabilities',
        'protection_capability_settings': :'protectionCapabilitySettings',
        'is_body_inspection_enabled': :'isBodyInspectionEnabled'
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
        'action_name': :'String',
        'protection_capabilities': :'Array<OCI::Waf::Models::ProtectionCapability>',
        'protection_capability_settings': :'OCI::Waf::Models::ProtectionCapabilitySettings',
        'is_body_inspection_enabled': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {OCI::Waf::Models::WebAppFirewallPolicyRule#name #name} proprety
    # @option attributes [String] :condition_language The value to assign to the {OCI::Waf::Models::WebAppFirewallPolicyRule#condition_language #condition_language} proprety
    # @option attributes [String] :condition The value to assign to the {OCI::Waf::Models::WebAppFirewallPolicyRule#condition #condition} proprety
    # @option attributes [String] :action_name The value to assign to the {OCI::Waf::Models::WebAppFirewallPolicyRule#action_name #action_name} proprety
    # @option attributes [Array<OCI::Waf::Models::ProtectionCapability>] :protection_capabilities The value to assign to the {#protection_capabilities} property
    # @option attributes [OCI::Waf::Models::ProtectionCapabilitySettings] :protection_capability_settings The value to assign to the {#protection_capability_settings} property
    # @option attributes [BOOLEAN] :is_body_inspection_enabled The value to assign to the {#is_body_inspection_enabled} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['type'] = 'PROTECTION'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.protection_capabilities = attributes[:'protectionCapabilities'] if attributes[:'protectionCapabilities']

      raise 'You cannot provide both :protectionCapabilities and :protection_capabilities' if attributes.key?(:'protectionCapabilities') && attributes.key?(:'protection_capabilities')

      self.protection_capabilities = attributes[:'protection_capabilities'] if attributes[:'protection_capabilities']

      self.protection_capability_settings = attributes[:'protectionCapabilitySettings'] if attributes[:'protectionCapabilitySettings']

      raise 'You cannot provide both :protectionCapabilitySettings and :protection_capability_settings' if attributes.key?(:'protectionCapabilitySettings') && attributes.key?(:'protection_capability_settings')

      self.protection_capability_settings = attributes[:'protection_capability_settings'] if attributes[:'protection_capability_settings']

      self.is_body_inspection_enabled = attributes[:'isBodyInspectionEnabled'] unless attributes[:'isBodyInspectionEnabled'].nil?
      self.is_body_inspection_enabled = false if is_body_inspection_enabled.nil? && !attributes.key?(:'isBodyInspectionEnabled') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isBodyInspectionEnabled and :is_body_inspection_enabled' if attributes.key?(:'isBodyInspectionEnabled') && attributes.key?(:'is_body_inspection_enabled')

      self.is_body_inspection_enabled = attributes[:'is_body_inspection_enabled'] unless attributes[:'is_body_inspection_enabled'].nil?
      self.is_body_inspection_enabled = false if is_body_inspection_enabled.nil? && !attributes.key?(:'isBodyInspectionEnabled') && !attributes.key?(:'is_body_inspection_enabled') # rubocop:disable Style/StringLiterals
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

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
        action_name == other.action_name &&
        protection_capabilities == other.protection_capabilities &&
        protection_capability_settings == other.protection_capability_settings &&
        is_body_inspection_enabled == other.is_body_inspection_enabled
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
      [type, name, condition_language, condition, action_name, protection_capabilities, protection_capability_settings, is_body_inspection_enabled].hash
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
