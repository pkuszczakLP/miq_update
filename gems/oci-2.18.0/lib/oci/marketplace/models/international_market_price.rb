# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The model for international market pricing.
  class Marketplace::Models::InternationalMarketPrice
    CURRENCY_CODE_ENUM = [
      CURRENCY_CODE_USD = 'USD'.freeze,
      CURRENCY_CODE_CAD = 'CAD'.freeze,
      CURRENCY_CODE_INR = 'INR'.freeze,
      CURRENCY_CODE_GBP = 'GBP'.freeze,
      CURRENCY_CODE_BRL = 'BRL'.freeze,
      CURRENCY_CODE_JPY = 'JPY'.freeze,
      CURRENCY_CODE_OMR = 'OMR'.freeze,
      CURRENCY_CODE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The currency of the pricing model.
    # @return [String]
    attr_reader :currency_code

    # The symbol of the currency
    # @return [String]
    attr_accessor :currency_symbol

    # **[Required]** The pricing rate.
    # @return [Float]
    attr_accessor :rate

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'currency_code': :'currencyCode',
        'currency_symbol': :'currencySymbol',
        'rate': :'rate'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'currency_code': :'String',
        'currency_symbol': :'String',
        'rate': :'Float'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :currency_code The value to assign to the {#currency_code} property
    # @option attributes [String] :currency_symbol The value to assign to the {#currency_symbol} property
    # @option attributes [Float] :rate The value to assign to the {#rate} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.currency_code = attributes[:'currencyCode'] if attributes[:'currencyCode']

      raise 'You cannot provide both :currencyCode and :currency_code' if attributes.key?(:'currencyCode') && attributes.key?(:'currency_code')

      self.currency_code = attributes[:'currency_code'] if attributes[:'currency_code']

      self.currency_symbol = attributes[:'currencySymbol'] if attributes[:'currencySymbol']

      raise 'You cannot provide both :currencySymbol and :currency_symbol' if attributes.key?(:'currencySymbol') && attributes.key?(:'currency_symbol')

      self.currency_symbol = attributes[:'currency_symbol'] if attributes[:'currency_symbol']

      self.rate = attributes[:'rate'] if attributes[:'rate']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] currency_code Object to be assigned
    def currency_code=(currency_code)
      # rubocop:disable Style/ConditionalAssignment
      if currency_code && !CURRENCY_CODE_ENUM.include?(currency_code)
        OCI.logger.debug("Unknown value for 'currency_code' [" + currency_code + "]. Mapping to 'CURRENCY_CODE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @currency_code = CURRENCY_CODE_UNKNOWN_ENUM_VALUE
      else
        @currency_code = currency_code
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        currency_code == other.currency_code &&
        currency_symbol == other.currency_symbol &&
        rate == other.rate
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
      [currency_code, currency_symbol, rate].hash
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
