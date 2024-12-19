# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Use the Database Management API to perform tasks such as obtaining performance and resource usage metrics
  # for a fleet of Managed Databases or a specific Managed Database, creating Managed Database Groups, and
  # running a SQL job on a Managed Database or Managed Database Group.
  class DatabaseManagement::SqlTuningClient
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


    # Creates a new SqlTuningClient.
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
      logger.info "SqlTuningClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://dbmgmt.{region}.oci.{secondLevelDomain}') + '/20201101'
      logger.info "SqlTuningClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Clones and runs a SQL tuning task in the database.
    #
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [OCI::DatabaseManagement::Models::CloneSqlTuningTaskDetails] clone_sql_tuning_task_details The detailed inputs required to clone a SQL tuning task.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::SqlTuningTaskReturn SqlTuningTaskReturn}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/clone_sql_tuning_task.rb.html) to see an example of how to use clone_sql_tuning_task API.
    def clone_sql_tuning_task(managed_database_id, clone_sql_tuning_task_details, opts = {})
      logger.debug 'Calling operation SqlTuningClient#clone_sql_tuning_task.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling clone_sql_tuning_task." if managed_database_id.nil?
      raise "Missing the required parameter 'clone_sql_tuning_task_details' when calling clone_sql_tuning_task." if clone_sql_tuning_task_details.nil?
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)

      path = '/managedDatabases/{managedDatabaseId}/actions/cloneSqlTuningTask'.sub('{managedDatabaseId}', managed_database_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(clone_sql_tuning_task_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'SqlTuningClient#clone_sql_tuning_task') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::SqlTuningTaskReturn'
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


    # Drops a SQL tuning task and its related results from the database.
    #
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [OCI::DatabaseManagement::Models::DropSqlTuningTaskDetails] drop_sql_tuning_task_details The detailed inputs required to drop a SQL tuning task.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/drop_sql_tuning_task.rb.html) to see an example of how to use drop_sql_tuning_task API.
    def drop_sql_tuning_task(managed_database_id, drop_sql_tuning_task_details, opts = {})
      logger.debug 'Calling operation SqlTuningClient#drop_sql_tuning_task.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling drop_sql_tuning_task." if managed_database_id.nil?
      raise "Missing the required parameter 'drop_sql_tuning_task_details' when calling drop_sql_tuning_task." if drop_sql_tuning_task_details.nil?
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)

      path = '/managedDatabases/{managedDatabaseId}/actions/dropSqlTuningTask'.sub('{managedDatabaseId}', managed_database_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(drop_sql_tuning_task_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'SqlTuningClient#drop_sql_tuning_task') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body
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


    # Retrieves a comparison of the existing SQL execution plan and a new plan.
    # A SQL tuning task may suggest a new execution plan for a SQL,
    # and this API retrieves the comparison report of the statistics of the two plans.
    #
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [Integer] sql_tuning_advisor_task_id The SQL tuning task identifier. This is not the [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Integer] sql_object_id The SQL object ID for the SQL tuning task. This is not the [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Integer] execution_id The execution ID for an execution of a SQL tuning task. This is not the [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::ExecutionPlanStatsComparision ExecutionPlanStatsComparision}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/get_execution_plan_stats_comparision.rb.html) to see an example of how to use get_execution_plan_stats_comparision API.
    def get_execution_plan_stats_comparision(managed_database_id, sql_tuning_advisor_task_id, sql_object_id, execution_id, opts = {})
      logger.debug 'Calling operation SqlTuningClient#get_execution_plan_stats_comparision.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling get_execution_plan_stats_comparision." if managed_database_id.nil?
      raise "Missing the required parameter 'sql_tuning_advisor_task_id' when calling get_execution_plan_stats_comparision." if sql_tuning_advisor_task_id.nil?
      raise "Missing the required parameter 'sql_object_id' when calling get_execution_plan_stats_comparision." if sql_object_id.nil?
      raise "Missing the required parameter 'execution_id' when calling get_execution_plan_stats_comparision." if execution_id.nil?
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)
      raise "Parameter value for 'sql_tuning_advisor_task_id' must not be blank" if OCI::Internal::Util.blank_string?(sql_tuning_advisor_task_id)

      path = '/managedDatabases/{managedDatabaseId}/sqlTuningAdvisorTasks/{sqlTuningAdvisorTaskId}/executionPlanStatsComparision'.sub('{managedDatabaseId}', managed_database_id.to_s).sub('{sqlTuningAdvisorTaskId}', sql_tuning_advisor_task_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:sqlObjectId] = sql_object_id
      query_params[:executionId] = execution_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'SqlTuningClient#get_execution_plan_stats_comparision') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::ExecutionPlanStatsComparision'
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


    # Retrieves a SQL execution plan for the SQL being tuned.
    #
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [Integer] sql_tuning_advisor_task_id The SQL tuning task identifier. This is not the [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Integer] sql_object_id The SQL object ID for the SQL tuning task. This is not the [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [String] attribute The attribute of the SQL execution plan.
    #   Allowed values are: ORIGINAL, ORIGINAL_WITH_ADJUSTED_COST, USING_SQL_PROFILE, USING_NEW_INDICES, USING_PARALLEL_EXECUTION
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::SqlTuningAdvisorTaskSqlExecutionPlan SqlTuningAdvisorTaskSqlExecutionPlan}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/get_sql_execution_plan.rb.html) to see an example of how to use get_sql_execution_plan API.
    def get_sql_execution_plan(managed_database_id, sql_tuning_advisor_task_id, sql_object_id, attribute, opts = {})
      logger.debug 'Calling operation SqlTuningClient#get_sql_execution_plan.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling get_sql_execution_plan." if managed_database_id.nil?
      raise "Missing the required parameter 'sql_tuning_advisor_task_id' when calling get_sql_execution_plan." if sql_tuning_advisor_task_id.nil?
      raise "Missing the required parameter 'sql_object_id' when calling get_sql_execution_plan." if sql_object_id.nil?
      raise "Missing the required parameter 'attribute' when calling get_sql_execution_plan." if attribute.nil?
      unless %w[ORIGINAL ORIGINAL_WITH_ADJUSTED_COST USING_SQL_PROFILE USING_NEW_INDICES USING_PARALLEL_EXECUTION].include?(attribute)
        raise "Invalid value for 'attribute', must be one of ORIGINAL, ORIGINAL_WITH_ADJUSTED_COST, USING_SQL_PROFILE, USING_NEW_INDICES, USING_PARALLEL_EXECUTION."
      end
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)
      raise "Parameter value for 'sql_tuning_advisor_task_id' must not be blank" if OCI::Internal::Util.blank_string?(sql_tuning_advisor_task_id)

      path = '/managedDatabases/{managedDatabaseId}/sqlTuningAdvisorTasks/{sqlTuningAdvisorTaskId}/sqlExecutionPlan'.sub('{managedDatabaseId}', managed_database_id.to_s).sub('{sqlTuningAdvisorTaskId}', sql_tuning_advisor_task_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:sqlObjectId] = sql_object_id
      query_params[:attribute] = attribute

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'SqlTuningClient#get_sql_execution_plan') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::SqlTuningAdvisorTaskSqlExecutionPlan'
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


    # Gets the summary report for the specified SQL Tuning Advisor task.
    #
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [Integer] sql_tuning_advisor_task_id The SQL tuning task identifier. This is not the [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :search_period How far back the API will search for begin and end exec id. Unused if neither exec ids nor time filter query params are supplied. This is applicable only for Auto SQL Tuning tasks. (default to ALL)
    #   Allowed values are: LAST_24HR, LAST_7DAY, LAST_31DAY, SINCE_LAST, ALL
    # @option opts [DateTime] :time_greater_than_or_equal_to The optional greater than or equal to query parameter to filter the timestamp. This is applicable only for Auto SQL Tuning tasks.
    # @option opts [DateTime] :time_less_than_or_equal_to The optional less than or equal to query parameter to filter the timestamp. This is applicable only for Auto SQL Tuning tasks.
    # @option opts [Integer] :begin_exec_id_greater_than_or_equal_to The optional greater than or equal to filter on the execution ID related to a specific SQL Tuning Advisor task. This is applicable only for Auto SQL Tuning tasks.
    # @option opts [Integer] :end_exec_id_less_than_or_equal_to The optional less than or equal to query parameter to filter on the execution ID related to a specific SQL Tuning Advisor task. This is applicable only for Auto SQL Tuning tasks.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::SqlTuningAdvisorTaskSummaryReport SqlTuningAdvisorTaskSummaryReport}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/get_sql_tuning_advisor_task_summary_report.rb.html) to see an example of how to use get_sql_tuning_advisor_task_summary_report API.
    def get_sql_tuning_advisor_task_summary_report(managed_database_id, sql_tuning_advisor_task_id, opts = {})
      logger.debug 'Calling operation SqlTuningClient#get_sql_tuning_advisor_task_summary_report.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling get_sql_tuning_advisor_task_summary_report." if managed_database_id.nil?
      raise "Missing the required parameter 'sql_tuning_advisor_task_id' when calling get_sql_tuning_advisor_task_summary_report." if sql_tuning_advisor_task_id.nil?

      if opts[:search_period] && !%w[LAST_24HR LAST_7DAY LAST_31DAY SINCE_LAST ALL].include?(opts[:search_period])
        raise 'Invalid value for "search_period", must be one of LAST_24HR, LAST_7DAY, LAST_31DAY, SINCE_LAST, ALL.'
      end
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)
      raise "Parameter value for 'sql_tuning_advisor_task_id' must not be blank" if OCI::Internal::Util.blank_string?(sql_tuning_advisor_task_id)

      path = '/managedDatabases/{managedDatabaseId}/sqlTuningAdvisorTasks/{sqlTuningAdvisorTaskId}/summaryReport'.sub('{managedDatabaseId}', managed_database_id.to_s).sub('{sqlTuningAdvisorTaskId}', sql_tuning_advisor_task_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:searchPeriod] = opts[:search_period] if opts[:search_period]
      query_params[:timeGreaterThanOrEqualTo] = opts[:time_greater_than_or_equal_to] if opts[:time_greater_than_or_equal_to]
      query_params[:timeLessThanOrEqualTo] = opts[:time_less_than_or_equal_to] if opts[:time_less_than_or_equal_to]
      query_params[:beginExecIdGreaterThanOrEqualTo] = opts[:begin_exec_id_greater_than_or_equal_to] if opts[:begin_exec_id_greater_than_or_equal_to]
      query_params[:endExecIdLessThanOrEqualTo] = opts[:end_exec_id_less_than_or_equal_to] if opts[:end_exec_id_less_than_or_equal_to]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'SqlTuningClient#get_sql_tuning_advisor_task_summary_report') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::SqlTuningAdvisorTaskSummaryReport'
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


    # Gets an array of the details of the findings that match specific filters.
    #
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [Integer] sql_tuning_advisor_task_id The SQL tuning task identifier. This is not the [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :begin_exec_id The optional greater than or equal to filter on the execution ID related to a specific SQL Tuning Advisor task.
    # @option opts [Integer] :end_exec_id The optional less than or equal to query parameter to filter on the execution ID related to a specific SQL Tuning Advisor task.
    # @option opts [String] :search_period The search period during which the API will search for begin and end exec id, if not supplied.
    #   Unused if beginExecId and endExecId optional query params are both supplied.
    #    (default to ALL)
    #   Allowed values are: LAST_24HR, LAST_7DAY, LAST_31DAY, SINCE_LAST, ALL
    # @option opts [String] :finding_filter The filter used to display specific findings in the report. (default to none)
    #   Allowed values are: none, FINDINGS, NOFINDINGS, ERRORS, PROFILES, INDICES, STATS, RESTRUCTURE, ALTERNATIVE, AUTO_PROFILES, OTHER_PROFILES
    # @option opts [String] :stats_hash_filter The hash value of the object for the statistic finding search.
    # @option opts [String] :index_hash_filter The hash value of the index table name.
    # @option opts [String] :sort_by The possible sortBy values of an object's recommendations. (default to DBTIME_BENEFIT)
    #   Allowed values are: DBTIME_BENEFIT, PARSING_SCHEMA, SQL_ID, STATS, PROFILES, SQL_BENEFIT, DATE, INDICES, RESTRUCTURE, ALTERNATIVE, MISC, ERROR, TIMEOUTS
    # @option opts [String] :sort_order The option to sort information in ascending (\u2018ASC\u2019) or descending (\u2018DESC\u2019) order. Descending order is the default order. (default to DESC)
    # @option opts [String] :page The page token representing the page from where the next set of paginated results
    #   are retrieved. This is usually retrieved from a previous list call.
    #
    # @option opts [Integer] :limit The maximum number of records returned in the paginated response. (default to 10)
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::SqlTuningAdvisorTaskFindingCollection SqlTuningAdvisorTaskFindingCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/list_sql_tuning_advisor_task_findings.rb.html) to see an example of how to use list_sql_tuning_advisor_task_findings API.
    def list_sql_tuning_advisor_task_findings(managed_database_id, sql_tuning_advisor_task_id, opts = {})
      logger.debug 'Calling operation SqlTuningClient#list_sql_tuning_advisor_task_findings.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling list_sql_tuning_advisor_task_findings." if managed_database_id.nil?
      raise "Missing the required parameter 'sql_tuning_advisor_task_id' when calling list_sql_tuning_advisor_task_findings." if sql_tuning_advisor_task_id.nil?

      if opts[:search_period] && !%w[LAST_24HR LAST_7DAY LAST_31DAY SINCE_LAST ALL].include?(opts[:search_period])
        raise 'Invalid value for "search_period", must be one of LAST_24HR, LAST_7DAY, LAST_31DAY, SINCE_LAST, ALL.'
      end

      if opts[:finding_filter] && !%w[none FINDINGS NOFINDINGS ERRORS PROFILES INDICES STATS RESTRUCTURE ALTERNATIVE AUTO_PROFILES OTHER_PROFILES].include?(opts[:finding_filter])
        raise 'Invalid value for "finding_filter", must be one of none, FINDINGS, NOFINDINGS, ERRORS, PROFILES, INDICES, STATS, RESTRUCTURE, ALTERNATIVE, AUTO_PROFILES, OTHER_PROFILES.'
      end

      if opts[:sort_by] && !%w[DBTIME_BENEFIT PARSING_SCHEMA SQL_ID STATS PROFILES SQL_BENEFIT DATE INDICES RESTRUCTURE ALTERNATIVE MISC ERROR TIMEOUTS].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of DBTIME_BENEFIT, PARSING_SCHEMA, SQL_ID, STATS, PROFILES, SQL_BENEFIT, DATE, INDICES, RESTRUCTURE, ALTERNATIVE, MISC, ERROR, TIMEOUTS.'
      end

      if opts[:sort_order] && !OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.'
      end
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)
      raise "Parameter value for 'sql_tuning_advisor_task_id' must not be blank" if OCI::Internal::Util.blank_string?(sql_tuning_advisor_task_id)

      path = '/managedDatabases/{managedDatabaseId}/sqlTuningAdvisorTasks/{sqlTuningAdvisorTaskId}/findings'.sub('{managedDatabaseId}', managed_database_id.to_s).sub('{sqlTuningAdvisorTaskId}', sql_tuning_advisor_task_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:beginExecId] = opts[:begin_exec_id] if opts[:begin_exec_id]
      query_params[:endExecId] = opts[:end_exec_id] if opts[:end_exec_id]
      query_params[:searchPeriod] = opts[:search_period] if opts[:search_period]
      query_params[:findingFilter] = opts[:finding_filter] if opts[:finding_filter]
      query_params[:statsHashFilter] = opts[:stats_hash_filter] if opts[:stats_hash_filter]
      query_params[:indexHashFilter] = opts[:index_hash_filter] if opts[:index_hash_filter]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'SqlTuningClient#list_sql_tuning_advisor_task_findings') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::SqlTuningAdvisorTaskFindingCollection'
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


    # Gets the findings and possible actions for a given object in a SQL tuning task.
    # The task ID and object ID are used to retrieve the findings and recommendations.
    #
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [Integer] sql_tuning_advisor_task_id The SQL tuning task identifier. This is not the [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Integer] sql_object_id The SQL object ID for the SQL tuning task. This is not the [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Integer] execution_id The execution ID for an execution of a SQL tuning task. This is not the [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :sort_by The possible sortBy values of an object's recommendations. (default to RECOMMENDATION_TYPE)
    #   Allowed values are: RECOMMENDATION_TYPE, BENEFIT
    # @option opts [String] :sort_order The option to sort information in ascending (\u2018ASC\u2019) or descending (\u2018DESC\u2019) order. Descending order is the default order. (default to DESC)
    # @option opts [String] :page The page token representing the page from where the next set of paginated results
    #   are retrieved. This is usually retrieved from a previous list call.
    #
    # @option opts [Integer] :limit The maximum number of records returned in the paginated response. (default to 10)
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::SqlTuningAdvisorTaskRecommendationCollection SqlTuningAdvisorTaskRecommendationCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/list_sql_tuning_advisor_task_recommendations.rb.html) to see an example of how to use list_sql_tuning_advisor_task_recommendations API.
    def list_sql_tuning_advisor_task_recommendations(managed_database_id, sql_tuning_advisor_task_id, sql_object_id, execution_id, opts = {})
      logger.debug 'Calling operation SqlTuningClient#list_sql_tuning_advisor_task_recommendations.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling list_sql_tuning_advisor_task_recommendations." if managed_database_id.nil?
      raise "Missing the required parameter 'sql_tuning_advisor_task_id' when calling list_sql_tuning_advisor_task_recommendations." if sql_tuning_advisor_task_id.nil?
      raise "Missing the required parameter 'sql_object_id' when calling list_sql_tuning_advisor_task_recommendations." if sql_object_id.nil?
      raise "Missing the required parameter 'execution_id' when calling list_sql_tuning_advisor_task_recommendations." if execution_id.nil?

      if opts[:sort_by] && !%w[RECOMMENDATION_TYPE BENEFIT].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of RECOMMENDATION_TYPE, BENEFIT.'
      end

      if opts[:sort_order] && !OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.'
      end
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)
      raise "Parameter value for 'sql_tuning_advisor_task_id' must not be blank" if OCI::Internal::Util.blank_string?(sql_tuning_advisor_task_id)

      path = '/managedDatabases/{managedDatabaseId}/sqlTuningAdvisorTasks/{sqlTuningAdvisorTaskId}/recommendations'.sub('{managedDatabaseId}', managed_database_id.to_s).sub('{sqlTuningAdvisorTaskId}', sql_tuning_advisor_task_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:sqlObjectId] = sql_object_id
      query_params[:executionId] = execution_id
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'SqlTuningClient#list_sql_tuning_advisor_task_recommendations') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::SqlTuningAdvisorTaskRecommendationCollection'
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


    # Lists the SQL Tuning Advisor tasks for the specified Managed Database.
    #
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :name The optional query parameter to filter the SQL Tuning Advisor task list by name.
    # @option opts [String] :status The optional query parameter to filter the SQL Tuning Advisor task list by status.
    #   Allowed values are: INITIAL, EXECUTING, INTERRUPTED, COMPLETED, ERROR
    # @option opts [DateTime] :time_greater_than_or_equal_to The optional greater than or equal to query parameter to filter the timestamp.
    # @option opts [DateTime] :time_less_than_or_equal_to The optional less than or equal to query parameter to filter the timestamp.
    # @option opts [String] :page The page token representing the page from where the next set of paginated results
    #   are retrieved. This is usually retrieved from a previous list call.
    #
    # @option opts [Integer] :limit The maximum number of records returned in the paginated response. (default to 10)
    # @option opts [String] :sort_by The option to sort the SQL Tuning Advisor task summary data. (default to START_TIME)
    #   Allowed values are: NAME, START_TIME
    # @option opts [String] :sort_order The option to sort information in ascending (\u2018ASC\u2019) or descending (\u2018DESC\u2019) order. Descending order is the default order. (default to DESC)
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::SqlTuningAdvisorTaskCollection SqlTuningAdvisorTaskCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/list_sql_tuning_advisor_tasks.rb.html) to see an example of how to use list_sql_tuning_advisor_tasks API.
    def list_sql_tuning_advisor_tasks(managed_database_id, opts = {})
      logger.debug 'Calling operation SqlTuningClient#list_sql_tuning_advisor_tasks.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling list_sql_tuning_advisor_tasks." if managed_database_id.nil?

      if opts[:status] && !%w[INITIAL EXECUTING INTERRUPTED COMPLETED ERROR].include?(opts[:status])
        raise 'Invalid value for "status", must be one of INITIAL, EXECUTING, INTERRUPTED, COMPLETED, ERROR.'
      end

      if opts[:sort_by] && !%w[NAME START_TIME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of NAME, START_TIME.'
      end

      if opts[:sort_order] && !OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.'
      end
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)

      path = '/managedDatabases/{managedDatabaseId}/sqlTuningAdvisorTasks'.sub('{managedDatabaseId}', managed_database_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:status] = opts[:status] if opts[:status]
      query_params[:timeGreaterThanOrEqualTo] = opts[:time_greater_than_or_equal_to] if opts[:time_greater_than_or_equal_to]
      query_params[:timeLessThanOrEqualTo] = opts[:time_less_than_or_equal_to] if opts[:time_less_than_or_equal_to]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'SqlTuningClient#list_sql_tuning_advisor_tasks') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::SqlTuningAdvisorTaskCollection'
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


    # Lists the SQL tuning sets for the specified Managed Database.
    #
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :owner The owner of the SQL tuning set.
    # @option opts [String] :name_contains Allow searching the name of the SQL tuning set by partial matching. The search is case insensitive.
    # @option opts [String] :sort_by The option to sort the SQL tuning set summary data. (default to NAME)
    #   Allowed values are: NAME
    # @option opts [String] :sort_order The option to sort information in ascending (\u2018ASC\u2019) or descending (\u2018DESC\u2019) order. Ascending order is the default order. (default to ASC)
    # @option opts [String] :page The page token representing the page from where the next set of paginated results
    #   are retrieved. This is usually retrieved from a previous list call.
    #
    # @option opts [Integer] :limit The maximum number of records returned in the paginated response. (default to 10)
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::SqlTuningSetCollection SqlTuningSetCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/list_sql_tuning_sets.rb.html) to see an example of how to use list_sql_tuning_sets API.
    def list_sql_tuning_sets(managed_database_id, opts = {})
      logger.debug 'Calling operation SqlTuningClient#list_sql_tuning_sets.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling list_sql_tuning_sets." if managed_database_id.nil?

      if opts[:sort_by] && !%w[NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of NAME.'
      end

      if opts[:sort_order] && !OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.'
      end
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)

      path = '/managedDatabases/{managedDatabaseId}/sqlTuningSets'.sub('{managedDatabaseId}', managed_database_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:owner] = opts[:owner] if opts[:owner]
      query_params[:nameContains] = opts[:name_contains] if opts[:name_contains]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'SqlTuningClient#list_sql_tuning_sets') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::SqlTuningSetCollection'
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


    # Starts a SQL tuning task for a given set of SQL statements from the active session history top SQL statements.
    #
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [OCI::DatabaseManagement::Models::StartSqlTuningTaskDetails] start_sql_tuning_task_details The detailed inputs required to start a SQL tuning task.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::SqlTuningTaskReturn SqlTuningTaskReturn}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/start_sql_tuning_task.rb.html) to see an example of how to use start_sql_tuning_task API.
    def start_sql_tuning_task(managed_database_id, start_sql_tuning_task_details, opts = {})
      logger.debug 'Calling operation SqlTuningClient#start_sql_tuning_task.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling start_sql_tuning_task." if managed_database_id.nil?
      raise "Missing the required parameter 'start_sql_tuning_task_details' when calling start_sql_tuning_task." if start_sql_tuning_task_details.nil?
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)

      path = '/managedDatabases/{managedDatabaseId}/actions/startSqlTuningTask'.sub('{managedDatabaseId}', managed_database_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(start_sql_tuning_task_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'SqlTuningClient#start_sql_tuning_task') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::SqlTuningTaskReturn'
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
