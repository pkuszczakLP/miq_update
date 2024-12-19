# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Use the Database Management API to perform tasks such as obtaining performance and resource usage metrics
  # for a fleet of Managed Databases or a specific Managed Database, creating Managed Database Groups, and
  # running a SQL job on a Managed Database or Managed Database Group.
  class DatabaseManagement::DiagnosabilityClient
    # Client used to make HTTP requests.
    # @return [OCI::ApiClient]
    attr_reader :api_client

    # Fully qualified endpoint URL
    # @return [String]
    attr_reader :endpoint

    # The default retry configuration to apply to all operations in this service client. This can be overridden
    # on a per-operation basis. The default retry configuration value is `nil`, which means that an operation
    # will not perform any retries
    # @return [OCI::Retry::RetryConfig]
    attr_reader :retry_config

    # The region, which will usually correspond to a value in {OCI::Regions::REGION_ENUM}.
    # @return [String]
    attr_reader :region

    # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity


    # Creates a new DiagnosabilityClient.
    # Notes:
    #   If a config is not specified, then the global OCI.config will be used.
    #
    #   This client is not thread-safe
    #
    #   Either a region or an endpoint must be specified.  If an endpoint is specified, it will be used instead of the
    #     region. A region may be specified in the config or via or the region parameter. If specified in both, then the
    #     region parameter will be used.
    # @param [Config] config A Config object.
    # @param [String] region A region used to determine the service endpoint. This will usually
    #   correspond to a value in {OCI::Regions::REGION_ENUM}, but may be an arbitrary string.
    # @param [String] endpoint The fully qualified endpoint URL
    # @param [OCI::BaseSigner] signer A signer implementation which can be used by this client. If this is not provided then
    #   a signer will be constructed via the provided config. One use case of this parameter is instance principals authentication,
    #   so that the instance principals signer can be provided to the client
    # @param [OCI::ApiClientProxySettings] proxy_settings If your environment requires you to use a proxy server for outgoing HTTP requests
    #   the details for the proxy can be provided in this parameter
    # @param [OCI::Retry::RetryConfig] retry_config The retry configuration for this service client. This represents the default retry configuration to
    #   apply across all operations. This can be overridden on a per-operation basis. The default retry configuration value is `nil`, which means that an operation
    #   will not perform any retries
    def initialize(config: nil, region: nil, endpoint: nil, signer: nil, proxy_settings: nil, retry_config: nil)
      # If the signer is an InstancePrincipalsSecurityTokenSigner or SecurityTokenSigner and no config was supplied (they are self-sufficient signers)
      # then create a dummy config to pass to the ApiClient constructor. If customers wish to create a client which uses instance principals
      # and has config (either populated programmatically or loaded from a file), they must construct that config themselves and then
      # pass it to this constructor.
      #
      # If there is no signer (or the signer is not an instance principals signer) and no config was supplied, this is not valid
      # so try and load the config from the default file.
      config = OCI::Config.validate_and_build_config_with_signer(config, signer)

      signer = OCI::Signer.config_file_auth_builder(config) if signer.nil?

      @api_client = OCI::ApiClient.new(config, signer, proxy_settings: proxy_settings)
      @retry_config = retry_config

      if endpoint
        @endpoint = endpoint + '/20201101'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "DiagnosabilityClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://dbmgmt.{region}.oci.{secondLevelDomain}') + '/20201101'
      logger.info "DiagnosabilityClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the alert logs for the specified Managed Database.
    #
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [DateTime] :time_greater_than_or_equal_to The optional greater than or equal to timestamp to filter the logs.
    # @option opts [DateTime] :time_less_than_or_equal_to The optional less than or equal to timestamp to filter the logs.
    # @option opts [String] :level_filter The optional parameter to filter the alert logs by log level. (default to ALL)
    #   Allowed values are: CRITICAL, SEVERE, IMPORTANT, NORMAL, ALL
    # @option opts [String] :type_filter The optional parameter to filter the attention or alert logs by type. (default to ALL)
    #   Allowed values are: UNKNOWN, INCIDENT_ERROR, ERROR, WARNING, NOTIFICATION, TRACE, ALL
    # @option opts [String] :log_search_text The optional query parameter to filter the attention or alert logs by search text.
    # @option opts [BOOLEAN] :is_regular_expression The flag to indicate whether the search text is regular expression or not. (default to false)
    # @option opts [String] :sort_by The possible sortBy values of attention logs. (default to TIMESTAMP)
    #   Allowed values are: LEVEL, TYPE, MESSAGE, TIMESTAMP
    # @option opts [String] :sort_order The option to sort information in ascending (\u2018ASC\u2019) or descending (\u2018DESC\u2019) order. Ascending order is the default order. (default to ASC)
    # @option opts [String] :page The page token representing the page from where the next set of paginated results
    #   are retrieved. This is usually retrieved from a previous list call.
    #
    # @option opts [Integer] :limit The maximum number of records returned in the paginated response. (default to 10)
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::AlertLogCollection AlertLogCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/list_alert_logs.rb.html) to see an example of how to use list_alert_logs API.
    def list_alert_logs(managed_database_id, opts = {})
      logger.debug 'Calling operation DiagnosabilityClient#list_alert_logs.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling list_alert_logs." if managed_database_id.nil?

      if opts[:level_filter] && !%w[CRITICAL SEVERE IMPORTANT NORMAL ALL].include?(opts[:level_filter])
        raise 'Invalid value for "level_filter", must be one of CRITICAL, SEVERE, IMPORTANT, NORMAL, ALL.'
      end

      if opts[:type_filter] && !%w[UNKNOWN INCIDENT_ERROR ERROR WARNING NOTIFICATION TRACE ALL].include?(opts[:type_filter])
        raise 'Invalid value for "type_filter", must be one of UNKNOWN, INCIDENT_ERROR, ERROR, WARNING, NOTIFICATION, TRACE, ALL.'
      end

      if opts[:sort_by] && !%w[LEVEL TYPE MESSAGE TIMESTAMP].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of LEVEL, TYPE, MESSAGE, TIMESTAMP.'
      end

      if opts[:sort_order] && !OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.'
      end
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)

      path = '/managedDatabases/{managedDatabaseId}/alertLogs'.sub('{managedDatabaseId}', managed_database_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:timeGreaterThanOrEqualTo] = opts[:time_greater_than_or_equal_to] if opts[:time_greater_than_or_equal_to]
      query_params[:timeLessThanOrEqualTo] = opts[:time_less_than_or_equal_to] if opts[:time_less_than_or_equal_to]
      query_params[:levelFilter] = opts[:level_filter] if opts[:level_filter]
      query_params[:typeFilter] = opts[:type_filter] if opts[:type_filter]
      query_params[:logSearchText] = opts[:log_search_text] if opts[:log_search_text]
      query_params[:isRegularExpression] = opts[:is_regular_expression] if !opts[:is_regular_expression].nil?
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DiagnosabilityClient#list_alert_logs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::AlertLogCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the attention logs for the specified Managed Database.
    #
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [DateTime] :time_greater_than_or_equal_to The optional greater than or equal to timestamp to filter the logs.
    # @option opts [DateTime] :time_less_than_or_equal_to The optional less than or equal to timestamp to filter the logs.
    # @option opts [String] :urgency_filter The optional parameter to filter the attention logs by urgency. (default to ALL)
    #   Allowed values are: IMMEDIATE, SOON, DEFERRABLE, INFO, ALL
    # @option opts [String] :type_filter The optional parameter to filter the attention or alert logs by type. (default to ALL)
    #   Allowed values are: UNKNOWN, INCIDENT_ERROR, ERROR, WARNING, NOTIFICATION, TRACE, ALL
    # @option opts [String] :log_search_text The optional query parameter to filter the attention or alert logs by search text.
    # @option opts [BOOLEAN] :is_regular_expression The flag to indicate whether the search text is regular expression or not. (default to false)
    # @option opts [String] :sort_by The possible sortBy values of attention logs. (default to TIMESTAMP)
    #   Allowed values are: URGENCY, TYPE, MESSAGE, TIMESTAMP, SCOPE, TARGET_USER
    # @option opts [String] :sort_order The option to sort information in ascending (\u2018ASC\u2019) or descending (\u2018DESC\u2019) order. Ascending order is the default order. (default to ASC)
    # @option opts [String] :page The page token representing the page from where the next set of paginated results
    #   are retrieved. This is usually retrieved from a previous list call.
    #
    # @option opts [Integer] :limit The maximum number of records returned in the paginated response. (default to 10)
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::AttentionLogCollection AttentionLogCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/list_attention_logs.rb.html) to see an example of how to use list_attention_logs API.
    def list_attention_logs(managed_database_id, opts = {})
      logger.debug 'Calling operation DiagnosabilityClient#list_attention_logs.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling list_attention_logs." if managed_database_id.nil?

      if opts[:urgency_filter] && !%w[IMMEDIATE SOON DEFERRABLE INFO ALL].include?(opts[:urgency_filter])
        raise 'Invalid value for "urgency_filter", must be one of IMMEDIATE, SOON, DEFERRABLE, INFO, ALL.'
      end

      if opts[:type_filter] && !%w[UNKNOWN INCIDENT_ERROR ERROR WARNING NOTIFICATION TRACE ALL].include?(opts[:type_filter])
        raise 'Invalid value for "type_filter", must be one of UNKNOWN, INCIDENT_ERROR, ERROR, WARNING, NOTIFICATION, TRACE, ALL.'
      end

      if opts[:sort_by] && !%w[URGENCY TYPE MESSAGE TIMESTAMP SCOPE TARGET_USER].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of URGENCY, TYPE, MESSAGE, TIMESTAMP, SCOPE, TARGET_USER.'
      end

      if opts[:sort_order] && !OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.'
      end
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)

      path = '/managedDatabases/{managedDatabaseId}/attentionLogs'.sub('{managedDatabaseId}', managed_database_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:timeGreaterThanOrEqualTo] = opts[:time_greater_than_or_equal_to] if opts[:time_greater_than_or_equal_to]
      query_params[:timeLessThanOrEqualTo] = opts[:time_less_than_or_equal_to] if opts[:time_less_than_or_equal_to]
      query_params[:urgencyFilter] = opts[:urgency_filter] if opts[:urgency_filter]
      query_params[:typeFilter] = opts[:type_filter] if opts[:type_filter]
      query_params[:logSearchText] = opts[:log_search_text] if opts[:log_search_text]
      query_params[:isRegularExpression] = opts[:is_regular_expression] if !opts[:is_regular_expression].nil?
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DiagnosabilityClient#list_attention_logs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::AttentionLogCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Get the counts of alert logs for the specified Managed Database.
    #
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [DateTime] :time_greater_than_or_equal_to The optional greater than or equal to timestamp to filter the logs.
    # @option opts [DateTime] :time_less_than_or_equal_to The optional less than or equal to timestamp to filter the logs.
    # @option opts [String] :level_filter The optional parameter to filter the alert logs by log level. (default to ALL)
    #   Allowed values are: CRITICAL, SEVERE, IMPORTANT, NORMAL, ALL
    # @option opts [String] :group_by The optional parameter used to group different alert logs. (default to TYPE)
    #   Allowed values are: LEVEL, TYPE
    # @option opts [String] :type_filter The optional parameter to filter the attention or alert logs by type. (default to ALL)
    #   Allowed values are: UNKNOWN, INCIDENT_ERROR, ERROR, WARNING, NOTIFICATION, TRACE, ALL
    # @option opts [String] :log_search_text The optional query parameter to filter the attention or alert logs by search text.
    # @option opts [BOOLEAN] :is_regular_expression The flag to indicate whether the search text is regular expression or not. (default to false)
    # @option opts [String] :page The page token representing the page from where the next set of paginated results
    #   are retrieved. This is usually retrieved from a previous list call.
    #
    # @option opts [Integer] :limit The maximum number of records returned in the paginated response. (default to 10)
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::AlertLogCountsCollection AlertLogCountsCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/summarize_alert_log_counts.rb.html) to see an example of how to use summarize_alert_log_counts API.
    def summarize_alert_log_counts(managed_database_id, opts = {})
      logger.debug 'Calling operation DiagnosabilityClient#summarize_alert_log_counts.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling summarize_alert_log_counts." if managed_database_id.nil?

      if opts[:level_filter] && !%w[CRITICAL SEVERE IMPORTANT NORMAL ALL].include?(opts[:level_filter])
        raise 'Invalid value for "level_filter", must be one of CRITICAL, SEVERE, IMPORTANT, NORMAL, ALL.'
      end

      if opts[:group_by] && !%w[LEVEL TYPE].include?(opts[:group_by])
        raise 'Invalid value for "group_by", must be one of LEVEL, TYPE.'
      end

      if opts[:type_filter] && !%w[UNKNOWN INCIDENT_ERROR ERROR WARNING NOTIFICATION TRACE ALL].include?(opts[:type_filter])
        raise 'Invalid value for "type_filter", must be one of UNKNOWN, INCIDENT_ERROR, ERROR, WARNING, NOTIFICATION, TRACE, ALL.'
      end
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)

      path = '/managedDatabases/{managedDatabaseId}/alertLogCounts'.sub('{managedDatabaseId}', managed_database_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:timeGreaterThanOrEqualTo] = opts[:time_greater_than_or_equal_to] if opts[:time_greater_than_or_equal_to]
      query_params[:timeLessThanOrEqualTo] = opts[:time_less_than_or_equal_to] if opts[:time_less_than_or_equal_to]
      query_params[:levelFilter] = opts[:level_filter] if opts[:level_filter]
      query_params[:groupBy] = opts[:group_by] if opts[:group_by]
      query_params[:typeFilter] = opts[:type_filter] if opts[:type_filter]
      query_params[:logSearchText] = opts[:log_search_text] if opts[:log_search_text]
      query_params[:isRegularExpression] = opts[:is_regular_expression] if !opts[:is_regular_expression].nil?
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DiagnosabilityClient#summarize_alert_log_counts') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::AlertLogCountsCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Get the counts of attention logs for the specified Managed Database.
    #
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [DateTime] :time_greater_than_or_equal_to The optional greater than or equal to timestamp to filter the logs.
    # @option opts [DateTime] :time_less_than_or_equal_to The optional less than or equal to timestamp to filter the logs.
    # @option opts [String] :urgency_filter The optional parameter to filter the attention logs by urgency. (default to ALL)
    #   Allowed values are: IMMEDIATE, SOON, DEFERRABLE, INFO, ALL
    # @option opts [String] :group_by The optional parameter used to group different attention logs. (default to TYPE)
    #   Allowed values are: URGENCY, TYPE
    # @option opts [String] :type_filter The optional parameter to filter the attention or alert logs by type. (default to ALL)
    #   Allowed values are: UNKNOWN, INCIDENT_ERROR, ERROR, WARNING, NOTIFICATION, TRACE, ALL
    # @option opts [String] :log_search_text The optional query parameter to filter the attention or alert logs by search text.
    # @option opts [BOOLEAN] :is_regular_expression The flag to indicate whether the search text is regular expression or not. (default to false)
    # @option opts [String] :page The page token representing the page from where the next set of paginated results
    #   are retrieved. This is usually retrieved from a previous list call.
    #
    # @option opts [Integer] :limit The maximum number of records returned in the paginated response. (default to 10)
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::AttentionLogCountsCollection AttentionLogCountsCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/summarize_attention_log_counts.rb.html) to see an example of how to use summarize_attention_log_counts API.
    def summarize_attention_log_counts(managed_database_id, opts = {})
      logger.debug 'Calling operation DiagnosabilityClient#summarize_attention_log_counts.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling summarize_attention_log_counts." if managed_database_id.nil?

      if opts[:urgency_filter] && !%w[IMMEDIATE SOON DEFERRABLE INFO ALL].include?(opts[:urgency_filter])
        raise 'Invalid value for "urgency_filter", must be one of IMMEDIATE, SOON, DEFERRABLE, INFO, ALL.'
      end

      if opts[:group_by] && !%w[URGENCY TYPE].include?(opts[:group_by])
        raise 'Invalid value for "group_by", must be one of URGENCY, TYPE.'
      end

      if opts[:type_filter] && !%w[UNKNOWN INCIDENT_ERROR ERROR WARNING NOTIFICATION TRACE ALL].include?(opts[:type_filter])
        raise 'Invalid value for "type_filter", must be one of UNKNOWN, INCIDENT_ERROR, ERROR, WARNING, NOTIFICATION, TRACE, ALL.'
      end
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)

      path = '/managedDatabases/{managedDatabaseId}/attentionLogCounts'.sub('{managedDatabaseId}', managed_database_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:timeGreaterThanOrEqualTo] = opts[:time_greater_than_or_equal_to] if opts[:time_greater_than_or_equal_to]
      query_params[:timeLessThanOrEqualTo] = opts[:time_less_than_or_equal_to] if opts[:time_less_than_or_equal_to]
      query_params[:urgencyFilter] = opts[:urgency_filter] if opts[:urgency_filter]
      query_params[:groupBy] = opts[:group_by] if opts[:group_by]
      query_params[:typeFilter] = opts[:type_filter] if opts[:type_filter]
      query_params[:logSearchText] = opts[:log_search_text] if opts[:log_search_text]
      query_params[:isRegularExpression] = opts[:is_regular_expression] if !opts[:is_regular_expression].nil?
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DiagnosabilityClient#summarize_attention_log_counts') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::AttentionLogCountsCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    private

    def applicable_retry_config(opts = {})
      return @retry_config unless opts.key?(:retry_config)

      opts[:retry_config]
    end
  end
end
# rubocop:enable Lint/UnneededCopDisableDirective, Metrics/LineLength
