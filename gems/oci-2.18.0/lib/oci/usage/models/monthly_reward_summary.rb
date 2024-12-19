# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Object describing the monthly rewards summary for the requested subscription ID.
  class Usage::Models::MonthlyRewardSummary
    # The number of rewards available for a specific usage period.
    # @return [Float]
    attr_accessor :available_rewards

    # The number of rewards redeemed for a specific month.
    # @return [Float]
    attr_accessor :redeemed_rewards

    # The number of rewards earned for the specific usage period.
    # @return [Float]
    attr_accessor :earned_rewards

    # The boolean parameter to indicate whether or not the available rewards are manually posted.
    # @return [BOOLEAN]
    attr_accessor :is_manual

    # The date and time when rewards expire.
    # @return [DateTime]
    attr_accessor :time_rewards_expired

    # The date and time when rewards accrue.
    #
    # @return [DateTime]
    attr_accessor :time_rewards_earned

    # The start date and time for the usage period.
    #
    # @return [DateTime]
    attr_accessor :time_usage_started

    # The end date and time for the usage period.
    #
    # @return [DateTime]
    attr_accessor :time_usage_ended

    # The usage amount for the usage period.
    #
    # @return [Float]
    attr_accessor :usage_amount

    # The eligible usage amount for the usage period.
    #
    # @return [Float]
    attr_accessor :eligible_usage_amount

    # The ineligible usage amount for the usage period.
    #
    # @return [Float]
    attr_accessor :ineligible_usage_amount

    # The usage period ID.
    #
    # @return [String]
    attr_accessor :usage_period_key

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'available_rewards': :'availableRewards',
        'redeemed_rewards': :'redeemedRewards',
        'earned_rewards': :'earnedRewards',
        'is_manual': :'isManual',
        'time_rewards_expired': :'timeRewardsExpired',
        'time_rewards_earned': :'timeRewardsEarned',
        'time_usage_started': :'timeUsageStarted',
        'time_usage_ended': :'timeUsageEnded',
        'usage_amount': :'usageAmount',
        'eligible_usage_amount': :'eligibleUsageAmount',
        'ineligible_usage_amount': :'ineligibleUsageAmount',
        'usage_period_key': :'usagePeriodKey'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'available_rewards': :'Float',
        'redeemed_rewards': :'Float',
        'earned_rewards': :'Float',
        'is_manual': :'BOOLEAN',
        'time_rewards_expired': :'DateTime',
        'time_rewards_earned': :'DateTime',
        'time_usage_started': :'DateTime',
        'time_usage_ended': :'DateTime',
        'usage_amount': :'Float',
        'eligible_usage_amount': :'Float',
        'ineligible_usage_amount': :'Float',
        'usage_period_key': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Float] :available_rewards The value to assign to the {#available_rewards} property
    # @option attributes [Float] :redeemed_rewards The value to assign to the {#redeemed_rewards} property
    # @option attributes [Float] :earned_rewards The value to assign to the {#earned_rewards} property
    # @option attributes [BOOLEAN] :is_manual The value to assign to the {#is_manual} property
    # @option attributes [DateTime] :time_rewards_expired The value to assign to the {#time_rewards_expired} property
    # @option attributes [DateTime] :time_rewards_earned The value to assign to the {#time_rewards_earned} property
    # @option attributes [DateTime] :time_usage_started The value to assign to the {#time_usage_started} property
    # @option attributes [DateTime] :time_usage_ended The value to assign to the {#time_usage_ended} property
    # @option attributes [Float] :usage_amount The value to assign to the {#usage_amount} property
    # @option attributes [Float] :eligible_usage_amount The value to assign to the {#eligible_usage_amount} property
    # @option attributes [Float] :ineligible_usage_amount The value to assign to the {#ineligible_usage_amount} property
    # @option attributes [String] :usage_period_key The value to assign to the {#usage_period_key} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.available_rewards = attributes[:'availableRewards'] if attributes[:'availableRewards']

      raise 'You cannot provide both :availableRewards and :available_rewards' if attributes.key?(:'availableRewards') && attributes.key?(:'available_rewards')

      self.available_rewards = attributes[:'available_rewards'] if attributes[:'available_rewards']

      self.redeemed_rewards = attributes[:'redeemedRewards'] if attributes[:'redeemedRewards']

      raise 'You cannot provide both :redeemedRewards and :redeemed_rewards' if attributes.key?(:'redeemedRewards') && attributes.key?(:'redeemed_rewards')

      self.redeemed_rewards = attributes[:'redeemed_rewards'] if attributes[:'redeemed_rewards']

      self.earned_rewards = attributes[:'earnedRewards'] if attributes[:'earnedRewards']

      raise 'You cannot provide both :earnedRewards and :earned_rewards' if attributes.key?(:'earnedRewards') && attributes.key?(:'earned_rewards')

      self.earned_rewards = attributes[:'earned_rewards'] if attributes[:'earned_rewards']

      self.is_manual = attributes[:'isManual'] unless attributes[:'isManual'].nil?

      raise 'You cannot provide both :isManual and :is_manual' if attributes.key?(:'isManual') && attributes.key?(:'is_manual')

      self.is_manual = attributes[:'is_manual'] unless attributes[:'is_manual'].nil?

      self.time_rewards_expired = attributes[:'timeRewardsExpired'] if attributes[:'timeRewardsExpired']

      raise 'You cannot provide both :timeRewardsExpired and :time_rewards_expired' if attributes.key?(:'timeRewardsExpired') && attributes.key?(:'time_rewards_expired')

      self.time_rewards_expired = attributes[:'time_rewards_expired'] if attributes[:'time_rewards_expired']

      self.time_rewards_earned = attributes[:'timeRewardsEarned'] if attributes[:'timeRewardsEarned']

      raise 'You cannot provide both :timeRewardsEarned and :time_rewards_earned' if attributes.key?(:'timeRewardsEarned') && attributes.key?(:'time_rewards_earned')

      self.time_rewards_earned = attributes[:'time_rewards_earned'] if attributes[:'time_rewards_earned']

      self.time_usage_started = attributes[:'timeUsageStarted'] if attributes[:'timeUsageStarted']

      raise 'You cannot provide both :timeUsageStarted and :time_usage_started' if attributes.key?(:'timeUsageStarted') && attributes.key?(:'time_usage_started')

      self.time_usage_started = attributes[:'time_usage_started'] if attributes[:'time_usage_started']

      self.time_usage_ended = attributes[:'timeUsageEnded'] if attributes[:'timeUsageEnded']

      raise 'You cannot provide both :timeUsageEnded and :time_usage_ended' if attributes.key?(:'timeUsageEnded') && attributes.key?(:'time_usage_ended')

      self.time_usage_ended = attributes[:'time_usage_ended'] if attributes[:'time_usage_ended']

      self.usage_amount = attributes[:'usageAmount'] if attributes[:'usageAmount']

      raise 'You cannot provide both :usageAmount and :usage_amount' if attributes.key?(:'usageAmount') && attributes.key?(:'usage_amount')

      self.usage_amount = attributes[:'usage_amount'] if attributes[:'usage_amount']

      self.eligible_usage_amount = attributes[:'eligibleUsageAmount'] if attributes[:'eligibleUsageAmount']

      raise 'You cannot provide both :eligibleUsageAmount and :eligible_usage_amount' if attributes.key?(:'eligibleUsageAmount') && attributes.key?(:'eligible_usage_amount')

      self.eligible_usage_amount = attributes[:'eligible_usage_amount'] if attributes[:'eligible_usage_amount']

      self.ineligible_usage_amount = attributes[:'ineligibleUsageAmount'] if attributes[:'ineligibleUsageAmount']

      raise 'You cannot provide both :ineligibleUsageAmount and :ineligible_usage_amount' if attributes.key?(:'ineligibleUsageAmount') && attributes.key?(:'ineligible_usage_amount')

      self.ineligible_usage_amount = attributes[:'ineligible_usage_amount'] if attributes[:'ineligible_usage_amount']

      self.usage_period_key = attributes[:'usagePeriodKey'] if attributes[:'usagePeriodKey']

      raise 'You cannot provide both :usagePeriodKey and :usage_period_key' if attributes.key?(:'usagePeriodKey') && attributes.key?(:'usage_period_key')

      self.usage_period_key = attributes[:'usage_period_key'] if attributes[:'usage_period_key']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        available_rewards == other.available_rewards &&
        redeemed_rewards == other.redeemed_rewards &&
        earned_rewards == other.earned_rewards &&
        is_manual == other.is_manual &&
        time_rewards_expired == other.time_rewards_expired &&
        time_rewards_earned == other.time_rewards_earned &&
        time_usage_started == other.time_usage_started &&
        time_usage_ended == other.time_usage_ended &&
        usage_amount == other.usage_amount &&
        eligible_usage_amount == other.eligible_usage_amount &&
        ineligible_usage_amount == other.ineligible_usage_amount &&
        usage_period_key == other.usage_period_key
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
      [available_rewards, redeemed_rewards, earned_rewards, is_manual, time_rewards_expired, time_rewards_earned, time_usage_started, time_usage_ended, usage_amount, eligible_usage_amount, ineligible_usage_amount, usage_period_key].hash
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
