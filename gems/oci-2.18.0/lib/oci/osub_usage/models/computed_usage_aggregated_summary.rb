# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Subscribed Service Contract details
  #
  class OsubUsage::Models::ComputedUsageAggregatedSummary
    PRICING_MODEL_ENUM = [
      PRICING_MODEL_PAY_AS_YOU_GO = 'PAY_AS_YOU_GO'.freeze,
      PRICING_MODEL_MONTHLY = 'MONTHLY'.freeze,
      PRICING_MODEL_ANNUAL = 'ANNUAL'.freeze,
      PRICING_MODEL_PREPAID = 'PREPAID'.freeze,
      PRICING_MODEL_FUNDED_ALLOCATION = 'FUNDED_ALLOCATION'.freeze,
      PRICING_MODEL_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Subscription Id is an identifier associated to the service used for filter the Computed Usage in SPM
    #
    # @return [String]
    attr_accessor :subscription_id

    # Subscribed service line parent id
    #
    # @return [String]
    attr_accessor :parent_subscribed_service_id

    # @return [OCI::OsubUsage::Models::Product]
    attr_accessor :parent_product

    # Subscribed services contract line start date, expressed in RFC 3339 timestamp format.
    #
    # @return [DateTime]
    attr_accessor :time_start

    # Subscribed services contract line end date, expressed in RFC 3339 timestamp format.
    #
    # @return [DateTime]
    attr_accessor :time_end

    # Subscribed service asociated subscription plan number.
    #
    # @return [String]
    attr_accessor :plan_number

    # Currency code
    #
    # @return [String]
    attr_accessor :currency_code

    # Inernal SPM Ratecard Id at line level
    #
    # @return [String]
    attr_accessor :rate_card_id

    # Subscribed services pricing model
    #
    # @return [String]
    attr_reader :pricing_model

    # Aggregation of computed usages for the subscribed service.
    #
    # @return [Array<OCI::OsubUsage::Models::ComputedUsageAggregation>]
    attr_accessor :aggregated_computed_usages

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'subscription_id': :'subscriptionId',
        'parent_subscribed_service_id': :'parentSubscribedServiceId',
        'parent_product': :'parentProduct',
        'time_start': :'timeStart',
        'time_end': :'timeEnd',
        'plan_number': :'planNumber',
        'currency_code': :'currencyCode',
        'rate_card_id': :'rateCardId',
        'pricing_model': :'pricingModel',
        'aggregated_computed_usages': :'aggregatedComputedUsages'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'subscription_id': :'String',
        'parent_subscribed_service_id': :'String',
        'parent_product': :'OCI::OsubUsage::Models::Product',
        'time_start': :'DateTime',
        'time_end': :'DateTime',
        'plan_number': :'String',
        'currency_code': :'String',
        'rate_card_id': :'String',
        'pricing_model': :'String',
        'aggregated_computed_usages': :'Array<OCI::OsubUsage::Models::ComputedUsageAggregation>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :subscription_id The value to assign to the {#subscription_id} property
    # @option attributes [String] :parent_subscribed_service_id The value to assign to the {#parent_subscribed_service_id} property
    # @option attributes [OCI::OsubUsage::Models::Product] :parent_product The value to assign to the {#parent_product} property
    # @option attributes [DateTime] :time_start The value to assign to the {#time_start} property
    # @option attributes [DateTime] :time_end The value to assign to the {#time_end} property
    # @option attributes [String] :plan_number The value to assign to the {#plan_number} property
    # @option attributes [String] :currency_code The value to assign to the {#currency_code} property
    # @option attributes [String] :rate_card_id The value to assign to the {#rate_card_id} property
    # @option attributes [String] :pricing_model The value to assign to the {#pricing_model} property
    # @option attributes [Array<OCI::OsubUsage::Models::ComputedUsageAggregation>] :aggregated_computed_usages The value to assign to the {#aggregated_computed_usages} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.subscription_id = attributes[:'subscriptionId'] if attributes[:'subscriptionId']

      raise 'You cannot provide both :subscriptionId and :subscription_id' if attributes.key?(:'subscriptionId') && attributes.key?(:'subscription_id')

      self.subscription_id = attributes[:'subscription_id'] if attributes[:'subscription_id']

      self.parent_subscribed_service_id = attributes[:'parentSubscribedServiceId'] if attributes[:'parentSubscribedServiceId']

      raise 'You cannot provide both :parentSubscribedServiceId and :parent_subscribed_service_id' if attributes.key?(:'parentSubscribedServiceId') && attributes.key?(:'parent_subscribed_service_id')

      self.parent_subscribed_service_id = attributes[:'parent_subscribed_service_id'] if attributes[:'parent_subscribed_service_id']

      self.parent_product = attributes[:'parentProduct'] if attributes[:'parentProduct']

      raise 'You cannot provide both :parentProduct and :parent_product' if attributes.key?(:'parentProduct') && attributes.key?(:'parent_product')

      self.parent_product = attributes[:'parent_product'] if attributes[:'parent_product']

      self.time_start = attributes[:'timeStart'] if attributes[:'timeStart']

      raise 'You cannot provide both :timeStart and :time_start' if attributes.key?(:'timeStart') && attributes.key?(:'time_start')

      self.time_start = attributes[:'time_start'] if attributes[:'time_start']

      self.time_end = attributes[:'timeEnd'] if attributes[:'timeEnd']

      raise 'You cannot provide both :timeEnd and :time_end' if attributes.key?(:'timeEnd') && attributes.key?(:'time_end')

      self.time_end = attributes[:'time_end'] if attributes[:'time_end']

      self.plan_number = attributes[:'planNumber'] if attributes[:'planNumber']

      raise 'You cannot provide both :planNumber and :plan_number' if attributes.key?(:'planNumber') && attributes.key?(:'plan_number')

      self.plan_number = attributes[:'plan_number'] if attributes[:'plan_number']

      self.currency_code = attributes[:'currencyCode'] if attributes[:'currencyCode']

      raise 'You cannot provide both :currencyCode and :currency_code' if attributes.key?(:'currencyCode') && attributes.key?(:'currency_code')

      self.currency_code = attributes[:'currency_code'] if attributes[:'currency_code']

      self.rate_card_id = attributes[:'rateCardId'] if attributes[:'rateCardId']

      raise 'You cannot provide both :rateCardId and :rate_card_id' if attributes.key?(:'rateCardId') && attributes.key?(:'rate_card_id')

      self.rate_card_id = attributes[:'rate_card_id'] if attributes[:'rate_card_id']

      self.pricing_model = attributes[:'pricingModel'] if attributes[:'pricingModel']

      raise 'You cannot provide both :pricingModel and :pricing_model' if attributes.key?(:'pricingModel') && attributes.key?(:'pricing_model')

      self.pricing_model = attributes[:'pricing_model'] if attributes[:'pricing_model']

      self.aggregated_computed_usages = attributes[:'aggregatedComputedUsages'] if attributes[:'aggregatedComputedUsages']

      raise 'You cannot provide both :aggregatedComputedUsages and :aggregated_computed_usages' if attributes.key?(:'aggregatedComputedUsages') && attributes.key?(:'aggregated_computed_usages')

      self.aggregated_computed_usages = attributes[:'aggregated_computed_usages'] if attributes[:'aggregated_computed_usages']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] pricing_model Object to be assigned
    def pricing_model=(pricing_model)
      # rubocop:disable Style/ConditionalAssignment
      if pricing_model && !PRICING_MODEL_ENUM.include?(pricing_model)
        OCI.logger.debug("Unknown value for 'pricing_model' [" + pricing_model + "]. Mapping to 'PRICING_MODEL_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @pricing_model = PRICING_MODEL_UNKNOWN_ENUM_VALUE
      else
        @pricing_model = pricing_model
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        subscription_id == other.subscription_id &&
        parent_subscribed_service_id == other.parent_subscribed_service_id &&
        parent_product == other.parent_product &&
        time_start == other.time_start &&
        time_end == other.time_end &&
        plan_number == other.plan_number &&
        currency_code == other.currency_code &&
        rate_card_id == other.rate_card_id &&
        pricing_model == other.pricing_model &&
        aggregated_computed_usages == other.aggregated_computed_usages
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
      [subscription_id, parent_subscribed_service_id, parent_product, time_start, time_end, plan_number, currency_code, rate_card_id, pricing_model, aggregated_computed_usages].hash
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
