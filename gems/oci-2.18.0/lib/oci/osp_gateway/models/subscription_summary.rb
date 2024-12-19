# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Subscription object which contains the common subscription data.
  class OspGateway::Models::SubscriptionSummary
    PLAN_TYPE_ENUM = [
      PLAN_TYPE_FREE_TIER = 'FREE_TIER'.freeze,
      PLAN_TYPE_PAYG = 'PAYG'.freeze,
      PLAN_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    UPGRADE_STATE_ENUM = [
      UPGRADE_STATE_PROMO = 'PROMO'.freeze,
      UPGRADE_STATE_SUBMITTED = 'SUBMITTED'.freeze,
      UPGRADE_STATE_ERROR = 'ERROR'.freeze,
      UPGRADE_STATE_UPGRADED = 'UPGRADED'.freeze,
      UPGRADE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    UPGRADE_STATE_DETAILS_ENUM = [
      UPGRADE_STATE_DETAILS_TAX_ERROR = 'TAX_ERROR'.freeze,
      UPGRADE_STATE_DETAILS_UPGRADE_ERROR = 'UPGRADE_ERROR'.freeze,
      UPGRADE_STATE_DETAILS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # Subscription id identifier (OCID).
    # @return [String]
    attr_accessor :id

    # **[Required]** Subscription plan number.
    # @return [String]
    attr_accessor :subscription_plan_number

    # Subscription plan type.
    # @return [String]
    attr_reader :plan_type

    # Start date of the subscription.
    # @return [DateTime]
    attr_accessor :time_start

    # Ship to customer account site address id.
    # @return [String]
    attr_accessor :ship_to_cust_acct_site_id

    # Ship to customer account role.
    # @return [String]
    attr_accessor :ship_to_cust_acct_role_id

    # Bill to customer Account id.
    # @return [String]
    attr_accessor :bill_to_cust_account_id

    # Payment intension.
    # @return [BOOLEAN]
    attr_accessor :is_intent_to_pay

    # Currency code
    # @return [String]
    attr_accessor :currency_code

    # GSI Subscription external code.
    # @return [String]
    attr_accessor :gsi_org_code

    # Language short code (en, de, hu, etc)
    # @return [String]
    attr_accessor :language_code

    # GSI organization external identifier.
    # @return [String]
    attr_accessor :organization_id

    # Status of the upgrade.
    # @return [String]
    attr_reader :upgrade_state

    # This field is used to describe the Upgrade State in case of error (E.g. Upgrade failure caused by interfacing Tax details- TaxError)
    # @return [String]
    attr_reader :upgrade_state_details

    # @return [OCI::OspGateway::Models::TaxInfo]
    attr_accessor :tax_info

    # Payment option list of a subscription.
    # @return [Array<OCI::OspGateway::Models::PaymentOption>]
    attr_accessor :payment_options

    # @return [OCI::OspGateway::Models::PaymentGateway]
    attr_accessor :payment_gateway

    # @return [OCI::OspGateway::Models::BillingAddress]
    attr_accessor :billing_address

    # Date of upgrade/conversion when planType changed from FREE_TIER to PAYG
    # @return [DateTime]
    attr_accessor :time_plan_upgrade

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'subscription_plan_number': :'subscriptionPlanNumber',
        'plan_type': :'planType',
        'time_start': :'timeStart',
        'ship_to_cust_acct_site_id': :'shipToCustAcctSiteId',
        'ship_to_cust_acct_role_id': :'shipToCustAcctRoleId',
        'bill_to_cust_account_id': :'billToCustAccountId',
        'is_intent_to_pay': :'isIntentToPay',
        'currency_code': :'currencyCode',
        'gsi_org_code': :'gsiOrgCode',
        'language_code': :'languageCode',
        'organization_id': :'organizationId',
        'upgrade_state': :'upgradeState',
        'upgrade_state_details': :'upgradeStateDetails',
        'tax_info': :'taxInfo',
        'payment_options': :'paymentOptions',
        'payment_gateway': :'paymentGateway',
        'billing_address': :'billingAddress',
        'time_plan_upgrade': :'timePlanUpgrade'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'subscription_plan_number': :'String',
        'plan_type': :'String',
        'time_start': :'DateTime',
        'ship_to_cust_acct_site_id': :'String',
        'ship_to_cust_acct_role_id': :'String',
        'bill_to_cust_account_id': :'String',
        'is_intent_to_pay': :'BOOLEAN',
        'currency_code': :'String',
        'gsi_org_code': :'String',
        'language_code': :'String',
        'organization_id': :'String',
        'upgrade_state': :'String',
        'upgrade_state_details': :'String',
        'tax_info': :'OCI::OspGateway::Models::TaxInfo',
        'payment_options': :'Array<OCI::OspGateway::Models::PaymentOption>',
        'payment_gateway': :'OCI::OspGateway::Models::PaymentGateway',
        'billing_address': :'OCI::OspGateway::Models::BillingAddress',
        'time_plan_upgrade': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :subscription_plan_number The value to assign to the {#subscription_plan_number} property
    # @option attributes [String] :plan_type The value to assign to the {#plan_type} property
    # @option attributes [DateTime] :time_start The value to assign to the {#time_start} property
    # @option attributes [String] :ship_to_cust_acct_site_id The value to assign to the {#ship_to_cust_acct_site_id} property
    # @option attributes [String] :ship_to_cust_acct_role_id The value to assign to the {#ship_to_cust_acct_role_id} property
    # @option attributes [String] :bill_to_cust_account_id The value to assign to the {#bill_to_cust_account_id} property
    # @option attributes [BOOLEAN] :is_intent_to_pay The value to assign to the {#is_intent_to_pay} property
    # @option attributes [String] :currency_code The value to assign to the {#currency_code} property
    # @option attributes [String] :gsi_org_code The value to assign to the {#gsi_org_code} property
    # @option attributes [String] :language_code The value to assign to the {#language_code} property
    # @option attributes [String] :organization_id The value to assign to the {#organization_id} property
    # @option attributes [String] :upgrade_state The value to assign to the {#upgrade_state} property
    # @option attributes [String] :upgrade_state_details The value to assign to the {#upgrade_state_details} property
    # @option attributes [OCI::OspGateway::Models::TaxInfo] :tax_info The value to assign to the {#tax_info} property
    # @option attributes [Array<OCI::OspGateway::Models::PaymentOption>] :payment_options The value to assign to the {#payment_options} property
    # @option attributes [OCI::OspGateway::Models::PaymentGateway] :payment_gateway The value to assign to the {#payment_gateway} property
    # @option attributes [OCI::OspGateway::Models::BillingAddress] :billing_address The value to assign to the {#billing_address} property
    # @option attributes [DateTime] :time_plan_upgrade The value to assign to the {#time_plan_upgrade} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.subscription_plan_number = attributes[:'subscriptionPlanNumber'] if attributes[:'subscriptionPlanNumber']

      raise 'You cannot provide both :subscriptionPlanNumber and :subscription_plan_number' if attributes.key?(:'subscriptionPlanNumber') && attributes.key?(:'subscription_plan_number')

      self.subscription_plan_number = attributes[:'subscription_plan_number'] if attributes[:'subscription_plan_number']

      self.plan_type = attributes[:'planType'] if attributes[:'planType']

      raise 'You cannot provide both :planType and :plan_type' if attributes.key?(:'planType') && attributes.key?(:'plan_type')

      self.plan_type = attributes[:'plan_type'] if attributes[:'plan_type']

      self.time_start = attributes[:'timeStart'] if attributes[:'timeStart']

      raise 'You cannot provide both :timeStart and :time_start' if attributes.key?(:'timeStart') && attributes.key?(:'time_start')

      self.time_start = attributes[:'time_start'] if attributes[:'time_start']

      self.ship_to_cust_acct_site_id = attributes[:'shipToCustAcctSiteId'] if attributes[:'shipToCustAcctSiteId']

      raise 'You cannot provide both :shipToCustAcctSiteId and :ship_to_cust_acct_site_id' if attributes.key?(:'shipToCustAcctSiteId') && attributes.key?(:'ship_to_cust_acct_site_id')

      self.ship_to_cust_acct_site_id = attributes[:'ship_to_cust_acct_site_id'] if attributes[:'ship_to_cust_acct_site_id']

      self.ship_to_cust_acct_role_id = attributes[:'shipToCustAcctRoleId'] if attributes[:'shipToCustAcctRoleId']

      raise 'You cannot provide both :shipToCustAcctRoleId and :ship_to_cust_acct_role_id' if attributes.key?(:'shipToCustAcctRoleId') && attributes.key?(:'ship_to_cust_acct_role_id')

      self.ship_to_cust_acct_role_id = attributes[:'ship_to_cust_acct_role_id'] if attributes[:'ship_to_cust_acct_role_id']

      self.bill_to_cust_account_id = attributes[:'billToCustAccountId'] if attributes[:'billToCustAccountId']

      raise 'You cannot provide both :billToCustAccountId and :bill_to_cust_account_id' if attributes.key?(:'billToCustAccountId') && attributes.key?(:'bill_to_cust_account_id')

      self.bill_to_cust_account_id = attributes[:'bill_to_cust_account_id'] if attributes[:'bill_to_cust_account_id']

      self.is_intent_to_pay = attributes[:'isIntentToPay'] unless attributes[:'isIntentToPay'].nil?

      raise 'You cannot provide both :isIntentToPay and :is_intent_to_pay' if attributes.key?(:'isIntentToPay') && attributes.key?(:'is_intent_to_pay')

      self.is_intent_to_pay = attributes[:'is_intent_to_pay'] unless attributes[:'is_intent_to_pay'].nil?

      self.currency_code = attributes[:'currencyCode'] if attributes[:'currencyCode']

      raise 'You cannot provide both :currencyCode and :currency_code' if attributes.key?(:'currencyCode') && attributes.key?(:'currency_code')

      self.currency_code = attributes[:'currency_code'] if attributes[:'currency_code']

      self.gsi_org_code = attributes[:'gsiOrgCode'] if attributes[:'gsiOrgCode']

      raise 'You cannot provide both :gsiOrgCode and :gsi_org_code' if attributes.key?(:'gsiOrgCode') && attributes.key?(:'gsi_org_code')

      self.gsi_org_code = attributes[:'gsi_org_code'] if attributes[:'gsi_org_code']

      self.language_code = attributes[:'languageCode'] if attributes[:'languageCode']

      raise 'You cannot provide both :languageCode and :language_code' if attributes.key?(:'languageCode') && attributes.key?(:'language_code')

      self.language_code = attributes[:'language_code'] if attributes[:'language_code']

      self.organization_id = attributes[:'organizationId'] if attributes[:'organizationId']

      raise 'You cannot provide both :organizationId and :organization_id' if attributes.key?(:'organizationId') && attributes.key?(:'organization_id')

      self.organization_id = attributes[:'organization_id'] if attributes[:'organization_id']

      self.upgrade_state = attributes[:'upgradeState'] if attributes[:'upgradeState']

      raise 'You cannot provide both :upgradeState and :upgrade_state' if attributes.key?(:'upgradeState') && attributes.key?(:'upgrade_state')

      self.upgrade_state = attributes[:'upgrade_state'] if attributes[:'upgrade_state']

      self.upgrade_state_details = attributes[:'upgradeStateDetails'] if attributes[:'upgradeStateDetails']

      raise 'You cannot provide both :upgradeStateDetails and :upgrade_state_details' if attributes.key?(:'upgradeStateDetails') && attributes.key?(:'upgrade_state_details')

      self.upgrade_state_details = attributes[:'upgrade_state_details'] if attributes[:'upgrade_state_details']

      self.tax_info = attributes[:'taxInfo'] if attributes[:'taxInfo']

      raise 'You cannot provide both :taxInfo and :tax_info' if attributes.key?(:'taxInfo') && attributes.key?(:'tax_info')

      self.tax_info = attributes[:'tax_info'] if attributes[:'tax_info']

      self.payment_options = attributes[:'paymentOptions'] if attributes[:'paymentOptions']

      raise 'You cannot provide both :paymentOptions and :payment_options' if attributes.key?(:'paymentOptions') && attributes.key?(:'payment_options')

      self.payment_options = attributes[:'payment_options'] if attributes[:'payment_options']

      self.payment_gateway = attributes[:'paymentGateway'] if attributes[:'paymentGateway']

      raise 'You cannot provide both :paymentGateway and :payment_gateway' if attributes.key?(:'paymentGateway') && attributes.key?(:'payment_gateway')

      self.payment_gateway = attributes[:'payment_gateway'] if attributes[:'payment_gateway']

      self.billing_address = attributes[:'billingAddress'] if attributes[:'billingAddress']

      raise 'You cannot provide both :billingAddress and :billing_address' if attributes.key?(:'billingAddress') && attributes.key?(:'billing_address')

      self.billing_address = attributes[:'billing_address'] if attributes[:'billing_address']

      self.time_plan_upgrade = attributes[:'timePlanUpgrade'] if attributes[:'timePlanUpgrade']

      raise 'You cannot provide both :timePlanUpgrade and :time_plan_upgrade' if attributes.key?(:'timePlanUpgrade') && attributes.key?(:'time_plan_upgrade')

      self.time_plan_upgrade = attributes[:'time_plan_upgrade'] if attributes[:'time_plan_upgrade']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] plan_type Object to be assigned
    def plan_type=(plan_type)
      # rubocop:disable Style/ConditionalAssignment
      if plan_type && !PLAN_TYPE_ENUM.include?(plan_type)
        OCI.logger.debug("Unknown value for 'plan_type' [" + plan_type + "]. Mapping to 'PLAN_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @plan_type = PLAN_TYPE_UNKNOWN_ENUM_VALUE
      else
        @plan_type = plan_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] upgrade_state Object to be assigned
    def upgrade_state=(upgrade_state)
      # rubocop:disable Style/ConditionalAssignment
      if upgrade_state && !UPGRADE_STATE_ENUM.include?(upgrade_state)
        OCI.logger.debug("Unknown value for 'upgrade_state' [" + upgrade_state + "]. Mapping to 'UPGRADE_STATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @upgrade_state = UPGRADE_STATE_UNKNOWN_ENUM_VALUE
      else
        @upgrade_state = upgrade_state
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] upgrade_state_details Object to be assigned
    def upgrade_state_details=(upgrade_state_details)
      # rubocop:disable Style/ConditionalAssignment
      if upgrade_state_details && !UPGRADE_STATE_DETAILS_ENUM.include?(upgrade_state_details)
        OCI.logger.debug("Unknown value for 'upgrade_state_details' [" + upgrade_state_details + "]. Mapping to 'UPGRADE_STATE_DETAILS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @upgrade_state_details = UPGRADE_STATE_DETAILS_UNKNOWN_ENUM_VALUE
      else
        @upgrade_state_details = upgrade_state_details
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        subscription_plan_number == other.subscription_plan_number &&
        plan_type == other.plan_type &&
        time_start == other.time_start &&
        ship_to_cust_acct_site_id == other.ship_to_cust_acct_site_id &&
        ship_to_cust_acct_role_id == other.ship_to_cust_acct_role_id &&
        bill_to_cust_account_id == other.bill_to_cust_account_id &&
        is_intent_to_pay == other.is_intent_to_pay &&
        currency_code == other.currency_code &&
        gsi_org_code == other.gsi_org_code &&
        language_code == other.language_code &&
        organization_id == other.organization_id &&
        upgrade_state == other.upgrade_state &&
        upgrade_state_details == other.upgrade_state_details &&
        tax_info == other.tax_info &&
        payment_options == other.payment_options &&
        payment_gateway == other.payment_gateway &&
        billing_address == other.billing_address &&
        time_plan_upgrade == other.time_plan_upgrade
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
      [id, subscription_plan_number, plan_type, time_start, ship_to_cust_acct_site_id, ship_to_cust_acct_role_id, bill_to_cust_account_id, is_intent_to_pay, currency_code, gsi_org_code, language_code, organization_id, upgrade_state, upgrade_state_details, tax_info, payment_options, payment_gateway, billing_address, time_plan_upgrade].hash
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
