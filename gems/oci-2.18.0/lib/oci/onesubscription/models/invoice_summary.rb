# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Invoice details
  #
  class Onesubscription::Models::InvoiceSummary
    # **[Required]** SPM Document Number is an functional identifier for invoice in SPM
    #
    # @return [String]
    attr_accessor :spm_invoice_number

    # AR Invoice Numbers comma separated under one invoice
    #
    # @return [String]
    attr_accessor :ar_invoices

    # This attribute is required.
    # @return [OCI::Onesubscription::Models::InvoicingBusinessPartner]
    attr_accessor :bill_to_customer

    # This attribute is required.
    # @return [OCI::Onesubscription::Models::InvoicingUser]
    attr_accessor :bill_to_contact

    # This attribute is required.
    # @return [OCI::Onesubscription::Models::InvoicingAddress]
    attr_accessor :bill_to_address

    # **[Required]** Payment Method
    #
    # @return [String]
    attr_accessor :payment_method

    # This attribute is required.
    # @return [OCI::Onesubscription::Models::InvoicingPaymentTerm]
    attr_accessor :payment_term

    # Receipt Method of Payment Mode
    #
    # @return [String]
    attr_accessor :receipt_method

    # This attribute is required.
    # @return [OCI::Onesubscription::Models::InvoicingCurrency]
    attr_accessor :currency

    # This attribute is required.
    # @return [OCI::Onesubscription::Models::InvoicingOrganization]
    attr_accessor :organization

    # **[Required]** Document Type in SPM like SPM Invoice,SPM Credit Memo etc.,
    #
    # @return [String]
    attr_accessor :type

    # **[Required]** Document Status in SPM which depicts current state of invoice
    #
    # @return [String]
    attr_accessor :status

    # **[Required]** Invoice associated subscription plan number.
    #
    # @return [String]
    attr_accessor :subscription_number

    # **[Required]** Invoice Date
    #
    # @return [DateTime]
    attr_accessor :time_invoice_date

    # SPM Invocie creation date
    #
    # @return [DateTime]
    attr_accessor :time_created

    # User that executed SPM Invoice process
    #
    # @return [String]
    attr_accessor :created_by

    # SPM Invoice updated date
    #
    # @return [DateTime]
    attr_accessor :time_updated

    # User that updated SPM Invoice
    #
    # @return [String]
    attr_accessor :updated_by

    # Invoice Lines under particular invoice.
    #
    # @return [Array<OCI::Onesubscription::Models::InvoiceLineSummary>]
    attr_accessor :invoice_lines

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'spm_invoice_number': :'spmInvoiceNumber',
        'ar_invoices': :'arInvoices',
        'bill_to_customer': :'billToCustomer',
        'bill_to_contact': :'billToContact',
        'bill_to_address': :'billToAddress',
        'payment_method': :'paymentMethod',
        'payment_term': :'paymentTerm',
        'receipt_method': :'receiptMethod',
        'currency': :'currency',
        'organization': :'organization',
        'type': :'type',
        'status': :'status',
        'subscription_number': :'subscriptionNumber',
        'time_invoice_date': :'timeInvoiceDate',
        'time_created': :'timeCreated',
        'created_by': :'createdBy',
        'time_updated': :'timeUpdated',
        'updated_by': :'updatedBy',
        'invoice_lines': :'invoiceLines'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'spm_invoice_number': :'String',
        'ar_invoices': :'String',
        'bill_to_customer': :'OCI::Onesubscription::Models::InvoicingBusinessPartner',
        'bill_to_contact': :'OCI::Onesubscription::Models::InvoicingUser',
        'bill_to_address': :'OCI::Onesubscription::Models::InvoicingAddress',
        'payment_method': :'String',
        'payment_term': :'OCI::Onesubscription::Models::InvoicingPaymentTerm',
        'receipt_method': :'String',
        'currency': :'OCI::Onesubscription::Models::InvoicingCurrency',
        'organization': :'OCI::Onesubscription::Models::InvoicingOrganization',
        'type': :'String',
        'status': :'String',
        'subscription_number': :'String',
        'time_invoice_date': :'DateTime',
        'time_created': :'DateTime',
        'created_by': :'String',
        'time_updated': :'DateTime',
        'updated_by': :'String',
        'invoice_lines': :'Array<OCI::Onesubscription::Models::InvoiceLineSummary>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :spm_invoice_number The value to assign to the {#spm_invoice_number} property
    # @option attributes [String] :ar_invoices The value to assign to the {#ar_invoices} property
    # @option attributes [OCI::Onesubscription::Models::InvoicingBusinessPartner] :bill_to_customer The value to assign to the {#bill_to_customer} property
    # @option attributes [OCI::Onesubscription::Models::InvoicingUser] :bill_to_contact The value to assign to the {#bill_to_contact} property
    # @option attributes [OCI::Onesubscription::Models::InvoicingAddress] :bill_to_address The value to assign to the {#bill_to_address} property
    # @option attributes [String] :payment_method The value to assign to the {#payment_method} property
    # @option attributes [OCI::Onesubscription::Models::InvoicingPaymentTerm] :payment_term The value to assign to the {#payment_term} property
    # @option attributes [String] :receipt_method The value to assign to the {#receipt_method} property
    # @option attributes [OCI::Onesubscription::Models::InvoicingCurrency] :currency The value to assign to the {#currency} property
    # @option attributes [OCI::Onesubscription::Models::InvoicingOrganization] :organization The value to assign to the {#organization} property
    # @option attributes [String] :type The value to assign to the {#type} property
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [String] :subscription_number The value to assign to the {#subscription_number} property
    # @option attributes [DateTime] :time_invoice_date The value to assign to the {#time_invoice_date} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [String] :created_by The value to assign to the {#created_by} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :updated_by The value to assign to the {#updated_by} property
    # @option attributes [Array<OCI::Onesubscription::Models::InvoiceLineSummary>] :invoice_lines The value to assign to the {#invoice_lines} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.spm_invoice_number = attributes[:'spmInvoiceNumber'] if attributes[:'spmInvoiceNumber']

      raise 'You cannot provide both :spmInvoiceNumber and :spm_invoice_number' if attributes.key?(:'spmInvoiceNumber') && attributes.key?(:'spm_invoice_number')

      self.spm_invoice_number = attributes[:'spm_invoice_number'] if attributes[:'spm_invoice_number']

      self.ar_invoices = attributes[:'arInvoices'] if attributes[:'arInvoices']

      raise 'You cannot provide both :arInvoices and :ar_invoices' if attributes.key?(:'arInvoices') && attributes.key?(:'ar_invoices')

      self.ar_invoices = attributes[:'ar_invoices'] if attributes[:'ar_invoices']

      self.bill_to_customer = attributes[:'billToCustomer'] if attributes[:'billToCustomer']

      raise 'You cannot provide both :billToCustomer and :bill_to_customer' if attributes.key?(:'billToCustomer') && attributes.key?(:'bill_to_customer')

      self.bill_to_customer = attributes[:'bill_to_customer'] if attributes[:'bill_to_customer']

      self.bill_to_contact = attributes[:'billToContact'] if attributes[:'billToContact']

      raise 'You cannot provide both :billToContact and :bill_to_contact' if attributes.key?(:'billToContact') && attributes.key?(:'bill_to_contact')

      self.bill_to_contact = attributes[:'bill_to_contact'] if attributes[:'bill_to_contact']

      self.bill_to_address = attributes[:'billToAddress'] if attributes[:'billToAddress']

      raise 'You cannot provide both :billToAddress and :bill_to_address' if attributes.key?(:'billToAddress') && attributes.key?(:'bill_to_address')

      self.bill_to_address = attributes[:'bill_to_address'] if attributes[:'bill_to_address']

      self.payment_method = attributes[:'paymentMethod'] if attributes[:'paymentMethod']

      raise 'You cannot provide both :paymentMethod and :payment_method' if attributes.key?(:'paymentMethod') && attributes.key?(:'payment_method')

      self.payment_method = attributes[:'payment_method'] if attributes[:'payment_method']

      self.payment_term = attributes[:'paymentTerm'] if attributes[:'paymentTerm']

      raise 'You cannot provide both :paymentTerm and :payment_term' if attributes.key?(:'paymentTerm') && attributes.key?(:'payment_term')

      self.payment_term = attributes[:'payment_term'] if attributes[:'payment_term']

      self.receipt_method = attributes[:'receiptMethod'] if attributes[:'receiptMethod']

      raise 'You cannot provide both :receiptMethod and :receipt_method' if attributes.key?(:'receiptMethod') && attributes.key?(:'receipt_method')

      self.receipt_method = attributes[:'receipt_method'] if attributes[:'receipt_method']

      self.currency = attributes[:'currency'] if attributes[:'currency']

      self.organization = attributes[:'organization'] if attributes[:'organization']

      self.type = attributes[:'type'] if attributes[:'type']

      self.status = attributes[:'status'] if attributes[:'status']

      self.subscription_number = attributes[:'subscriptionNumber'] if attributes[:'subscriptionNumber']

      raise 'You cannot provide both :subscriptionNumber and :subscription_number' if attributes.key?(:'subscriptionNumber') && attributes.key?(:'subscription_number')

      self.subscription_number = attributes[:'subscription_number'] if attributes[:'subscription_number']

      self.time_invoice_date = attributes[:'timeInvoiceDate'] if attributes[:'timeInvoiceDate']

      raise 'You cannot provide both :timeInvoiceDate and :time_invoice_date' if attributes.key?(:'timeInvoiceDate') && attributes.key?(:'time_invoice_date')

      self.time_invoice_date = attributes[:'time_invoice_date'] if attributes[:'time_invoice_date']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.created_by = attributes[:'createdBy'] if attributes[:'createdBy']

      raise 'You cannot provide both :createdBy and :created_by' if attributes.key?(:'createdBy') && attributes.key?(:'created_by')

      self.created_by = attributes[:'created_by'] if attributes[:'created_by']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.updated_by = attributes[:'updatedBy'] if attributes[:'updatedBy']

      raise 'You cannot provide both :updatedBy and :updated_by' if attributes.key?(:'updatedBy') && attributes.key?(:'updated_by')

      self.updated_by = attributes[:'updated_by'] if attributes[:'updated_by']

      self.invoice_lines = attributes[:'invoiceLines'] if attributes[:'invoiceLines']

      raise 'You cannot provide both :invoiceLines and :invoice_lines' if attributes.key?(:'invoiceLines') && attributes.key?(:'invoice_lines')

      self.invoice_lines = attributes[:'invoice_lines'] if attributes[:'invoice_lines']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        spm_invoice_number == other.spm_invoice_number &&
        ar_invoices == other.ar_invoices &&
        bill_to_customer == other.bill_to_customer &&
        bill_to_contact == other.bill_to_contact &&
        bill_to_address == other.bill_to_address &&
        payment_method == other.payment_method &&
        payment_term == other.payment_term &&
        receipt_method == other.receipt_method &&
        currency == other.currency &&
        organization == other.organization &&
        type == other.type &&
        status == other.status &&
        subscription_number == other.subscription_number &&
        time_invoice_date == other.time_invoice_date &&
        time_created == other.time_created &&
        created_by == other.created_by &&
        time_updated == other.time_updated &&
        updated_by == other.updated_by &&
        invoice_lines == other.invoice_lines
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
      [spm_invoice_number, ar_invoices, bill_to_customer, bill_to_contact, bill_to_address, payment_method, payment_term, receipt_method, currency, organization, type, status, subscription_number, time_invoice_date, time_created, created_by, time_updated, updated_by, invoice_lines].hash
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
