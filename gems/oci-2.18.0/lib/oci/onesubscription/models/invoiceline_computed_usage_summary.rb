# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Computed Usage Summary object
  #
  class Onesubscription::Models::InvoicelineComputedUsageSummary
    TYPE_ENUM = [
      TYPE_PROMOTION = 'PROMOTION'.freeze,
      TYPE_DO_NOT_BILL = 'DO_NOT_BILL'.freeze,
      TYPE_USAGE = 'USAGE'.freeze,
      TYPE_COMMIT = 'COMMIT'.freeze,
      TYPE_OVERAGE = 'OVERAGE'.freeze,
      TYPE_PAY_AS_YOU_GO = 'PAY_AS_YOU_GO'.freeze,
      TYPE_MONTHLY_MINIMUM = 'MONTHLY_MINIMUM'.freeze,
      TYPE_DELAYED_USAGE_INVOICE_TIMING = 'DELAYED_USAGE_INVOICE_TIMING'.freeze,
      TYPE_DELAYED_USAGE_COMMITMENT_EXP = 'DELAYED_USAGE_COMMITMENT_EXP'.freeze,
      TYPE_ON_ACCOUNT_CREDIT = 'ON_ACCOUNT_CREDIT'.freeze,
      TYPE_SERVICE_CREDIT = 'SERVICE_CREDIT'.freeze,
      TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # This attribute is required.
    # @return [OCI::Onesubscription::Models::InvoicingProduct]
    attr_accessor :parent_product

    # @return [OCI::Onesubscription::Models::InvoicingProduct]
    attr_accessor :product

    # **[Required]** Total Quantity that was used for computation
    #
    # @return [Float]
    attr_accessor :quantity

    # **[Required]** Net Unit Price for the product in consideration, price actual.
    #
    # @return [Float]
    attr_accessor :net_unit_price

    # **[Required]** Metered Service date.
    #
    # @return [DateTime]
    attr_accessor :time_metered_on

    # **[Required]** Usage compute type in SPM.
    #
    # @return [String]
    attr_reader :type

    # Sum of Usage/Service Billing Line net Amount
    #
    # @return [Float]
    attr_accessor :cost

    # **[Required]** Computed Line Amount rounded.
    #
    # @return [Float]
    attr_accessor :cost_rounded

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'parent_product': :'parentProduct',
        'product': :'product',
        'quantity': :'quantity',
        'net_unit_price': :'netUnitPrice',
        'time_metered_on': :'timeMeteredOn',
        'type': :'type',
        'cost': :'cost',
        'cost_rounded': :'costRounded'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'parent_product': :'OCI::Onesubscription::Models::InvoicingProduct',
        'product': :'OCI::Onesubscription::Models::InvoicingProduct',
        'quantity': :'Float',
        'net_unit_price': :'Float',
        'time_metered_on': :'DateTime',
        'type': :'String',
        'cost': :'Float',
        'cost_rounded': :'Float'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [OCI::Onesubscription::Models::InvoicingProduct] :parent_product The value to assign to the {#parent_product} property
    # @option attributes [OCI::Onesubscription::Models::InvoicingProduct] :product The value to assign to the {#product} property
    # @option attributes [Float] :quantity The value to assign to the {#quantity} property
    # @option attributes [Float] :net_unit_price The value to assign to the {#net_unit_price} property
    # @option attributes [DateTime] :time_metered_on The value to assign to the {#time_metered_on} property
    # @option attributes [String] :type The value to assign to the {#type} property
    # @option attributes [Float] :cost The value to assign to the {#cost} property
    # @option attributes [Float] :cost_rounded The value to assign to the {#cost_rounded} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.parent_product = attributes[:'parentProduct'] if attributes[:'parentProduct']

      raise 'You cannot provide both :parentProduct and :parent_product' if attributes.key?(:'parentProduct') && attributes.key?(:'parent_product')

      self.parent_product = attributes[:'parent_product'] if attributes[:'parent_product']

      self.product = attributes[:'product'] if attributes[:'product']

      self.quantity = attributes[:'quantity'] if attributes[:'quantity']

      self.net_unit_price = attributes[:'netUnitPrice'] if attributes[:'netUnitPrice']

      raise 'You cannot provide both :netUnitPrice and :net_unit_price' if attributes.key?(:'netUnitPrice') && attributes.key?(:'net_unit_price')

      self.net_unit_price = attributes[:'net_unit_price'] if attributes[:'net_unit_price']

      self.time_metered_on = attributes[:'timeMeteredOn'] if attributes[:'timeMeteredOn']

      raise 'You cannot provide both :timeMeteredOn and :time_metered_on' if attributes.key?(:'timeMeteredOn') && attributes.key?(:'time_metered_on')

      self.time_metered_on = attributes[:'time_metered_on'] if attributes[:'time_metered_on']

      self.type = attributes[:'type'] if attributes[:'type']

      self.cost = attributes[:'cost'] if attributes[:'cost']

      self.cost_rounded = attributes[:'costRounded'] if attributes[:'costRounded']

      raise 'You cannot provide both :costRounded and :cost_rounded' if attributes.key?(:'costRounded') && attributes.key?(:'cost_rounded')

      self.cost_rounded = attributes[:'cost_rounded'] if attributes[:'cost_rounded']
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

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        parent_product == other.parent_product &&
        product == other.product &&
        quantity == other.quantity &&
        net_unit_price == other.net_unit_price &&
        time_metered_on == other.time_metered_on &&
        type == other.type &&
        cost == other.cost &&
        cost_rounded == other.cost_rounded
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
      [parent_product, product, quantity, net_unit_price, time_metered_on, type, cost, cost_rounded].hash
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
