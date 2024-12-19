# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Billing schedule details related to Subscription Id
  #
  class OsubBillingSchedule::Models::BillingScheduleSummary
    INVOICE_STATUS_ENUM = [
      INVOICE_STATUS_INVOICED = 'INVOICED'.freeze,
      INVOICE_STATUS_NOT_INVOICED = 'NOT_INVOICED'.freeze,
      INVOICE_STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # Billing schedule start date
    #
    # @return [DateTime]
    attr_accessor :time_start

    # Billing schedule end date
    #
    # @return [DateTime]
    attr_accessor :time_end

    # Billing schedule invoicing date
    #
    # @return [DateTime]
    attr_accessor :time_invoicing

    # Billing schedule invoice status
    #
    # @return [String]
    attr_reader :invoice_status

    # Billing schedule quantity
    #
    # @return [String]
    attr_accessor :quantity

    # Billing schedule net unit price
    #
    # @return [String]
    attr_accessor :net_unit_price

    # Billing schedule line net amount
    #
    # @return [String]
    attr_accessor :amount

    # Billing frequency
    #
    # @return [String]
    attr_accessor :billing_frequency

    # Indicates the associated AR Invoice Number
    #
    # @return [String]
    attr_accessor :ar_invoice_number

    # Indicates the associated AR Customer transaction id a unique identifier existing on AR.
    #
    # @return [String]
    attr_accessor :ar_customer_transaction_id

    # Order number associated with the Subscribed Service
    #
    # @return [String]
    attr_accessor :order_number

    # @return [OCI::OsubBillingSchedule::Models::Product]
    attr_accessor :product

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'time_start': :'timeStart',
        'time_end': :'timeEnd',
        'time_invoicing': :'timeInvoicing',
        'invoice_status': :'invoiceStatus',
        'quantity': :'quantity',
        'net_unit_price': :'netUnitPrice',
        'amount': :'amount',
        'billing_frequency': :'billingFrequency',
        'ar_invoice_number': :'arInvoiceNumber',
        'ar_customer_transaction_id': :'arCustomerTransactionId',
        'order_number': :'orderNumber',
        'product': :'product'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'time_start': :'DateTime',
        'time_end': :'DateTime',
        'time_invoicing': :'DateTime',
        'invoice_status': :'String',
        'quantity': :'String',
        'net_unit_price': :'String',
        'amount': :'String',
        'billing_frequency': :'String',
        'ar_invoice_number': :'String',
        'ar_customer_transaction_id': :'String',
        'order_number': :'String',
        'product': :'OCI::OsubBillingSchedule::Models::Product'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [DateTime] :time_start The value to assign to the {#time_start} property
    # @option attributes [DateTime] :time_end The value to assign to the {#time_end} property
    # @option attributes [DateTime] :time_invoicing The value to assign to the {#time_invoicing} property
    # @option attributes [String] :invoice_status The value to assign to the {#invoice_status} property
    # @option attributes [String] :quantity The value to assign to the {#quantity} property
    # @option attributes [String] :net_unit_price The value to assign to the {#net_unit_price} property
    # @option attributes [String] :amount The value to assign to the {#amount} property
    # @option attributes [String] :billing_frequency The value to assign to the {#billing_frequency} property
    # @option attributes [String] :ar_invoice_number The value to assign to the {#ar_invoice_number} property
    # @option attributes [String] :ar_customer_transaction_id The value to assign to the {#ar_customer_transaction_id} property
    # @option attributes [String] :order_number The value to assign to the {#order_number} property
    # @option attributes [OCI::OsubBillingSchedule::Models::Product] :product The value to assign to the {#product} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.time_start = attributes[:'timeStart'] if attributes[:'timeStart']

      raise 'You cannot provide both :timeStart and :time_start' if attributes.key?(:'timeStart') && attributes.key?(:'time_start')

      self.time_start = attributes[:'time_start'] if attributes[:'time_start']

      self.time_end = attributes[:'timeEnd'] if attributes[:'timeEnd']

      raise 'You cannot provide both :timeEnd and :time_end' if attributes.key?(:'timeEnd') && attributes.key?(:'time_end')

      self.time_end = attributes[:'time_end'] if attributes[:'time_end']

      self.time_invoicing = attributes[:'timeInvoicing'] if attributes[:'timeInvoicing']

      raise 'You cannot provide both :timeInvoicing and :time_invoicing' if attributes.key?(:'timeInvoicing') && attributes.key?(:'time_invoicing')

      self.time_invoicing = attributes[:'time_invoicing'] if attributes[:'time_invoicing']

      self.invoice_status = attributes[:'invoiceStatus'] if attributes[:'invoiceStatus']

      raise 'You cannot provide both :invoiceStatus and :invoice_status' if attributes.key?(:'invoiceStatus') && attributes.key?(:'invoice_status')

      self.invoice_status = attributes[:'invoice_status'] if attributes[:'invoice_status']

      self.quantity = attributes[:'quantity'] if attributes[:'quantity']

      self.net_unit_price = attributes[:'netUnitPrice'] if attributes[:'netUnitPrice']

      raise 'You cannot provide both :netUnitPrice and :net_unit_price' if attributes.key?(:'netUnitPrice') && attributes.key?(:'net_unit_price')

      self.net_unit_price = attributes[:'net_unit_price'] if attributes[:'net_unit_price']

      self.amount = attributes[:'amount'] if attributes[:'amount']

      self.billing_frequency = attributes[:'billingFrequency'] if attributes[:'billingFrequency']

      raise 'You cannot provide both :billingFrequency and :billing_frequency' if attributes.key?(:'billingFrequency') && attributes.key?(:'billing_frequency')

      self.billing_frequency = attributes[:'billing_frequency'] if attributes[:'billing_frequency']

      self.ar_invoice_number = attributes[:'arInvoiceNumber'] if attributes[:'arInvoiceNumber']

      raise 'You cannot provide both :arInvoiceNumber and :ar_invoice_number' if attributes.key?(:'arInvoiceNumber') && attributes.key?(:'ar_invoice_number')

      self.ar_invoice_number = attributes[:'ar_invoice_number'] if attributes[:'ar_invoice_number']

      self.ar_customer_transaction_id = attributes[:'arCustomerTransactionId'] if attributes[:'arCustomerTransactionId']

      raise 'You cannot provide both :arCustomerTransactionId and :ar_customer_transaction_id' if attributes.key?(:'arCustomerTransactionId') && attributes.key?(:'ar_customer_transaction_id')

      self.ar_customer_transaction_id = attributes[:'ar_customer_transaction_id'] if attributes[:'ar_customer_transaction_id']

      self.order_number = attributes[:'orderNumber'] if attributes[:'orderNumber']

      raise 'You cannot provide both :orderNumber and :order_number' if attributes.key?(:'orderNumber') && attributes.key?(:'order_number')

      self.order_number = attributes[:'order_number'] if attributes[:'order_number']

      self.product = attributes[:'product'] if attributes[:'product']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] invoice_status Object to be assigned
    def invoice_status=(invoice_status)
      # rubocop:disable Style/ConditionalAssignment
      if invoice_status && !INVOICE_STATUS_ENUM.include?(invoice_status)
        OCI.logger.debug("Unknown value for 'invoice_status' [" + invoice_status + "]. Mapping to 'INVOICE_STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @invoice_status = INVOICE_STATUS_UNKNOWN_ENUM_VALUE
      else
        @invoice_status = invoice_status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        time_start == other.time_start &&
        time_end == other.time_end &&
        time_invoicing == other.time_invoicing &&
        invoice_status == other.invoice_status &&
        quantity == other.quantity &&
        net_unit_price == other.net_unit_price &&
        amount == other.amount &&
        billing_frequency == other.billing_frequency &&
        ar_invoice_number == other.ar_invoice_number &&
        ar_customer_transaction_id == other.ar_customer_transaction_id &&
        order_number == other.order_number &&
        product == other.product
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
      [time_start, time_end, time_invoicing, invoice_status, quantity, net_unit_price, amount, billing_frequency, ar_invoice_number, ar_customer_transaction_id, order_number, product].hash
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
