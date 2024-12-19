# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'payment_option'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # PayPal Payment related details
  class OspGateway::Models::PaypalPaymentOption < OspGateway::Models::PaymentOption
    # The email address of the paypal user.
    # @return [String]
    attr_accessor :email_address

    # First name of the paypal user.
    # @return [String]
    attr_accessor :first_name

    # Last name of the paypal user.
    # @return [String]
    attr_accessor :last_name

    # Agreement id for the paypal account.
    # @return [String]
    attr_accessor :ext_billing_agreement_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'wallet_instrument_id': :'walletInstrumentId',
        'wallet_transaction_id': :'walletTransactionId',
        'payment_method': :'paymentMethod',
        'email_address': :'emailAddress',
        'first_name': :'firstName',
        'last_name': :'lastName',
        'ext_billing_agreement_id': :'extBillingAgreementId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'wallet_instrument_id': :'String',
        'wallet_transaction_id': :'String',
        'payment_method': :'String',
        'email_address': :'String',
        'first_name': :'String',
        'last_name': :'String',
        'ext_billing_agreement_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :wallet_instrument_id The value to assign to the {OCI::OspGateway::Models::PaymentOption#wallet_instrument_id #wallet_instrument_id} proprety
    # @option attributes [String] :wallet_transaction_id The value to assign to the {OCI::OspGateway::Models::PaymentOption#wallet_transaction_id #wallet_transaction_id} proprety
    # @option attributes [String] :email_address The value to assign to the {#email_address} property
    # @option attributes [String] :first_name The value to assign to the {#first_name} property
    # @option attributes [String] :last_name The value to assign to the {#last_name} property
    # @option attributes [String] :ext_billing_agreement_id The value to assign to the {#ext_billing_agreement_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['paymentMethod'] = 'PAYPAL'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.email_address = attributes[:'emailAddress'] if attributes[:'emailAddress']

      raise 'You cannot provide both :emailAddress and :email_address' if attributes.key?(:'emailAddress') && attributes.key?(:'email_address')

      self.email_address = attributes[:'email_address'] if attributes[:'email_address']

      self.first_name = attributes[:'firstName'] if attributes[:'firstName']

      raise 'You cannot provide both :firstName and :first_name' if attributes.key?(:'firstName') && attributes.key?(:'first_name')

      self.first_name = attributes[:'first_name'] if attributes[:'first_name']

      self.last_name = attributes[:'lastName'] if attributes[:'lastName']

      raise 'You cannot provide both :lastName and :last_name' if attributes.key?(:'lastName') && attributes.key?(:'last_name')

      self.last_name = attributes[:'last_name'] if attributes[:'last_name']

      self.ext_billing_agreement_id = attributes[:'extBillingAgreementId'] if attributes[:'extBillingAgreementId']

      raise 'You cannot provide both :extBillingAgreementId and :ext_billing_agreement_id' if attributes.key?(:'extBillingAgreementId') && attributes.key?(:'ext_billing_agreement_id')

      self.ext_billing_agreement_id = attributes[:'ext_billing_agreement_id'] if attributes[:'ext_billing_agreement_id']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        wallet_instrument_id == other.wallet_instrument_id &&
        wallet_transaction_id == other.wallet_transaction_id &&
        payment_method == other.payment_method &&
        email_address == other.email_address &&
        first_name == other.first_name &&
        last_name == other.last_name &&
        ext_billing_agreement_id == other.ext_billing_agreement_id
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
      [wallet_instrument_id, wallet_transaction_id, payment_method, email_address, first_name, last_name, ext_billing_agreement_id].hash
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
