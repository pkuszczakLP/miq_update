# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Tax details.
  class OspGateway::Models::TaxInfo
    # Tay payer identifier.
    # @return [String]
    attr_accessor :tax_payer_id

    # Tax registration number.
    # @return [String]
    attr_accessor :tax_reg_number

    # Tax exemption reason code.
    # @return [String]
    attr_accessor :no_tax_reason_code

    # Tax exemption reason description.
    # @return [String]
    attr_accessor :no_tax_reason_code_details

    # Brazilian companies' CNPJ number.
    # @return [String]
    attr_accessor :tax_cnpj

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'tax_payer_id': :'taxPayerId',
        'tax_reg_number': :'taxRegNumber',
        'no_tax_reason_code': :'noTaxReasonCode',
        'no_tax_reason_code_details': :'noTaxReasonCodeDetails',
        'tax_cnpj': :'taxCnpj'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'tax_payer_id': :'String',
        'tax_reg_number': :'String',
        'no_tax_reason_code': :'String',
        'no_tax_reason_code_details': :'String',
        'tax_cnpj': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :tax_payer_id The value to assign to the {#tax_payer_id} property
    # @option attributes [String] :tax_reg_number The value to assign to the {#tax_reg_number} property
    # @option attributes [String] :no_tax_reason_code The value to assign to the {#no_tax_reason_code} property
    # @option attributes [String] :no_tax_reason_code_details The value to assign to the {#no_tax_reason_code_details} property
    # @option attributes [String] :tax_cnpj The value to assign to the {#tax_cnpj} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.tax_payer_id = attributes[:'taxPayerId'] if attributes[:'taxPayerId']

      raise 'You cannot provide both :taxPayerId and :tax_payer_id' if attributes.key?(:'taxPayerId') && attributes.key?(:'tax_payer_id')

      self.tax_payer_id = attributes[:'tax_payer_id'] if attributes[:'tax_payer_id']

      self.tax_reg_number = attributes[:'taxRegNumber'] if attributes[:'taxRegNumber']

      raise 'You cannot provide both :taxRegNumber and :tax_reg_number' if attributes.key?(:'taxRegNumber') && attributes.key?(:'tax_reg_number')

      self.tax_reg_number = attributes[:'tax_reg_number'] if attributes[:'tax_reg_number']

      self.no_tax_reason_code = attributes[:'noTaxReasonCode'] if attributes[:'noTaxReasonCode']

      raise 'You cannot provide both :noTaxReasonCode and :no_tax_reason_code' if attributes.key?(:'noTaxReasonCode') && attributes.key?(:'no_tax_reason_code')

      self.no_tax_reason_code = attributes[:'no_tax_reason_code'] if attributes[:'no_tax_reason_code']

      self.no_tax_reason_code_details = attributes[:'noTaxReasonCodeDetails'] if attributes[:'noTaxReasonCodeDetails']

      raise 'You cannot provide both :noTaxReasonCodeDetails and :no_tax_reason_code_details' if attributes.key?(:'noTaxReasonCodeDetails') && attributes.key?(:'no_tax_reason_code_details')

      self.no_tax_reason_code_details = attributes[:'no_tax_reason_code_details'] if attributes[:'no_tax_reason_code_details']

      self.tax_cnpj = attributes[:'taxCnpj'] if attributes[:'taxCnpj']

      raise 'You cannot provide both :taxCnpj and :tax_cnpj' if attributes.key?(:'taxCnpj') && attributes.key?(:'tax_cnpj')

      self.tax_cnpj = attributes[:'tax_cnpj'] if attributes[:'tax_cnpj']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        tax_payer_id == other.tax_payer_id &&
        tax_reg_number == other.tax_reg_number &&
        no_tax_reason_code == other.no_tax_reason_code &&
        no_tax_reason_code_details == other.no_tax_reason_code_details &&
        tax_cnpj == other.tax_cnpj
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
      [tax_payer_id, tax_reg_number, no_tax_reason_code, no_tax_reason_code_details, tax_cnpj].hash
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
