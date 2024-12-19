# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The model for pricing.
  class Marketplace::Models::PricingModel
    TYPE_ENUM = [
      TYPE_FREE = 'FREE'.freeze,
      TYPE_BYOL = 'BYOL'.freeze,
      TYPE_PAYGO = 'PAYGO'.freeze,
      TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    PAY_GO_STRATEGY_ENUM = [
      PAY_GO_STRATEGY_PER_OCPU_LINEAR = 'PER_OCPU_LINEAR'.freeze,
      PAY_GO_STRATEGY_PER_OCPU_MIN_BILLING = 'PER_OCPU_MIN_BILLING'.freeze,
      PAY_GO_STRATEGY_PER_INSTANCE = 'PER_INSTANCE'.freeze,
      PAY_GO_STRATEGY_PER_INSTANCE_MONTHLY_INCLUSIVE = 'PER_INSTANCE_MONTHLY_INCLUSIVE'.freeze,
      PAY_GO_STRATEGY_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    CURRENCY_ENUM = [
      CURRENCY_USD = 'USD'.freeze,
      CURRENCY_CAD = 'CAD'.freeze,
      CURRENCY_INR = 'INR'.freeze,
      CURRENCY_GBP = 'GBP'.freeze,
      CURRENCY_BRL = 'BRL'.freeze,
      CURRENCY_JPY = 'JPY'.freeze,
      CURRENCY_OMR = 'OMR'.freeze,
      CURRENCY_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The type of the pricing model.
    # @return [String]
    attr_reader :type

    # The type of pricing for a PAYGO model, eg PER_OCPU_LINEAR, PER_OCPU_MIN_BILLING, PER_INSTANCE.  Null if type is not PAYGO.
    # @return [String]
    attr_reader :pay_go_strategy

    # The currency of the pricing model.
    # @return [String]
    attr_reader :currency

    # The pricing rate.
    # @return [Float]
    attr_accessor :rate

    # @return [OCI::Marketplace::Models::InternationalMarketPrice]
    attr_accessor :international_market_price

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'type',
        'pay_go_strategy': :'payGoStrategy',
        'currency': :'currency',
        'rate': :'rate',
        'international_market_price': :'internationalMarketPrice'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'String',
        'pay_go_strategy': :'String',
        'currency': :'String',
        'rate': :'Float',
        'international_market_price': :'OCI::Marketplace::Models::InternationalMarketPrice'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :type The value to assign to the {#type} property
    # @option attributes [String] :pay_go_strategy The value to assign to the {#pay_go_strategy} property
    # @option attributes [String] :currency The value to assign to the {#currency} property
    # @option attributes [Float] :rate The value to assign to the {#rate} property
    # @option attributes [OCI::Marketplace::Models::InternationalMarketPrice] :international_market_price The value to assign to the {#international_market_price} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.type = attributes[:'type'] if attributes[:'type']

      self.pay_go_strategy = attributes[:'payGoStrategy'] if attributes[:'payGoStrategy']

      raise 'You cannot provide both :payGoStrategy and :pay_go_strategy' if attributes.key?(:'payGoStrategy') && attributes.key?(:'pay_go_strategy')

      self.pay_go_strategy = attributes[:'pay_go_strategy'] if attributes[:'pay_go_strategy']

      self.currency = attributes[:'currency'] if attributes[:'currency']

      self.rate = attributes[:'rate'] if attributes[:'rate']

      self.international_market_price = attributes[:'internationalMarketPrice'] if attributes[:'internationalMarketPrice']

      raise 'You cannot provide both :internationalMarketPrice and :international_market_price' if attributes.key?(:'internationalMarketPrice') && attributes.key?(:'international_market_price')

      self.international_market_price = attributes[:'international_market_price'] if attributes[:'international_market_price']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] type Object to be assigned
    def type=(type)
      # rubocop:disable Style/ConditionalAssignment
      if type && !TYPE_ENUM.include?(type)
        OCI.logger.debug("Unknown value for 'type' [" + type + "]. Mapping to 'TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @type = TYPE_UNKNOWN_ENUM_VALUE
      else
        @type = type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] pay_go_strategy Object to be assigned
    def pay_go_strategy=(pay_go_strategy)
      # rubocop:disable Style/ConditionalAssignment
      if pay_go_strategy && !PAY_GO_STRATEGY_ENUM.include?(pay_go_strategy)
        OCI.logger.debug("Unknown value for 'pay_go_strategy' [" + pay_go_strategy + "]. Mapping to 'PAY_GO_STRATEGY_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @pay_go_strategy = PAY_GO_STRATEGY_UNKNOWN_ENUM_VALUE
      else
        @pay_go_strategy = pay_go_strategy
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] currency Object to be assigned
    def currency=(currency)
      # rubocop:disable Style/ConditionalAssignment
      if currency && !CURRENCY_ENUM.include?(currency)
        OCI.logger.debug("Unknown value for 'currency' [" + currency + "]. Mapping to 'CURRENCY_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @currency = CURRENCY_UNKNOWN_ENUM_VALUE
      else
        @currency = currency
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        type == other.type &&
        pay_go_strategy == other.pay_go_strategy &&
        currency == other.currency &&
        rate == other.rate &&
        international_market_price == other.international_market_price
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
      [type, pay_go_strategy, currency, rate, international_market_price].hash
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
