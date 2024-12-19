# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Tenant eligibility for using third party paid listings
  class Marketplace::Models::ThirdPartyPaidListingEligibility
    ELIGIBILITY_REASON_ENUM = [
      ELIGIBILITY_REASON_ELIGIBLE = 'ELIGIBLE'.freeze,
      ELIGIBILITY_REASON_INELIGIBLE_ACCOUNT_COUNTRY = 'INELIGIBLE_ACCOUNT_COUNTRY'.freeze,
      ELIGIBILITY_REASON_INELIGIBLE_REGION = 'INELIGIBLE_REGION'.freeze,
      ELIGIBILITY_REASON_INELIGIBLE_ACCOUNT_BLACKLISTED = 'INELIGIBLE_ACCOUNT_BLACKLISTED'.freeze,
      ELIGIBILITY_REASON_INELIGIBLE_ACCOUNT_FEATURE_DISABLED = 'INELIGIBLE_ACCOUNT_FEATURE_DISABLED'.freeze,
      ELIGIBILITY_REASON_INELIGIBLE_ACCOUNT_CURRENCY = 'INELIGIBLE_ACCOUNT_CURRENCY'.freeze,
      ELIGIBILITY_REASON_INELIGIBLE_ACCOUNT_NOT_PAID = 'INELIGIBLE_ACCOUNT_NOT_PAID'.freeze,
      ELIGIBILITY_REASON_INELIGIBLE_ACCOUNT_INTERNAL = 'INELIGIBLE_ACCOUNT_INTERNAL'.freeze,
      ELIGIBILITY_REASON_INELIGIBLE_ACCOUNT_GOV_SUBSCRIPTION = 'INELIGIBLE_ACCOUNT_GOV_SUBSCRIPTION'.freeze,
      ELIGIBILITY_REASON_NOT_AUTHORIZED = 'NOT_AUTHORIZED'.freeze,
      ELIGIBILITY_REASON_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Whether the tenant is permitted to use paid listings
    # @return [BOOLEAN]
    attr_accessor :is_paid_listing_eligible

    # **[Required]** Whether the tenant is currently prevented from using paid listings because of throttling
    # @return [BOOLEAN]
    attr_accessor :is_paid_listing_throttled

    # **[Required]** Reason the account is ineligible to launch paid listings
    # @return [String]
    attr_reader :eligibility_reason

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'is_paid_listing_eligible': :'isPaidListingEligible',
        'is_paid_listing_throttled': :'isPaidListingThrottled',
        'eligibility_reason': :'eligibilityReason'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'is_paid_listing_eligible': :'BOOLEAN',
        'is_paid_listing_throttled': :'BOOLEAN',
        'eligibility_reason': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [BOOLEAN] :is_paid_listing_eligible The value to assign to the {#is_paid_listing_eligible} property
    # @option attributes [BOOLEAN] :is_paid_listing_throttled The value to assign to the {#is_paid_listing_throttled} property
    # @option attributes [String] :eligibility_reason The value to assign to the {#eligibility_reason} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.is_paid_listing_eligible = attributes[:'isPaidListingEligible'] unless attributes[:'isPaidListingEligible'].nil?

      raise 'You cannot provide both :isPaidListingEligible and :is_paid_listing_eligible' if attributes.key?(:'isPaidListingEligible') && attributes.key?(:'is_paid_listing_eligible')

      self.is_paid_listing_eligible = attributes[:'is_paid_listing_eligible'] unless attributes[:'is_paid_listing_eligible'].nil?

      self.is_paid_listing_throttled = attributes[:'isPaidListingThrottled'] unless attributes[:'isPaidListingThrottled'].nil?

      raise 'You cannot provide both :isPaidListingThrottled and :is_paid_listing_throttled' if attributes.key?(:'isPaidListingThrottled') && attributes.key?(:'is_paid_listing_throttled')

      self.is_paid_listing_throttled = attributes[:'is_paid_listing_throttled'] unless attributes[:'is_paid_listing_throttled'].nil?

      self.eligibility_reason = attributes[:'eligibilityReason'] if attributes[:'eligibilityReason']

      raise 'You cannot provide both :eligibilityReason and :eligibility_reason' if attributes.key?(:'eligibilityReason') && attributes.key?(:'eligibility_reason')

      self.eligibility_reason = attributes[:'eligibility_reason'] if attributes[:'eligibility_reason']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] eligibility_reason Object to be assigned
    def eligibility_reason=(eligibility_reason)
      # rubocop:disable Style/ConditionalAssignment
      if eligibility_reason && !ELIGIBILITY_REASON_ENUM.include?(eligibility_reason)
        OCI.logger.debug("Unknown value for 'eligibility_reason' [" + eligibility_reason + "]. Mapping to 'ELIGIBILITY_REASON_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @eligibility_reason = ELIGIBILITY_REASON_UNKNOWN_ENUM_VALUE
      else
        @eligibility_reason = eligibility_reason
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        is_paid_listing_eligible == other.is_paid_listing_eligible &&
        is_paid_listing_throttled == other.is_paid_listing_throttled &&
        eligibility_reason == other.eligibility_reason
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
      [is_paid_listing_eligible, is_paid_listing_throttled, eligibility_reason].hash
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
