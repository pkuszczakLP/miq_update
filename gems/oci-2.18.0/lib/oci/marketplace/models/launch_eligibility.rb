# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Tenant eligibility and other information for launching a PIC image
  class Marketplace::Models::LaunchEligibility
    INELIGIBILITY_REASON_ENUM = [
      INELIGIBILITY_REASON_INELIGIBLE_ACCOUNT_COUNTRY = 'INELIGIBLE_ACCOUNT_COUNTRY'.freeze,
      INELIGIBILITY_REASON_INELIGIBLE_REGION = 'INELIGIBLE_REGION'.freeze,
      INELIGIBILITY_REASON_INELIGIBLE_ACCOUNT_BLACKLISTED = 'INELIGIBLE_ACCOUNT_BLACKLISTED'.freeze,
      INELIGIBILITY_REASON_INELIGIBLE_ACCOUNT_FEATURE_DISABLED = 'INELIGIBLE_ACCOUNT_FEATURE_DISABLED'.freeze,
      INELIGIBILITY_REASON_INELIGIBLE_ACCOUNT_CURRENCY = 'INELIGIBLE_ACCOUNT_CURRENCY'.freeze,
      INELIGIBILITY_REASON_INELIGIBLE_ACCOUNT_NOT_PAID = 'INELIGIBLE_ACCOUNT_NOT_PAID'.freeze,
      INELIGIBILITY_REASON_INELIGIBLE_ACCOUNT_INTERNAL = 'INELIGIBLE_ACCOUNT_INTERNAL'.freeze,
      INELIGIBILITY_REASON_INELIGIBLE_ACCOUNT_GOV_SUBSCRIPTION = 'INELIGIBLE_ACCOUNT_GOV_SUBSCRIPTION'.freeze,
      INELIGIBILITY_REASON_INELIGIBLE_PAID_LISTING_THROTTLED = 'INELIGIBLE_PAID_LISTING_THROTTLED'.freeze,
      INELIGIBILITY_REASON_NOT_AUTHORIZED = 'NOT_AUTHORIZED'.freeze,
      INELIGIBILITY_REASON_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** PIC Image ID
    # @return [String]
    attr_accessor :image_id

    # **[Required]** Is the tenant permitted to launch the PIC image
    # @return [BOOLEAN]
    attr_accessor :is_launch_allowed

    # related meters for the PIC image
    # @return [String]
    attr_accessor :meters

    # Reason the account is ineligible to launch paid listings
    # @return [String]
    attr_reader :ineligibility_reason

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'image_id': :'imageId',
        'is_launch_allowed': :'isLaunchAllowed',
        'meters': :'meters',
        'ineligibility_reason': :'ineligibilityReason'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'image_id': :'String',
        'is_launch_allowed': :'BOOLEAN',
        'meters': :'String',
        'ineligibility_reason': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :image_id The value to assign to the {#image_id} property
    # @option attributes [BOOLEAN] :is_launch_allowed The value to assign to the {#is_launch_allowed} property
    # @option attributes [String] :meters The value to assign to the {#meters} property
    # @option attributes [String] :ineligibility_reason The value to assign to the {#ineligibility_reason} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.image_id = attributes[:'imageId'] if attributes[:'imageId']

      raise 'You cannot provide both :imageId and :image_id' if attributes.key?(:'imageId') && attributes.key?(:'image_id')

      self.image_id = attributes[:'image_id'] if attributes[:'image_id']

      self.is_launch_allowed = attributes[:'isLaunchAllowed'] unless attributes[:'isLaunchAllowed'].nil?

      raise 'You cannot provide both :isLaunchAllowed and :is_launch_allowed' if attributes.key?(:'isLaunchAllowed') && attributes.key?(:'is_launch_allowed')

      self.is_launch_allowed = attributes[:'is_launch_allowed'] unless attributes[:'is_launch_allowed'].nil?

      self.meters = attributes[:'meters'] if attributes[:'meters']

      self.ineligibility_reason = attributes[:'ineligibilityReason'] if attributes[:'ineligibilityReason']

      raise 'You cannot provide both :ineligibilityReason and :ineligibility_reason' if attributes.key?(:'ineligibilityReason') && attributes.key?(:'ineligibility_reason')

      self.ineligibility_reason = attributes[:'ineligibility_reason'] if attributes[:'ineligibility_reason']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] ineligibility_reason Object to be assigned
    def ineligibility_reason=(ineligibility_reason)
      # rubocop:disable Style/ConditionalAssignment
      if ineligibility_reason && !INELIGIBILITY_REASON_ENUM.include?(ineligibility_reason)
        OCI.logger.debug("Unknown value for 'ineligibility_reason' [" + ineligibility_reason + "]. Mapping to 'INELIGIBILITY_REASON_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @ineligibility_reason = INELIGIBILITY_REASON_UNKNOWN_ENUM_VALUE
      else
        @ineligibility_reason = ineligibility_reason
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        image_id == other.image_id &&
        is_launch_allowed == other.is_launch_allowed &&
        meters == other.meters &&
        ineligibility_reason == other.ineligibility_reason
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
      [image_id, is_launch_allowed, meters, ineligibility_reason].hash
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
