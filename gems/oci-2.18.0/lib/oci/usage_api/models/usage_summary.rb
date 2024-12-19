# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The usage store result.
  class UsageApi::Models::UsageSummary
    # The tenancy OCID.
    # @return [String]
    attr_accessor :tenant_id

    # The tenancy name.
    # @return [String]
    attr_accessor :tenant_name

    # The compartment OCID.
    # @return [String]
    attr_accessor :compartment_id

    # The compartment path, starting from root.
    # @return [String]
    attr_accessor :compartment_path

    # The compartment name.
    # @return [String]
    attr_accessor :compartment_name

    # The service name that is incurring the cost.
    # @return [String]
    attr_accessor :service

    # The resource name that is incurring the cost.
    # @return [String]
    attr_accessor :resource_name

    # The resource OCID that is incurring the cost.
    # @return [String]
    attr_accessor :resource_id

    # The region of the usage.
    # @return [String]
    attr_accessor :region

    # The availability domain of the usage.
    # @return [String]
    attr_accessor :ad

    # The resource size being metered.
    # @return [Float]
    attr_accessor :weight

    # The resource shape.
    # @return [String]
    attr_accessor :shape

    # The SKU part number.
    # @return [String]
    attr_accessor :sku_part_number

    # The SKU friendly name.
    # @return [String]
    attr_accessor :sku_name

    # The usage unit.
    # @return [String]
    attr_accessor :unit

    # The discretionary discount applied to the SKU.
    # @return [Float]
    attr_accessor :discount

    # The SKU list rate (not discount).
    # @return [Float]
    attr_accessor :list_rate

    # Platform for the cost.
    # @return [String]
    attr_accessor :platform

    # **[Required]** The usage start time.
    # @return [DateTime]
    attr_accessor :time_usage_started

    # **[Required]** The usage end time.
    # @return [DateTime]
    attr_accessor :time_usage_ended

    # The computed cost.
    # @return [Float]
    attr_accessor :computed_amount

    # The usage number.
    # @return [Float]
    attr_accessor :computed_quantity

    # The SPM OverageFlag.
    # @return [String]
    attr_accessor :overages_flag

    # The price per unit.
    # @return [Float]
    attr_accessor :unit_price

    # The price currency.
    # @return [String]
    attr_accessor :currency

    # The subscription ID.
    # @return [String]
    attr_accessor :subscription_id

    # The overage usage.
    # @return [String]
    attr_accessor :overage

    # The forecasted data.
    # @return [BOOLEAN]
    attr_accessor :is_forecast

    # For grouping, a tag definition. For filtering, a definition and key.
    # @return [Array<OCI::UsageApi::Models::Tag>]
    attr_accessor :tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'tenant_id': :'tenantId',
        'tenant_name': :'tenantName',
        'compartment_id': :'compartmentId',
        'compartment_path': :'compartmentPath',
        'compartment_name': :'compartmentName',
        'service': :'service',
        'resource_name': :'resourceName',
        'resource_id': :'resourceId',
        'region': :'region',
        'ad': :'ad',
        'weight': :'weight',
        'shape': :'shape',
        'sku_part_number': :'skuPartNumber',
        'sku_name': :'skuName',
        'unit': :'unit',
        'discount': :'discount',
        'list_rate': :'listRate',
        'platform': :'platform',
        'time_usage_started': :'timeUsageStarted',
        'time_usage_ended': :'timeUsageEnded',
        'computed_amount': :'computedAmount',
        'computed_quantity': :'computedQuantity',
        'overages_flag': :'overagesFlag',
        'unit_price': :'unitPrice',
        'currency': :'currency',
        'subscription_id': :'subscriptionId',
        'overage': :'overage',
        'is_forecast': :'isForecast',
        'tags': :'tags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'tenant_id': :'String',
        'tenant_name': :'String',
        'compartment_id': :'String',
        'compartment_path': :'String',
        'compartment_name': :'String',
        'service': :'String',
        'resource_name': :'String',
        'resource_id': :'String',
        'region': :'String',
        'ad': :'String',
        'weight': :'Float',
        'shape': :'String',
        'sku_part_number': :'String',
        'sku_name': :'String',
        'unit': :'String',
        'discount': :'Float',
        'list_rate': :'Float',
        'platform': :'String',
        'time_usage_started': :'DateTime',
        'time_usage_ended': :'DateTime',
        'computed_amount': :'Float',
        'computed_quantity': :'Float',
        'overages_flag': :'String',
        'unit_price': :'Float',
        'currency': :'String',
        'subscription_id': :'String',
        'overage': :'String',
        'is_forecast': :'BOOLEAN',
        'tags': :'Array<OCI::UsageApi::Models::Tag>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :tenant_id The value to assign to the {#tenant_id} property
    # @option attributes [String] :tenant_name The value to assign to the {#tenant_name} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :compartment_path The value to assign to the {#compartment_path} property
    # @option attributes [String] :compartment_name The value to assign to the {#compartment_name} property
    # @option attributes [String] :service The value to assign to the {#service} property
    # @option attributes [String] :resource_name The value to assign to the {#resource_name} property
    # @option attributes [String] :resource_id The value to assign to the {#resource_id} property
    # @option attributes [String] :region The value to assign to the {#region} property
    # @option attributes [String] :ad The value to assign to the {#ad} property
    # @option attributes [Float] :weight The value to assign to the {#weight} property
    # @option attributes [String] :shape The value to assign to the {#shape} property
    # @option attributes [String] :sku_part_number The value to assign to the {#sku_part_number} property
    # @option attributes [String] :sku_name The value to assign to the {#sku_name} property
    # @option attributes [String] :unit The value to assign to the {#unit} property
    # @option attributes [Float] :discount The value to assign to the {#discount} property
    # @option attributes [Float] :list_rate The value to assign to the {#list_rate} property
    # @option attributes [String] :platform The value to assign to the {#platform} property
    # @option attributes [DateTime] :time_usage_started The value to assign to the {#time_usage_started} property
    # @option attributes [DateTime] :time_usage_ended The value to assign to the {#time_usage_ended} property
    # @option attributes [Float] :computed_amount The value to assign to the {#computed_amount} property
    # @option attributes [Float] :computed_quantity The value to assign to the {#computed_quantity} property
    # @option attributes [String] :overages_flag The value to assign to the {#overages_flag} property
    # @option attributes [Float] :unit_price The value to assign to the {#unit_price} property
    # @option attributes [String] :currency The value to assign to the {#currency} property
    # @option attributes [String] :subscription_id The value to assign to the {#subscription_id} property
    # @option attributes [String] :overage The value to assign to the {#overage} property
    # @option attributes [BOOLEAN] :is_forecast The value to assign to the {#is_forecast} property
    # @option attributes [Array<OCI::UsageApi::Models::Tag>] :tags The value to assign to the {#tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.tenant_id = attributes[:'tenantId'] if attributes[:'tenantId']

      raise 'You cannot provide both :tenantId and :tenant_id' if attributes.key?(:'tenantId') && attributes.key?(:'tenant_id')

      self.tenant_id = attributes[:'tenant_id'] if attributes[:'tenant_id']

      self.tenant_name = attributes[:'tenantName'] if attributes[:'tenantName']

      raise 'You cannot provide both :tenantName and :tenant_name' if attributes.key?(:'tenantName') && attributes.key?(:'tenant_name')

      self.tenant_name = attributes[:'tenant_name'] if attributes[:'tenant_name']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.compartment_path = attributes[:'compartmentPath'] if attributes[:'compartmentPath']

      raise 'You cannot provide both :compartmentPath and :compartment_path' if attributes.key?(:'compartmentPath') && attributes.key?(:'compartment_path')

      self.compartment_path = attributes[:'compartment_path'] if attributes[:'compartment_path']

      self.compartment_name = attributes[:'compartmentName'] if attributes[:'compartmentName']

      raise 'You cannot provide both :compartmentName and :compartment_name' if attributes.key?(:'compartmentName') && attributes.key?(:'compartment_name')

      self.compartment_name = attributes[:'compartment_name'] if attributes[:'compartment_name']

      self.service = attributes[:'service'] if attributes[:'service']

      self.resource_name = attributes[:'resourceName'] if attributes[:'resourceName']

      raise 'You cannot provide both :resourceName and :resource_name' if attributes.key?(:'resourceName') && attributes.key?(:'resource_name')

      self.resource_name = attributes[:'resource_name'] if attributes[:'resource_name']

      self.resource_id = attributes[:'resourceId'] if attributes[:'resourceId']

      raise 'You cannot provide both :resourceId and :resource_id' if attributes.key?(:'resourceId') && attributes.key?(:'resource_id')

      self.resource_id = attributes[:'resource_id'] if attributes[:'resource_id']

      self.region = attributes[:'region'] if attributes[:'region']

      self.ad = attributes[:'ad'] if attributes[:'ad']

      self.weight = attributes[:'weight'] if attributes[:'weight']

      self.shape = attributes[:'shape'] if attributes[:'shape']

      self.sku_part_number = attributes[:'skuPartNumber'] if attributes[:'skuPartNumber']

      raise 'You cannot provide both :skuPartNumber and :sku_part_number' if attributes.key?(:'skuPartNumber') && attributes.key?(:'sku_part_number')

      self.sku_part_number = attributes[:'sku_part_number'] if attributes[:'sku_part_number']

      self.sku_name = attributes[:'skuName'] if attributes[:'skuName']

      raise 'You cannot provide both :skuName and :sku_name' if attributes.key?(:'skuName') && attributes.key?(:'sku_name')

      self.sku_name = attributes[:'sku_name'] if attributes[:'sku_name']

      self.unit = attributes[:'unit'] if attributes[:'unit']

      self.discount = attributes[:'discount'] if attributes[:'discount']

      self.list_rate = attributes[:'listRate'] if attributes[:'listRate']

      raise 'You cannot provide both :listRate and :list_rate' if attributes.key?(:'listRate') && attributes.key?(:'list_rate')

      self.list_rate = attributes[:'list_rate'] if attributes[:'list_rate']

      self.platform = attributes[:'platform'] if attributes[:'platform']

      self.time_usage_started = attributes[:'timeUsageStarted'] if attributes[:'timeUsageStarted']

      raise 'You cannot provide both :timeUsageStarted and :time_usage_started' if attributes.key?(:'timeUsageStarted') && attributes.key?(:'time_usage_started')

      self.time_usage_started = attributes[:'time_usage_started'] if attributes[:'time_usage_started']

      self.time_usage_ended = attributes[:'timeUsageEnded'] if attributes[:'timeUsageEnded']

      raise 'You cannot provide both :timeUsageEnded and :time_usage_ended' if attributes.key?(:'timeUsageEnded') && attributes.key?(:'time_usage_ended')

      self.time_usage_ended = attributes[:'time_usage_ended'] if attributes[:'time_usage_ended']

      self.computed_amount = attributes[:'computedAmount'] if attributes[:'computedAmount']

      raise 'You cannot provide both :computedAmount and :computed_amount' if attributes.key?(:'computedAmount') && attributes.key?(:'computed_amount')

      self.computed_amount = attributes[:'computed_amount'] if attributes[:'computed_amount']

      self.computed_quantity = attributes[:'computedQuantity'] if attributes[:'computedQuantity']

      raise 'You cannot provide both :computedQuantity and :computed_quantity' if attributes.key?(:'computedQuantity') && attributes.key?(:'computed_quantity')

      self.computed_quantity = attributes[:'computed_quantity'] if attributes[:'computed_quantity']

      self.overages_flag = attributes[:'overagesFlag'] if attributes[:'overagesFlag']

      raise 'You cannot provide both :overagesFlag and :overages_flag' if attributes.key?(:'overagesFlag') && attributes.key?(:'overages_flag')

      self.overages_flag = attributes[:'overages_flag'] if attributes[:'overages_flag']

      self.unit_price = attributes[:'unitPrice'] if attributes[:'unitPrice']

      raise 'You cannot provide both :unitPrice and :unit_price' if attributes.key?(:'unitPrice') && attributes.key?(:'unit_price')

      self.unit_price = attributes[:'unit_price'] if attributes[:'unit_price']

      self.currency = attributes[:'currency'] if attributes[:'currency']

      self.subscription_id = attributes[:'subscriptionId'] if attributes[:'subscriptionId']

      raise 'You cannot provide both :subscriptionId and :subscription_id' if attributes.key?(:'subscriptionId') && attributes.key?(:'subscription_id')

      self.subscription_id = attributes[:'subscription_id'] if attributes[:'subscription_id']

      self.overage = attributes[:'overage'] if attributes[:'overage']

      self.is_forecast = attributes[:'isForecast'] unless attributes[:'isForecast'].nil?

      raise 'You cannot provide both :isForecast and :is_forecast' if attributes.key?(:'isForecast') && attributes.key?(:'is_forecast')

      self.is_forecast = attributes[:'is_forecast'] unless attributes[:'is_forecast'].nil?

      self.tags = attributes[:'tags'] if attributes[:'tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        tenant_id == other.tenant_id &&
        tenant_name == other.tenant_name &&
        compartment_id == other.compartment_id &&
        compartment_path == other.compartment_path &&
        compartment_name == other.compartment_name &&
        service == other.service &&
        resource_name == other.resource_name &&
        resource_id == other.resource_id &&
        region == other.region &&
        ad == other.ad &&
        weight == other.weight &&
        shape == other.shape &&
        sku_part_number == other.sku_part_number &&
        sku_name == other.sku_name &&
        unit == other.unit &&
        discount == other.discount &&
        list_rate == other.list_rate &&
        platform == other.platform &&
        time_usage_started == other.time_usage_started &&
        time_usage_ended == other.time_usage_ended &&
        computed_amount == other.computed_amount &&
        computed_quantity == other.computed_quantity &&
        overages_flag == other.overages_flag &&
        unit_price == other.unit_price &&
        currency == other.currency &&
        subscription_id == other.subscription_id &&
        overage == other.overage &&
        is_forecast == other.is_forecast &&
        tags == other.tags
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
      [tenant_id, tenant_name, compartment_id, compartment_path, compartment_name, service, resource_name, resource_id, region, ad, weight, shape, sku_part_number, sku_name, unit, discount, list_rate, platform, time_usage_started, time_usage_ended, computed_amount, computed_quantity, overages_flag, unit_price, currency, subscription_id, overage, is_forecast, tags].hash
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
