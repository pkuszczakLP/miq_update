# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Module that allows to enable OCI-managed protection capabilities for incoming HTTP requests.
  class Waf::Models::RequestProtection
    # Ordered list of ProtectionRules. Rules are executed in order of appearance in this array.
    # ProtectionRules in this array can only use protection Capabilities of REQUEST_PROTECTION_CAPABILITY type.
    #
    # @return [Array<OCI::Waf::Models::ProtectionRule>]
    attr_accessor :rules

    # Maximum size of inspected HTTP message body in bytes. Actions to take if this limit is exceeded are defined in `bodyInspectionSizeLimitExceededActionName`.
    #
    # Body inspection maximum size allowed is defined with per-tenancy limit: 8192 bytes.
    #
    # @return [Integer]
    attr_accessor :body_inspection_size_limit_in_bytes

    # References action by name from actions defined in WebAppFirewallPolicy. Executed if HTTP message
    # body size exceeds limit set in field `bodyInspectionSizeLimitInBytes`.
    #
    # If this field is `null` HTTP message body will inspected up to `bodyInspectionSizeLimitInBytes` and the rest
    # will not be inspected by Protection Capabilities.
    #
    # Allowed action types:
    # * **RETURN_HTTP_RESPONSE** terminates further execution of modules and rules and returns defined HTTP response.
    #
    # @return [String]
    attr_accessor :body_inspection_size_limit_exceeded_action_name

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'rules': :'rules',
        'body_inspection_size_limit_in_bytes': :'bodyInspectionSizeLimitInBytes',
        'body_inspection_size_limit_exceeded_action_name': :'bodyInspectionSizeLimitExceededActionName'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'rules': :'Array<OCI::Waf::Models::ProtectionRule>',
        'body_inspection_size_limit_in_bytes': :'Integer',
        'body_inspection_size_limit_exceeded_action_name': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Array<OCI::Waf::Models::ProtectionRule>] :rules The value to assign to the {#rules} property
    # @option attributes [Integer] :body_inspection_size_limit_in_bytes The value to assign to the {#body_inspection_size_limit_in_bytes} property
    # @option attributes [String] :body_inspection_size_limit_exceeded_action_name The value to assign to the {#body_inspection_size_limit_exceeded_action_name} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.rules = attributes[:'rules'] if attributes[:'rules']

      self.body_inspection_size_limit_in_bytes = attributes[:'bodyInspectionSizeLimitInBytes'] if attributes[:'bodyInspectionSizeLimitInBytes']

      raise 'You cannot provide both :bodyInspectionSizeLimitInBytes and :body_inspection_size_limit_in_bytes' if attributes.key?(:'bodyInspectionSizeLimitInBytes') && attributes.key?(:'body_inspection_size_limit_in_bytes')

      self.body_inspection_size_limit_in_bytes = attributes[:'body_inspection_size_limit_in_bytes'] if attributes[:'body_inspection_size_limit_in_bytes']

      self.body_inspection_size_limit_exceeded_action_name = attributes[:'bodyInspectionSizeLimitExceededActionName'] if attributes[:'bodyInspectionSizeLimitExceededActionName']

      raise 'You cannot provide both :bodyInspectionSizeLimitExceededActionName and :body_inspection_size_limit_exceeded_action_name' if attributes.key?(:'bodyInspectionSizeLimitExceededActionName') && attributes.key?(:'body_inspection_size_limit_exceeded_action_name')

      self.body_inspection_size_limit_exceeded_action_name = attributes[:'body_inspection_size_limit_exceeded_action_name'] if attributes[:'body_inspection_size_limit_exceeded_action_name']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        rules == other.rules &&
        body_inspection_size_limit_in_bytes == other.body_inspection_size_limit_in_bytes &&
        body_inspection_size_limit_exceeded_action_name == other.body_inspection_size_limit_exceeded_action_name
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
      [rules, body_inspection_size_limit_in_bytes, body_inspection_size_limit_exceeded_action_name].hash
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
