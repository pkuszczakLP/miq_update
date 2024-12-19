# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Computed Usage Summary object
  #
  class OsubUsage::Models::ComputedUsageSummary
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
      TYPE_COMMITMENT_EXPIRATION = 'COMMITMENT_EXPIRATION'.freeze,
      TYPE_FUNDED_ALLOCATION = 'FUNDED_ALLOCATION'.freeze,
      TYPE_DONOT_BILL_USAGE_POST_TERMINATION = 'DONOT_BILL_USAGE_POST_TERMINATION'.freeze,
      TYPE_DELAYED_USAGE_POST_TERMINATION = 'DELAYED_USAGE_POST_TERMINATION'.freeze,
      TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # Computed Usage created time, expressed in RFC 3339 timestamp format.
    #
    # @return [DateTime]
    attr_accessor :time_created

    # Computed Usage updated time, expressed in RFC 3339 timestamp format.
    #
    # @return [DateTime]
    attr_accessor :time_updated

    # Subscribed service line parent id
    #
    # @return [String]
    attr_accessor :parent_subscribed_service_id

    # @return [OCI::OsubUsage::Models::Product]
    attr_accessor :parent_product

    # Subscription plan number
    #
    # @return [String]
    attr_accessor :plan_number

    # Currency code
    #
    # @return [String]
    attr_accessor :currency_code

    # References the tier in the ratecard for that usage (OCI will be using the same reference to cross-reference for correctness on the usage csv report), comes from Entity OBSCNTR_IPT_PRODUCTTIER.
    #
    # @return [String]
    attr_accessor :rate_card_tierd_id

    # Ratecard Id at subscribed service level
    #
    # @return [String]
    attr_accessor :rate_card_id

    # SPM Internal compute records source .
    #
    # @return [String]
    attr_accessor :compute_source

    # Data Center Attribute as sent by MQS to SPM.
    #
    # @return [String]
    attr_accessor :data_center

    # MQS Identfier send to SPM , SPM does not transform this attribute and is received as is.
    #
    # @return [String]
    attr_accessor :mqs_message_id

    # **[Required]** SPM Internal computed usage Id , 32 character string
    #
    # @return [String]
    attr_accessor :computed_usage_id

    # Total Quantity that was used for computation
    #
    # @return [String]
    attr_accessor :quantity

    # SPM Internal usage Line number identifier in SPM coming from Metered Services entity.
    #
    # @return [String]
    attr_accessor :usage_number

    # SPM Internal Original usage Line number identifier in SPM coming from Metered Services entity.
    #
    # @return [String]
    attr_accessor :original_usage_number

    # Subscribed service commitmentId.
    #
    # @return [String]
    attr_accessor :commitment_service_id

    # Invoicing status for the aggregated compute usage
    #
    # @return [BOOLEAN]
    attr_accessor :is_invoiced

    # Usage compute type in SPM.
    #
    # @return [String]
    attr_reader :type

    # Usae computation date, expressed in RFC 3339 timestamp format.
    #
    # @return [DateTime]
    attr_accessor :time_of_arrival

    # Metered Service date, expressed in RFC 3339 timestamp format.
    #
    # @return [DateTime]
    attr_accessor :time_metered_on

    # Net Unit Price for the product in consideration, price actual.
    #
    # @return [String]
    attr_accessor :net_unit_price

    # Computed Line Amount rounded.
    #
    # @return [String]
    attr_accessor :cost_rounded

    # Computed Line Amount not rounded
    #
    # @return [String]
    attr_accessor :cost

    # @return [OCI::OsubUsage::Models::Product]
    attr_accessor :product

    # Unit of Messure
    #
    # @return [String]
    attr_accessor :unit_of_measure

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'parent_subscribed_service_id': :'parentSubscribedServiceId',
        'parent_product': :'parentProduct',
        'plan_number': :'planNumber',
        'currency_code': :'currencyCode',
        'rate_card_tierd_id': :'rateCardTierdId',
        'rate_card_id': :'rateCardId',
        'compute_source': :'computeSource',
        'data_center': :'dataCenter',
        'mqs_message_id': :'mqsMessageId',
        'computed_usage_id': :'computedUsageId',
        'quantity': :'quantity',
        'usage_number': :'usageNumber',
        'original_usage_number': :'originalUsageNumber',
        'commitment_service_id': :'commitmentServiceId',
        'is_invoiced': :'isInvoiced',
        'type': :'type',
        'time_of_arrival': :'timeOfArrival',
        'time_metered_on': :'timeMeteredOn',
        'net_unit_price': :'netUnitPrice',
        'cost_rounded': :'costRounded',
        'cost': :'cost',
        'product': :'product',
        'unit_of_measure': :'unitOfMeasure'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'parent_subscribed_service_id': :'String',
        'parent_product': :'OCI::OsubUsage::Models::Product',
        'plan_number': :'String',
        'currency_code': :'String',
        'rate_card_tierd_id': :'String',
        'rate_card_id': :'String',
        'compute_source': :'String',
        'data_center': :'String',
        'mqs_message_id': :'String',
        'computed_usage_id': :'String',
        'quantity': :'String',
        'usage_number': :'String',
        'original_usage_number': :'String',
        'commitment_service_id': :'String',
        'is_invoiced': :'BOOLEAN',
        'type': :'String',
        'time_of_arrival': :'DateTime',
        'time_metered_on': :'DateTime',
        'net_unit_price': :'String',
        'cost_rounded': :'String',
        'cost': :'String',
        'product': :'OCI::OsubUsage::Models::Product',
        'unit_of_measure': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :parent_subscribed_service_id The value to assign to the {#parent_subscribed_service_id} property
    # @option attributes [OCI::OsubUsage::Models::Product] :parent_product The value to assign to the {#parent_product} property
    # @option attributes [String] :plan_number The value to assign to the {#plan_number} property
    # @option attributes [String] :currency_code The value to assign to the {#currency_code} property
    # @option attributes [String] :rate_card_tierd_id The value to assign to the {#rate_card_tierd_id} property
    # @option attributes [String] :rate_card_id The value to assign to the {#rate_card_id} property
    # @option attributes [String] :compute_source The value to assign to the {#compute_source} property
    # @option attributes [String] :data_center The value to assign to the {#data_center} property
    # @option attributes [String] :mqs_message_id The value to assign to the {#mqs_message_id} property
    # @option attributes [String] :computed_usage_id The value to assign to the {#computed_usage_id} property
    # @option attributes [String] :quantity The value to assign to the {#quantity} property
    # @option attributes [String] :usage_number The value to assign to the {#usage_number} property
    # @option attributes [String] :original_usage_number The value to assign to the {#original_usage_number} property
    # @option attributes [String] :commitment_service_id The value to assign to the {#commitment_service_id} property
    # @option attributes [BOOLEAN] :is_invoiced The value to assign to the {#is_invoiced} property
    # @option attributes [String] :type The value to assign to the {#type} property
    # @option attributes [DateTime] :time_of_arrival The value to assign to the {#time_of_arrival} property
    # @option attributes [DateTime] :time_metered_on The value to assign to the {#time_metered_on} property
    # @option attributes [String] :net_unit_price The value to assign to the {#net_unit_price} property
    # @option attributes [String] :cost_rounded The value to assign to the {#cost_rounded} property
    # @option attributes [String] :cost The value to assign to the {#cost} property
    # @option attributes [OCI::OsubUsage::Models::Product] :product The value to assign to the {#product} property
    # @option attributes [String] :unit_of_measure The value to assign to the {#unit_of_measure} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.parent_subscribed_service_id = attributes[:'parentSubscribedServiceId'] if attributes[:'parentSubscribedServiceId']

      raise 'You cannot provide both :parentSubscribedServiceId and :parent_subscribed_service_id' if attributes.key?(:'parentSubscribedServiceId') && attributes.key?(:'parent_subscribed_service_id')

      self.parent_subscribed_service_id = attributes[:'parent_subscribed_service_id'] if attributes[:'parent_subscribed_service_id']

      self.parent_product = attributes[:'parentProduct'] if attributes[:'parentProduct']

      raise 'You cannot provide both :parentProduct and :parent_product' if attributes.key?(:'parentProduct') && attributes.key?(:'parent_product')

      self.parent_product = attributes[:'parent_product'] if attributes[:'parent_product']

      self.plan_number = attributes[:'planNumber'] if attributes[:'planNumber']

      raise 'You cannot provide both :planNumber and :plan_number' if attributes.key?(:'planNumber') && attributes.key?(:'plan_number')

      self.plan_number = attributes[:'plan_number'] if attributes[:'plan_number']

      self.currency_code = attributes[:'currencyCode'] if attributes[:'currencyCode']

      raise 'You cannot provide both :currencyCode and :currency_code' if attributes.key?(:'currencyCode') && attributes.key?(:'currency_code')

      self.currency_code = attributes[:'currency_code'] if attributes[:'currency_code']

      self.rate_card_tierd_id = attributes[:'rateCardTierdId'] if attributes[:'rateCardTierdId']

      raise 'You cannot provide both :rateCardTierdId and :rate_card_tierd_id' if attributes.key?(:'rateCardTierdId') && attributes.key?(:'rate_card_tierd_id')

      self.rate_card_tierd_id = attributes[:'rate_card_tierd_id'] if attributes[:'rate_card_tierd_id']

      self.rate_card_id = attributes[:'rateCardId'] if attributes[:'rateCardId']

      raise 'You cannot provide both :rateCardId and :rate_card_id' if attributes.key?(:'rateCardId') && attributes.key?(:'rate_card_id')

      self.rate_card_id = attributes[:'rate_card_id'] if attributes[:'rate_card_id']

      self.compute_source = attributes[:'computeSource'] if attributes[:'computeSource']

      raise 'You cannot provide both :computeSource and :compute_source' if attributes.key?(:'computeSource') && attributes.key?(:'compute_source')

      self.compute_source = attributes[:'compute_source'] if attributes[:'compute_source']

      self.data_center = attributes[:'dataCenter'] if attributes[:'dataCenter']

      raise 'You cannot provide both :dataCenter and :data_center' if attributes.key?(:'dataCenter') && attributes.key?(:'data_center')

      self.data_center = attributes[:'data_center'] if attributes[:'data_center']

      self.mqs_message_id = attributes[:'mqsMessageId'] if attributes[:'mqsMessageId']

      raise 'You cannot provide both :mqsMessageId and :mqs_message_id' if attributes.key?(:'mqsMessageId') && attributes.key?(:'mqs_message_id')

      self.mqs_message_id = attributes[:'mqs_message_id'] if attributes[:'mqs_message_id']

      self.computed_usage_id = attributes[:'computedUsageId'] if attributes[:'computedUsageId']

      raise 'You cannot provide both :computedUsageId and :computed_usage_id' if attributes.key?(:'computedUsageId') && attributes.key?(:'computed_usage_id')

      self.computed_usage_id = attributes[:'computed_usage_id'] if attributes[:'computed_usage_id']

      self.quantity = attributes[:'quantity'] if attributes[:'quantity']

      self.usage_number = attributes[:'usageNumber'] if attributes[:'usageNumber']

      raise 'You cannot provide both :usageNumber and :usage_number' if attributes.key?(:'usageNumber') && attributes.key?(:'usage_number')

      self.usage_number = attributes[:'usage_number'] if attributes[:'usage_number']

      self.original_usage_number = attributes[:'originalUsageNumber'] if attributes[:'originalUsageNumber']

      raise 'You cannot provide both :originalUsageNumber and :original_usage_number' if attributes.key?(:'originalUsageNumber') && attributes.key?(:'original_usage_number')

      self.original_usage_number = attributes[:'original_usage_number'] if attributes[:'original_usage_number']

      self.commitment_service_id = attributes[:'commitmentServiceId'] if attributes[:'commitmentServiceId']

      raise 'You cannot provide both :commitmentServiceId and :commitment_service_id' if attributes.key?(:'commitmentServiceId') && attributes.key?(:'commitment_service_id')

      self.commitment_service_id = attributes[:'commitment_service_id'] if attributes[:'commitment_service_id']

      self.is_invoiced = attributes[:'isInvoiced'] unless attributes[:'isInvoiced'].nil?

      raise 'You cannot provide both :isInvoiced and :is_invoiced' if attributes.key?(:'isInvoiced') && attributes.key?(:'is_invoiced')

      self.is_invoiced = attributes[:'is_invoiced'] unless attributes[:'is_invoiced'].nil?

      self.type = attributes[:'type'] if attributes[:'type']

      self.time_of_arrival = attributes[:'timeOfArrival'] if attributes[:'timeOfArrival']

      raise 'You cannot provide both :timeOfArrival and :time_of_arrival' if attributes.key?(:'timeOfArrival') && attributes.key?(:'time_of_arrival')

      self.time_of_arrival = attributes[:'time_of_arrival'] if attributes[:'time_of_arrival']

      self.time_metered_on = attributes[:'timeMeteredOn'] if attributes[:'timeMeteredOn']

      raise 'You cannot provide both :timeMeteredOn and :time_metered_on' if attributes.key?(:'timeMeteredOn') && attributes.key?(:'time_metered_on')

      self.time_metered_on = attributes[:'time_metered_on'] if attributes[:'time_metered_on']

      self.net_unit_price = attributes[:'netUnitPrice'] if attributes[:'netUnitPrice']

      raise 'You cannot provide both :netUnitPrice and :net_unit_price' if attributes.key?(:'netUnitPrice') && attributes.key?(:'net_unit_price')

      self.net_unit_price = attributes[:'net_unit_price'] if attributes[:'net_unit_price']

      self.cost_rounded = attributes[:'costRounded'] if attributes[:'costRounded']

      raise 'You cannot provide both :costRounded and :cost_rounded' if attributes.key?(:'costRounded') && attributes.key?(:'cost_rounded')

      self.cost_rounded = attributes[:'cost_rounded'] if attributes[:'cost_rounded']

      self.cost = attributes[:'cost'] if attributes[:'cost']

      self.product = attributes[:'product'] if attributes[:'product']

      self.unit_of_measure = attributes[:'unitOfMeasure'] if attributes[:'unitOfMeasure']

      raise 'You cannot provide both :unitOfMeasure and :unit_of_measure' if attributes.key?(:'unitOfMeasure') && attributes.key?(:'unit_of_measure')

      self.unit_of_measure = attributes[:'unit_of_measure'] if attributes[:'unit_of_measure']
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
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        parent_subscribed_service_id == other.parent_subscribed_service_id &&
        parent_product == other.parent_product &&
        plan_number == other.plan_number &&
        currency_code == other.currency_code &&
        rate_card_tierd_id == other.rate_card_tierd_id &&
        rate_card_id == other.rate_card_id &&
        compute_source == other.compute_source &&
        data_center == other.data_center &&
        mqs_message_id == other.mqs_message_id &&
        computed_usage_id == other.computed_usage_id &&
        quantity == other.quantity &&
        usage_number == other.usage_number &&
        original_usage_number == other.original_usage_number &&
        commitment_service_id == other.commitment_service_id &&
        is_invoiced == other.is_invoiced &&
        type == other.type &&
        time_of_arrival == other.time_of_arrival &&
        time_metered_on == other.time_metered_on &&
        net_unit_price == other.net_unit_price &&
        cost_rounded == other.cost_rounded &&
        cost == other.cost &&
        product == other.product &&
        unit_of_measure == other.unit_of_measure
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
      [time_created, time_updated, parent_subscribed_service_id, parent_product, plan_number, currency_code, rate_card_tierd_id, rate_card_id, compute_source, data_center, mqs_message_id, computed_usage_id, quantity, usage_number, original_usage_number, commitment_service_id, is_invoiced, type, time_of_arrival, time_metered_on, net_unit_price, cost_rounded, cost, product, unit_of_measure].hash
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
