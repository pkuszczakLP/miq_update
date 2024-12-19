# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Security Rule used in the firewall policy rules.
  # Security Rules determine whether to block or allow a session based on traffic attributes,
  # such as  the source and destination IP address, protocol/port, and the HTTP(S) target URL.
  #
  class NetworkFirewall::Models::SecurityRule
    ACTION_ENUM = [
      ACTION_ALLOW = 'ALLOW'.freeze,
      ACTION_DROP = 'DROP'.freeze,
      ACTION_REJECT = 'REJECT'.freeze,
      ACTION_INSPECT = 'INSPECT'.freeze,
      ACTION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    INSPECTION_ENUM = [
      INSPECTION_INTRUSION_DETECTION = 'INTRUSION_DETECTION'.freeze,
      INSPECTION_INTRUSION_PREVENTION = 'INTRUSION_PREVENTION'.freeze,
      INSPECTION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Name for the Security rule, must be unique within the policy.
    # @return [String]
    attr_accessor :name

    # This attribute is required.
    # @return [OCI::NetworkFirewall::Models::SecurityRuleMatchCriteria]
    attr_accessor :condition

    # **[Required]** Types of Action on the Traffic flow.
    #
    #   * ALLOW - Allows the traffic.
    #   * DROP - Silently drops the traffic, e.g. without sending a TCP reset.
    #   * REJECT - Rejects the traffic, sending a TCP reset to client and/or server as applicable.
    #   * INSPECT - Inspects traffic for vulnerability as specified in `inspection`, which may result in rejection.
    #
    # @return [String]
    attr_reader :action

    # Type of inspection to affect the Traffic flow. This is only applicable if action is INSPECT.
    #
    #   * INTRUSION_DETECTION - Intrusion Detection.
    #   * INTRUSION_PREVENTION - Intrusion Detection and Prevention. Traffic classified as potentially malicious will be rejected as described in `type`.
    #
    # @return [String]
    attr_reader :inspection

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'condition': :'condition',
        'action': :'action',
        'inspection': :'inspection'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'condition': :'OCI::NetworkFirewall::Models::SecurityRuleMatchCriteria',
        'action': :'String',
        'inspection': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [OCI::NetworkFirewall::Models::SecurityRuleMatchCriteria] :condition The value to assign to the {#condition} property
    # @option attributes [String] :action The value to assign to the {#action} property
    # @option attributes [String] :inspection The value to assign to the {#inspection} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.condition = attributes[:'condition'] if attributes[:'condition']

      self.action = attributes[:'action'] if attributes[:'action']

      self.inspection = attributes[:'inspection'] if attributes[:'inspection']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] action Object to be assigned
    def action=(action)
      # rubocop:disable Style/ConditionalAssignment
      if action && !ACTION_ENUM.include?(action)
        OCI.logger.debug("Unknown value for 'action' [" + action + "]. Mapping to 'ACTION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @action = ACTION_UNKNOWN_ENUM_VALUE
      else
        @action = action
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] inspection Object to be assigned
    def inspection=(inspection)
      # rubocop:disable Style/ConditionalAssignment
      if inspection && !INSPECTION_ENUM.include?(inspection)
        OCI.logger.debug("Unknown value for 'inspection' [" + inspection + "]. Mapping to 'INSPECTION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @inspection = INSPECTION_UNKNOWN_ENUM_VALUE
      else
        @inspection = inspection
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
        condition == other.condition &&
        action == other.action &&
        inspection == other.inspection
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
      [name, condition, action, inspection].hash
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
