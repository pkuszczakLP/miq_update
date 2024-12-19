# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Quota policy for a usage plan.
  #
  class Apigateway::Models::Quota
    UNIT_ENUM = [
      UNIT_MINUTE = 'MINUTE'.freeze,
      UNIT_HOUR = 'HOUR'.freeze,
      UNIT_DAY = 'DAY'.freeze,
      UNIT_WEEK = 'WEEK'.freeze,
      UNIT_MONTH = 'MONTH'.freeze,
      UNIT_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    RESET_POLICY_ENUM = [
      RESET_POLICY_CALENDAR = 'CALENDAR'.freeze,
      RESET_POLICY_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    OPERATION_ON_BREACH_ENUM = [
      OPERATION_ON_BREACH_REJECT = 'REJECT'.freeze,
      OPERATION_ON_BREACH_ALLOW = 'ALLOW'.freeze,
      OPERATION_ON_BREACH_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The number of requests that can be made per time period.
    #
    # @return [Integer]
    attr_accessor :value

    # **[Required]** The unit of time over which quotas are calculated.
    # Example: `MINUTE` or `MONTH`
    #
    # @return [String]
    attr_reader :unit

    # **[Required]** The policy that controls when quotas will reset.
    # Example: `CALENDAR`
    #
    # @return [String]
    attr_reader :reset_policy

    # **[Required]** What the usage plan will do when a quota is breached:
    # `REJECT` will allow no further requests
    # `ALLOW` will continue to allow further requests
    #
    # @return [String]
    attr_reader :operation_on_breach

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'value': :'value',
        'unit': :'unit',
        'reset_policy': :'resetPolicy',
        'operation_on_breach': :'operationOnBreach'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'value': :'Integer',
        'unit': :'String',
        'reset_policy': :'String',
        'operation_on_breach': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :value The value to assign to the {#value} property
    # @option attributes [String] :unit The value to assign to the {#unit} property
    # @option attributes [String] :reset_policy The value to assign to the {#reset_policy} property
    # @option attributes [String] :operation_on_breach The value to assign to the {#operation_on_breach} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.value = attributes[:'value'] if attributes[:'value']

      self.unit = attributes[:'unit'] if attributes[:'unit']

      self.reset_policy = attributes[:'resetPolicy'] if attributes[:'resetPolicy']

      raise 'You cannot provide both :resetPolicy and :reset_policy' if attributes.key?(:'resetPolicy') && attributes.key?(:'reset_policy')

      self.reset_policy = attributes[:'reset_policy'] if attributes[:'reset_policy']

      self.operation_on_breach = attributes[:'operationOnBreach'] if attributes[:'operationOnBreach']

      raise 'You cannot provide both :operationOnBreach and :operation_on_breach' if attributes.key?(:'operationOnBreach') && attributes.key?(:'operation_on_breach')

      self.operation_on_breach = attributes[:'operation_on_breach'] if attributes[:'operation_on_breach']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] unit Object to be assigned
    def unit=(unit)
      # rubocop:disable Style/ConditionalAssignment
      if unit && !UNIT_ENUM.include?(unit)
        OCI.logger.debug("Unknown value for 'unit' [" + unit + "]. Mapping to 'UNIT_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @unit = UNIT_UNKNOWN_ENUM_VALUE
      else
        @unit = unit
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] reset_policy Object to be assigned
    def reset_policy=(reset_policy)
      # rubocop:disable Style/ConditionalAssignment
      if reset_policy && !RESET_POLICY_ENUM.include?(reset_policy)
        OCI.logger.debug("Unknown value for 'reset_policy' [" + reset_policy + "]. Mapping to 'RESET_POLICY_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @reset_policy = RESET_POLICY_UNKNOWN_ENUM_VALUE
      else
        @reset_policy = reset_policy
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] operation_on_breach Object to be assigned
    def operation_on_breach=(operation_on_breach)
      # rubocop:disable Style/ConditionalAssignment
      if operation_on_breach && !OPERATION_ON_BREACH_ENUM.include?(operation_on_breach)
        OCI.logger.debug("Unknown value for 'operation_on_breach' [" + operation_on_breach + "]. Mapping to 'OPERATION_ON_BREACH_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @operation_on_breach = OPERATION_ON_BREACH_UNKNOWN_ENUM_VALUE
      else
        @operation_on_breach = operation_on_breach
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        value == other.value &&
        unit == other.unit &&
        reset_policy == other.reset_policy &&
        operation_on_breach == other.operation_on_breach
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
      [value, unit, reset_policy, operation_on_breach].hash
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
