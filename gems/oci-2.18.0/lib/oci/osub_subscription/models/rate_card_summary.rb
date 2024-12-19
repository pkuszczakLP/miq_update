# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Rate Card Summary
  #
  class OsubSubscription::Models::RateCardSummary
    # This attribute is required.
    # @return [OCI::OsubSubscription::Models::Product]
    attr_accessor :product

    # Rate card start date
    #
    # @return [DateTime]
    attr_accessor :time_start

    # Rate card end date
    #
    # @return [DateTime]
    attr_accessor :time_end

    # **[Required]** Rate card net unit price
    #
    # @return [String]
    attr_accessor :net_unit_price

    # Rate card discretionary discount percentage
    #
    # @return [String]
    attr_accessor :discretionary_discount_percentage

    # **[Required]** Rate card overage price
    #
    # @return [String]
    attr_accessor :overage_price

    # Rate card price tier flag
    #
    # @return [BOOLEAN]
    attr_accessor :is_tier

    # @return [OCI::OsubSubscription::Models::Currency]
    attr_accessor :currency

    # List of tiered rate card prices
    #
    # @return [Array<OCI::OsubSubscription::Models::RateCardTier>]
    attr_accessor :rate_card_tiers

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'product': :'product',
        'time_start': :'timeStart',
        'time_end': :'timeEnd',
        'net_unit_price': :'netUnitPrice',
        'discretionary_discount_percentage': :'discretionaryDiscountPercentage',
        'overage_price': :'overagePrice',
        'is_tier': :'isTier',
        'currency': :'currency',
        'rate_card_tiers': :'rateCardTiers'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'product': :'OCI::OsubSubscription::Models::Product',
        'time_start': :'DateTime',
        'time_end': :'DateTime',
        'net_unit_price': :'String',
        'discretionary_discount_percentage': :'String',
        'overage_price': :'String',
        'is_tier': :'BOOLEAN',
        'currency': :'OCI::OsubSubscription::Models::Currency',
        'rate_card_tiers': :'Array<OCI::OsubSubscription::Models::RateCardTier>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [OCI::OsubSubscription::Models::Product] :product The value to assign to the {#product} property
    # @option attributes [DateTime] :time_start The value to assign to the {#time_start} property
    # @option attributes [DateTime] :time_end The value to assign to the {#time_end} property
    # @option attributes [String] :net_unit_price The value to assign to the {#net_unit_price} property
    # @option attributes [String] :discretionary_discount_percentage The value to assign to the {#discretionary_discount_percentage} property
    # @option attributes [String] :overage_price The value to assign to the {#overage_price} property
    # @option attributes [BOOLEAN] :is_tier The value to assign to the {#is_tier} property
    # @option attributes [OCI::OsubSubscription::Models::Currency] :currency The value to assign to the {#currency} property
    # @option attributes [Array<OCI::OsubSubscription::Models::RateCardTier>] :rate_card_tiers The value to assign to the {#rate_card_tiers} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.product = attributes[:'product'] if attributes[:'product']

      self.time_start = attributes[:'timeStart'] if attributes[:'timeStart']

      raise 'You cannot provide both :timeStart and :time_start' if attributes.key?(:'timeStart') && attributes.key?(:'time_start')

      self.time_start = attributes[:'time_start'] if attributes[:'time_start']

      self.time_end = attributes[:'timeEnd'] if attributes[:'timeEnd']

      raise 'You cannot provide both :timeEnd and :time_end' if attributes.key?(:'timeEnd') && attributes.key?(:'time_end')

      self.time_end = attributes[:'time_end'] if attributes[:'time_end']

      self.net_unit_price = attributes[:'netUnitPrice'] if attributes[:'netUnitPrice']

      raise 'You cannot provide both :netUnitPrice and :net_unit_price' if attributes.key?(:'netUnitPrice') && attributes.key?(:'net_unit_price')

      self.net_unit_price = attributes[:'net_unit_price'] if attributes[:'net_unit_price']

      self.discretionary_discount_percentage = attributes[:'discretionaryDiscountPercentage'] if attributes[:'discretionaryDiscountPercentage']

      raise 'You cannot provide both :discretionaryDiscountPercentage and :discretionary_discount_percentage' if attributes.key?(:'discretionaryDiscountPercentage') && attributes.key?(:'discretionary_discount_percentage')

      self.discretionary_discount_percentage = attributes[:'discretionary_discount_percentage'] if attributes[:'discretionary_discount_percentage']

      self.overage_price = attributes[:'overagePrice'] if attributes[:'overagePrice']

      raise 'You cannot provide both :overagePrice and :overage_price' if attributes.key?(:'overagePrice') && attributes.key?(:'overage_price')

      self.overage_price = attributes[:'overage_price'] if attributes[:'overage_price']

      self.is_tier = attributes[:'isTier'] unless attributes[:'isTier'].nil?

      raise 'You cannot provide both :isTier and :is_tier' if attributes.key?(:'isTier') && attributes.key?(:'is_tier')

      self.is_tier = attributes[:'is_tier'] unless attributes[:'is_tier'].nil?

      self.currency = attributes[:'currency'] if attributes[:'currency']

      self.rate_card_tiers = attributes[:'rateCardTiers'] if attributes[:'rateCardTiers']

      raise 'You cannot provide both :rateCardTiers and :rate_card_tiers' if attributes.key?(:'rateCardTiers') && attributes.key?(:'rate_card_tiers')

      self.rate_card_tiers = attributes[:'rate_card_tiers'] if attributes[:'rate_card_tiers']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        product == other.product &&
        time_start == other.time_start &&
        time_end == other.time_end &&
        net_unit_price == other.net_unit_price &&
        discretionary_discount_percentage == other.discretionary_discount_percentage &&
        overage_price == other.overage_price &&
        is_tier == other.is_tier &&
        currency == other.currency &&
        rate_card_tiers == other.rate_card_tiers
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
      [product, time_start, time_end, net_unit_price, discretionary_discount_percentage, overage_price, is_tier, currency, rate_card_tiers].hash
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
