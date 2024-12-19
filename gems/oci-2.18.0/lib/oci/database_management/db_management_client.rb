# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Use the Database Management API to perform tasks such as obtaining performance and resource usage metrics
  # for a fleet of Managed Databases or a specific Managed Database, creating Managed Database Groups, and
  # running a SQL job on a Managed Database or Managed Database Group.
  class DatabaseManagement::DbManagementClient
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


    # Creates a new DbManagementClient.
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
      logger.info "DbManagementClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://dbmgmt.{region}.oci.{secondLevelDomain}') + '/20201101'
      logger.info "DbManagementClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Adds data files or temp files to the tablespace.
    #
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [String] tablespace_name The name of the tablespace.
    # @param [OCI::DatabaseManagement::Models::AddDataFilesDetails] add_data_files_details The details required to add data files or temp files to the tablespace.
    #
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
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::TablespaceAdminStatus TablespaceAdminStatus}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/add_data_files.rb.html) to see an example of how to use add_data_files API.
    def add_data_files(managed_database_id, tablespace_name, add_data_files_details, opts = {})
      logger.debug 'Calling operation DbManagementClient#add_data_files.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling add_data_files." if managed_database_id.nil?
      raise "Missing the required parameter 'tablespace_name' when calling add_data_files." if tablespace_name.nil?
      raise "Missing the required parameter 'add_data_files_details' when calling add_data_files." if add_data_files_details.nil?
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)
      raise "Parameter value for 'tablespace_name' must not be blank" if OCI::Internal::Util.blank_string?(tablespace_name)

      path = '/managedDatabases/{managedDatabaseId}/tablespaces/{tablespaceName}/actions/addDataFiles'.sub('{managedDatabaseId}', managed_database_id.to_s).sub('{tablespaceName}', tablespace_name.to_s)
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

      post_body = @api_client.object_to_http_body(add_data_files_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#add_data_files') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::TablespaceAdminStatus'
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


    # Adds a Managed Database to a specific Managed Database Group.
    # After the database is added, it will be included in the
    # management activities performed on the Managed Database Group.
    #
    # @param [String] managed_database_group_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database Group.
    # @param [OCI::DatabaseManagement::Models::AddManagedDatabaseToManagedDatabaseGroupDetails] add_managed_database_to_managed_database_group_details The Managed Database details required to add the Managed Database to a Managed Database Group.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/add_managed_database_to_managed_database_group.rb.html) to see an example of how to use add_managed_database_to_managed_database_group API.
    def add_managed_database_to_managed_database_group(managed_database_group_id, add_managed_database_to_managed_database_group_details, opts = {})
      logger.debug 'Calling operation DbManagementClient#add_managed_database_to_managed_database_group.' if logger

      raise "Missing the required parameter 'managed_database_group_id' when calling add_managed_database_to_managed_database_group." if managed_database_group_id.nil?
      raise "Missing the required parameter 'add_managed_database_to_managed_database_group_details' when calling add_managed_database_to_managed_database_group." if add_managed_database_to_managed_database_group_details.nil?
      raise "Parameter value for 'managed_database_group_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_group_id)

      path = '/managedDatabaseGroups/{managedDatabaseGroupId}/actions/addManagedDatabase'.sub('{managedDatabaseGroupId}', managed_database_group_id.to_s)
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

      post_body = @api_client.object_to_http_body(add_managed_database_to_managed_database_group_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#add_managed_database_to_managed_database_group') do
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


    # Lists the metadata for each ADDM task who's end snapshot time falls within the provided start and end time. Details include
    # the name of the ADDM task, description, user, status and creation date time.
    #
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [DateTime] time_start The beginning of the time range to search for ADDM tasks as defined by date-time RFC3339 format.
    # @param [DateTime] time_end The end of the time range to search for ADDM tasks as defined by date-time RFC3339 format.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @option opts [String] :page The page token representing the page from where the next set of paginated results
    #   are retrieved. This is usually retrieved from a previous list call.
    #
    # @option opts [Integer] :limit The maximum number of records returned in the paginated response. (default to 10)
    # @option opts [String] :sort_by The option to sort the list of ADDM tasks. (default to END_TIME)
    #   Allowed values are: TASK_NAME, TASK_ID, DESCRIPTION, DB_USER, STATUS, TIME_CREATED, BEGIN_TIME, END_TIME
    # @option opts [String] :sort_order The option to sort information in ascending (\u2018ASC\u2019) or descending (\u2018DESC\u2019) order. Descending order is the default order. (default to DESC)
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::AddmTasksCollection AddmTasksCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/addm_tasks.rb.html) to see an example of how to use addm_tasks API.
    def addm_tasks(managed_database_id, time_start, time_end, opts = {})
      logger.debug 'Calling operation DbManagementClient#addm_tasks.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling addm_tasks." if managed_database_id.nil?
      raise "Missing the required parameter 'time_start' when calling addm_tasks." if time_start.nil?
      raise "Missing the required parameter 'time_end' when calling addm_tasks." if time_end.nil?

      if opts[:sort_by] && !%w[TASK_NAME TASK_ID DESCRIPTION DB_USER STATUS TIME_CREATED BEGIN_TIME END_TIME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TASK_NAME, TASK_ID, DESCRIPTION, DB_USER, STATUS, TIME_CREATED, BEGIN_TIME, END_TIME.'
      end

      if opts[:sort_order] && !OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.'
      end
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)

      path = '/managedDatabases/{managedDatabaseId}/addmTasks'.sub('{managedDatabaseId}', managed_database_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:timeStart] = time_start
      query_params[:timeEnd] = time_end
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#addm_tasks') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::AddmTasksCollection'
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


    # Changes database parameter values. There are two kinds of database
    # parameters:
    #
    # - Dynamic parameters: They can be changed for the current Oracle
    # Database instance. The changes take effect immediately.
    # - Static parameters: They cannot be changed for the current instance.
    # You must change these parameters and then restart the database before
    # changes take effect.
    #
    # **Note:** If the instance is started using a text initialization
    # parameter file, the parameter changes are applicable only for the
    # current instance. You must update them manually to be passed to
    # a future instance.
    #
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [OCI::DatabaseManagement::Models::ChangeDatabaseParametersDetails] change_database_parameters_details The details required to change database parameter values.
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
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::UpdateDatabaseParametersResult UpdateDatabaseParametersResult}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/change_database_parameters.rb.html) to see an example of how to use change_database_parameters API.
    def change_database_parameters(managed_database_id, change_database_parameters_details, opts = {})
      logger.debug 'Calling operation DbManagementClient#change_database_parameters.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling change_database_parameters." if managed_database_id.nil?
      raise "Missing the required parameter 'change_database_parameters_details' when calling change_database_parameters." if change_database_parameters_details.nil?
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)

      path = '/managedDatabases/{managedDatabaseId}/actions/changeDatabaseParameters'.sub('{managedDatabaseId}', managed_database_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_database_parameters_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#change_database_parameters') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::UpdateDatabaseParametersResult'
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


    # Moves the Database Management private endpoint and its dependent resources to the specified compartment.
    # @param [String] db_management_private_endpoint_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Database Management private endpoint.
    # @param [OCI::DatabaseManagement::Models::ChangeDbManagementPrivateEndpointCompartmentDetails] change_db_management_private_endpoint_compartment_details The details used to move the Database Management private endpoint to another compartment.
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
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/change_db_management_private_endpoint_compartment.rb.html) to see an example of how to use change_db_management_private_endpoint_compartment API.
    def change_db_management_private_endpoint_compartment(db_management_private_endpoint_id, change_db_management_private_endpoint_compartment_details, opts = {})
      logger.debug 'Calling operation DbManagementClient#change_db_management_private_endpoint_compartment.' if logger

      raise "Missing the required parameter 'db_management_private_endpoint_id' when calling change_db_management_private_endpoint_compartment." if db_management_private_endpoint_id.nil?
      raise "Missing the required parameter 'change_db_management_private_endpoint_compartment_details' when calling change_db_management_private_endpoint_compartment." if change_db_management_private_endpoint_compartment_details.nil?
      raise "Parameter value for 'db_management_private_endpoint_id' must not be blank" if OCI::Internal::Util.blank_string?(db_management_private_endpoint_id)

      path = '/dbManagementPrivateEndpoints/{dbManagementPrivateEndpointId}/actions/changeCompartment'.sub('{dbManagementPrivateEndpointId}', db_management_private_endpoint_id.to_s)
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
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(change_db_management_private_endpoint_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#change_db_management_private_endpoint_compartment') do
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


    # Moves a job.
    #
    # @param [String] job_id The identifier of the job.
    # @param [OCI::DatabaseManagement::Models::ChangeJobCompartmentDetails] change_job_compartment_details The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment to move the job to.
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
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/change_job_compartment.rb.html) to see an example of how to use change_job_compartment API.
    def change_job_compartment(job_id, change_job_compartment_details, opts = {})
      logger.debug 'Calling operation DbManagementClient#change_job_compartment.' if logger

      raise "Missing the required parameter 'job_id' when calling change_job_compartment." if job_id.nil?
      raise "Missing the required parameter 'change_job_compartment_details' when calling change_job_compartment." if change_job_compartment_details.nil?
      raise "Parameter value for 'job_id' must not be blank" if OCI::Internal::Util.blank_string?(job_id)

      path = '/jobs/{jobId}/actions/changeCompartment'.sub('{jobId}', job_id.to_s)
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
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(change_job_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#change_job_compartment') do
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


    # Moves a Managed Database Group to a different compartment.
    # The destination compartment must not have a Managed Database Group
    # with the same name.
    #
    # @param [String] managed_database_group_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database Group.
    # @param [OCI::DatabaseManagement::Models::ChangeManagedDatabaseGroupCompartmentDetails] change_managed_database_group_compartment_details The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment to move the Managed Database Group to.
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
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/change_managed_database_group_compartment.rb.html) to see an example of how to use change_managed_database_group_compartment API.
    def change_managed_database_group_compartment(managed_database_group_id, change_managed_database_group_compartment_details, opts = {})
      logger.debug 'Calling operation DbManagementClient#change_managed_database_group_compartment.' if logger

      raise "Missing the required parameter 'managed_database_group_id' when calling change_managed_database_group_compartment." if managed_database_group_id.nil?
      raise "Missing the required parameter 'change_managed_database_group_compartment_details' when calling change_managed_database_group_compartment." if change_managed_database_group_compartment_details.nil?
      raise "Parameter value for 'managed_database_group_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_group_id)

      path = '/managedDatabaseGroups/{managedDatabaseGroupId}/actions/changeCompartment'.sub('{managedDatabaseGroupId}', managed_database_group_id.to_s)
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
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(change_managed_database_group_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#change_managed_database_group_compartment') do
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


    # Creates a new Database Management private endpoint.
    #
    # @param [OCI::DatabaseManagement::Models::CreateDbManagementPrivateEndpointDetails] create_db_management_private_endpoint_details Details used to create a new Database Management private endpoint.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::DbManagementPrivateEndpoint DbManagementPrivateEndpoint}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/create_db_management_private_endpoint.rb.html) to see an example of how to use create_db_management_private_endpoint API.
    def create_db_management_private_endpoint(create_db_management_private_endpoint_details, opts = {})
      logger.debug 'Calling operation DbManagementClient#create_db_management_private_endpoint.' if logger

      raise "Missing the required parameter 'create_db_management_private_endpoint_details' when calling create_db_management_private_endpoint." if create_db_management_private_endpoint_details.nil?

      path = '/dbManagementPrivateEndpoints'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_db_management_private_endpoint_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#create_db_management_private_endpoint') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::DbManagementPrivateEndpoint'
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


    # Creates a job to be executed on a Managed Database or Managed Database Group. Only one
    # of the parameters, managedDatabaseId or managedDatabaseGroupId should be provided as
    # input in CreateJobDetails resource in request body.
    #
    # @param [OCI::DatabaseManagement::Models::CreateJobDetails] create_job_details The details required to create a job.
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
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::Job Job}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/create_job.rb.html) to see an example of how to use create_job API.
    def create_job(create_job_details, opts = {})
      logger.debug 'Calling operation DbManagementClient#create_job.' if logger

      raise "Missing the required parameter 'create_job_details' when calling create_job." if create_job_details.nil?

      path = '/jobs'
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

      post_body = @api_client.object_to_http_body(create_job_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#create_job') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::Job'
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


    # Creates a Managed Database Group. The group does not contain any
    # Managed Databases when it is created, and they must be added later.
    #
    # @param [OCI::DatabaseManagement::Models::CreateManagedDatabaseGroupDetails] create_managed_database_group_details The details required to create a Managed Database Group.
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
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::ManagedDatabaseGroup ManagedDatabaseGroup}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/create_managed_database_group.rb.html) to see an example of how to use create_managed_database_group API.
    def create_managed_database_group(create_managed_database_group_details, opts = {})
      logger.debug 'Calling operation DbManagementClient#create_managed_database_group.' if logger

      raise "Missing the required parameter 'create_managed_database_group_details' when calling create_managed_database_group." if create_managed_database_group_details.nil?

      path = '/managedDatabaseGroups'
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

      post_body = @api_client.object_to_http_body(create_managed_database_group_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#create_managed_database_group') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::ManagedDatabaseGroup'
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


    # Creates a tablespace within the Managed Database specified by managedDatabaseId.
    #
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [OCI::DatabaseManagement::Models::CreateTablespaceDetails] create_tablespace_details The details required to create a tablespace.
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
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::Tablespace Tablespace}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/create_tablespace.rb.html) to see an example of how to use create_tablespace API.
    def create_tablespace(managed_database_id, create_tablespace_details, opts = {})
      logger.debug 'Calling operation DbManagementClient#create_tablespace.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling create_tablespace." if managed_database_id.nil?
      raise "Missing the required parameter 'create_tablespace_details' when calling create_tablespace." if create_tablespace_details.nil?
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)

      path = '/managedDatabases/{managedDatabaseId}/tablespaces'.sub('{managedDatabaseId}', managed_database_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_tablespace_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#create_tablespace') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::Tablespace'
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


    # Deletes a specific Database Management private endpoint.
    # @param [String] db_management_private_endpoint_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Database Management private endpoint.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/delete_db_management_private_endpoint.rb.html) to see an example of how to use delete_db_management_private_endpoint API.
    def delete_db_management_private_endpoint(db_management_private_endpoint_id, opts = {})
      logger.debug 'Calling operation DbManagementClient#delete_db_management_private_endpoint.' if logger

      raise "Missing the required parameter 'db_management_private_endpoint_id' when calling delete_db_management_private_endpoint." if db_management_private_endpoint_id.nil?
      raise "Parameter value for 'db_management_private_endpoint_id' must not be blank" if OCI::Internal::Util.blank_string?(db_management_private_endpoint_id)

      path = '/dbManagementPrivateEndpoints/{dbManagementPrivateEndpointId}'.sub('{dbManagementPrivateEndpointId}', db_management_private_endpoint_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#delete_db_management_private_endpoint') do
        @api_client.call_api(
          :DELETE,
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


    # Deletes the job specified by jobId.
    # @param [String] job_id The identifier of the job.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/delete_job.rb.html) to see an example of how to use delete_job API.
    def delete_job(job_id, opts = {})
      logger.debug 'Calling operation DbManagementClient#delete_job.' if logger

      raise "Missing the required parameter 'job_id' when calling delete_job." if job_id.nil?
      raise "Parameter value for 'job_id' must not be blank" if OCI::Internal::Util.blank_string?(job_id)

      path = '/jobs/{jobId}'.sub('{jobId}', job_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#delete_job') do
        @api_client.call_api(
          :DELETE,
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


    # Deletes the Managed Database Group specified by managedDatabaseGroupId.
    # If the group contains Managed Databases, then it cannot be deleted.
    #
    # @param [String] managed_database_group_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database Group.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/delete_managed_database_group.rb.html) to see an example of how to use delete_managed_database_group API.
    def delete_managed_database_group(managed_database_group_id, opts = {})
      logger.debug 'Calling operation DbManagementClient#delete_managed_database_group.' if logger

      raise "Missing the required parameter 'managed_database_group_id' when calling delete_managed_database_group." if managed_database_group_id.nil?
      raise "Parameter value for 'managed_database_group_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_group_id)

      path = '/managedDatabaseGroups/{managedDatabaseGroupId}'.sub('{managedDatabaseGroupId}', managed_database_group_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#delete_managed_database_group') do
        @api_client.call_api(
          :DELETE,
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


    # Drops the tablespace specified by tablespaceName within the Managed Database specified by managedDatabaseId.
    #
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [String] tablespace_name The name of the tablespace.
    # @param [OCI::DatabaseManagement::Models::DropTablespaceDetails] drop_tablespace_details The details required to drop a tablespace.
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
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::TablespaceAdminStatus TablespaceAdminStatus}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/drop_tablespace.rb.html) to see an example of how to use drop_tablespace API.
    def drop_tablespace(managed_database_id, tablespace_name, drop_tablespace_details, opts = {})
      logger.debug 'Calling operation DbManagementClient#drop_tablespace.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling drop_tablespace." if managed_database_id.nil?
      raise "Missing the required parameter 'tablespace_name' when calling drop_tablespace." if tablespace_name.nil?
      raise "Missing the required parameter 'drop_tablespace_details' when calling drop_tablespace." if drop_tablespace_details.nil?
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)
      raise "Parameter value for 'tablespace_name' must not be blank" if OCI::Internal::Util.blank_string?(tablespace_name)

      path = '/managedDatabases/{managedDatabaseId}/tablespaces/{tablespaceName}/actions/dropTablespace'.sub('{managedDatabaseId}', managed_database_id.to_s).sub('{tablespaceName}', tablespace_name.to_s)
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

      post_body = @api_client.object_to_http_body(drop_tablespace_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#drop_tablespace') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::TablespaceAdminStatus'
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


    # Creates an AWR snapshot for the target database.
    #
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::SnapshotDetails SnapshotDetails}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/generate_awr_snapshot.rb.html) to see an example of how to use generate_awr_snapshot API.
    def generate_awr_snapshot(managed_database_id, opts = {})
      logger.debug 'Calling operation DbManagementClient#generate_awr_snapshot.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling generate_awr_snapshot." if managed_database_id.nil?
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)

      path = '/managedDatabases/{managedDatabaseId}/actions/generateAwrSnapshot'.sub('{managedDatabaseId}', managed_database_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#generate_awr_snapshot') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::SnapshotDetails'
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


    # Gets the AWR report for the specific database.
    #
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [String] awr_db_id The parameter to filter the database by internal ID.
    #   Note that the internal ID of the database can be retrieved from the following endpoint:
    #   /managedDatabases/{managedDatabaseId}/awrDbs
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Array<Integer>] :inst_nums The optional multiple value query parameter to filter the database instance numbers.
    # @option opts [Integer] :begin_sn_id_greater_than_or_equal_to The optional greater than or equal to filter on the snapshot ID.
    # @option opts [Integer] :end_sn_id_less_than_or_equal_to The optional less than or equal to query parameter to filter the snapshot ID.
    # @option opts [DateTime] :time_greater_than_or_equal_to The optional greater than or equal to query parameter to filter the timestamp.
    # @option opts [DateTime] :time_less_than_or_equal_to The optional less than or equal to query parameter to filter the timestamp.
    # @option opts [String] :report_type The query parameter to filter the AWR report types. (default to AWR)
    #   Allowed values are: AWR, ASH
    # @option opts [Integer] :container_id The optional query parameter to filter the database container by an exact ID value.
    #   Note that the database container ID can be retrieved from the following endpoint:
    #   /managedDatabases/{managedDatabaseId}/awrDbSnapshotRanges
    #
    # @option opts [String] :report_format The format of the AWR report. (default to HTML)
    #   Allowed values are: HTML, TEXT
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::AwrDbReport AwrDbReport}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/get_awr_db_report.rb.html) to see an example of how to use get_awr_db_report API.
    def get_awr_db_report(managed_database_id, awr_db_id, opts = {})
      logger.debug 'Calling operation DbManagementClient#get_awr_db_report.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling get_awr_db_report." if managed_database_id.nil?
      raise "Missing the required parameter 'awr_db_id' when calling get_awr_db_report." if awr_db_id.nil?

      if opts[:report_type] && !%w[AWR ASH].include?(opts[:report_type])
        raise 'Invalid value for "report_type", must be one of AWR, ASH.'
      end

      if opts[:report_format] && !%w[HTML TEXT].include?(opts[:report_format])
        raise 'Invalid value for "report_format", must be one of HTML, TEXT.'
      end
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)
      raise "Parameter value for 'awr_db_id' must not be blank" if OCI::Internal::Util.blank_string?(awr_db_id)

      path = '/managedDatabases/{managedDatabaseId}/awrDbs/{awrDbId}/awrDbReport'.sub('{managedDatabaseId}', managed_database_id.to_s).sub('{awrDbId}', awr_db_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:instNums] = OCI::ApiClient.build_collection_params(opts[:inst_nums], :csv) if opts[:inst_nums] && !opts[:inst_nums].empty?
      query_params[:beginSnIdGreaterThanOrEqualTo] = opts[:begin_sn_id_greater_than_or_equal_to] if opts[:begin_sn_id_greater_than_or_equal_to]
      query_params[:endSnIdLessThanOrEqualTo] = opts[:end_sn_id_less_than_or_equal_to] if opts[:end_sn_id_less_than_or_equal_to]
      query_params[:timeGreaterThanOrEqualTo] = opts[:time_greater_than_or_equal_to] if opts[:time_greater_than_or_equal_to]
      query_params[:timeLessThanOrEqualTo] = opts[:time_less_than_or_equal_to] if opts[:time_less_than_or_equal_to]
      query_params[:reportType] = opts[:report_type] if opts[:report_type]
      query_params[:containerId] = opts[:container_id] if opts[:container_id]
      query_params[:reportFormat] = opts[:report_format] if opts[:report_format]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#get_awr_db_report') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::AwrDbReport'
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


    # Gets the SQL health check report for one SQL of the specific database.
    #
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [String] awr_db_id The parameter to filter the database by internal ID.
    #   Note that the internal ID of the database can be retrieved from the following endpoint:
    #   /managedDatabases/{managedDatabaseId}/awrDbs
    #
    # @param [String] sql_id The parameter to filter SQL by ID. Note that the SQL ID is generated internally by Oracle for each SQL statement and can be retrieved from AWR Report API (/managedDatabases/{managedDatabaseId}/awrDbs/{awrDbId}/awrDbReport) or Performance Hub API (/internal/managedDatabases/{managedDatabaseId}/actions/retrievePerformanceData)
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :inst_num The optional single value query parameter to filter the database instance number.
    # @option opts [Integer] :begin_sn_id_greater_than_or_equal_to The optional greater than or equal to filter on the snapshot ID.
    # @option opts [Integer] :end_sn_id_less_than_or_equal_to The optional less than or equal to query parameter to filter the snapshot ID.
    # @option opts [DateTime] :time_greater_than_or_equal_to The optional greater than or equal to query parameter to filter the timestamp.
    # @option opts [DateTime] :time_less_than_or_equal_to The optional less than or equal to query parameter to filter the timestamp.
    # @option opts [String] :report_format The format of the AWR report. (default to HTML)
    #   Allowed values are: HTML, TEXT
    # @option opts [Integer] :container_id The optional query parameter to filter the database container by an exact ID value.
    #   Note that the database container ID can be retrieved from the following endpoint:
    #   /managedDatabases/{managedDatabaseId}/awrDbSnapshotRanges
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::AwrDbSqlReport AwrDbSqlReport}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/get_awr_db_sql_report.rb.html) to see an example of how to use get_awr_db_sql_report API.
    def get_awr_db_sql_report(managed_database_id, awr_db_id, sql_id, opts = {})
      logger.debug 'Calling operation DbManagementClient#get_awr_db_sql_report.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling get_awr_db_sql_report." if managed_database_id.nil?
      raise "Missing the required parameter 'awr_db_id' when calling get_awr_db_sql_report." if awr_db_id.nil?
      raise "Missing the required parameter 'sql_id' when calling get_awr_db_sql_report." if sql_id.nil?

      if opts[:report_format] && !%w[HTML TEXT].include?(opts[:report_format])
        raise 'Invalid value for "report_format", must be one of HTML, TEXT.'
      end
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)
      raise "Parameter value for 'awr_db_id' must not be blank" if OCI::Internal::Util.blank_string?(awr_db_id)

      path = '/managedDatabases/{managedDatabaseId}/awrDbs/{awrDbId}/awrDbSqlReport'.sub('{managedDatabaseId}', managed_database_id.to_s).sub('{awrDbId}', awr_db_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:sqlId] = sql_id
      query_params[:instNum] = opts[:inst_num] if opts[:inst_num]
      query_params[:beginSnIdGreaterThanOrEqualTo] = opts[:begin_sn_id_greater_than_or_equal_to] if opts[:begin_sn_id_greater_than_or_equal_to]
      query_params[:endSnIdLessThanOrEqualTo] = opts[:end_sn_id_less_than_or_equal_to] if opts[:end_sn_id_less_than_or_equal_to]
      query_params[:timeGreaterThanOrEqualTo] = opts[:time_greater_than_or_equal_to] if opts[:time_greater_than_or_equal_to]
      query_params[:timeLessThanOrEqualTo] = opts[:time_less_than_or_equal_to] if opts[:time_less_than_or_equal_to]
      query_params[:reportFormat] = opts[:report_format] if opts[:report_format]
      query_params[:containerId] = opts[:container_id] if opts[:container_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#get_awr_db_sql_report') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::AwrDbSqlReport'
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


    # Gets the metrics related to cluster cache for the Oracle
    # Real Application Clusters (Oracle RAC) database specified
    # by managedDatabaseId.
    #
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [String] start_time The start time of the time range to retrieve the health metrics of a Managed Database
    #   in UTC in ISO-8601 format, which is \"yyyy-MM-dd'T'hh:mm:ss.sss'Z'\".
    #
    # @param [String] end_time The end time of the time range to retrieve the health metrics of a Managed Database
    #   in UTC in ISO-8601 format, which is \"yyyy-MM-dd'T'hh:mm:ss.sss'Z'\".
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::ClusterCacheMetric ClusterCacheMetric}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/get_cluster_cache_metric.rb.html) to see an example of how to use get_cluster_cache_metric API.
    def get_cluster_cache_metric(managed_database_id, start_time, end_time, opts = {})
      logger.debug 'Calling operation DbManagementClient#get_cluster_cache_metric.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling get_cluster_cache_metric." if managed_database_id.nil?
      raise "Missing the required parameter 'start_time' when calling get_cluster_cache_metric." if start_time.nil?
      raise "Missing the required parameter 'end_time' when calling get_cluster_cache_metric." if end_time.nil?
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)

      path = '/managedDatabases/{managedDatabaseId}/clusterCacheMetrics'.sub('{managedDatabaseId}', managed_database_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:startTime] = start_time
      query_params[:endTime] = end_time

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#get_cluster_cache_metric') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::ClusterCacheMetric'
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


    # Gets the health metrics for a fleet of databases in a compartment or in a Managed Database Group.
    # Either the CompartmentId or the ManagedDatabaseGroupId query parameters must be provided to retrieve the health metrics.
    #
    # @param [String] compare_baseline_time The baseline time for metrics comparison.
    # @param [String] compare_target_time The target time for metrics comparison.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :managed_database_group_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database Group.
    # @option opts [String] :compartment_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment.
    # @option opts [String] :compare_type The time window used for metrics comparison.
    # @option opts [String] :filter_by_metric_names The filter used to retrieve a specific set of metrics by passing the desired metric names with a comma separator. Note that, by default, the service returns all supported metrics.
    # @option opts [String] :filter_by_database_type The filter used to filter the databases in the fleet by a specific Oracle Database type.
    # @option opts [String] :filter_by_database_sub_type The filter used to filter the databases in the fleet by a specific Oracle Database subtype.
    # @option opts [String] :filter_by_database_deployment_type The filter used to filter the databases in the fleet by a specific Oracle Database deployment type.
    # @option opts [String] :filter_by_database_version The filter used to filter the databases in the fleet by a specific Oracle Database version.
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::DatabaseFleetHealthMetrics DatabaseFleetHealthMetrics}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/get_database_fleet_health_metrics.rb.html) to see an example of how to use get_database_fleet_health_metrics API.
    def get_database_fleet_health_metrics(compare_baseline_time, compare_target_time, opts = {})
      logger.debug 'Calling operation DbManagementClient#get_database_fleet_health_metrics.' if logger

      raise "Missing the required parameter 'compare_baseline_time' when calling get_database_fleet_health_metrics." if compare_baseline_time.nil?
      raise "Missing the required parameter 'compare_target_time' when calling get_database_fleet_health_metrics." if compare_target_time.nil?

      if opts[:compare_type] && !OCI::DatabaseManagement::Models::COMPARE_TYPE_ENUM.include?(opts[:compare_type])
        raise 'Invalid value for "compare_type", must be one of the values in OCI::DatabaseManagement::Models::COMPARE_TYPE_ENUM.'
      end

      path = '/fleetMetrics'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compareBaselineTime] = compare_baseline_time
      query_params[:compareTargetTime] = compare_target_time
      query_params[:managedDatabaseGroupId] = opts[:managed_database_group_id] if opts[:managed_database_group_id]
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:compareType] = opts[:compare_type] if opts[:compare_type]
      query_params[:filterByMetricNames] = opts[:filter_by_metric_names] if opts[:filter_by_metric_names]
      query_params[:filterByDatabaseType] = opts[:filter_by_database_type] if opts[:filter_by_database_type]
      query_params[:filterByDatabaseSubType] = opts[:filter_by_database_sub_type] if opts[:filter_by_database_sub_type]
      query_params[:filterByDatabaseDeploymentType] = opts[:filter_by_database_deployment_type] if opts[:filter_by_database_deployment_type]
      query_params[:filterByDatabaseVersion] = opts[:filter_by_database_version] if opts[:filter_by_database_version]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#get_database_fleet_health_metrics') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::DatabaseFleetHealthMetrics'
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


    # Gets a summary of the activity and resource usage metrics like DB Time, CPU, User I/O, Wait, Storage, and Memory for a Managed Database.
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [String] start_time The start time of the time range to retrieve the health metrics of a Managed Database
    #   in UTC in ISO-8601 format, which is \"yyyy-MM-dd'T'hh:mm:ss.sss'Z'\".
    #
    # @param [String] end_time The end time of the time range to retrieve the health metrics of a Managed Database
    #   in UTC in ISO-8601 format, which is \"yyyy-MM-dd'T'hh:mm:ss.sss'Z'\".
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::DatabaseHomeMetrics DatabaseHomeMetrics}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/get_database_home_metrics.rb.html) to see an example of how to use get_database_home_metrics API.
    def get_database_home_metrics(managed_database_id, start_time, end_time, opts = {})
      logger.debug 'Calling operation DbManagementClient#get_database_home_metrics.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling get_database_home_metrics." if managed_database_id.nil?
      raise "Missing the required parameter 'start_time' when calling get_database_home_metrics." if start_time.nil?
      raise "Missing the required parameter 'end_time' when calling get_database_home_metrics." if end_time.nil?

      path = '/databaseHomeMetrics'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:managedDatabaseId] = managed_database_id
      query_params[:startTime] = start_time
      query_params[:endTime] = end_time

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#get_database_home_metrics') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::DatabaseHomeMetrics'
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


    # Gets the details of a specific Database Management private endpoint.
    # @param [String] db_management_private_endpoint_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Database Management private endpoint.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::DbManagementPrivateEndpoint DbManagementPrivateEndpoint}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/get_db_management_private_endpoint.rb.html) to see an example of how to use get_db_management_private_endpoint API.
    def get_db_management_private_endpoint(db_management_private_endpoint_id, opts = {})
      logger.debug 'Calling operation DbManagementClient#get_db_management_private_endpoint.' if logger

      raise "Missing the required parameter 'db_management_private_endpoint_id' when calling get_db_management_private_endpoint." if db_management_private_endpoint_id.nil?
      raise "Parameter value for 'db_management_private_endpoint_id' must not be blank" if OCI::Internal::Util.blank_string?(db_management_private_endpoint_id)

      path = '/dbManagementPrivateEndpoints/{dbManagementPrivateEndpointId}'.sub('{dbManagementPrivateEndpointId}', db_management_private_endpoint_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#get_db_management_private_endpoint') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::DbManagementPrivateEndpoint'
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


    # Gets the details for the job specified by jobId.
    #
    # @param [String] job_id The identifier of the job.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::Job Job}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/get_job.rb.html) to see an example of how to use get_job API.
    def get_job(job_id, opts = {})
      logger.debug 'Calling operation DbManagementClient#get_job.' if logger

      raise "Missing the required parameter 'job_id' when calling get_job." if job_id.nil?
      raise "Parameter value for 'job_id' must not be blank" if OCI::Internal::Util.blank_string?(job_id)

      path = '/jobs/{jobId}'.sub('{jobId}', job_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#get_job') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::Job'
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


    # Gets the details for the job execution specified by jobExecutionId.
    #
    # @param [String] job_execution_id The identifier of the job execution.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::JobExecution JobExecution}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/get_job_execution.rb.html) to see an example of how to use get_job_execution API.
    def get_job_execution(job_execution_id, opts = {})
      logger.debug 'Calling operation DbManagementClient#get_job_execution.' if logger

      raise "Missing the required parameter 'job_execution_id' when calling get_job_execution." if job_execution_id.nil?
      raise "Parameter value for 'job_execution_id' must not be blank" if OCI::Internal::Util.blank_string?(job_execution_id)

      path = '/jobExecutions/{jobExecutionId}'.sub('{jobExecutionId}', job_execution_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#get_job_execution') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::JobExecution'
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


    # Gets the details for the job run specified by jobRunId.
    #
    # @param [String] job_run_id The identifier of the job run.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::JobRun JobRun}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/get_job_run.rb.html) to see an example of how to use get_job_run API.
    def get_job_run(job_run_id, opts = {})
      logger.debug 'Calling operation DbManagementClient#get_job_run.' if logger

      raise "Missing the required parameter 'job_run_id' when calling get_job_run." if job_run_id.nil?
      raise "Parameter value for 'job_run_id' must not be blank" if OCI::Internal::Util.blank_string?(job_run_id)

      path = '/jobRuns/{jobRunId}'.sub('{jobRunId}', job_run_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#get_job_run') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::JobRun'
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


    # Gets the details for the Managed Database specified by managedDatabaseId.
    #
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::ManagedDatabase ManagedDatabase}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/get_managed_database.rb.html) to see an example of how to use get_managed_database API.
    def get_managed_database(managed_database_id, opts = {})
      logger.debug 'Calling operation DbManagementClient#get_managed_database.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling get_managed_database." if managed_database_id.nil?
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)

      path = '/managedDatabases/{managedDatabaseId}'.sub('{managedDatabaseId}', managed_database_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#get_managed_database') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::ManagedDatabase'
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


    # Gets the details for the Managed Database Group specified by managedDatabaseGroupId.
    #
    # @param [String] managed_database_group_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database Group.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::ManagedDatabaseGroup ManagedDatabaseGroup}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/get_managed_database_group.rb.html) to see an example of how to use get_managed_database_group API.
    def get_managed_database_group(managed_database_group_id, opts = {})
      logger.debug 'Calling operation DbManagementClient#get_managed_database_group.' if logger

      raise "Missing the required parameter 'managed_database_group_id' when calling get_managed_database_group." if managed_database_group_id.nil?
      raise "Parameter value for 'managed_database_group_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_group_id)

      path = '/managedDatabaseGroups/{managedDatabaseGroupId}'.sub('{managedDatabaseGroupId}', managed_database_group_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#get_managed_database_group') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::ManagedDatabaseGroup'
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


    # Gets a summary of the resource usage metrics such as CPU, User I/O, and Storage for each
    # PDB within a specific CDB. If comparmentId is specified, then the metrics for
    # each PDB (within the CDB) in the specified compartment are retrieved.
    # If compartmentId is not specified, then the metrics for all the PDBs within the CDB are retrieved.
    #
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [String] start_time The start time of the time range to retrieve the health metrics of a Managed Database
    #   in UTC in ISO-8601 format, which is \"yyyy-MM-dd'T'hh:mm:ss.sss'Z'\".
    #
    # @param [String] end_time The end time of the time range to retrieve the health metrics of a Managed Database
    #   in UTC in ISO-8601 format, which is \"yyyy-MM-dd'T'hh:mm:ss.sss'Z'\".
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :compartment_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment.
    # @option opts [String] :compare_type The time window used for metrics comparison.
    # @option opts [String] :filter_by_metric_names The filter used to retrieve a specific set of metrics by passing the desired metric names with a comma separator. Note that, by default, the service returns all supported metrics.
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::PdbMetrics PdbMetrics}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/get_pdb_metrics.rb.html) to see an example of how to use get_pdb_metrics API.
    def get_pdb_metrics(managed_database_id, start_time, end_time, opts = {})
      logger.debug 'Calling operation DbManagementClient#get_pdb_metrics.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling get_pdb_metrics." if managed_database_id.nil?
      raise "Missing the required parameter 'start_time' when calling get_pdb_metrics." if start_time.nil?
      raise "Missing the required parameter 'end_time' when calling get_pdb_metrics." if end_time.nil?

      if opts[:compare_type] && !OCI::DatabaseManagement::Models::COMPARE_TYPE_ENUM.include?(opts[:compare_type])
        raise 'Invalid value for "compare_type", must be one of the values in OCI::DatabaseManagement::Models::COMPARE_TYPE_ENUM.'
      end
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)

      path = '/managedDatabases/{managedDatabaseId}/pdbMetrics'.sub('{managedDatabaseId}', managed_database_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:startTime] = start_time
      query_params[:endTime] = end_time
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:compareType] = opts[:compare_type] if opts[:compare_type]
      query_params[:filterByMetricNames] = opts[:filter_by_metric_names] if opts[:filter_by_metric_names]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#get_pdb_metrics') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::PdbMetrics'
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


    # Gets the details of the tablespace specified by tablespaceName within the Managed Database specified by managedDatabaseId.
    #
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [String] tablespace_name The name of the tablespace.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::Tablespace Tablespace}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/get_tablespace.rb.html) to see an example of how to use get_tablespace API.
    def get_tablespace(managed_database_id, tablespace_name, opts = {})
      logger.debug 'Calling operation DbManagementClient#get_tablespace.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling get_tablespace." if managed_database_id.nil?
      raise "Missing the required parameter 'tablespace_name' when calling get_tablespace." if tablespace_name.nil?
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)
      raise "Parameter value for 'tablespace_name' must not be blank" if OCI::Internal::Util.blank_string?(tablespace_name)

      path = '/managedDatabases/{managedDatabaseId}/tablespaces/{tablespaceName}'.sub('{managedDatabaseId}', managed_database_id.to_s).sub('{tablespaceName}', tablespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#get_tablespace') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::Tablespace'
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


    # Gets the details of the user specified by managedDatabaseId and userName.
    #
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [String] user_name The name of the user whose details are to be viewed.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::User User}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/get_user.rb.html) to see an example of how to use get_user API.
    def get_user(managed_database_id, user_name, opts = {})
      logger.debug 'Calling operation DbManagementClient#get_user.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling get_user." if managed_database_id.nil?
      raise "Missing the required parameter 'user_name' when calling get_user." if user_name.nil?
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)
      raise "Parameter value for 'user_name' must not be blank" if OCI::Internal::Util.blank_string?(user_name)

      path = '/managedDatabases/{managedDatabaseId}/users/{userName}'.sub('{managedDatabaseId}', managed_database_id.to_s).sub('{userName}', user_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#get_user') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::User'
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


    # Gets the status of the work request with the given Work Request ID
    # @param [String] work_request_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the asynchronous work request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::WorkRequest WorkRequest}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/get_work_request.rb.html) to see an example of how to use get_work_request API.
    def get_work_request(work_request_id, opts = {})
      logger.debug 'Calling operation DbManagementClient#get_work_request.' if logger

      raise "Missing the required parameter 'work_request_id' when calling get_work_request." if work_request_id.nil?
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/workRequests/{workRequestId}'.sub('{workRequestId}', work_request_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#get_work_request') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::WorkRequest'
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


    # Gets the list of ASM properties for the specified managedDatabaseId.
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :name A filter to return only resources that match the entire name.
    # @option opts [String] :sort_by The field to sort information by. Only one sortOrder can be used. The default sort order
    #   for \u2018TIMECREATED\u2019 is descending and the default sort order for \u2018NAME\u2019 is ascending.
    #   The \u2018NAME\u2019 sort order is case-sensitive.
    #    (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, NAME
    # @option opts [String] :sort_order The option to sort information in ascending (\u2018ASC\u2019) or descending (\u2018DESC\u2019) order. Ascending order is the default order. (default to ASC)
    # @option opts [String] :page The page token representing the page from where the next set of paginated results
    #   are retrieved. This is usually retrieved from a previous list call.
    #
    # @option opts [Integer] :limit The maximum number of records returned in the paginated response. (default to 10)
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::AsmPropertyCollection AsmPropertyCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/list_asm_properties.rb.html) to see an example of how to use list_asm_properties API.
    def list_asm_properties(managed_database_id, opts = {})
      logger.debug 'Calling operation DbManagementClient#list_asm_properties.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling list_asm_properties." if managed_database_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, NAME.'
      end

      if opts[:sort_order] && !OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.'
      end
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)

      path = '/managedDatabases/{managedDatabaseId}/asmProperties'.sub('{managedDatabaseId}', managed_database_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:name] = opts[:name] if opts[:name]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#list_asm_properties') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::AsmPropertyCollection'
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


    # Gets the list of databases using a specific Database Management private endpoint.
    # @param [String] db_management_private_endpoint_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Database Management private endpoint.
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [Integer] :limit The maximum number of records returned in the paginated response. (default to 10)
    # @option opts [String] :page The page token representing the page from where the next set of paginated results
    #   are retrieved. This is usually retrieved from a previous list call.
    #
    # @option opts [String] :sort_order The option to sort information in ascending (\u2018ASC\u2019) or descending (\u2018DESC\u2019) order. Ascending order is the default order. (default to ASC)
    # @option opts [String] :sort_by The option to sort databases using a specific Database Management private endpoint.
    #    (default to timeRegistered)
    #   Allowed values are: timeRegistered
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::AssociatedDatabaseCollection AssociatedDatabaseCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/list_associated_databases.rb.html) to see an example of how to use list_associated_databases API.
    def list_associated_databases(db_management_private_endpoint_id, compartment_id, opts = {})
      logger.debug 'Calling operation DbManagementClient#list_associated_databases.' if logger

      raise "Missing the required parameter 'db_management_private_endpoint_id' when calling list_associated_databases." if db_management_private_endpoint_id.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_associated_databases." if compartment_id.nil?

      if opts[:sort_order] && !OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.'
      end

      if opts[:sort_by] && !%w[timeRegistered].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeRegistered.'
      end
      raise "Parameter value for 'db_management_private_endpoint_id' must not be blank" if OCI::Internal::Util.blank_string?(db_management_private_endpoint_id)

      path = '/dbManagementPrivateEndpoints/{dbManagementPrivateEndpointId}/associatedDatabases'.sub('{dbManagementPrivateEndpointId}', db_management_private_endpoint_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#list_associated_databases') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::AssociatedDatabaseCollection'
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


    # Lists AWR snapshots for the specified database in the AWR.
    #
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [String] awr_db_id The parameter to filter the database by internal ID.
    #   Note that the internal ID of the database can be retrieved from the following endpoint:
    #   /managedDatabases/{managedDatabaseId}/awrDbs
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :inst_num The optional single value query parameter to filter the database instance number.
    # @option opts [Integer] :begin_sn_id_greater_than_or_equal_to The optional greater than or equal to filter on the snapshot ID.
    # @option opts [Integer] :end_sn_id_less_than_or_equal_to The optional less than or equal to query parameter to filter the snapshot ID.
    # @option opts [DateTime] :time_greater_than_or_equal_to The optional greater than or equal to query parameter to filter the timestamp.
    # @option opts [DateTime] :time_less_than_or_equal_to The optional less than or equal to query parameter to filter the timestamp.
    # @option opts [Integer] :container_id The optional query parameter to filter the database container by an exact ID value.
    #   Note that the database container ID can be retrieved from the following endpoint:
    #   /managedDatabases/{managedDatabaseId}/awrDbSnapshotRanges
    #
    # @option opts [String] :page The page token representing the page from where the next set of paginated results
    #   are retrieved. This is usually retrieved from a previous list call.
    #
    # @option opts [Integer] :limit The maximum number of records returned in the paginated response. (default to 10)
    # @option opts [String] :sort_by The option to sort the AWR snapshot summary data. (default to TIME_BEGIN)
    #   Allowed values are: TIME_BEGIN, SNAPSHOT_ID
    # @option opts [String] :sort_order The option to sort information in ascending (\u2018ASC\u2019) or descending (\u2018DESC\u2019) order. Descending order is the default order. (default to DESC)
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::AwrDbSnapshotCollection AwrDbSnapshotCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/list_awr_db_snapshots.rb.html) to see an example of how to use list_awr_db_snapshots API.
    def list_awr_db_snapshots(managed_database_id, awr_db_id, opts = {})
      logger.debug 'Calling operation DbManagementClient#list_awr_db_snapshots.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling list_awr_db_snapshots." if managed_database_id.nil?
      raise "Missing the required parameter 'awr_db_id' when calling list_awr_db_snapshots." if awr_db_id.nil?

      if opts[:sort_by] && !%w[TIME_BEGIN SNAPSHOT_ID].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIME_BEGIN, SNAPSHOT_ID.'
      end

      if opts[:sort_order] && !OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.'
      end
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)
      raise "Parameter value for 'awr_db_id' must not be blank" if OCI::Internal::Util.blank_string?(awr_db_id)

      path = '/managedDatabases/{managedDatabaseId}/awrDbs/{awrDbId}/awrDbSnapshots'.sub('{managedDatabaseId}', managed_database_id.to_s).sub('{awrDbId}', awr_db_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:instNum] = opts[:inst_num] if opts[:inst_num]
      query_params[:beginSnIdGreaterThanOrEqualTo] = opts[:begin_sn_id_greater_than_or_equal_to] if opts[:begin_sn_id_greater_than_or_equal_to]
      query_params[:endSnIdLessThanOrEqualTo] = opts[:end_sn_id_less_than_or_equal_to] if opts[:end_sn_id_less_than_or_equal_to]
      query_params[:timeGreaterThanOrEqualTo] = opts[:time_greater_than_or_equal_to] if opts[:time_greater_than_or_equal_to]
      query_params[:timeLessThanOrEqualTo] = opts[:time_less_than_or_equal_to] if opts[:time_less_than_or_equal_to]
      query_params[:containerId] = opts[:container_id] if opts[:container_id]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#list_awr_db_snapshots') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::AwrDbSnapshotCollection'
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


    # Gets the list of databases and their snapshot summary details available in the AWR of the specified Managed Database.
    #
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :name The optional single value query parameter to filter the entity name.
    # @option opts [DateTime] :time_greater_than_or_equal_to The optional greater than or equal to query parameter to filter the timestamp.
    # @option opts [DateTime] :time_less_than_or_equal_to The optional less than or equal to query parameter to filter the timestamp.
    # @option opts [String] :page The page token representing the page from where the next set of paginated results
    #   are retrieved. This is usually retrieved from a previous list call.
    #
    # @option opts [Integer] :limit The maximum number of records returned in the paginated response. (default to 10)
    # @option opts [String] :sort_by The option to sort the AWR summary data. (default to END_INTERVAL_TIME)
    #   Allowed values are: END_INTERVAL_TIME, NAME
    # @option opts [String] :sort_order The option to sort information in ascending (\u2018ASC\u2019) or descending (\u2018DESC\u2019) order. Descending order is the default order. (default to DESC)
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::AwrDbCollection AwrDbCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/list_awr_dbs.rb.html) to see an example of how to use list_awr_dbs API.
    def list_awr_dbs(managed_database_id, opts = {})
      logger.debug 'Calling operation DbManagementClient#list_awr_dbs.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling list_awr_dbs." if managed_database_id.nil?

      if opts[:sort_by] && !%w[END_INTERVAL_TIME NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of END_INTERVAL_TIME, NAME.'
      end

      if opts[:sort_order] && !OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.'
      end
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)

      path = '/managedDatabases/{managedDatabaseId}/awrDbs'.sub('{managedDatabaseId}', managed_database_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:name] = opts[:name] if opts[:name]
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
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#list_awr_dbs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::AwrDbCollection'
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


    # Gets the list of consumer group privileges granted to a specific user.
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [String] user_name The name of the user whose details are to be viewed.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :name A filter to return only resources that match the entire name.
    # @option opts [String] :sort_by The field to sort information by. Only one sortOrder can be used. The default sort order
    #   for \u2018NAME\u2019 is ascending. The \u2018NAME\u2019 sort order is case-sensitive.
    #    (default to NAME)
    #   Allowed values are: NAME
    # @option opts [String] :sort_order The option to sort information in ascending (\u2018ASC\u2019) or descending (\u2018DESC\u2019) order. Ascending order is the default order. (default to ASC)
    # @option opts [Integer] :limit The maximum number of records returned in the paginated response. (default to 10)
    # @option opts [String] :page The page token representing the page from where the next set of paginated results
    #   are retrieved. This is usually retrieved from a previous list call.
    #
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::ConsumerGroupPrivilegeCollection ConsumerGroupPrivilegeCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/list_consumer_group_privileges.rb.html) to see an example of how to use list_consumer_group_privileges API.
    def list_consumer_group_privileges(managed_database_id, user_name, opts = {})
      logger.debug 'Calling operation DbManagementClient#list_consumer_group_privileges.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling list_consumer_group_privileges." if managed_database_id.nil?
      raise "Missing the required parameter 'user_name' when calling list_consumer_group_privileges." if user_name.nil?

      if opts[:sort_by] && !%w[NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of NAME.'
      end

      if opts[:sort_order] && !OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.'
      end
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)
      raise "Parameter value for 'user_name' must not be blank" if OCI::Internal::Util.blank_string?(user_name)

      path = '/managedDatabases/{managedDatabaseId}/users/{userName}/consumerGroupPrivileges'.sub('{managedDatabaseId}', managed_database_id.to_s).sub('{userName}', user_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#list_consumer_group_privileges') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::ConsumerGroupPrivilegeCollection'
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


    # Gets the list of containers for a specific user. This is only applicable if ALL_CONTAINERS !='Y'.
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [String] user_name The name of the user whose details are to be viewed.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :name A filter to return only resources that match the entire name.
    # @option opts [String] :sort_by The field to sort information by. Only one sortOrder can be used. The default sort order
    #   for \u2018NAME\u2019 is ascending. The \u2018NAME\u2019 sort order is case-sensitive.
    #    (default to NAME)
    #   Allowed values are: NAME
    # @option opts [String] :sort_order The option to sort information in ascending (\u2018ASC\u2019) or descending (\u2018DESC\u2019) order. Ascending order is the default order. (default to ASC)
    # @option opts [Integer] :limit The maximum number of records returned in the paginated response. (default to 10)
    # @option opts [String] :page The page token representing the page from where the next set of paginated results
    #   are retrieved. This is usually retrieved from a previous list call.
    #
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::DataAccessContainerCollection DataAccessContainerCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/list_data_access_containers.rb.html) to see an example of how to use list_data_access_containers API.
    def list_data_access_containers(managed_database_id, user_name, opts = {})
      logger.debug 'Calling operation DbManagementClient#list_data_access_containers.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling list_data_access_containers." if managed_database_id.nil?
      raise "Missing the required parameter 'user_name' when calling list_data_access_containers." if user_name.nil?

      if opts[:sort_by] && !%w[NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of NAME.'
      end

      if opts[:sort_order] && !OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.'
      end
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)
      raise "Parameter value for 'user_name' must not be blank" if OCI::Internal::Util.blank_string?(user_name)

      path = '/managedDatabases/{managedDatabaseId}/users/{userName}/dataAccessContainers'.sub('{managedDatabaseId}', managed_database_id.to_s).sub('{userName}', user_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#list_data_access_containers') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::DataAccessContainerCollection'
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


    # Gets the list of database parameters for the specified Managed Database. The parameters are listed in alphabetical order, along with their current values.
    #
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :source The source used to list database parameters. `CURRENT` is used to get the
    #   database parameters that are currently in effect for the database
    #   instance. `SPFILE` is used to list parameters from the server parameter
    #   file. Default is `CURRENT`.
    #    (default to CURRENT)
    #   Allowed values are: CURRENT, SPFILE
    # @option opts [String] :name A filter to return all parameters that have the text given in their names.
    #
    # @option opts [BOOLEAN] :is_allowed_values_included When true, results include a list of valid values for parameters (if applicable).
    #    (default to false)
    # @option opts [String] :sort_by The field to sort information by. Only one sortOrder can be used. The
    #   default sort order for `NAME` is ascending and it is case-sensitive.
    #    (default to NAME)
    #   Allowed values are: NAME
    # @option opts [String] :sort_order The option to sort information in ascending (\u2018ASC\u2019) or descending (\u2018DESC\u2019) order. Ascending order is the default order. (default to ASC)
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::DatabaseParametersCollection DatabaseParametersCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/list_database_parameters.rb.html) to see an example of how to use list_database_parameters API.
    def list_database_parameters(managed_database_id, opts = {})
      logger.debug 'Calling operation DbManagementClient#list_database_parameters.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling list_database_parameters." if managed_database_id.nil?

      if opts[:source] && !%w[CURRENT SPFILE].include?(opts[:source])
        raise 'Invalid value for "source", must be one of CURRENT, SPFILE.'
      end

      if opts[:sort_by] && !%w[NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of NAME.'
      end

      if opts[:sort_order] && !OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.'
      end
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)

      path = '/managedDatabases/{managedDatabaseId}/databaseParameters'.sub('{managedDatabaseId}', managed_database_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:source] = opts[:source] if opts[:source]
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:isAllowedValuesIncluded] = opts[:is_allowed_values_included] if !opts[:is_allowed_values_included].nil?
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#list_database_parameters') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::DatabaseParametersCollection'
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


    # Gets a list of Database Management private endpoints.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :name A filter to return only resources that match the entire name.
    # @option opts [String] :vcn_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the VCN.
    # @option opts [BOOLEAN] :is_cluster The option to filter Database Management private endpoints that can used for Oracle Databases in a cluster. This should be used along with the vcnId query parameter.
    #    (default to false)
    # @option opts [String] :lifecycle_state The lifecycle state of a resource.
    # @option opts [Integer] :limit The maximum number of records returned in the paginated response. (default to 10)
    # @option opts [String] :page The page token representing the page from where the next set of paginated results
    #   are retrieved. This is usually retrieved from a previous list call.
    #
    # @option opts [String] :sort_order The option to sort information in ascending (\u2018ASC\u2019) or descending (\u2018DESC\u2019) order. Ascending order is the default order. (default to ASC)
    # @option opts [String] :sort_by The field to sort information by. Only one sortOrder can be used. The default sort order
    #   for \u2018TIMECREATED\u2019 is descending and the default sort order for \u2018NAME\u2019 is ascending.
    #   The \u2018NAME\u2019 sort order is case-sensitive.
    #    (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, NAME
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::DbManagementPrivateEndpointCollection DbManagementPrivateEndpointCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/list_db_management_private_endpoints.rb.html) to see an example of how to use list_db_management_private_endpoints API.
    def list_db_management_private_endpoints(compartment_id, opts = {})
      logger.debug 'Calling operation DbManagementClient#list_db_management_private_endpoints.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_db_management_private_endpoints." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::DatabaseManagement::Models::LIFECYCLE_STATES_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DatabaseManagement::Models::LIFECYCLE_STATES_ENUM.'
      end

      if opts[:sort_order] && !OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.'
      end

      if opts[:sort_by] && !%w[TIMECREATED NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, NAME.'
      end

      path = '/dbManagementPrivateEndpoints'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:vcnId] = opts[:vcn_id] if opts[:vcn_id]
      query_params[:isCluster] = opts[:is_cluster] if !opts[:is_cluster].nil?
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#list_db_management_private_endpoints') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::DbManagementPrivateEndpointCollection'
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


    # Gets the job execution for a specific ID or the list of job executions for a job, job run, Managed Database or Managed Database Group
    # in a specific compartment. Only one of the parameters, ID, jobId, jobRunId, managedDatabaseId or managedDatabaseGroupId should be provided.
    # If none of these parameters is provided, all the job executions in the compartment are listed. Job executions can also be filtered
    # based on the name and status parameters.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :id The identifier of the resource.
    # @option opts [String] :job_id The identifier of the job.
    # @option opts [String] :managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @option opts [String] :managed_database_group_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database Group.
    # @option opts [String] :status The status of the job execution.
    # @option opts [String] :name A filter to return only resources that match the entire name.
    # @option opts [Integer] :limit The maximum number of records returned in the paginated response. (default to 10)
    # @option opts [String] :page The page token representing the page from where the next set of paginated results
    #   are retrieved. This is usually retrieved from a previous list call.
    #
    # @option opts [String] :sort_by The field to sort information by. Only one sortOrder can be used. The default sort order
    #   for \u2018TIMECREATED\u2019 is descending and the default sort order for \u2018NAME\u2019 is ascending.
    #   The \u2018NAME\u2019 sort order is case-sensitive.
    #    (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, NAME
    # @option opts [String] :sort_order The option to sort information in ascending (\u2018ASC\u2019) or descending (\u2018DESC\u2019) order. Ascending order is the default order. (default to ASC)
    # @option opts [String] :job_run_id The identifier of the job run.
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::JobExecutionCollection JobExecutionCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/list_job_executions.rb.html) to see an example of how to use list_job_executions API.
    def list_job_executions(compartment_id, opts = {})
      logger.debug 'Calling operation DbManagementClient#list_job_executions.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_job_executions." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, NAME.'
      end

      if opts[:sort_order] && !OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.'
      end

      path = '/jobExecutions'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:id] = opts[:id] if opts[:id]
      query_params[:jobId] = opts[:job_id] if opts[:job_id]
      query_params[:managedDatabaseId] = opts[:managed_database_id] if opts[:managed_database_id]
      query_params[:managedDatabaseGroupId] = opts[:managed_database_group_id] if opts[:managed_database_group_id]
      query_params[:status] = opts[:status] if opts[:status]
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:jobRunId] = opts[:job_run_id] if opts[:job_run_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#list_job_executions') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::JobExecutionCollection'
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


    # Gets the job run for a specific ID or the list of job runs for a job, Managed Database or Managed Database Group
    # in a specific compartment. Only one of the parameters, ID, jobId, managedDatabaseId, or managedDatabaseGroupId
    # should be provided. If none of these parameters is provided, all the job runs in the compartment are listed.
    # Job runs can also be filtered based on name and runStatus parameters.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :id The identifier of the resource.
    # @option opts [String] :job_id The identifier of the job.
    # @option opts [String] :managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @option opts [String] :managed_database_group_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database Group.
    # @option opts [String] :run_status The status of the job run.
    # @option opts [String] :name A filter to return only resources that match the entire name.
    # @option opts [Integer] :limit The maximum number of records returned in the paginated response. (default to 10)
    # @option opts [String] :page The page token representing the page from where the next set of paginated results
    #   are retrieved. This is usually retrieved from a previous list call.
    #
    # @option opts [String] :sort_by The field to sort information by. Only one sortOrder can be used. The default sort order
    #   for \u2018TIMECREATED\u2019 is descending and the default sort order for \u2018NAME\u2019 is ascending.
    #   The \u2018NAME\u2019 sort order is case-sensitive.
    #    (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, NAME
    # @option opts [String] :sort_order The option to sort information in ascending (\u2018ASC\u2019) or descending (\u2018DESC\u2019) order. Ascending order is the default order. (default to ASC)
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::JobRunCollection JobRunCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/list_job_runs.rb.html) to see an example of how to use list_job_runs API.
    def list_job_runs(compartment_id, opts = {})
      logger.debug 'Calling operation DbManagementClient#list_job_runs.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_job_runs." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, NAME.'
      end

      if opts[:sort_order] && !OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.'
      end

      path = '/jobRuns'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:id] = opts[:id] if opts[:id]
      query_params[:jobId] = opts[:job_id] if opts[:job_id]
      query_params[:managedDatabaseId] = opts[:managed_database_id] if opts[:managed_database_id]
      query_params[:managedDatabaseGroupId] = opts[:managed_database_group_id] if opts[:managed_database_group_id]
      query_params[:runStatus] = opts[:run_status] if opts[:run_status]
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#list_job_runs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::JobRunCollection'
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


    # Gets the job for a specific ID or the list of jobs for a Managed Database or Managed Database Group
    # in a specific compartment. Only one of the parameters, ID, managedDatabaseId or managedDatabaseGroupId,
    # should be provided. If none of these parameters is provided, all the jobs in the compartment are listed.
    # Jobs can also be filtered based on the name and lifecycleState parameters.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :id The identifier of the resource.
    # @option opts [String] :managed_database_group_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database Group.
    # @option opts [String] :managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @option opts [String] :name A filter to return only resources that match the entire name.
    # @option opts [String] :lifecycle_state The lifecycle state of the job.
    # @option opts [Integer] :limit The maximum number of records returned in the paginated response. (default to 10)
    # @option opts [String] :page The page token representing the page from where the next set of paginated results
    #   are retrieved. This is usually retrieved from a previous list call.
    #
    # @option opts [String] :sort_by The field to sort information by. Only one sortOrder can be used. The default sort order
    #   for \u2018TIMECREATED\u2019 is descending and the default sort order for \u2018NAME\u2019 is ascending.
    #   The \u2018NAME\u2019 sort order is case-sensitive.
    #    (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, NAME
    # @option opts [String] :sort_order The option to sort information in ascending (\u2018ASC\u2019) or descending (\u2018DESC\u2019) order. Ascending order is the default order. (default to ASC)
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::JobCollection JobCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/list_jobs.rb.html) to see an example of how to use list_jobs API.
    def list_jobs(compartment_id, opts = {})
      logger.debug 'Calling operation DbManagementClient#list_jobs.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_jobs." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::DatabaseManagement::Models::Job::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DatabaseManagement::Models::Job::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_by] && !%w[TIMECREATED NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, NAME.'
      end

      if opts[:sort_order] && !OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.'
      end

      path = '/jobs'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:id] = opts[:id] if opts[:id]
      query_params[:managedDatabaseGroupId] = opts[:managed_database_group_id] if opts[:managed_database_group_id]
      query_params[:managedDatabaseId] = opts[:managed_database_id] if opts[:managed_database_id]
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#list_jobs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::JobCollection'
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


    # Gets the Managed Database Group for a specific ID or the list of Managed Database Groups in
    # a specific compartment. Managed Database Groups can also be filtered based on the name parameter.
    # Only one of the parameters, ID or name should be provided. If none of these parameters is provided,
    # all the Managed Database Groups in the compartment are listed.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :id The identifier of the resource.
    # @option opts [String] :name A filter to return only resources that match the entire name.
    # @option opts [String] :lifecycle_state The lifecycle state of a resource.
    # @option opts [String] :page The page token representing the page from where the next set of paginated results
    #   are retrieved. This is usually retrieved from a previous list call.
    #
    # @option opts [Integer] :limit The maximum number of records returned in the paginated response. (default to 10)
    # @option opts [String] :sort_by The field to sort information by. Only one sortOrder can be used. The default sort order
    #   for \u2018TIMECREATED\u2019 is descending and the default sort order for \u2018NAME\u2019 is ascending.
    #   The \u2018NAME\u2019 sort order is case-sensitive.
    #    (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, NAME
    # @option opts [String] :sort_order The option to sort information in ascending (\u2018ASC\u2019) or descending (\u2018DESC\u2019) order. Ascending order is the default order. (default to ASC)
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::ManagedDatabaseGroupCollection ManagedDatabaseGroupCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/list_managed_database_groups.rb.html) to see an example of how to use list_managed_database_groups API.
    def list_managed_database_groups(compartment_id, opts = {})
      logger.debug 'Calling operation DbManagementClient#list_managed_database_groups.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_managed_database_groups." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::DatabaseManagement::Models::LIFECYCLE_STATES_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DatabaseManagement::Models::LIFECYCLE_STATES_ENUM.'
      end

      if opts[:sort_by] && !%w[TIMECREATED NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, NAME.'
      end

      if opts[:sort_order] && !OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.'
      end

      path = '/managedDatabaseGroups'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:id] = opts[:id] if opts[:id]
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#list_managed_database_groups') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::ManagedDatabaseGroupCollection'
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


    # Gets the Managed Database for a specific ID or the list of Managed Databases in a specific compartment.
    # Managed Databases can be filtered based on the name parameter. Only one of the parameters, ID or name
    # should be provided. If neither of these parameters is provided, all the Managed Databases in the compartment
    # are listed. Managed Databases can also be filtered based on the deployment type and management option.
    # If the deployment type is not specified or if it is `ONPREMISE`, then the management option is not
    # considered and Managed Databases with `ADVANCED` management option are listed.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :id The identifier of the resource.
    # @option opts [String] :name A filter to return only resources that match the entire name.
    # @option opts [String] :management_option A filter to return Managed Databases with the specified management option.
    # @option opts [String] :deployment_type A filter to return Managed Databases of the specified deployment type.
    # @option opts [String] :page The page token representing the page from where the next set of paginated results
    #   are retrieved. This is usually retrieved from a previous list call.
    #
    # @option opts [Integer] :limit The maximum number of records returned in the paginated response. (default to 10)
    # @option opts [String] :sort_by The field to sort information by. Only one sortOrder can be used. The default sort order
    #   for \u2018TIMECREATED\u2019 is descending and the default sort order for \u2018NAME\u2019 is ascending.
    #   The \u2018NAME\u2019 sort order is case-sensitive.
    #    (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, NAME
    # @option opts [String] :sort_order The option to sort information in ascending (\u2018ASC\u2019) or descending (\u2018DESC\u2019) order. Ascending order is the default order. (default to ASC)
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::ManagedDatabaseCollection ManagedDatabaseCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/list_managed_databases.rb.html) to see an example of how to use list_managed_databases API.
    def list_managed_databases(compartment_id, opts = {})
      logger.debug 'Calling operation DbManagementClient#list_managed_databases.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_managed_databases." if compartment_id.nil?

      if opts[:management_option] && !OCI::DatabaseManagement::Models::MANAGEMENT_OPTION_ENUM.include?(opts[:management_option])
        raise 'Invalid value for "management_option", must be one of the values in OCI::DatabaseManagement::Models::MANAGEMENT_OPTION_ENUM.'
      end

      if opts[:deployment_type] && !OCI::DatabaseManagement::Models::DEPLOYMENT_TYPE_ENUM.include?(opts[:deployment_type])
        raise 'Invalid value for "deployment_type", must be one of the values in OCI::DatabaseManagement::Models::DEPLOYMENT_TYPE_ENUM.'
      end

      if opts[:sort_by] && !%w[TIMECREATED NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, NAME.'
      end

      if opts[:sort_order] && !OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.'
      end

      path = '/managedDatabases'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:id] = opts[:id] if opts[:id]
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:managementOption] = opts[:management_option] if opts[:management_option]
      query_params[:deploymentType] = opts[:deployment_type] if opts[:deployment_type]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#list_managed_databases') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::ManagedDatabaseCollection'
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


    # Gets the list of object privileges granted to a specific user.
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [String] user_name The name of the user whose details are to be viewed.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :name A filter to return only resources that match the entire name.
    # @option opts [String] :sort_by The field to sort information by. Only one sortOrder can be used. The default sort order
    #   for \u2018NAME\u2019 is ascending. The \u2018NAME\u2019 sort order is case-sensitive.
    #    (default to NAME)
    #   Allowed values are: NAME
    # @option opts [String] :sort_order The option to sort information in ascending (\u2018ASC\u2019) or descending (\u2018DESC\u2019) order. Ascending order is the default order. (default to ASC)
    # @option opts [Integer] :limit The maximum number of records returned in the paginated response. (default to 10)
    # @option opts [String] :page The page token representing the page from where the next set of paginated results
    #   are retrieved. This is usually retrieved from a previous list call.
    #
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::ObjectPrivilegeCollection ObjectPrivilegeCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/list_object_privileges.rb.html) to see an example of how to use list_object_privileges API.
    def list_object_privileges(managed_database_id, user_name, opts = {})
      logger.debug 'Calling operation DbManagementClient#list_object_privileges.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling list_object_privileges." if managed_database_id.nil?
      raise "Missing the required parameter 'user_name' when calling list_object_privileges." if user_name.nil?

      if opts[:sort_by] && !%w[NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of NAME.'
      end

      if opts[:sort_order] && !OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.'
      end
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)
      raise "Parameter value for 'user_name' must not be blank" if OCI::Internal::Util.blank_string?(user_name)

      path = '/managedDatabases/{managedDatabaseId}/users/{userName}/objectPrivileges'.sub('{managedDatabaseId}', managed_database_id.to_s).sub('{userName}', user_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#list_object_privileges') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::ObjectPrivilegeCollection'
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


    # Gets the list of users on whose behalf the current user acts as proxy.
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [String] user_name The name of the user whose details are to be viewed.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :name A filter to return only resources that match the entire name.
    # @option opts [String] :sort_by The field to sort information by. Only one sortOrder can be used. The default sort order
    #   for \u2018NAME\u2019 is ascending. The \u2018NAME\u2019 sort order is case-sensitive.
    #    (default to NAME)
    #   Allowed values are: NAME
    # @option opts [String] :sort_order The option to sort information in ascending (\u2018ASC\u2019) or descending (\u2018DESC\u2019) order. Ascending order is the default order. (default to ASC)
    # @option opts [Integer] :limit The maximum number of records returned in the paginated response. (default to 10)
    # @option opts [String] :page The page token representing the page from where the next set of paginated results
    #   are retrieved. This is usually retrieved from a previous list call.
    #
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::ProxiedForUserCollection ProxiedForUserCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/list_proxied_for_users.rb.html) to see an example of how to use list_proxied_for_users API.
    def list_proxied_for_users(managed_database_id, user_name, opts = {})
      logger.debug 'Calling operation DbManagementClient#list_proxied_for_users.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling list_proxied_for_users." if managed_database_id.nil?
      raise "Missing the required parameter 'user_name' when calling list_proxied_for_users." if user_name.nil?

      if opts[:sort_by] && !%w[NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of NAME.'
      end

      if opts[:sort_order] && !OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.'
      end
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)
      raise "Parameter value for 'user_name' must not be blank" if OCI::Internal::Util.blank_string?(user_name)

      path = '/managedDatabases/{managedDatabaseId}/users/{userName}/proxiedForUsers'.sub('{managedDatabaseId}', managed_database_id.to_s).sub('{userName}', user_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#list_proxied_for_users') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::ProxiedForUserCollection'
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


    # Gets the list of proxy users for the current user.
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [String] user_name The name of the user whose details are to be viewed.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :name A filter to return only resources that match the entire name.
    # @option opts [String] :sort_by The field to sort information by. Only one sortOrder can be used. The default sort order
    #   for \u2018NAME\u2019 is ascending. The \u2018NAME\u2019 sort order is case-sensitive.
    #    (default to NAME)
    #   Allowed values are: NAME
    # @option opts [String] :sort_order The option to sort information in ascending (\u2018ASC\u2019) or descending (\u2018DESC\u2019) order. Ascending order is the default order. (default to ASC)
    # @option opts [Integer] :limit The maximum number of records returned in the paginated response. (default to 10)
    # @option opts [String] :page The page token representing the page from where the next set of paginated results
    #   are retrieved. This is usually retrieved from a previous list call.
    #
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::ProxyUserCollection ProxyUserCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/list_proxy_users.rb.html) to see an example of how to use list_proxy_users API.
    def list_proxy_users(managed_database_id, user_name, opts = {})
      logger.debug 'Calling operation DbManagementClient#list_proxy_users.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling list_proxy_users." if managed_database_id.nil?
      raise "Missing the required parameter 'user_name' when calling list_proxy_users." if user_name.nil?

      if opts[:sort_by] && !%w[NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of NAME.'
      end

      if opts[:sort_order] && !OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.'
      end
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)
      raise "Parameter value for 'user_name' must not be blank" if OCI::Internal::Util.blank_string?(user_name)

      path = '/managedDatabases/{managedDatabaseId}/users/{userName}/proxyUsers'.sub('{managedDatabaseId}', managed_database_id.to_s).sub('{userName}', user_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#list_proxy_users') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::ProxyUserCollection'
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


    # Gets the list of roles granted to a specific user.
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [String] user_name The name of the user whose details are to be viewed.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :name A filter to return only resources that match the entire name.
    # @option opts [String] :sort_by The field to sort information by. Only one sortOrder can be used. The default sort order
    #   for \u2018NAME\u2019 is ascending. The \u2018NAME\u2019 sort order is case-sensitive.
    #    (default to NAME)
    #   Allowed values are: NAME
    # @option opts [String] :sort_order The option to sort information in ascending (\u2018ASC\u2019) or descending (\u2018DESC\u2019) order. Ascending order is the default order. (default to ASC)
    # @option opts [Integer] :limit The maximum number of records returned in the paginated response. (default to 10)
    # @option opts [String] :page The page token representing the page from where the next set of paginated results
    #   are retrieved. This is usually retrieved from a previous list call.
    #
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::RoleCollection RoleCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/list_roles.rb.html) to see an example of how to use list_roles API.
    def list_roles(managed_database_id, user_name, opts = {})
      logger.debug 'Calling operation DbManagementClient#list_roles.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling list_roles." if managed_database_id.nil?
      raise "Missing the required parameter 'user_name' when calling list_roles." if user_name.nil?

      if opts[:sort_by] && !%w[NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of NAME.'
      end

      if opts[:sort_order] && !OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.'
      end
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)
      raise "Parameter value for 'user_name' must not be blank" if OCI::Internal::Util.blank_string?(user_name)

      path = '/managedDatabases/{managedDatabaseId}/users/{userName}/roles'.sub('{managedDatabaseId}', managed_database_id.to_s).sub('{userName}', user_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#list_roles') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::RoleCollection'
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


    # Gets the list of system privileges granted to a specific user.
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [String] user_name The name of the user whose details are to be viewed.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :name A filter to return only resources that match the entire name.
    # @option opts [String] :sort_by The field to sort information by. Only one sortOrder can be used. The default sort order
    #   for \u2018NAME\u2019 is ascending. The \u2018NAME\u2019 sort order is case-sensitive.
    #    (default to NAME)
    #   Allowed values are: NAME
    # @option opts [String] :sort_order The option to sort information in ascending (\u2018ASC\u2019) or descending (\u2018DESC\u2019) order. Ascending order is the default order. (default to ASC)
    # @option opts [Integer] :limit The maximum number of records returned in the paginated response. (default to 10)
    # @option opts [String] :page The page token representing the page from where the next set of paginated results
    #   are retrieved. This is usually retrieved from a previous list call.
    #
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::SystemPrivilegeCollection SystemPrivilegeCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/list_system_privileges.rb.html) to see an example of how to use list_system_privileges API.
    def list_system_privileges(managed_database_id, user_name, opts = {})
      logger.debug 'Calling operation DbManagementClient#list_system_privileges.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling list_system_privileges." if managed_database_id.nil?
      raise "Missing the required parameter 'user_name' when calling list_system_privileges." if user_name.nil?

      if opts[:sort_by] && !%w[NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of NAME.'
      end

      if opts[:sort_order] && !OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.'
      end
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)
      raise "Parameter value for 'user_name' must not be blank" if OCI::Internal::Util.blank_string?(user_name)

      path = '/managedDatabases/{managedDatabaseId}/users/{userName}/systemPrivileges'.sub('{managedDatabaseId}', managed_database_id.to_s).sub('{userName}', user_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#list_system_privileges') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::SystemPrivilegeCollection'
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


    # Gets the list of tablespaces for the specified managedDatabaseId.
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :name A filter to return only resources that match the entire name.
    # @option opts [String] :sort_by The field to sort information by. Only one sortOrder can be used. The default sort order
    #   for \u2018TIMECREATED\u2019 is descending and the default sort order for \u2018NAME\u2019 is ascending.
    #   The \u2018NAME\u2019 sort order is case-sensitive.
    #    (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, NAME
    # @option opts [String] :sort_order The option to sort information in ascending (\u2018ASC\u2019) or descending (\u2018DESC\u2019) order. Ascending order is the default order. (default to ASC)
    # @option opts [String] :page The page token representing the page from where the next set of paginated results
    #   are retrieved. This is usually retrieved from a previous list call.
    #
    # @option opts [Integer] :limit The maximum number of records returned in the paginated response. (default to 10)
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::TablespaceCollection TablespaceCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/list_tablespaces.rb.html) to see an example of how to use list_tablespaces API.
    def list_tablespaces(managed_database_id, opts = {})
      logger.debug 'Calling operation DbManagementClient#list_tablespaces.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling list_tablespaces." if managed_database_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, NAME.'
      end

      if opts[:sort_order] && !OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.'
      end
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)

      path = '/managedDatabases/{managedDatabaseId}/tablespaces'.sub('{managedDatabaseId}', managed_database_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:name] = opts[:name] if opts[:name]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#list_tablespaces') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::TablespaceCollection'
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


    # Gets the list of users for the specified managedDatabaseId.
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :name A filter to return only resources that match the entire name.
    # @option opts [String] :sort_by The field to sort information by. Only one sortOrder can be used. The default sort order
    #   for \u2018TIMECREATED\u2019 is descending and the default sort order for \u2018NAME\u2019 is ascending.
    #   The \u2018NAME\u2019 sort order is case-sensitive.
    #    (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, NAME
    # @option opts [String] :sort_order The option to sort information in ascending (\u2018ASC\u2019) or descending (\u2018DESC\u2019) order. Ascending order is the default order. (default to ASC)
    # @option opts [Integer] :limit The maximum number of records returned in the paginated response. (default to 10)
    # @option opts [String] :page The page token representing the page from where the next set of paginated results
    #   are retrieved. This is usually retrieved from a previous list call.
    #
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::UserCollection UserCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/list_users.rb.html) to see an example of how to use list_users API.
    def list_users(managed_database_id, opts = {})
      logger.debug 'Calling operation DbManagementClient#list_users.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling list_users." if managed_database_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, NAME.'
      end

      if opts[:sort_order] && !OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.'
      end
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)

      path = '/managedDatabases/{managedDatabaseId}/users'.sub('{managedDatabaseId}', managed_database_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#list_users') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::UserCollection'
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


    # Returns a paginated list of errors for a given work request.
    #
    # @param [String] work_request_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the asynchronous work request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :page The page token representing the page from where the next set of paginated results
    #   are retrieved. This is usually retrieved from a previous list call.
    #
    # @option opts [Integer] :limit The maximum number of records returned in the paginated response. (default to 10)
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided and the default order for timeAccepted is descending.
    #    (default to timeAccepted)
    #   Allowed values are: timeAccepted
    # @option opts [String] :sort_order The option to sort information in ascending (\u2018ASC\u2019) or descending (\u2018DESC\u2019) order. Ascending order is the default order. (default to ASC)
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::WorkRequestErrorCollection WorkRequestErrorCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/list_work_request_errors.rb.html) to see an example of how to use list_work_request_errors API.
    def list_work_request_errors(work_request_id, opts = {})
      logger.debug 'Calling operation DbManagementClient#list_work_request_errors.' if logger

      raise "Missing the required parameter 'work_request_id' when calling list_work_request_errors." if work_request_id.nil?

      if opts[:sort_by] && !%w[timeAccepted].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeAccepted.'
      end

      if opts[:sort_order] && !OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.'
      end
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/workRequests/{workRequestId}/errors'.sub('{workRequestId}', work_request_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#list_work_request_errors') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::WorkRequestErrorCollection'
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


    # Returns a paginated list of logs for a given work request.
    #
    # @param [String] work_request_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the asynchronous work request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :page The page token representing the page from where the next set of paginated results
    #   are retrieved. This is usually retrieved from a previous list call.
    #
    # @option opts [Integer] :limit The maximum number of records returned in the paginated response. (default to 10)
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided and the default order for timeAccepted is descending.
    #    (default to timeAccepted)
    #   Allowed values are: timeAccepted
    # @option opts [String] :sort_order The option to sort information in ascending (\u2018ASC\u2019) or descending (\u2018DESC\u2019) order. Ascending order is the default order. (default to ASC)
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::WorkRequestLogEntryCollection WorkRequestLogEntryCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/list_work_request_logs.rb.html) to see an example of how to use list_work_request_logs API.
    def list_work_request_logs(work_request_id, opts = {})
      logger.debug 'Calling operation DbManagementClient#list_work_request_logs.' if logger

      raise "Missing the required parameter 'work_request_id' when calling list_work_request_logs." if work_request_id.nil?

      if opts[:sort_by] && !%w[timeAccepted].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeAccepted.'
      end

      if opts[:sort_order] && !OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.'
      end
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/workRequests/{workRequestId}/logs'.sub('{workRequestId}', work_request_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#list_work_request_logs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::WorkRequestLogEntryCollection'
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


    # The list of work requests in a specific compartment was retrieved successfully.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :resource_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the resource affected by the work request.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :work_request_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the asynchronous work request.
    # @option opts [String] :status A filter that returns the resources whose status matches the given WorkRequestStatus.
    # @option opts [String] :sort_order The option to sort information in ascending (\u2018ASC\u2019) or descending (\u2018DESC\u2019) order. Ascending order is the default order. (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided and the default order for timeAccepted is descending.
    #    (default to timeAccepted)
    #   Allowed values are: timeAccepted
    # @option opts [String] :page The page token representing the page from where the next set of paginated results
    #   are retrieved. This is usually retrieved from a previous list call.
    #
    # @option opts [Integer] :limit The maximum number of records returned in the paginated response. (default to 10)
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::WorkRequestCollection WorkRequestCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/list_work_requests.rb.html) to see an example of how to use list_work_requests API.
    def list_work_requests(compartment_id, opts = {})
      logger.debug 'Calling operation DbManagementClient#list_work_requests.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_work_requests." if compartment_id.nil?

      if opts[:status] && !OCI::DatabaseManagement::Models::WORK_REQUEST_STATUS_ENUM.include?(opts[:status])
        raise 'Invalid value for "status", must be one of the values in OCI::DatabaseManagement::Models::WORK_REQUEST_STATUS_ENUM.'
      end

      if opts[:sort_order] && !OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.'
      end

      if opts[:sort_by] && !%w[timeAccepted].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeAccepted.'
      end

      path = '/workRequests'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:resourceId] = opts[:resource_id] if opts[:resource_id]
      query_params[:workRequestId] = opts[:work_request_id] if opts[:work_request_id]
      query_params[:status] = opts[:status] if opts[:status]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#list_work_requests') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::WorkRequestCollection'
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


    # Removes a data file or temp file from the tablespace.
    #
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [String] tablespace_name The name of the tablespace.
    # @param [OCI::DatabaseManagement::Models::RemoveDataFileDetails] remove_data_file_details The details required to remove a data file or temp file from the tablespace.
    #
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
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::TablespaceAdminStatus TablespaceAdminStatus}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/remove_data_file.rb.html) to see an example of how to use remove_data_file API.
    def remove_data_file(managed_database_id, tablespace_name, remove_data_file_details, opts = {})
      logger.debug 'Calling operation DbManagementClient#remove_data_file.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling remove_data_file." if managed_database_id.nil?
      raise "Missing the required parameter 'tablespace_name' when calling remove_data_file." if tablespace_name.nil?
      raise "Missing the required parameter 'remove_data_file_details' when calling remove_data_file." if remove_data_file_details.nil?
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)
      raise "Parameter value for 'tablespace_name' must not be blank" if OCI::Internal::Util.blank_string?(tablespace_name)

      path = '/managedDatabases/{managedDatabaseId}/tablespaces/{tablespaceName}/actions/removeDataFile'.sub('{managedDatabaseId}', managed_database_id.to_s).sub('{tablespaceName}', tablespace_name.to_s)
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

      post_body = @api_client.object_to_http_body(remove_data_file_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#remove_data_file') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::TablespaceAdminStatus'
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


    # Removes a Managed Database from a Managed Database Group. Any management
    # activities that are currently running on this database will continue to
    # run to completion. However, any activities scheduled to run in the future
    # will not be performed on this database.
    #
    # @param [String] managed_database_group_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database Group.
    # @param [OCI::DatabaseManagement::Models::RemoveManagedDatabaseFromManagedDatabaseGroupDetails] remove_managed_database_from_managed_database_group_details The Managed Database details required to remove the Managed Database from a Managed Database Group.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/remove_managed_database_from_managed_database_group.rb.html) to see an example of how to use remove_managed_database_from_managed_database_group API.
    def remove_managed_database_from_managed_database_group(managed_database_group_id, remove_managed_database_from_managed_database_group_details, opts = {})
      logger.debug 'Calling operation DbManagementClient#remove_managed_database_from_managed_database_group.' if logger

      raise "Missing the required parameter 'managed_database_group_id' when calling remove_managed_database_from_managed_database_group." if managed_database_group_id.nil?
      raise "Missing the required parameter 'remove_managed_database_from_managed_database_group_details' when calling remove_managed_database_from_managed_database_group." if remove_managed_database_from_managed_database_group_details.nil?
      raise "Parameter value for 'managed_database_group_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_group_id)

      path = '/managedDatabaseGroups/{managedDatabaseGroupId}/actions/removeManagedDatabase'.sub('{managedDatabaseGroupId}', managed_database_group_id.to_s)
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

      post_body = @api_client.object_to_http_body(remove_managed_database_from_managed_database_group_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#remove_managed_database_from_managed_database_group') do
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


    # Resets database parameter values to their default or startup values.
    #
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [OCI::DatabaseManagement::Models::ResetDatabaseParametersDetails] reset_database_parameters_details The details required to reset database parameters.
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
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::UpdateDatabaseParametersResult UpdateDatabaseParametersResult}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/reset_database_parameters.rb.html) to see an example of how to use reset_database_parameters API.
    def reset_database_parameters(managed_database_id, reset_database_parameters_details, opts = {})
      logger.debug 'Calling operation DbManagementClient#reset_database_parameters.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling reset_database_parameters." if managed_database_id.nil?
      raise "Missing the required parameter 'reset_database_parameters_details' when calling reset_database_parameters." if reset_database_parameters_details.nil?
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)

      path = '/managedDatabases/{managedDatabaseId}/actions/resetDatabaseParameters'.sub('{managedDatabaseId}', managed_database_id.to_s)
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

      post_body = @api_client.object_to_http_body(reset_database_parameters_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#reset_database_parameters') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::UpdateDatabaseParametersResult'
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


    # Resizes a data file or temp file within the tablespace.
    #
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [String] tablespace_name The name of the tablespace.
    # @param [OCI::DatabaseManagement::Models::ResizeDataFileDetails] resize_data_file_details The details required to resize a data file or temp file within the tablespace.
    #
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
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::TablespaceAdminStatus TablespaceAdminStatus}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/resize_data_file.rb.html) to see an example of how to use resize_data_file API.
    def resize_data_file(managed_database_id, tablespace_name, resize_data_file_details, opts = {})
      logger.debug 'Calling operation DbManagementClient#resize_data_file.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling resize_data_file." if managed_database_id.nil?
      raise "Missing the required parameter 'tablespace_name' when calling resize_data_file." if tablespace_name.nil?
      raise "Missing the required parameter 'resize_data_file_details' when calling resize_data_file." if resize_data_file_details.nil?
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)
      raise "Parameter value for 'tablespace_name' must not be blank" if OCI::Internal::Util.blank_string?(tablespace_name)

      path = '/managedDatabases/{managedDatabaseId}/tablespaces/{tablespaceName}/actions/resizeDataFile'.sub('{managedDatabaseId}', managed_database_id.to_s).sub('{tablespaceName}', tablespace_name.to_s)
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

      post_body = @api_client.object_to_http_body(resize_data_file_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#resize_data_file') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::TablespaceAdminStatus'
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


    # Creates and executes a historic ADDM task using the specified AWR snapshot IDs. If an existing ADDM task
    # uses the provided awr snapshot IDs, the existing task will be returned.
    #
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [OCI::DatabaseManagement::Models::RunHistoricAddmDetails] run_historic_addm_details The details of the ADDM task, which include the beginning and ending AWR snapshot IDs.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::HistoricAddmResult HistoricAddmResult}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/run_historic_addm.rb.html) to see an example of how to use run_historic_addm API.
    def run_historic_addm(managed_database_id, run_historic_addm_details, opts = {})
      logger.debug 'Calling operation DbManagementClient#run_historic_addm.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling run_historic_addm." if managed_database_id.nil?
      raise "Missing the required parameter 'run_historic_addm_details' when calling run_historic_addm." if run_historic_addm_details.nil?
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)

      path = '/managedDatabases/{managedDatabaseId}/actions/runHistoricAddm'.sub('{managedDatabaseId}', managed_database_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(run_historic_addm_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#run_historic_addm') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::HistoricAddmResult'
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


    # Summarizes the AWR CPU resource limits and metrics for the specified database in AWR.
    #
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [String] awr_db_id The parameter to filter the database by internal ID.
    #   Note that the internal ID of the database can be retrieved from the following endpoint:
    #   /managedDatabases/{managedDatabaseId}/awrDbs
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :inst_num The optional single value query parameter to filter the database instance number.
    # @option opts [Integer] :begin_sn_id_greater_than_or_equal_to The optional greater than or equal to filter on the snapshot ID.
    # @option opts [Integer] :end_sn_id_less_than_or_equal_to The optional less than or equal to query parameter to filter the snapshot ID.
    # @option opts [DateTime] :time_greater_than_or_equal_to The optional greater than or equal to query parameter to filter the timestamp.
    # @option opts [DateTime] :time_less_than_or_equal_to The optional less than or equal to query parameter to filter the timestamp.
    # @option opts [String] :session_type The optional query parameter to filter ASH activities by FOREGROUND or BACKGROUND. (default to FOREGROUND)
    #   Allowed values are: FOREGROUND, BACKGROUND, ALL
    # @option opts [Integer] :container_id The optional query parameter to filter the database container by an exact ID value.
    #   Note that the database container ID can be retrieved from the following endpoint:
    #   /managedDatabases/{managedDatabaseId}/awrDbSnapshotRanges
    #
    # @option opts [String] :page The page token representing the page from where the next set of paginated results
    #   are retrieved. This is usually retrieved from a previous list call.
    #
    # @option opts [Integer] :limit The maximum number of records returned in large paginated response. (default to 1000)
    # @option opts [String] :sort_by The option to sort the AWR CPU usage summary data. (default to TIME_SAMPLED)
    #   Allowed values are: TIME_SAMPLED, AVG_VALUE
    # @option opts [String] :sort_order The option to sort information in ascending (\u2018ASC\u2019) or descending (\u2018DESC\u2019) order. Descending order is the default order. (default to DESC)
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::AwrDbCpuUsageCollection AwrDbCpuUsageCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/summarize_awr_db_cpu_usages.rb.html) to see an example of how to use summarize_awr_db_cpu_usages API.
    def summarize_awr_db_cpu_usages(managed_database_id, awr_db_id, opts = {})
      logger.debug 'Calling operation DbManagementClient#summarize_awr_db_cpu_usages.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling summarize_awr_db_cpu_usages." if managed_database_id.nil?
      raise "Missing the required parameter 'awr_db_id' when calling summarize_awr_db_cpu_usages." if awr_db_id.nil?

      if opts[:session_type] && !%w[FOREGROUND BACKGROUND ALL].include?(opts[:session_type])
        raise 'Invalid value for "session_type", must be one of FOREGROUND, BACKGROUND, ALL.'
      end

      if opts[:sort_by] && !%w[TIME_SAMPLED AVG_VALUE].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIME_SAMPLED, AVG_VALUE.'
      end

      if opts[:sort_order] && !OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.'
      end
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)
      raise "Parameter value for 'awr_db_id' must not be blank" if OCI::Internal::Util.blank_string?(awr_db_id)

      path = '/managedDatabases/{managedDatabaseId}/awrDbs/{awrDbId}/awrDbCpuUsages'.sub('{managedDatabaseId}', managed_database_id.to_s).sub('{awrDbId}', awr_db_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:instNum] = opts[:inst_num] if opts[:inst_num]
      query_params[:beginSnIdGreaterThanOrEqualTo] = opts[:begin_sn_id_greater_than_or_equal_to] if opts[:begin_sn_id_greater_than_or_equal_to]
      query_params[:endSnIdLessThanOrEqualTo] = opts[:end_sn_id_less_than_or_equal_to] if opts[:end_sn_id_less_than_or_equal_to]
      query_params[:timeGreaterThanOrEqualTo] = opts[:time_greater_than_or_equal_to] if opts[:time_greater_than_or_equal_to]
      query_params[:timeLessThanOrEqualTo] = opts[:time_less_than_or_equal_to] if opts[:time_less_than_or_equal_to]
      query_params[:sessionType] = opts[:session_type] if opts[:session_type]
      query_params[:containerId] = opts[:container_id] if opts[:container_id]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#summarize_awr_db_cpu_usages') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::AwrDbCpuUsageCollection'
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


    # Summarizes the metric samples for the specified database in the AWR. The metric samples are summarized based on the Time dimension for each metric.
    #
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [String] awr_db_id The parameter to filter the database by internal ID.
    #   Note that the internal ID of the database can be retrieved from the following endpoint:
    #   /managedDatabases/{managedDatabaseId}/awrDbs
    #
    # @param [Array<String>] name The required multiple value query parameter to filter the entity name.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :inst_num The optional single value query parameter to filter the database instance number.
    # @option opts [Integer] :begin_sn_id_greater_than_or_equal_to The optional greater than or equal to filter on the snapshot ID.
    # @option opts [Integer] :end_sn_id_less_than_or_equal_to The optional less than or equal to query parameter to filter the snapshot ID.
    # @option opts [DateTime] :time_greater_than_or_equal_to The optional greater than or equal to query parameter to filter the timestamp.
    # @option opts [DateTime] :time_less_than_or_equal_to The optional less than or equal to query parameter to filter the timestamp.
    # @option opts [Integer] :container_id The optional query parameter to filter the database container by an exact ID value.
    #   Note that the database container ID can be retrieved from the following endpoint:
    #   /managedDatabases/{managedDatabaseId}/awrDbSnapshotRanges
    #
    # @option opts [String] :page The page token representing the page from where the next set of paginated results
    #   are retrieved. This is usually retrieved from a previous list call.
    #
    # @option opts [Integer] :limit The maximum number of records returned in large paginated response. (default to 1000)
    # @option opts [String] :sort_by The option to sort the AWR time series summary data. (default to TIMESTAMP)
    #   Allowed values are: TIMESTAMP, NAME
    # @option opts [String] :sort_order The option to sort information in ascending (\u2018ASC\u2019) or descending (\u2018DESC\u2019) order. Descending order is the default order. (default to DESC)
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::AwrDbMetricCollection AwrDbMetricCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/summarize_awr_db_metrics.rb.html) to see an example of how to use summarize_awr_db_metrics API.
    def summarize_awr_db_metrics(managed_database_id, awr_db_id, name, opts = {})
      logger.debug 'Calling operation DbManagementClient#summarize_awr_db_metrics.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling summarize_awr_db_metrics." if managed_database_id.nil?
      raise "Missing the required parameter 'awr_db_id' when calling summarize_awr_db_metrics." if awr_db_id.nil?
      raise "Missing the required parameter 'name' when calling summarize_awr_db_metrics." if name.nil?

      if opts[:sort_by] && !%w[TIMESTAMP NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMESTAMP, NAME.'
      end

      if opts[:sort_order] && !OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.'
      end
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)
      raise "Parameter value for 'awr_db_id' must not be blank" if OCI::Internal::Util.blank_string?(awr_db_id)

      path = '/managedDatabases/{managedDatabaseId}/awrDbs/{awrDbId}/awrDbMetrics'.sub('{managedDatabaseId}', managed_database_id.to_s).sub('{awrDbId}', awr_db_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:name] = OCI::ApiClient.build_collection_params(name, :multi)
      query_params[:instNum] = opts[:inst_num] if opts[:inst_num]
      query_params[:beginSnIdGreaterThanOrEqualTo] = opts[:begin_sn_id_greater_than_or_equal_to] if opts[:begin_sn_id_greater_than_or_equal_to]
      query_params[:endSnIdLessThanOrEqualTo] = opts[:end_sn_id_less_than_or_equal_to] if opts[:end_sn_id_less_than_or_equal_to]
      query_params[:timeGreaterThanOrEqualTo] = opts[:time_greater_than_or_equal_to] if opts[:time_greater_than_or_equal_to]
      query_params[:timeLessThanOrEqualTo] = opts[:time_less_than_or_equal_to] if opts[:time_less_than_or_equal_to]
      query_params[:containerId] = opts[:container_id] if opts[:container_id]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#summarize_awr_db_metrics') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::AwrDbMetricCollection'
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


    # Summarizes the database parameter change history for one database parameter of the specified database in AWR. One change history record contains
    # the previous value, the changed value, and the corresponding time range. If the database parameter value was changed multiple times within the time range, then multiple change history records are created for the same parameter.
    # Note that this API only returns information on change history details for one database parameter.
    # To get a list of all the database parameters whose values were changed during a specified time range, use the following API endpoint:
    # /managedDatabases/{managedDatabaseId}/awrDbs/{awrDbId}/awrDbParameters
    #
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [String] awr_db_id The parameter to filter the database by internal ID.
    #   Note that the internal ID of the database can be retrieved from the following endpoint:
    #   /managedDatabases/{managedDatabaseId}/awrDbs
    #
    # @param [String] name The required single value query parameter to filter the entity name.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :inst_num The optional single value query parameter to filter the database instance number.
    # @option opts [Integer] :begin_sn_id_greater_than_or_equal_to The optional greater than or equal to filter on the snapshot ID.
    # @option opts [Integer] :end_sn_id_less_than_or_equal_to The optional less than or equal to query parameter to filter the snapshot ID.
    # @option opts [DateTime] :time_greater_than_or_equal_to The optional greater than or equal to query parameter to filter the timestamp.
    # @option opts [DateTime] :time_less_than_or_equal_to The optional less than or equal to query parameter to filter the timestamp.
    # @option opts [Integer] :container_id The optional query parameter to filter the database container by an exact ID value.
    #   Note that the database container ID can be retrieved from the following endpoint:
    #   /managedDatabases/{managedDatabaseId}/awrDbSnapshotRanges
    #
    # @option opts [String] :page The page token representing the page from where the next set of paginated results
    #   are retrieved. This is usually retrieved from a previous list call.
    #
    # @option opts [Integer] :limit The maximum number of records returned in large paginated response. (default to 1000)
    # @option opts [String] :sort_by The option to sort the AWR database parameter change history data. (default to IS_CHANGED)
    #   Allowed values are: IS_CHANGED, NAME
    # @option opts [String] :sort_order The option to sort information in ascending (\u2018ASC\u2019) or descending (\u2018DESC\u2019) order. Descending order is the default order. (default to DESC)
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::AwrDbParameterChangeCollection AwrDbParameterChangeCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/summarize_awr_db_parameter_changes.rb.html) to see an example of how to use summarize_awr_db_parameter_changes API.
    def summarize_awr_db_parameter_changes(managed_database_id, awr_db_id, name, opts = {})
      logger.debug 'Calling operation DbManagementClient#summarize_awr_db_parameter_changes.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling summarize_awr_db_parameter_changes." if managed_database_id.nil?
      raise "Missing the required parameter 'awr_db_id' when calling summarize_awr_db_parameter_changes." if awr_db_id.nil?
      raise "Missing the required parameter 'name' when calling summarize_awr_db_parameter_changes." if name.nil?

      if opts[:sort_by] && !%w[IS_CHANGED NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of IS_CHANGED, NAME.'
      end

      if opts[:sort_order] && !OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.'
      end
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)
      raise "Parameter value for 'awr_db_id' must not be blank" if OCI::Internal::Util.blank_string?(awr_db_id)

      path = '/managedDatabases/{managedDatabaseId}/awrDbs/{awrDbId}/awrDbParameterChanges'.sub('{managedDatabaseId}', managed_database_id.to_s).sub('{awrDbId}', awr_db_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:name] = name
      query_params[:instNum] = opts[:inst_num] if opts[:inst_num]
      query_params[:beginSnIdGreaterThanOrEqualTo] = opts[:begin_sn_id_greater_than_or_equal_to] if opts[:begin_sn_id_greater_than_or_equal_to]
      query_params[:endSnIdLessThanOrEqualTo] = opts[:end_sn_id_less_than_or_equal_to] if opts[:end_sn_id_less_than_or_equal_to]
      query_params[:timeGreaterThanOrEqualTo] = opts[:time_greater_than_or_equal_to] if opts[:time_greater_than_or_equal_to]
      query_params[:timeLessThanOrEqualTo] = opts[:time_less_than_or_equal_to] if opts[:time_less_than_or_equal_to]
      query_params[:containerId] = opts[:container_id] if opts[:container_id]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#summarize_awr_db_parameter_changes') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::AwrDbParameterChangeCollection'
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


    # Summarizes the database parameter history for the specified database in AWR. This includes the list of database
    # parameters, with information on whether the parameter values were modified within the query time range. Note that
    # each database parameter is only listed once. Depending on the optional query parameters, the returned summary gets all the database parameters, which include:
    #
    # - Each parameter whose value was changed during the time range:  (valueChanged =\"Y\")
    # - Each parameter whose value was unchanged during the time range:  (valueChanged =\"N\")
    # - Each parameter whose value was changed at the system level during the time range: (valueChanged =\"Y\"  and valueModified = \"SYSTEM_MOD\")
    # - Each parameter whose value was unchanged during the time range, however, the value is not the default value: (valueChanged =\"N\" and  valueDefault = \"FALSE\")
    #
    # Note that this API does not return information on the number of times each database parameter has been changed within the time range. To get the database parameter value change history for a specific parameter, use the following API endpoint:
    # /managedDatabases/{managedDatabaseId}/awrDbs/{awrDbId}/awrDbParameterChanges
    #
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [String] awr_db_id The parameter to filter the database by internal ID.
    #   Note that the internal ID of the database can be retrieved from the following endpoint:
    #   /managedDatabases/{managedDatabaseId}/awrDbs
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :inst_num The optional single value query parameter to filter the database instance number.
    # @option opts [Integer] :begin_sn_id_greater_than_or_equal_to The optional greater than or equal to filter on the snapshot ID.
    # @option opts [Integer] :end_sn_id_less_than_or_equal_to The optional less than or equal to query parameter to filter the snapshot ID.
    # @option opts [DateTime] :time_greater_than_or_equal_to The optional greater than or equal to query parameter to filter the timestamp.
    # @option opts [DateTime] :time_less_than_or_equal_to The optional less than or equal to query parameter to filter the timestamp.
    # @option opts [Integer] :container_id The optional query parameter to filter the database container by an exact ID value.
    #   Note that the database container ID can be retrieved from the following endpoint:
    #   /managedDatabases/{managedDatabaseId}/awrDbSnapshotRanges
    #
    # @option opts [Array<String>] :name The optional multiple value query parameter to filter the entity name.
    # @option opts [String] :name_contains The optional contains query parameter to filter the entity name by any part of the name.
    # @option opts [String] :value_changed The optional query parameter to filter database parameters whose values were changed. (default to Y)
    #   Allowed values are: Y, N
    # @option opts [String] :value_default The optional query parameter to filter the database parameters that had the default value in the last snapshot.
    #   Allowed values are: TRUE, FALSE
    # @option opts [String] :value_modified The optional query parameter to filter the database parameters that had a modified value in the last snapshot.
    #   Allowed values are: MODIFIED, SYSTEM_MOD, FALSE
    # @option opts [String] :page The page token representing the page from where the next set of paginated results
    #   are retrieved. This is usually retrieved from a previous list call.
    #
    # @option opts [Integer] :limit The maximum number of records returned in large paginated response. (default to 1000)
    # @option opts [String] :sort_by The option to sort the AWR database parameter change history data. (default to IS_CHANGED)
    #   Allowed values are: IS_CHANGED, NAME
    # @option opts [String] :sort_order The option to sort information in ascending (\u2018ASC\u2019) or descending (\u2018DESC\u2019) order. Descending order is the default order. (default to DESC)
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::AwrDbParameterCollection AwrDbParameterCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/summarize_awr_db_parameters.rb.html) to see an example of how to use summarize_awr_db_parameters API.
    def summarize_awr_db_parameters(managed_database_id, awr_db_id, opts = {})
      logger.debug 'Calling operation DbManagementClient#summarize_awr_db_parameters.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling summarize_awr_db_parameters." if managed_database_id.nil?
      raise "Missing the required parameter 'awr_db_id' when calling summarize_awr_db_parameters." if awr_db_id.nil?

      if opts[:value_changed] && !%w[Y N].include?(opts[:value_changed])
        raise 'Invalid value for "value_changed", must be one of Y, N.'
      end

      if opts[:value_default] && !%w[TRUE FALSE].include?(opts[:value_default])
        raise 'Invalid value for "value_default", must be one of TRUE, FALSE.'
      end

      if opts[:value_modified] && !%w[MODIFIED SYSTEM_MOD FALSE].include?(opts[:value_modified])
        raise 'Invalid value for "value_modified", must be one of MODIFIED, SYSTEM_MOD, FALSE.'
      end

      if opts[:sort_by] && !%w[IS_CHANGED NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of IS_CHANGED, NAME.'
      end

      if opts[:sort_order] && !OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.'
      end
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)
      raise "Parameter value for 'awr_db_id' must not be blank" if OCI::Internal::Util.blank_string?(awr_db_id)

      path = '/managedDatabases/{managedDatabaseId}/awrDbs/{awrDbId}/awrDbParameters'.sub('{managedDatabaseId}', managed_database_id.to_s).sub('{awrDbId}', awr_db_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:instNum] = opts[:inst_num] if opts[:inst_num]
      query_params[:beginSnIdGreaterThanOrEqualTo] = opts[:begin_sn_id_greater_than_or_equal_to] if opts[:begin_sn_id_greater_than_or_equal_to]
      query_params[:endSnIdLessThanOrEqualTo] = opts[:end_sn_id_less_than_or_equal_to] if opts[:end_sn_id_less_than_or_equal_to]
      query_params[:timeGreaterThanOrEqualTo] = opts[:time_greater_than_or_equal_to] if opts[:time_greater_than_or_equal_to]
      query_params[:timeLessThanOrEqualTo] = opts[:time_less_than_or_equal_to] if opts[:time_less_than_or_equal_to]
      query_params[:containerId] = opts[:container_id] if opts[:container_id]
      query_params[:name] = OCI::ApiClient.build_collection_params(opts[:name], :multi) if opts[:name] && !opts[:name].empty?
      query_params[:nameContains] = opts[:name_contains] if opts[:name_contains]
      query_params[:valueChanged] = opts[:value_changed] if opts[:value_changed]
      query_params[:valueDefault] = opts[:value_default] if opts[:value_default]
      query_params[:valueModified] = opts[:value_modified] if opts[:value_modified]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#summarize_awr_db_parameters') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::AwrDbParameterCollection'
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


    # Summarizes the AWR snapshot ranges that contain continuous snapshots, for the specified Managed Database.
    #
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :name The optional single value query parameter to filter the entity name.
    # @option opts [DateTime] :time_greater_than_or_equal_to The optional greater than or equal to query parameter to filter the timestamp.
    # @option opts [DateTime] :time_less_than_or_equal_to The optional less than or equal to query parameter to filter the timestamp.
    # @option opts [String] :page The page token representing the page from where the next set of paginated results
    #   are retrieved. This is usually retrieved from a previous list call.
    #
    # @option opts [Integer] :limit The maximum number of records returned in the paginated response. (default to 10)
    # @option opts [String] :sort_by The option to sort the AWR summary data. (default to END_INTERVAL_TIME)
    #   Allowed values are: END_INTERVAL_TIME, NAME
    # @option opts [String] :sort_order The option to sort information in ascending (\u2018ASC\u2019) or descending (\u2018DESC\u2019) order. Descending order is the default order. (default to DESC)
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::AwrDbSnapshotRangeCollection AwrDbSnapshotRangeCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/summarize_awr_db_snapshot_ranges.rb.html) to see an example of how to use summarize_awr_db_snapshot_ranges API.
    def summarize_awr_db_snapshot_ranges(managed_database_id, opts = {})
      logger.debug 'Calling operation DbManagementClient#summarize_awr_db_snapshot_ranges.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling summarize_awr_db_snapshot_ranges." if managed_database_id.nil?

      if opts[:sort_by] && !%w[END_INTERVAL_TIME NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of END_INTERVAL_TIME, NAME.'
      end

      if opts[:sort_order] && !OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.'
      end
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)

      path = '/managedDatabases/{managedDatabaseId}/awrDbSnapshotRanges'.sub('{managedDatabaseId}', managed_database_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:name] = opts[:name] if opts[:name]
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
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#summarize_awr_db_snapshot_ranges') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::AwrDbSnapshotRangeCollection'
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


    # Summarizes the AWR SYSSTAT sample data for the specified database in AWR. The statistical data is summarized based on the Time dimension for each statistic.
    #
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [String] awr_db_id The parameter to filter the database by internal ID.
    #   Note that the internal ID of the database can be retrieved from the following endpoint:
    #   /managedDatabases/{managedDatabaseId}/awrDbs
    #
    # @param [Array<String>] name The required multiple value query parameter to filter the entity name.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :inst_num The optional single value query parameter to filter the database instance number.
    # @option opts [Integer] :begin_sn_id_greater_than_or_equal_to The optional greater than or equal to filter on the snapshot ID.
    # @option opts [Integer] :end_sn_id_less_than_or_equal_to The optional less than or equal to query parameter to filter the snapshot ID.
    # @option opts [DateTime] :time_greater_than_or_equal_to The optional greater than or equal to query parameter to filter the timestamp.
    # @option opts [DateTime] :time_less_than_or_equal_to The optional less than or equal to query parameter to filter the timestamp.
    # @option opts [Integer] :container_id The optional query parameter to filter the database container by an exact ID value.
    #   Note that the database container ID can be retrieved from the following endpoint:
    #   /managedDatabases/{managedDatabaseId}/awrDbSnapshotRanges
    #
    # @option opts [String] :page The page token representing the page from where the next set of paginated results
    #   are retrieved. This is usually retrieved from a previous list call.
    #
    # @option opts [Integer] :limit The maximum number of records returned in large paginated response. (default to 1000)
    # @option opts [String] :sort_by The option to sort the data within a time period. (default to TIME_BEGIN)
    #   Allowed values are: TIME_BEGIN, NAME
    # @option opts [String] :sort_order The option to sort information in ascending (\u2018ASC\u2019) or descending (\u2018DESC\u2019) order. Descending order is the default order. (default to DESC)
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::AwrDbSysstatCollection AwrDbSysstatCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/summarize_awr_db_sysstats.rb.html) to see an example of how to use summarize_awr_db_sysstats API.
    def summarize_awr_db_sysstats(managed_database_id, awr_db_id, name, opts = {})
      logger.debug 'Calling operation DbManagementClient#summarize_awr_db_sysstats.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling summarize_awr_db_sysstats." if managed_database_id.nil?
      raise "Missing the required parameter 'awr_db_id' when calling summarize_awr_db_sysstats." if awr_db_id.nil?
      raise "Missing the required parameter 'name' when calling summarize_awr_db_sysstats." if name.nil?

      if opts[:sort_by] && !%w[TIME_BEGIN NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIME_BEGIN, NAME.'
      end

      if opts[:sort_order] && !OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.'
      end
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)
      raise "Parameter value for 'awr_db_id' must not be blank" if OCI::Internal::Util.blank_string?(awr_db_id)

      path = '/managedDatabases/{managedDatabaseId}/awrDbs/{awrDbId}/awrDbSysstats'.sub('{managedDatabaseId}', managed_database_id.to_s).sub('{awrDbId}', awr_db_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:name] = OCI::ApiClient.build_collection_params(name, :multi)
      query_params[:instNum] = opts[:inst_num] if opts[:inst_num]
      query_params[:beginSnIdGreaterThanOrEqualTo] = opts[:begin_sn_id_greater_than_or_equal_to] if opts[:begin_sn_id_greater_than_or_equal_to]
      query_params[:endSnIdLessThanOrEqualTo] = opts[:end_sn_id_less_than_or_equal_to] if opts[:end_sn_id_less_than_or_equal_to]
      query_params[:timeGreaterThanOrEqualTo] = opts[:time_greater_than_or_equal_to] if opts[:time_greater_than_or_equal_to]
      query_params[:timeLessThanOrEqualTo] = opts[:time_less_than_or_equal_to] if opts[:time_less_than_or_equal_to]
      query_params[:containerId] = opts[:container_id] if opts[:container_id]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#summarize_awr_db_sysstats') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::AwrDbSysstatCollection'
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


    # Summarizes the AWR top wait events.
    #
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [String] awr_db_id The parameter to filter the database by internal ID.
    #   Note that the internal ID of the database can be retrieved from the following endpoint:
    #   /managedDatabases/{managedDatabaseId}/awrDbs
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :inst_num The optional single value query parameter to filter the database instance number.
    # @option opts [Integer] :begin_sn_id_greater_than_or_equal_to The optional greater than or equal to filter on the snapshot ID.
    # @option opts [Integer] :end_sn_id_less_than_or_equal_to The optional less than or equal to query parameter to filter the snapshot ID.
    # @option opts [DateTime] :time_greater_than_or_equal_to The optional greater than or equal to query parameter to filter the timestamp.
    # @option opts [DateTime] :time_less_than_or_equal_to The optional less than or equal to query parameter to filter the timestamp.
    # @option opts [String] :session_type The optional query parameter to filter ASH activities by FOREGROUND or BACKGROUND. (default to FOREGROUND)
    #   Allowed values are: FOREGROUND, BACKGROUND, ALL
    # @option opts [Integer] :container_id The optional query parameter to filter the database container by an exact ID value.
    #   Note that the database container ID can be retrieved from the following endpoint:
    #   /managedDatabases/{managedDatabaseId}/awrDbSnapshotRanges
    #
    # @option opts [Integer] :top_n The optional query parameter to filter the number of top categories to be returned. (default to 10)
    # @option opts [String] :sort_by The option to sort the AWR top event summary data. (default to WAITS_PERSEC)
    #   Allowed values are: WAITS_PERSEC, AVG_WAIT_TIME_PERSEC
    # @option opts [String] :sort_order The option to sort information in ascending (\u2018ASC\u2019) or descending (\u2018DESC\u2019) order. Descending order is the default order. (default to DESC)
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::AwrDbTopWaitEventCollection AwrDbTopWaitEventCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/summarize_awr_db_top_wait_events.rb.html) to see an example of how to use summarize_awr_db_top_wait_events API.
    def summarize_awr_db_top_wait_events(managed_database_id, awr_db_id, opts = {})
      logger.debug 'Calling operation DbManagementClient#summarize_awr_db_top_wait_events.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling summarize_awr_db_top_wait_events." if managed_database_id.nil?
      raise "Missing the required parameter 'awr_db_id' when calling summarize_awr_db_top_wait_events." if awr_db_id.nil?

      if opts[:session_type] && !%w[FOREGROUND BACKGROUND ALL].include?(opts[:session_type])
        raise 'Invalid value for "session_type", must be one of FOREGROUND, BACKGROUND, ALL.'
      end

      if opts[:sort_by] && !%w[WAITS_PERSEC AVG_WAIT_TIME_PERSEC].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of WAITS_PERSEC, AVG_WAIT_TIME_PERSEC.'
      end

      if opts[:sort_order] && !OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.'
      end
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)
      raise "Parameter value for 'awr_db_id' must not be blank" if OCI::Internal::Util.blank_string?(awr_db_id)

      path = '/managedDatabases/{managedDatabaseId}/awrDbs/{awrDbId}/awrDbTopWaitEvents'.sub('{managedDatabaseId}', managed_database_id.to_s).sub('{awrDbId}', awr_db_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:instNum] = opts[:inst_num] if opts[:inst_num]
      query_params[:beginSnIdGreaterThanOrEqualTo] = opts[:begin_sn_id_greater_than_or_equal_to] if opts[:begin_sn_id_greater_than_or_equal_to]
      query_params[:endSnIdLessThanOrEqualTo] = opts[:end_sn_id_less_than_or_equal_to] if opts[:end_sn_id_less_than_or_equal_to]
      query_params[:timeGreaterThanOrEqualTo] = opts[:time_greater_than_or_equal_to] if opts[:time_greater_than_or_equal_to]
      query_params[:timeLessThanOrEqualTo] = opts[:time_less_than_or_equal_to] if opts[:time_less_than_or_equal_to]
      query_params[:sessionType] = opts[:session_type] if opts[:session_type]
      query_params[:containerId] = opts[:container_id] if opts[:container_id]
      query_params[:topN] = opts[:top_n] if opts[:top_n]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#summarize_awr_db_top_wait_events') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::AwrDbTopWaitEventCollection'
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


    # Summarizes AWR wait event data into value buckets and frequency, for the specified database in the AWR.
    #
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [String] awr_db_id The parameter to filter the database by internal ID.
    #   Note that the internal ID of the database can be retrieved from the following endpoint:
    #   /managedDatabases/{managedDatabaseId}/awrDbs
    #
    # @param [String] name The required single value query parameter to filter the entity name.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :inst_num The optional single value query parameter to filter the database instance number.
    # @option opts [Integer] :begin_sn_id_greater_than_or_equal_to The optional greater than or equal to filter on the snapshot ID.
    # @option opts [Integer] :end_sn_id_less_than_or_equal_to The optional less than or equal to query parameter to filter the snapshot ID.
    # @option opts [DateTime] :time_greater_than_or_equal_to The optional greater than or equal to query parameter to filter the timestamp.
    # @option opts [DateTime] :time_less_than_or_equal_to The optional less than or equal to query parameter to filter the timestamp.
    # @option opts [Integer] :num_bucket The number of buckets within the histogram. (default to 10)
    # @option opts [Float] :min_value The minimum value of the histogram. (default to 0)
    # @option opts [Float] :max_value The maximum value of the histogram.
    # @option opts [Integer] :container_id The optional query parameter to filter the database container by an exact ID value.
    #   Note that the database container ID can be retrieved from the following endpoint:
    #   /managedDatabases/{managedDatabaseId}/awrDbSnapshotRanges
    #
    # @option opts [String] :page The page token representing the page from where the next set of paginated results
    #   are retrieved. This is usually retrieved from a previous list call.
    #
    # @option opts [Integer] :limit The maximum number of records returned in large paginated response. (default to 1000)
    # @option opts [String] :sort_by The option to sort distribution data. (default to CATEGORY)
    #   Allowed values are: CATEGORY, PERCENTAGE
    # @option opts [String] :sort_order The option to sort information in ascending (\u2018ASC\u2019) or descending (\u2018DESC\u2019) order. Ascending order is the default order. (default to ASC)
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::AwrDbWaitEventBucketCollection AwrDbWaitEventBucketCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/summarize_awr_db_wait_event_buckets.rb.html) to see an example of how to use summarize_awr_db_wait_event_buckets API.
    def summarize_awr_db_wait_event_buckets(managed_database_id, awr_db_id, name, opts = {})
      logger.debug 'Calling operation DbManagementClient#summarize_awr_db_wait_event_buckets.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling summarize_awr_db_wait_event_buckets." if managed_database_id.nil?
      raise "Missing the required parameter 'awr_db_id' when calling summarize_awr_db_wait_event_buckets." if awr_db_id.nil?
      raise "Missing the required parameter 'name' when calling summarize_awr_db_wait_event_buckets." if name.nil?

      if opts[:sort_by] && !%w[CATEGORY PERCENTAGE].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of CATEGORY, PERCENTAGE.'
      end

      if opts[:sort_order] && !OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.'
      end
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)
      raise "Parameter value for 'awr_db_id' must not be blank" if OCI::Internal::Util.blank_string?(awr_db_id)

      path = '/managedDatabases/{managedDatabaseId}/awrDbs/{awrDbId}/awrDbWaitEventBuckets'.sub('{managedDatabaseId}', managed_database_id.to_s).sub('{awrDbId}', awr_db_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:name] = name
      query_params[:instNum] = opts[:inst_num] if opts[:inst_num]
      query_params[:beginSnIdGreaterThanOrEqualTo] = opts[:begin_sn_id_greater_than_or_equal_to] if opts[:begin_sn_id_greater_than_or_equal_to]
      query_params[:endSnIdLessThanOrEqualTo] = opts[:end_sn_id_less_than_or_equal_to] if opts[:end_sn_id_less_than_or_equal_to]
      query_params[:timeGreaterThanOrEqualTo] = opts[:time_greater_than_or_equal_to] if opts[:time_greater_than_or_equal_to]
      query_params[:timeLessThanOrEqualTo] = opts[:time_less_than_or_equal_to] if opts[:time_less_than_or_equal_to]
      query_params[:numBucket] = opts[:num_bucket] if opts[:num_bucket]
      query_params[:minValue] = opts[:min_value] if opts[:min_value]
      query_params[:maxValue] = opts[:max_value] if opts[:max_value]
      query_params[:containerId] = opts[:container_id] if opts[:container_id]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#summarize_awr_db_wait_event_buckets') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::AwrDbWaitEventBucketCollection'
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


    # Summarizes the AWR wait event sample data for the specified database in the AWR. The event data is summarized based on the Time dimension for each event.
    #
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [String] awr_db_id The parameter to filter the database by internal ID.
    #   Note that the internal ID of the database can be retrieved from the following endpoint:
    #   /managedDatabases/{managedDatabaseId}/awrDbs
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :inst_num The optional single value query parameter to filter the database instance number.
    # @option opts [Integer] :begin_sn_id_greater_than_or_equal_to The optional greater than or equal to filter on the snapshot ID.
    # @option opts [Integer] :end_sn_id_less_than_or_equal_to The optional less than or equal to query parameter to filter the snapshot ID.
    # @option opts [DateTime] :time_greater_than_or_equal_to The optional greater than or equal to query parameter to filter the timestamp.
    # @option opts [DateTime] :time_less_than_or_equal_to The optional less than or equal to query parameter to filter the timestamp.
    # @option opts [Array<String>] :name The optional multiple value query parameter to filter the entity name.
    # @option opts [String] :session_type The optional query parameter to filter ASH activities by FOREGROUND or BACKGROUND. (default to FOREGROUND)
    #   Allowed values are: FOREGROUND, BACKGROUND, ALL
    # @option opts [Integer] :container_id The optional query parameter to filter the database container by an exact ID value.
    #   Note that the database container ID can be retrieved from the following endpoint:
    #   /managedDatabases/{managedDatabaseId}/awrDbSnapshotRanges
    #
    # @option opts [String] :page The page token representing the page from where the next set of paginated results
    #   are retrieved. This is usually retrieved from a previous list call.
    #
    # @option opts [Integer] :limit The maximum number of records returned in large paginated response. (default to 1000)
    # @option opts [String] :sort_by The option to sort the data within a time period. (default to TIME_BEGIN)
    #   Allowed values are: TIME_BEGIN, NAME
    # @option opts [String] :sort_order The option to sort information in ascending (\u2018ASC\u2019) or descending (\u2018DESC\u2019) order. Descending order is the default order. (default to DESC)
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::AwrDbWaitEventCollection AwrDbWaitEventCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/summarize_awr_db_wait_events.rb.html) to see an example of how to use summarize_awr_db_wait_events API.
    def summarize_awr_db_wait_events(managed_database_id, awr_db_id, opts = {})
      logger.debug 'Calling operation DbManagementClient#summarize_awr_db_wait_events.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling summarize_awr_db_wait_events." if managed_database_id.nil?
      raise "Missing the required parameter 'awr_db_id' when calling summarize_awr_db_wait_events." if awr_db_id.nil?

      if opts[:session_type] && !%w[FOREGROUND BACKGROUND ALL].include?(opts[:session_type])
        raise 'Invalid value for "session_type", must be one of FOREGROUND, BACKGROUND, ALL.'
      end

      if opts[:sort_by] && !%w[TIME_BEGIN NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIME_BEGIN, NAME.'
      end

      if opts[:sort_order] && !OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.'
      end
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)
      raise "Parameter value for 'awr_db_id' must not be blank" if OCI::Internal::Util.blank_string?(awr_db_id)

      path = '/managedDatabases/{managedDatabaseId}/awrDbs/{awrDbId}/awrDbWaitEvents'.sub('{managedDatabaseId}', managed_database_id.to_s).sub('{awrDbId}', awr_db_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:instNum] = opts[:inst_num] if opts[:inst_num]
      query_params[:beginSnIdGreaterThanOrEqualTo] = opts[:begin_sn_id_greater_than_or_equal_to] if opts[:begin_sn_id_greater_than_or_equal_to]
      query_params[:endSnIdLessThanOrEqualTo] = opts[:end_sn_id_less_than_or_equal_to] if opts[:end_sn_id_less_than_or_equal_to]
      query_params[:timeGreaterThanOrEqualTo] = opts[:time_greater_than_or_equal_to] if opts[:time_greater_than_or_equal_to]
      query_params[:timeLessThanOrEqualTo] = opts[:time_less_than_or_equal_to] if opts[:time_less_than_or_equal_to]
      query_params[:name] = OCI::ApiClient.build_collection_params(opts[:name], :multi) if opts[:name] && !opts[:name].empty?
      query_params[:sessionType] = opts[:session_type] if opts[:session_type]
      query_params[:containerId] = opts[:container_id] if opts[:container_id]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#summarize_awr_db_wait_events') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::AwrDbWaitEventCollection'
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


    # Gets the number of job executions grouped by status for a job, Managed Database, or Database Group in a specific compartment. Only one of the parameters, jobId, managedDatabaseId, or managedDatabaseGroupId should be provided.
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [String] start_time The start time of the time range to retrieve the status summary of job executions
    #   in UTC in ISO-8601 format, which is \"yyyy-MM-dd'T'hh:mm:ss.sss'Z'\".
    #
    # @param [String] end_time The end time of the time range to retrieve the status summary of job executions
    #   in UTC in ISO-8601 format, which is \"yyyy-MM-dd'T'hh:mm:ss.sss'Z'\".
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :id The identifier of the resource.
    # @option opts [String] :managed_database_group_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database Group.
    # @option opts [String] :managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @option opts [String] :name A filter to return only resources that match the entire name.
    # @option opts [String] :sort_by The field to sort information by. Only one sortOrder can be used. The default sort order
    #   for \u2018TIMECREATED\u2019 is descending and the default sort order for \u2018NAME\u2019 is ascending.
    #   The \u2018NAME\u2019 sort order is case-sensitive.
    #    (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, NAME
    # @option opts [String] :sort_order The option to sort information in ascending (\u2018ASC\u2019) or descending (\u2018DESC\u2019) order. Ascending order is the default order. (default to ASC)
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::JobExecutionsStatusSummaryCollection JobExecutionsStatusSummaryCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/summarize_job_executions_statuses.rb.html) to see an example of how to use summarize_job_executions_statuses API.
    def summarize_job_executions_statuses(compartment_id, start_time, end_time, opts = {})
      logger.debug 'Calling operation DbManagementClient#summarize_job_executions_statuses.' if logger

      raise "Missing the required parameter 'compartment_id' when calling summarize_job_executions_statuses." if compartment_id.nil?
      raise "Missing the required parameter 'start_time' when calling summarize_job_executions_statuses." if start_time.nil?
      raise "Missing the required parameter 'end_time' when calling summarize_job_executions_statuses." if end_time.nil?

      if opts[:sort_by] && !%w[TIMECREATED NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, NAME.'
      end

      if opts[:sort_order] && !OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::DatabaseManagement::Models::SORT_ORDERS_ENUM.'
      end

      path = '/jobExecutionsStatus'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:startTime] = start_time
      query_params[:endTime] = end_time
      query_params[:id] = opts[:id] if opts[:id]
      query_params[:managedDatabaseGroupId] = opts[:managed_database_group_id] if opts[:managed_database_group_id]
      query_params[:managedDatabaseId] = opts[:managed_database_id] if opts[:managed_database_id]
      query_params[:name] = opts[:name] if opts[:name]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#summarize_job_executions_statuses') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::JobExecutionsStatusSummaryCollection'
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


    # Updates one or more attributes of a specific Database Management private endpoint.
    # @param [String] db_management_private_endpoint_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Database Management private endpoint.
    # @param [OCI::DatabaseManagement::Models::UpdateDbManagementPrivateEndpointDetails] update_db_management_private_endpoint_details The details used to update a Database Management private endpoint.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::DbManagementPrivateEndpoint DbManagementPrivateEndpoint}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/update_db_management_private_endpoint.rb.html) to see an example of how to use update_db_management_private_endpoint API.
    def update_db_management_private_endpoint(db_management_private_endpoint_id, update_db_management_private_endpoint_details, opts = {})
      logger.debug 'Calling operation DbManagementClient#update_db_management_private_endpoint.' if logger

      raise "Missing the required parameter 'db_management_private_endpoint_id' when calling update_db_management_private_endpoint." if db_management_private_endpoint_id.nil?
      raise "Missing the required parameter 'update_db_management_private_endpoint_details' when calling update_db_management_private_endpoint." if update_db_management_private_endpoint_details.nil?
      raise "Parameter value for 'db_management_private_endpoint_id' must not be blank" if OCI::Internal::Util.blank_string?(db_management_private_endpoint_id)

      path = '/dbManagementPrivateEndpoints/{dbManagementPrivateEndpointId}'.sub('{dbManagementPrivateEndpointId}', db_management_private_endpoint_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_db_management_private_endpoint_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#update_db_management_private_endpoint') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::DbManagementPrivateEndpoint'
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


    # Updates the details for the recurring scheduled job specified by jobId. Note that non-recurring (one time) jobs cannot be updated.
    #
    # @param [String] job_id The identifier of the job.
    # @param [OCI::DatabaseManagement::Models::UpdateJobDetails] update_job_details The details required to update a job.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::Job Job}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/update_job.rb.html) to see an example of how to use update_job API.
    def update_job(job_id, update_job_details, opts = {})
      logger.debug 'Calling operation DbManagementClient#update_job.' if logger

      raise "Missing the required parameter 'job_id' when calling update_job." if job_id.nil?
      raise "Missing the required parameter 'update_job_details' when calling update_job." if update_job_details.nil?
      raise "Parameter value for 'job_id' must not be blank" if OCI::Internal::Util.blank_string?(job_id)

      path = '/jobs/{jobId}'.sub('{jobId}', job_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_job_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#update_job') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::Job'
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


    # Updates the Managed Database Group specified by managedDatabaseGroupId.
    #
    # @param [String] managed_database_group_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database Group.
    # @param [OCI::DatabaseManagement::Models::UpdateManagedDatabaseGroupDetails] update_managed_database_group_details The details required to update a Managed Database Group.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::ManagedDatabaseGroup ManagedDatabaseGroup}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/update_managed_database_group.rb.html) to see an example of how to use update_managed_database_group API.
    def update_managed_database_group(managed_database_group_id, update_managed_database_group_details, opts = {})
      logger.debug 'Calling operation DbManagementClient#update_managed_database_group.' if logger

      raise "Missing the required parameter 'managed_database_group_id' when calling update_managed_database_group." if managed_database_group_id.nil?
      raise "Missing the required parameter 'update_managed_database_group_details' when calling update_managed_database_group." if update_managed_database_group_details.nil?
      raise "Parameter value for 'managed_database_group_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_group_id)

      path = '/managedDatabaseGroups/{managedDatabaseGroupId}'.sub('{managedDatabaseGroupId}', managed_database_group_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_managed_database_group_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#update_managed_database_group') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::ManagedDatabaseGroup'
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


    # Updates the attributes of the tablespace specified by tablespaceName within the Managed Database specified by managedDatabaseId.
    #
    # @param [String] managed_database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database.
    # @param [String] tablespace_name The name of the tablespace.
    # @param [OCI::DatabaseManagement::Models::UpdateTablespaceDetails] update_tablespace_details The details required to update a tablespace.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DatabaseManagement::Models::Tablespace Tablespace}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/databasemanagement/update_tablespace.rb.html) to see an example of how to use update_tablespace API.
    def update_tablespace(managed_database_id, tablespace_name, update_tablespace_details, opts = {})
      logger.debug 'Calling operation DbManagementClient#update_tablespace.' if logger

      raise "Missing the required parameter 'managed_database_id' when calling update_tablespace." if managed_database_id.nil?
      raise "Missing the required parameter 'tablespace_name' when calling update_tablespace." if tablespace_name.nil?
      raise "Missing the required parameter 'update_tablespace_details' when calling update_tablespace." if update_tablespace_details.nil?
      raise "Parameter value for 'managed_database_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_database_id)
      raise "Parameter value for 'tablespace_name' must not be blank" if OCI::Internal::Util.blank_string?(tablespace_name)

      path = '/managedDatabases/{managedDatabaseId}/tablespaces/{tablespaceName}'.sub('{managedDatabaseId}', managed_database_id.to_s).sub('{tablespaceName}', tablespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_tablespace_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbManagementClient#update_tablespace') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DatabaseManagement::Models::Tablespace'
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
