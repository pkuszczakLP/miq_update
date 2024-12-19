# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Promotion information for a subscription.
  class TenantManagerControlPlane::Models::Promotion
    STATUS_ENUM = [
      STATUS_INITIALIZED = 'INITIALIZED'.freeze,
      STATUS_ACTIVE = 'ACTIVE'.freeze,
      STATUS_EXPIRED = 'EXPIRED'.freeze,
      STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # How long the promotion related to the subscription, if any, is valid in duration units.
    # @return [Integer]
    attr_accessor :duration

    # Unit for the duration.
    # @return [String]
    attr_accessor :duration_unit

    # Total amount of credit for the promotion related to the subscription if there is one.
    # @return [Float]
    attr_accessor :amount

    # Current status of the promotion related to the subscription if there is one.
    # @return [String]
    attr_reader :status

    # Whether or not customer intends to pay once the promotion is done.
    # @return [BOOLEAN]
    attr_accessor :is_intent_to_pay

    # Currency unit associated with the promotion.
    # @return [String]
    attr_accessor :currency_unit

    # Date-time for when the promotion starts.
    # @return [DateTime]
    attr_accessor :time_started

    # Date-time for when the promotion ends.
    # @return [DateTime]
    attr_accessor :time_expired

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'duration': :'duration',
        'duration_unit': :'durationUnit',
        'amount': :'amount',
        'status': :'status',
        'is_intent_to_pay': :'isIntentToPay',
        'currency_unit': :'currencyUnit',
        'time_started': :'timeStarted',
        'time_expired': :'timeExpired'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'duration': :'Integer',
        'duration_unit': :'String',
        'amount': :'Float',
        'status': :'String',
        'is_intent_to_pay': :'BOOLEAN',
        'currency_unit': :'String',
        'time_started': :'DateTime',
        'time_expired': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :duration The value to assign to the {#duration} property
    # @option attributes [String] :duration_unit The value to assign to the {#duration_unit} property
    # @option attributes [Float] :amount The value to assign to the {#amount} property
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [BOOLEAN] :is_intent_to_pay The value to assign to the {#is_intent_to_pay} property
    # @option attributes [String] :currency_unit The value to assign to the {#currency_unit} property
    # @option attributes [DateTime] :time_started The value to assign to the {#time_started} property
    # @option attributes [DateTime] :time_expired The value to assign to the {#time_expired} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.duration = attributes[:'duration'] if attributes[:'duration']

      self.duration_unit = attributes[:'durationUnit'] if attributes[:'durationUnit']

      raise 'You cannot provide both :durationUnit and :duration_unit' if attributes.key?(:'durationUnit') && attributes.key?(:'duration_unit')

      self.duration_unit = attributes[:'duration_unit'] if attributes[:'duration_unit']

      self.amount = attributes[:'amount'] if attributes[:'amount']

      self.status = attributes[:'status'] if attributes[:'status']

      self.is_intent_to_pay = attributes[:'isIntentToPay'] unless attributes[:'isIntentToPay'].nil?

      raise 'You cannot provide both :isIntentToPay and :is_intent_to_pay' if attributes.key?(:'isIntentToPay') && attributes.key?(:'is_intent_to_pay')

      self.is_intent_to_pay = attributes[:'is_intent_to_pay'] unless attributes[:'is_intent_to_pay'].nil?

      self.currency_unit = attributes[:'currencyUnit'] if attributes[:'currencyUnit']

      raise 'You cannot provide both :currencyUnit and :currency_unit' if attributes.key?(:'currencyUnit') && attributes.key?(:'currency_unit')

      self.currency_unit = attributes[:'currency_unit'] if attributes[:'currency_unit']

      self.time_started = attributes[:'timeStarted'] if attributes[:'timeStarted']

      raise 'You cannot provide both :timeStarted and :time_started' if attributes.key?(:'timeStarted') && attributes.key?(:'time_started')

      self.time_started = attributes[:'time_started'] if attributes[:'time_started']

      self.time_expired = attributes[:'timeExpired'] if attributes[:'timeExpired']

      raise 'You cannot provide both :timeExpired and :time_expired' if attributes.key?(:'timeExpired') && attributes.key?(:'time_expired')

      self.time_expired = attributes[:'time_expired'] if attributes[:'time_expired']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] status Object to be assigned
    def status=(status)
      # rubocop:disable Style/ConditionalAssignment
      if status && !STATUS_ENUM.include?(status)
        OCI.logger.debug("Unknown value for 'status' [" + status + "]. Mapping to 'STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @status = STATUS_UNKNOWN_ENUM_VALUE
      else
        @status = status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        duration == other.duration &&
        duration_unit == other.duration_unit &&
        amount == other.amount &&
        status == other.status &&
        is_intent_to_pay == other.is_intent_to_pay &&
        currency_unit == other.currency_unit &&
        time_started == other.time_started &&
        time_expired == other.time_expired
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
      [duration, duration_unit, amount, status, is_intent_to_pay, currency_unit, time_started, time_expired].hash
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
