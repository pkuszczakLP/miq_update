# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Address.
  #
  class Onesubscription::Models::InvoicingAddress
    # @return [OCI::Onesubscription::Models::InvoicingLocation]
    attr_accessor :location

    # Address name identifier.
    #
    # @return [String]
    attr_accessor :name

    # Phone.
    #
    # @return [String]
    attr_accessor :phone

    # Identify as the customer's billing address.
    #
    # @return [BOOLEAN]
    attr_accessor :is_bill_to

    # Identify as the customer's shipping address.
    #
    # @return [BOOLEAN]
    attr_accessor :is_ship_to

    # Bill to site use Id.
    #
    # @return [Integer]
    attr_accessor :bill_site_use_id

    # Service to site use Id.
    #
    # @return [Integer]
    attr_accessor :service2_site_use_id

    # TCA customer account site Id.
    #
    # @return [Integer]
    attr_accessor :tca_cust_acct_site_id

    # Party site number.
    #
    # @return [String]
    attr_accessor :tca_party_site_number

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'location': :'location',
        'name': :'name',
        'phone': :'phone',
        'is_bill_to': :'isBillTo',
        'is_ship_to': :'isShipTo',
        'bill_site_use_id': :'billSiteUseId',
        'service2_site_use_id': :'service2SiteUseId',
        'tca_cust_acct_site_id': :'tcaCustAcctSiteId',
        'tca_party_site_number': :'tcaPartySiteNumber'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'location': :'OCI::Onesubscription::Models::InvoicingLocation',
        'name': :'String',
        'phone': :'String',
        'is_bill_to': :'BOOLEAN',
        'is_ship_to': :'BOOLEAN',
        'bill_site_use_id': :'Integer',
        'service2_site_use_id': :'Integer',
        'tca_cust_acct_site_id': :'Integer',
        'tca_party_site_number': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [OCI::Onesubscription::Models::InvoicingLocation] :location The value to assign to the {#location} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :phone The value to assign to the {#phone} property
    # @option attributes [BOOLEAN] :is_bill_to The value to assign to the {#is_bill_to} property
    # @option attributes [BOOLEAN] :is_ship_to The value to assign to the {#is_ship_to} property
    # @option attributes [Integer] :bill_site_use_id The value to assign to the {#bill_site_use_id} property
    # @option attributes [Integer] :service2_site_use_id The value to assign to the {#service2_site_use_id} property
    # @option attributes [Integer] :tca_cust_acct_site_id The value to assign to the {#tca_cust_acct_site_id} property
    # @option attributes [String] :tca_party_site_number The value to assign to the {#tca_party_site_number} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.location = attributes[:'location'] if attributes[:'location']

      self.name = attributes[:'name'] if attributes[:'name']

      self.phone = attributes[:'phone'] if attributes[:'phone']

      self.is_bill_to = attributes[:'isBillTo'] unless attributes[:'isBillTo'].nil?

      raise 'You cannot provide both :isBillTo and :is_bill_to' if attributes.key?(:'isBillTo') && attributes.key?(:'is_bill_to')

      self.is_bill_to = attributes[:'is_bill_to'] unless attributes[:'is_bill_to'].nil?

      self.is_ship_to = attributes[:'isShipTo'] unless attributes[:'isShipTo'].nil?

      raise 'You cannot provide both :isShipTo and :is_ship_to' if attributes.key?(:'isShipTo') && attributes.key?(:'is_ship_to')

      self.is_ship_to = attributes[:'is_ship_to'] unless attributes[:'is_ship_to'].nil?

      self.bill_site_use_id = attributes[:'billSiteUseId'] if attributes[:'billSiteUseId']

      raise 'You cannot provide both :billSiteUseId and :bill_site_use_id' if attributes.key?(:'billSiteUseId') && attributes.key?(:'bill_site_use_id')

      self.bill_site_use_id = attributes[:'bill_site_use_id'] if attributes[:'bill_site_use_id']

      self.service2_site_use_id = attributes[:'service2SiteUseId'] if attributes[:'service2SiteUseId']

      raise 'You cannot provide both :service2SiteUseId and :service2_site_use_id' if attributes.key?(:'service2SiteUseId') && attributes.key?(:'service2_site_use_id')

      self.service2_site_use_id = attributes[:'service2_site_use_id'] if attributes[:'service2_site_use_id']

      self.tca_cust_acct_site_id = attributes[:'tcaCustAcctSiteId'] if attributes[:'tcaCustAcctSiteId']

      raise 'You cannot provide both :tcaCustAcctSiteId and :tca_cust_acct_site_id' if attributes.key?(:'tcaCustAcctSiteId') && attributes.key?(:'tca_cust_acct_site_id')

      self.tca_cust_acct_site_id = attributes[:'tca_cust_acct_site_id'] if attributes[:'tca_cust_acct_site_id']

      self.tca_party_site_number = attributes[:'tcaPartySiteNumber'] if attributes[:'tcaPartySiteNumber']

      raise 'You cannot provide both :tcaPartySiteNumber and :tca_party_site_number' if attributes.key?(:'tcaPartySiteNumber') && attributes.key?(:'tca_party_site_number')

      self.tca_party_site_number = attributes[:'tca_party_site_number'] if attributes[:'tca_party_site_number']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        location == other.location &&
        name == other.name &&
        phone == other.phone &&
        is_bill_to == other.is_bill_to &&
        is_ship_to == other.is_ship_to &&
        bill_site_use_id == other.bill_site_use_id &&
        service2_site_use_id == other.service2_site_use_id &&
        tca_cust_acct_site_id == other.tca_cust_acct_site_id &&
        tca_party_site_number == other.tca_party_site_number
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
      [location, name, phone, is_bill_to, is_ship_to, bill_site_use_id, service2_site_use_id, tca_cust_acct_site_id, tca_party_site_number].hash
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
