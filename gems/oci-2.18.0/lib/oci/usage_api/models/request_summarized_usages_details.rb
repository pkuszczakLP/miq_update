# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details for the '/usage' query.
  class UsageApi::Models::RequestSummarizedUsagesDetails
    GRANULARITY_ENUM = [
      GRANULARITY_HOURLY = 'HOURLY'.freeze,
      GRANULARITY_DAILY = 'DAILY'.freeze,
      GRANULARITY_MONTHLY = 'MONTHLY'.freeze,
      GRANULARITY_TOTAL = 'TOTAL'.freeze
    ].freeze

    QUERY_TYPE_ENUM = [
      QUERY_TYPE_USAGE = 'USAGE'.freeze,
      QUERY_TYPE_COST = 'COST'.freeze,
      QUERY_TYPE_CREDIT = 'CREDIT'.freeze,
      QUERY_TYPE_EXPIREDCREDIT = 'EXPIREDCREDIT'.freeze,
      QUERY_TYPE_ALLCREDIT = 'ALLCREDIT'.freeze
    ].freeze

    # **[Required]** Tenant ID.
    # @return [String]
    attr_accessor :tenant_id

    # **[Required]** The usage start time.
    # @return [DateTime]
    attr_accessor :time_usage_started

    # **[Required]** The usage end time.
    # @return [DateTime]
    attr_accessor :time_usage_ended

    # **[Required]** The usage granularity.
    # HOURLY - Hourly data aggregation.
    # DAILY - Daily data aggregation.
    # MONTHLY - Monthly data aggregation.
    # TOTAL - Not yet supported.
    #
    # @return [String]
    attr_reader :granularity

    # Whether aggregated by time. If isAggregateByTime is true, all usage/cost over the query time period will be added up.
    # @return [BOOLEAN]
    attr_accessor :is_aggregate_by_time

    # @return [OCI::UsageApi::Models::Forecast]
    attr_accessor :forecast

    # The query usage type. COST by default if it is missing.
    # Usage - Query the usage data.
    # Cost - Query the cost/billing data.
    # Credit - Query the credit adjustments data.
    # ExpiredCredit - Query the expired credits data.
    # AllCredit - Query the credit adjustments and expired credit.
    #
    # @return [String]
    attr_reader :query_type

    # Aggregate the result by.
    # example:
    #   `[\"tagNamespace\", \"tagKey\", \"tagValue\", \"service\", \"skuName\", \"skuPartNumber\", \"unit\",
    #     \"compartmentName\", \"compartmentPath\", \"compartmentId\", \"platform\", \"region\", \"logicalAd\",
    #     \"resourceId\", \"tenantId\", \"tenantName\"]`
    #
    # @return [Array<String>]
    attr_accessor :group_by

    # GroupBy a specific tagKey. Provide the tagNamespace and tagKey in the tag object. Only supports one tag in the list.
    # For example:
    #   `[{\"namespace\":\"oracle\", \"key\":\"createdBy\"]`
    #
    # @return [Array<OCI::UsageApi::Models::Tag>]
    attr_accessor :group_by_tag

    # The compartment depth level.
    # @return [Float]
    attr_accessor :compartment_depth

    # @return [OCI::UsageApi::Models::Filter]
    attr_accessor :filter

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'tenant_id': :'tenantId',
        'time_usage_started': :'timeUsageStarted',
        'time_usage_ended': :'timeUsageEnded',
        'granularity': :'granularity',
        'is_aggregate_by_time': :'isAggregateByTime',
        'forecast': :'forecast',
        'query_type': :'queryType',
        'group_by': :'groupBy',
        'group_by_tag': :'groupByTag',
        'compartment_depth': :'compartmentDepth',
        'filter': :'filter'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'tenant_id': :'String',
        'time_usage_started': :'DateTime',
        'time_usage_ended': :'DateTime',
        'granularity': :'String',
        'is_aggregate_by_time': :'BOOLEAN',
        'forecast': :'OCI::UsageApi::Models::Forecast',
        'query_type': :'String',
        'group_by': :'Array<String>',
        'group_by_tag': :'Array<OCI::UsageApi::Models::Tag>',
        'compartment_depth': :'Float',
        'filter': :'OCI::UsageApi::Models::Filter'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :tenant_id The value to assign to the {#tenant_id} property
    # @option attributes [DateTime] :time_usage_started The value to assign to the {#time_usage_started} property
    # @option attributes [DateTime] :time_usage_ended The value to assign to the {#time_usage_ended} property
    # @option attributes [String] :granularity The value to assign to the {#granularity} property
    # @option attributes [BOOLEAN] :is_aggregate_by_time The value to assign to the {#is_aggregate_by_time} property
    # @option attributes [OCI::UsageApi::Models::Forecast] :forecast The value to assign to the {#forecast} property
    # @option attributes [String] :query_type The value to assign to the {#query_type} property
    # @option attributes [Array<String>] :group_by The value to assign to the {#group_by} property
    # @option attributes [Array<OCI::UsageApi::Models::Tag>] :group_by_tag The value to assign to the {#group_by_tag} property
    # @option attributes [Float] :compartment_depth The value to assign to the {#compartment_depth} property
    # @option attributes [OCI::UsageApi::Models::Filter] :filter The value to assign to the {#filter} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.tenant_id = attributes[:'tenantId'] if attributes[:'tenantId']

      raise 'You cannot provide both :tenantId and :tenant_id' if attributes.key?(:'tenantId') && attributes.key?(:'tenant_id')

      self.tenant_id = attributes[:'tenant_id'] if attributes[:'tenant_id']

      self.time_usage_started = attributes[:'timeUsageStarted'] if attributes[:'timeUsageStarted']

      raise 'You cannot provide both :timeUsageStarted and :time_usage_started' if attributes.key?(:'timeUsageStarted') && attributes.key?(:'time_usage_started')

      self.time_usage_started = attributes[:'time_usage_started'] if attributes[:'time_usage_started']

      self.time_usage_ended = attributes[:'timeUsageEnded'] if attributes[:'timeUsageEnded']

      raise 'You cannot provide both :timeUsageEnded and :time_usage_ended' if attributes.key?(:'timeUsageEnded') && attributes.key?(:'time_usage_ended')

      self.time_usage_ended = attributes[:'time_usage_ended'] if attributes[:'time_usage_ended']

      self.granularity = attributes[:'granularity'] if attributes[:'granularity']

      self.is_aggregate_by_time = attributes[:'isAggregateByTime'] unless attributes[:'isAggregateByTime'].nil?
      self.is_aggregate_by_time = false if is_aggregate_by_time.nil? && !attributes.key?(:'isAggregateByTime') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isAggregateByTime and :is_aggregate_by_time' if attributes.key?(:'isAggregateByTime') && attributes.key?(:'is_aggregate_by_time')

      self.is_aggregate_by_time = attributes[:'is_aggregate_by_time'] unless attributes[:'is_aggregate_by_time'].nil?
      self.is_aggregate_by_time = false if is_aggregate_by_time.nil? && !attributes.key?(:'isAggregateByTime') && !attributes.key?(:'is_aggregate_by_time') # rubocop:disable Style/StringLiterals

      self.forecast = attributes[:'forecast'] if attributes[:'forecast']

      self.query_type = attributes[:'queryType'] if attributes[:'queryType']

      raise 'You cannot provide both :queryType and :query_type' if attributes.key?(:'queryType') && attributes.key?(:'query_type')

      self.query_type = attributes[:'query_type'] if attributes[:'query_type']

      self.group_by = attributes[:'groupBy'] if attributes[:'groupBy']

      raise 'You cannot provide both :groupBy and :group_by' if attributes.key?(:'groupBy') && attributes.key?(:'group_by')

      self.group_by = attributes[:'group_by'] if attributes[:'group_by']

      self.group_by_tag = attributes[:'groupByTag'] if attributes[:'groupByTag']

      raise 'You cannot provide both :groupByTag and :group_by_tag' if attributes.key?(:'groupByTag') && attributes.key?(:'group_by_tag')

      self.group_by_tag = attributes[:'group_by_tag'] if attributes[:'group_by_tag']

      self.compartment_depth = attributes[:'compartmentDepth'] if attributes[:'compartmentDepth']

      raise 'You cannot provide both :compartmentDepth and :compartment_depth' if attributes.key?(:'compartmentDepth') && attributes.key?(:'compartment_depth')

      self.compartment_depth = attributes[:'compartment_depth'] if attributes[:'compartment_depth']

      self.filter = attributes[:'filter'] if attributes[:'filter']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] granularity Object to be assigned
    def granularity=(granularity)
      raise "Invalid value for 'granularity': this must be one of the values in GRANULARITY_ENUM." if granularity && !GRANULARITY_ENUM.include?(granularity)

      @granularity = granularity
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] query_type Object to be assigned
    def query_type=(query_type)
      raise "Invalid value for 'query_type': this must be one of the values in QUERY_TYPE_ENUM." if query_type && !QUERY_TYPE_ENUM.include?(query_type)

      @query_type = query_type
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        tenant_id == other.tenant_id &&
        time_usage_started == other.time_usage_started &&
        time_usage_ended == other.time_usage_ended &&
        granularity == other.granularity &&
        is_aggregate_by_time == other.is_aggregate_by_time &&
        forecast == other.forecast &&
        query_type == other.query_type &&
        group_by == other.group_by &&
        group_by_tag == other.group_by_tag &&
        compartment_depth == other.compartment_depth &&
        filter == other.filter
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
      [tenant_id, time_usage_started, time_usage_ended, granularity, is_aggregate_by_time, forecast, query_type, group_by, group_by_tag, compartment_depth, filter].hash
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
