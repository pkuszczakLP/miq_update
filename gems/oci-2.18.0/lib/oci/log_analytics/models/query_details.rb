# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Input arguments for running a log anlaytics query. If the request is set to run in asynchronous mode
  # then shouldIncludeColumns and shouldIncludeFields can be overwritten when retrieving the results.
  #
  class LogAnalytics::Models::QueryDetails
    SUB_SYSTEM_ENUM = [
      SUB_SYSTEM_LOG = 'LOG'.freeze
    ].freeze

    ASYNC_MODE_ENUM = [
      ASYNC_MODE_FOREGROUND = 'FOREGROUND'.freeze,
      ASYNC_MODE_BACKGROUND = 'BACKGROUND'.freeze
    ].freeze

    # **[Required]** Compartment Identifier [OCID] (https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    # @return [String]
    attr_accessor :compartment_id

    # Flag to search all child compartments of the compartment Id specified in the compartmentId query parameter.
    #
    # @return [BOOLEAN]
    attr_accessor :compartment_id_in_subtree

    # Saved search OCID for this query if known.
    #
    # @return [String]
    attr_accessor :saved_search_id

    # **[Required]** Query to perform. Must conform to logging analytic querylanguage syntax. Syntax errors will be returned if present.
    # @return [String]
    attr_accessor :query_string

    # **[Required]** Default subsystem to qualify fields with in the queryString if not specified.
    #
    # @return [String]
    attr_reader :sub_system

    # Maximum number of results to count.  Note a maximum of 2001 will be enforced; that is, actualMaxTotalCountUsed = Math.min(maxTotalCount, 2001).
    #
    # @return [Integer]
    attr_accessor :max_total_count

    # @return [OCI::LogAnalytics::Models::TimeRange]
    attr_accessor :time_filter

    # List of filters to be applied when the query executes. More than one filter per field is not permitted.
    #
    # @return [Array<OCI::LogAnalytics::Models::ScopeFilter>]
    attr_accessor :scope_filters

    # Amount of time, in seconds, allowed for a query to execute. If this time expires before the query is complete, any partial results will be returned.
    # @return [Integer]
    attr_accessor :query_timeout_in_seconds

    # Option to run the query asynchronously. This will lead to a LogAnalyticsQueryJobWorkRequest being submitted and the {workRequestId} will be returned to use for fetching the results.
    #
    # @return [BOOLEAN]
    attr_accessor :should_run_async

    # Execution mode for the query if running asynchronously i.e (shouldRunAsync is set to true).
    # @return [String]
    attr_reader :async_mode

    # Include the total number of results from the query. Note, this value will always be equal to or less than maxTotalCount.
    # @return [BOOLEAN]
    attr_accessor :should_include_total_count

    # Include columns in response
    # @return [BOOLEAN]
    attr_accessor :should_include_columns

    # Include fields in response
    # @return [BOOLEAN]
    attr_accessor :should_include_fields

    # Controls if query should ignore pre-calculated results if available and only use raw data. If set and no acceleration data is found it will fallback to raw data.
    #
    # @return [BOOLEAN]
    attr_accessor :should_use_acceleration

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'compartmentId',
        'compartment_id_in_subtree': :'compartmentIdInSubtree',
        'saved_search_id': :'savedSearchId',
        'query_string': :'queryString',
        'sub_system': :'subSystem',
        'max_total_count': :'maxTotalCount',
        'time_filter': :'timeFilter',
        'scope_filters': :'scopeFilters',
        'query_timeout_in_seconds': :'queryTimeoutInSeconds',
        'should_run_async': :'shouldRunAsync',
        'async_mode': :'asyncMode',
        'should_include_total_count': :'shouldIncludeTotalCount',
        'should_include_columns': :'shouldIncludeColumns',
        'should_include_fields': :'shouldIncludeFields',
        'should_use_acceleration': :'shouldUseAcceleration'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'String',
        'compartment_id_in_subtree': :'BOOLEAN',
        'saved_search_id': :'String',
        'query_string': :'String',
        'sub_system': :'String',
        'max_total_count': :'Integer',
        'time_filter': :'OCI::LogAnalytics::Models::TimeRange',
        'scope_filters': :'Array<OCI::LogAnalytics::Models::ScopeFilter>',
        'query_timeout_in_seconds': :'Integer',
        'should_run_async': :'BOOLEAN',
        'async_mode': :'String',
        'should_include_total_count': :'BOOLEAN',
        'should_include_columns': :'BOOLEAN',
        'should_include_fields': :'BOOLEAN',
        'should_use_acceleration': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [BOOLEAN] :compartment_id_in_subtree The value to assign to the {#compartment_id_in_subtree} property
    # @option attributes [String] :saved_search_id The value to assign to the {#saved_search_id} property
    # @option attributes [String] :query_string The value to assign to the {#query_string} property
    # @option attributes [String] :sub_system The value to assign to the {#sub_system} property
    # @option attributes [Integer] :max_total_count The value to assign to the {#max_total_count} property
    # @option attributes [OCI::LogAnalytics::Models::TimeRange] :time_filter The value to assign to the {#time_filter} property
    # @option attributes [Array<OCI::LogAnalytics::Models::ScopeFilter>] :scope_filters The value to assign to the {#scope_filters} property
    # @option attributes [Integer] :query_timeout_in_seconds The value to assign to the {#query_timeout_in_seconds} property
    # @option attributes [BOOLEAN] :should_run_async The value to assign to the {#should_run_async} property
    # @option attributes [String] :async_mode The value to assign to the {#async_mode} property
    # @option attributes [BOOLEAN] :should_include_total_count The value to assign to the {#should_include_total_count} property
    # @option attributes [BOOLEAN] :should_include_columns The value to assign to the {#should_include_columns} property
    # @option attributes [BOOLEAN] :should_include_fields The value to assign to the {#should_include_fields} property
    # @option attributes [BOOLEAN] :should_use_acceleration The value to assign to the {#should_use_acceleration} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.compartment_id_in_subtree = attributes[:'compartmentIdInSubtree'] unless attributes[:'compartmentIdInSubtree'].nil?
      self.compartment_id_in_subtree = false if compartment_id_in_subtree.nil? && !attributes.key?(:'compartmentIdInSubtree') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :compartmentIdInSubtree and :compartment_id_in_subtree' if attributes.key?(:'compartmentIdInSubtree') && attributes.key?(:'compartment_id_in_subtree')

      self.compartment_id_in_subtree = attributes[:'compartment_id_in_subtree'] unless attributes[:'compartment_id_in_subtree'].nil?
      self.compartment_id_in_subtree = false if compartment_id_in_subtree.nil? && !attributes.key?(:'compartmentIdInSubtree') && !attributes.key?(:'compartment_id_in_subtree') # rubocop:disable Style/StringLiterals

      self.saved_search_id = attributes[:'savedSearchId'] if attributes[:'savedSearchId']

      raise 'You cannot provide both :savedSearchId and :saved_search_id' if attributes.key?(:'savedSearchId') && attributes.key?(:'saved_search_id')

      self.saved_search_id = attributes[:'saved_search_id'] if attributes[:'saved_search_id']

      self.query_string = attributes[:'queryString'] if attributes[:'queryString']

      raise 'You cannot provide both :queryString and :query_string' if attributes.key?(:'queryString') && attributes.key?(:'query_string')

      self.query_string = attributes[:'query_string'] if attributes[:'query_string']

      self.sub_system = attributes[:'subSystem'] if attributes[:'subSystem']

      raise 'You cannot provide both :subSystem and :sub_system' if attributes.key?(:'subSystem') && attributes.key?(:'sub_system')

      self.sub_system = attributes[:'sub_system'] if attributes[:'sub_system']

      self.max_total_count = attributes[:'maxTotalCount'] if attributes[:'maxTotalCount']
      self.max_total_count = 500 if max_total_count.nil? && !attributes.key?(:'maxTotalCount') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :maxTotalCount and :max_total_count' if attributes.key?(:'maxTotalCount') && attributes.key?(:'max_total_count')

      self.max_total_count = attributes[:'max_total_count'] if attributes[:'max_total_count']
      self.max_total_count = 500 if max_total_count.nil? && !attributes.key?(:'maxTotalCount') && !attributes.key?(:'max_total_count') # rubocop:disable Style/StringLiterals

      self.time_filter = attributes[:'timeFilter'] if attributes[:'timeFilter']

      raise 'You cannot provide both :timeFilter and :time_filter' if attributes.key?(:'timeFilter') && attributes.key?(:'time_filter')

      self.time_filter = attributes[:'time_filter'] if attributes[:'time_filter']

      self.scope_filters = attributes[:'scopeFilters'] if attributes[:'scopeFilters']

      raise 'You cannot provide both :scopeFilters and :scope_filters' if attributes.key?(:'scopeFilters') && attributes.key?(:'scope_filters')

      self.scope_filters = attributes[:'scope_filters'] if attributes[:'scope_filters']

      self.query_timeout_in_seconds = attributes[:'queryTimeoutInSeconds'] if attributes[:'queryTimeoutInSeconds']
      self.query_timeout_in_seconds = 120 if query_timeout_in_seconds.nil? && !attributes.key?(:'queryTimeoutInSeconds') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :queryTimeoutInSeconds and :query_timeout_in_seconds' if attributes.key?(:'queryTimeoutInSeconds') && attributes.key?(:'query_timeout_in_seconds')

      self.query_timeout_in_seconds = attributes[:'query_timeout_in_seconds'] if attributes[:'query_timeout_in_seconds']
      self.query_timeout_in_seconds = 120 if query_timeout_in_seconds.nil? && !attributes.key?(:'queryTimeoutInSeconds') && !attributes.key?(:'query_timeout_in_seconds') # rubocop:disable Style/StringLiterals

      self.should_run_async = attributes[:'shouldRunAsync'] unless attributes[:'shouldRunAsync'].nil?
      self.should_run_async = false if should_run_async.nil? && !attributes.key?(:'shouldRunAsync') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :shouldRunAsync and :should_run_async' if attributes.key?(:'shouldRunAsync') && attributes.key?(:'should_run_async')

      self.should_run_async = attributes[:'should_run_async'] unless attributes[:'should_run_async'].nil?
      self.should_run_async = false if should_run_async.nil? && !attributes.key?(:'shouldRunAsync') && !attributes.key?(:'should_run_async') # rubocop:disable Style/StringLiterals

      self.async_mode = attributes[:'asyncMode'] if attributes[:'asyncMode']
      self.async_mode = "FOREGROUND" if async_mode.nil? && !attributes.key?(:'asyncMode') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :asyncMode and :async_mode' if attributes.key?(:'asyncMode') && attributes.key?(:'async_mode')

      self.async_mode = attributes[:'async_mode'] if attributes[:'async_mode']
      self.async_mode = "FOREGROUND" if async_mode.nil? && !attributes.key?(:'asyncMode') && !attributes.key?(:'async_mode') # rubocop:disable Style/StringLiterals

      self.should_include_total_count = attributes[:'shouldIncludeTotalCount'] unless attributes[:'shouldIncludeTotalCount'].nil?
      self.should_include_total_count = false if should_include_total_count.nil? && !attributes.key?(:'shouldIncludeTotalCount') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :shouldIncludeTotalCount and :should_include_total_count' if attributes.key?(:'shouldIncludeTotalCount') && attributes.key?(:'should_include_total_count')

      self.should_include_total_count = attributes[:'should_include_total_count'] unless attributes[:'should_include_total_count'].nil?
      self.should_include_total_count = false if should_include_total_count.nil? && !attributes.key?(:'shouldIncludeTotalCount') && !attributes.key?(:'should_include_total_count') # rubocop:disable Style/StringLiterals

      self.should_include_columns = attributes[:'shouldIncludeColumns'] unless attributes[:'shouldIncludeColumns'].nil?
      self.should_include_columns = true if should_include_columns.nil? && !attributes.key?(:'shouldIncludeColumns') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :shouldIncludeColumns and :should_include_columns' if attributes.key?(:'shouldIncludeColumns') && attributes.key?(:'should_include_columns')

      self.should_include_columns = attributes[:'should_include_columns'] unless attributes[:'should_include_columns'].nil?
      self.should_include_columns = true if should_include_columns.nil? && !attributes.key?(:'shouldIncludeColumns') && !attributes.key?(:'should_include_columns') # rubocop:disable Style/StringLiterals

      self.should_include_fields = attributes[:'shouldIncludeFields'] unless attributes[:'shouldIncludeFields'].nil?
      self.should_include_fields = true if should_include_fields.nil? && !attributes.key?(:'shouldIncludeFields') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :shouldIncludeFields and :should_include_fields' if attributes.key?(:'shouldIncludeFields') && attributes.key?(:'should_include_fields')

      self.should_include_fields = attributes[:'should_include_fields'] unless attributes[:'should_include_fields'].nil?
      self.should_include_fields = true if should_include_fields.nil? && !attributes.key?(:'shouldIncludeFields') && !attributes.key?(:'should_include_fields') # rubocop:disable Style/StringLiterals

      self.should_use_acceleration = attributes[:'shouldUseAcceleration'] unless attributes[:'shouldUseAcceleration'].nil?
      self.should_use_acceleration = true if should_use_acceleration.nil? && !attributes.key?(:'shouldUseAcceleration') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :shouldUseAcceleration and :should_use_acceleration' if attributes.key?(:'shouldUseAcceleration') && attributes.key?(:'should_use_acceleration')

      self.should_use_acceleration = attributes[:'should_use_acceleration'] unless attributes[:'should_use_acceleration'].nil?
      self.should_use_acceleration = true if should_use_acceleration.nil? && !attributes.key?(:'shouldUseAcceleration') && !attributes.key?(:'should_use_acceleration') # rubocop:disable Style/StringLiterals
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] sub_system Object to be assigned
    def sub_system=(sub_system)
      raise "Invalid value for 'sub_system': this must be one of the values in SUB_SYSTEM_ENUM." if sub_system && !SUB_SYSTEM_ENUM.include?(sub_system)

      @sub_system = sub_system
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] async_mode Object to be assigned
    def async_mode=(async_mode)
      raise "Invalid value for 'async_mode': this must be one of the values in ASYNC_MODE_ENUM." if async_mode && !ASYNC_MODE_ENUM.include?(async_mode)

      @async_mode = async_mode
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        compartment_id == other.compartment_id &&
        compartment_id_in_subtree == other.compartment_id_in_subtree &&
        saved_search_id == other.saved_search_id &&
        query_string == other.query_string &&
        sub_system == other.sub_system &&
        max_total_count == other.max_total_count &&
        time_filter == other.time_filter &&
        scope_filters == other.scope_filters &&
        query_timeout_in_seconds == other.query_timeout_in_seconds &&
        should_run_async == other.should_run_async &&
        async_mode == other.async_mode &&
        should_include_total_count == other.should_include_total_count &&
        should_include_columns == other.should_include_columns &&
        should_include_fields == other.should_include_fields &&
        should_use_acceleration == other.should_use_acceleration
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
      [compartment_id, compartment_id_in_subtree, saved_search_id, query_string, sub_system, max_total_count, time_filter, scope_filters, query_timeout_in_seconds, should_run_async, async_mode, should_include_total_count, should_include_columns, should_include_fields, should_use_acceleration].hash
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
