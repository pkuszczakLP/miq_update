# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The LogAnalytics API for the LogAnalytics service.
  class LogAnalytics::LogAnalyticsClient
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


    # Creates a new LogAnalyticsClient.
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
        @endpoint = endpoint + '/20200601'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "LogAnalyticsClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://loganalytics.{region}.oci.{secondLevelDomain}') + '/20200601'
      logger.info "LogAnalyticsClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Adds association between input source log analytics entity and one or more existing destination entities.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] log_analytics_entity_id The log analytics entity OCID.
    #
    # @param [OCI::LogAnalytics::Models::AddEntityAssociationDetails] add_entity_association_details This parameter specifies the destination entity OCIDs with which associations are to be created.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/add_entity_association.rb.html) to see an example of how to use add_entity_association API.
    def add_entity_association(namespace_name, log_analytics_entity_id, add_entity_association_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#add_entity_association.' if logger

      raise "Missing the required parameter 'namespace_name' when calling add_entity_association." if namespace_name.nil?
      raise "Missing the required parameter 'log_analytics_entity_id' when calling add_entity_association." if log_analytics_entity_id.nil?
      raise "Missing the required parameter 'add_entity_association_details' when calling add_entity_association." if add_entity_association_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'log_analytics_entity_id' must not be blank" if OCI::Internal::Util.blank_string?(log_analytics_entity_id)

      path = '/namespaces/{namespaceName}/logAnalyticsEntities/{logAnalyticsEntityId}/actions/addEntityAssociations'.sub('{namespaceName}', namespace_name.to_s).sub('{logAnalyticsEntityId}', log_analytics_entity_id.to_s)
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
      header_params[:expect] ||= '100-continue'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(add_entity_association_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#add_entity_association') do
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


    # Add one or more event types to a source. An event type and version can be enabled only on one source.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] source_name The source name.
    # @param [OCI::LogAnalytics::Models::EventTypeDetails] add_event_type_details Details of event types to be added to the source. The specified event type string could be the fully qualified name or a prefix that matches the event type.
    #
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
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/add_source_event_types.rb.html) to see an example of how to use add_source_event_types API.
    def add_source_event_types(namespace_name, source_name, add_event_type_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#add_source_event_types.' if logger

      raise "Missing the required parameter 'namespace_name' when calling add_source_event_types." if namespace_name.nil?
      raise "Missing the required parameter 'source_name' when calling add_source_event_types." if source_name.nil?
      raise "Missing the required parameter 'add_event_type_details' when calling add_source_event_types." if add_event_type_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'source_name' must not be blank" if OCI::Internal::Util.blank_string?(source_name)

      path = '/namespaces/{namespaceName}/sources/{sourceName}/actions/addEventTypes'.sub('{namespaceName}', namespace_name.to_s).sub('{sourceName}', source_name.to_s)
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
      header_params[:expect] ||= '100-continue'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(add_event_type_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#add_source_event_types') do
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


    # Appends data to the lookup content. The csv file containing the content to be appended is passed in as binary data in the request.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] lookup_name The name of the lookup to operate on.
    # @param [String, IO] append_lookup_file_body The file to append.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [BOOLEAN] :is_force is force (default to false)
    # @option opts [String] :char_encoding The character encoding of the uploaded file. (default to UTF-8)
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :expect A value of `100-continue` requests preliminary verification of the request method, path, and headers before the request body is sent.
    #   If no error results from such verification, the server will send a 100 (Continue) interim response to indicate readiness for the request body.
    #   The only allowed value for this parameter is \"100-Continue\" (case-insensitive).
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/append_lookup_data.rb.html) to see an example of how to use append_lookup_data API.
    def append_lookup_data(namespace_name, lookup_name, append_lookup_file_body, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#append_lookup_data.' if logger

      raise "Missing the required parameter 'namespace_name' when calling append_lookup_data." if namespace_name.nil?
      raise "Missing the required parameter 'lookup_name' when calling append_lookup_data." if lookup_name.nil?
      raise "Missing the required parameter 'append_lookup_file_body' when calling append_lookup_data." if append_lookup_file_body.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'lookup_name' must not be blank" if OCI::Internal::Util.blank_string?(lookup_name)

      path = '/namespaces/{namespaceName}/lookups/{lookupName}/actions/appendData'.sub('{namespaceName}', namespace_name.to_s).sub('{lookupName}', lookup_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:isForce] = opts[:is_force] if !opts[:is_force].nil?
      query_params[:charEncoding] = opts[:char_encoding] if opts[:char_encoding]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:expect] = opts[:expect] if opts[:expect]
      # rubocop:enable Style/NegatedIf
      header_params[:'content-type'] ||= 'application/octet-stream'
      header_params[:expect] ||= '100-continue'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(append_lookup_file_body)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#append_lookup_data') do
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


    # Lists basic information about a specified set of labels in batch.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::LabelNames] basic_details List of label names to get information on
    # @param [BOOLEAN] is_include_deleted A flag specifying whether or not to include information on deleted labels.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :basic_label_sort_by The attribute used to sort the returned labels (default to name)
    #   Allowed values are: name, priority
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsLabelCollection LogAnalyticsLabelCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/batch_get_basic_info.rb.html) to see an example of how to use batch_get_basic_info API.
    def batch_get_basic_info(namespace_name, basic_details, is_include_deleted, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#batch_get_basic_info.' if logger

      raise "Missing the required parameter 'namespace_name' when calling batch_get_basic_info." if namespace_name.nil?
      raise "Missing the required parameter 'basic_details' when calling batch_get_basic_info." if basic_details.nil?
      raise "Missing the required parameter 'is_include_deleted' when calling batch_get_basic_info." if is_include_deleted.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:basic_label_sort_by] && !%w[name priority].include?(opts[:basic_label_sort_by])
        raise 'Invalid value for "basic_label_sort_by", must be one of name, priority.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/labels/actions/basicInfo'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:isIncludeDeleted] = is_include_deleted
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:basicLabelSortBy] = opts[:basic_label_sort_by] if opts[:basic_label_sort_by]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:expect] ||= '100-continue'

      post_body = @api_client.object_to_http_body(basic_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#batch_get_basic_info') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsLabelCollection'
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


    # Cancel/Remove query job work request.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] work_request_id Work Request Identifier [OCID] (https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) for the asynchronous request.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/cancel_query_work_request.rb.html) to see an example of how to use cancel_query_work_request API.
    def cancel_query_work_request(namespace_name, work_request_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#cancel_query_work_request.' if logger

      raise "Missing the required parameter 'namespace_name' when calling cancel_query_work_request." if namespace_name.nil?
      raise "Missing the required parameter 'work_request_id' when calling cancel_query_work_request." if work_request_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/namespaces/{namespaceName}/queryWorkRequests/{workRequestId}'.sub('{namespaceName}', namespace_name.to_s).sub('{workRequestId}', work_request_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#cancel_query_work_request') do
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


    # Update the compartment of the log analytics enterprise manager bridge with the given id.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] log_analytics_em_bridge_id The log analytics enterprise manager bridge OCID.
    #
    # @param [OCI::LogAnalytics::Models::ChangeLogAnalyticsEmBridgeCompartmentDetails] change_log_analytics_em_bridge_compartment_details Log analytics enterprise manager bridge compartment Id to be updated.
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
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/change_log_analytics_em_bridge_compartment.rb.html) to see an example of how to use change_log_analytics_em_bridge_compartment API.
    def change_log_analytics_em_bridge_compartment(namespace_name, log_analytics_em_bridge_id, change_log_analytics_em_bridge_compartment_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#change_log_analytics_em_bridge_compartment.' if logger

      raise "Missing the required parameter 'namespace_name' when calling change_log_analytics_em_bridge_compartment." if namespace_name.nil?
      raise "Missing the required parameter 'log_analytics_em_bridge_id' when calling change_log_analytics_em_bridge_compartment." if log_analytics_em_bridge_id.nil?
      raise "Missing the required parameter 'change_log_analytics_em_bridge_compartment_details' when calling change_log_analytics_em_bridge_compartment." if change_log_analytics_em_bridge_compartment_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'log_analytics_em_bridge_id' must not be blank" if OCI::Internal::Util.blank_string?(log_analytics_em_bridge_id)

      path = '/namespaces/{namespaceName}/logAnalyticsEmBridges/{logAnalyticsEmBridgeId}/actions/changeCompartment'.sub('{namespaceName}', namespace_name.to_s).sub('{logAnalyticsEmBridgeId}', log_analytics_em_bridge_id.to_s)
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
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:expect] ||= '100-continue'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(change_log_analytics_em_bridge_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#change_log_analytics_em_bridge_compartment') do
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


    # Update the compartment of the log analytics entity with the given id.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] log_analytics_entity_id The log analytics entity OCID.
    #
    # @param [OCI::LogAnalytics::Models::ChangeLogAnalyticsEntityCompartmentDetails] change_log_analytics_entity_compartment_details Log analytics entity compartment Id to be updated.
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
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/change_log_analytics_entity_compartment.rb.html) to see an example of how to use change_log_analytics_entity_compartment API.
    def change_log_analytics_entity_compartment(namespace_name, log_analytics_entity_id, change_log_analytics_entity_compartment_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#change_log_analytics_entity_compartment.' if logger

      raise "Missing the required parameter 'namespace_name' when calling change_log_analytics_entity_compartment." if namespace_name.nil?
      raise "Missing the required parameter 'log_analytics_entity_id' when calling change_log_analytics_entity_compartment." if log_analytics_entity_id.nil?
      raise "Missing the required parameter 'change_log_analytics_entity_compartment_details' when calling change_log_analytics_entity_compartment." if change_log_analytics_entity_compartment_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'log_analytics_entity_id' must not be blank" if OCI::Internal::Util.blank_string?(log_analytics_entity_id)

      path = '/namespaces/{namespaceName}/logAnalyticsEntities/{logAnalyticsEntityId}/actions/changeCompartment'.sub('{namespaceName}', namespace_name.to_s).sub('{logAnalyticsEntityId}', log_analytics_entity_id.to_s)
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
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:expect] ||= '100-continue'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(change_log_analytics_entity_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#change_log_analytics_entity_compartment') do
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


    # Moves the specified log group to a different compartment.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] log_analytics_log_group_id unique logAnalytics log group identifier
    # @param [OCI::LogAnalytics::Models::ChangeLogAnalyticsLogGroupCompartmentDetails] change_log_analytics_log_group_compartment_details The information to be updated.
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
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/change_log_analytics_log_group_compartment.rb.html) to see an example of how to use change_log_analytics_log_group_compartment API.
    def change_log_analytics_log_group_compartment(namespace_name, log_analytics_log_group_id, change_log_analytics_log_group_compartment_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#change_log_analytics_log_group_compartment.' if logger

      raise "Missing the required parameter 'namespace_name' when calling change_log_analytics_log_group_compartment." if namespace_name.nil?
      raise "Missing the required parameter 'log_analytics_log_group_id' when calling change_log_analytics_log_group_compartment." if log_analytics_log_group_id.nil?
      raise "Missing the required parameter 'change_log_analytics_log_group_compartment_details' when calling change_log_analytics_log_group_compartment." if change_log_analytics_log_group_compartment_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'log_analytics_log_group_id' must not be blank" if OCI::Internal::Util.blank_string?(log_analytics_log_group_id)

      path = '/namespaces/{namespaceName}/logAnalyticsLogGroups/{logAnalyticsLogGroupId}/actions/changeCompartment'.sub('{namespaceName}', namespace_name.to_s).sub('{logAnalyticsLogGroupId}', log_analytics_log_group_id.to_s)
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
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:expect] ||= '100-continue'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(change_log_analytics_log_group_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#change_log_analytics_log_group_compartment') do
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


    # Move the rule from it's current compartment to the given compartment.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] log_analytics_object_collection_rule_id The Logging Analytics Object Collection Rule [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    # @param [OCI::LogAnalytics::Models::ChangeLogAnalyticsObjectCollectionRuleCompartmentDetails] change_log_analytics_object_collection_rule_compartment_details The new compartment this Object Collection Rule will be moved to.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/change_log_analytics_object_collection_rule_compartment.rb.html) to see an example of how to use change_log_analytics_object_collection_rule_compartment API.
    def change_log_analytics_object_collection_rule_compartment(namespace_name, log_analytics_object_collection_rule_id, change_log_analytics_object_collection_rule_compartment_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#change_log_analytics_object_collection_rule_compartment.' if logger

      raise "Missing the required parameter 'namespace_name' when calling change_log_analytics_object_collection_rule_compartment." if namespace_name.nil?
      raise "Missing the required parameter 'log_analytics_object_collection_rule_id' when calling change_log_analytics_object_collection_rule_compartment." if log_analytics_object_collection_rule_id.nil?
      raise "Missing the required parameter 'change_log_analytics_object_collection_rule_compartment_details' when calling change_log_analytics_object_collection_rule_compartment." if change_log_analytics_object_collection_rule_compartment_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'log_analytics_object_collection_rule_id' must not be blank" if OCI::Internal::Util.blank_string?(log_analytics_object_collection_rule_id)

      path = '/namespaces/{namespaceName}/logAnalyticsObjectCollectionRules/{logAnalyticsObjectCollectionRuleId}/actions/changeCompartment'.sub('{namespaceName}', namespace_name.to_s).sub('{logAnalyticsObjectCollectionRuleId}', log_analytics_object_collection_rule_id.to_s)
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
      header_params[:expect] ||= '100-continue'

      post_body = @api_client.object_to_http_body(change_log_analytics_object_collection_rule_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#change_log_analytics_object_collection_rule_compartment') do
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


    # Move the scheduled task into a different compartment within the same tenancy.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] scheduled_task_id Unique scheduledTask id returned from task create.
    #   If invalid will lead to a 404 not found.
    #
    # @param [OCI::LogAnalytics::Models::ChangeScheduledTaskCompartmentDetails] change_scheduled_task_compartment_details The destination compartment identifier.
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
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/change_scheduled_task_compartment.rb.html) to see an example of how to use change_scheduled_task_compartment API.
    def change_scheduled_task_compartment(namespace_name, scheduled_task_id, change_scheduled_task_compartment_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#change_scheduled_task_compartment.' if logger

      raise "Missing the required parameter 'namespace_name' when calling change_scheduled_task_compartment." if namespace_name.nil?
      raise "Missing the required parameter 'scheduled_task_id' when calling change_scheduled_task_compartment." if scheduled_task_id.nil?
      raise "Missing the required parameter 'change_scheduled_task_compartment_details' when calling change_scheduled_task_compartment." if change_scheduled_task_compartment_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'scheduled_task_id' must not be blank" if OCI::Internal::Util.blank_string?(scheduled_task_id)

      path = '/namespaces/{namespaceName}/scheduledTasks/{scheduledTaskId}/actions/changeCompartment'.sub('{namespaceName}', namespace_name.to_s).sub('{scheduledTaskId}', scheduled_task_id.to_s)
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
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:expect] ||= '100-continue'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(change_scheduled_task_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#change_scheduled_task_compartment') do
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


    # Clean accumulated acceleration data stored for the accelerated saved search.
    # The ScheduledTask taskType must be ACCELERATION.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] scheduled_task_id Unique scheduledTask id returned from task create.
    #   If invalid will lead to a 404 not found.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [DateTime] :time_start Optional parameter to specify start of time range, in the format defined by RFC3339.
    #   Default value is beginning of time.
    #
    # @option opts [DateTime] :time_end Optional parameter to specify end of time range, in the format defined by RFC3339.
    #   Default value is end of time.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/clean.rb.html) to see an example of how to use clean API.
    def clean(namespace_name, scheduled_task_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#clean.' if logger

      raise "Missing the required parameter 'namespace_name' when calling clean." if namespace_name.nil?
      raise "Missing the required parameter 'scheduled_task_id' when calling clean." if scheduled_task_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'scheduled_task_id' must not be blank" if OCI::Internal::Util.blank_string?(scheduled_task_id)

      path = '/namespaces/{namespaceName}/scheduledTasks/{scheduledTaskId}/actions/clean'.sub('{namespaceName}', namespace_name.to_s).sub('{scheduledTaskId}', scheduled_task_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:timeStart] = opts[:time_start] if opts[:time_start]
      query_params[:timeEnd] = opts[:time_end] if opts[:time_end]

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#clean') do
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


    # Returns the difference between the two input payloads, including intraline differences.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::CompareContentDetails] compare_content_details The two payloads to be compared.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::CompareContentResult CompareContentResult}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/compare_content.rb.html) to see an example of how to use compare_content API.
    def compare_content(namespace_name, compare_content_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#compare_content.' if logger

      raise "Missing the required parameter 'namespace_name' when calling compare_content." if namespace_name.nil?
      raise "Missing the required parameter 'compare_content_details' when calling compare_content." if compare_content_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/search/actions/compareContent'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:expect] ||= '100-continue'

      post_body = @api_client.object_to_http_body(compare_content_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#compare_content') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::CompareContentResult'
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


    # Add configuration for enterprise manager bridge. Enterprise manager bridge is used to automatically add selected entities from enterprise manager cloud control. A corresponding OCI bridge configuration is required in enterprise manager.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::CreateLogAnalyticsEmBridgeDetails] create_log_analytics_em_bridge_details Details for the enterprise manager bridge.
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
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsEmBridge LogAnalyticsEmBridge}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/create_log_analytics_em_bridge.rb.html) to see an example of how to use create_log_analytics_em_bridge API.
    def create_log_analytics_em_bridge(namespace_name, create_log_analytics_em_bridge_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#create_log_analytics_em_bridge.' if logger

      raise "Missing the required parameter 'namespace_name' when calling create_log_analytics_em_bridge." if namespace_name.nil?
      raise "Missing the required parameter 'create_log_analytics_em_bridge_details' when calling create_log_analytics_em_bridge." if create_log_analytics_em_bridge_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/logAnalyticsEmBridges'.sub('{namespaceName}', namespace_name.to_s)
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
      header_params[:expect] ||= '100-continue'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_log_analytics_em_bridge_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#create_log_analytics_em_bridge') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsEmBridge'
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


    # Create a new log analytics entity.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::CreateLogAnalyticsEntityDetails] create_log_analytics_entity_details Details for the new log analytics entity.
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
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsEntity LogAnalyticsEntity}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/create_log_analytics_entity.rb.html) to see an example of how to use create_log_analytics_entity API.
    def create_log_analytics_entity(namespace_name, create_log_analytics_entity_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#create_log_analytics_entity.' if logger

      raise "Missing the required parameter 'namespace_name' when calling create_log_analytics_entity." if namespace_name.nil?
      raise "Missing the required parameter 'create_log_analytics_entity_details' when calling create_log_analytics_entity." if create_log_analytics_entity_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/logAnalyticsEntities'.sub('{namespaceName}', namespace_name.to_s)
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
      header_params[:expect] ||= '100-continue'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_log_analytics_entity_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#create_log_analytics_entity') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsEntity'
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


    # Add custom log analytics entity type.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::CreateLogAnalyticsEntityTypeDetails] create_log_analytics_entity_type_details Definition for custom log analytics entity type.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/create_log_analytics_entity_type.rb.html) to see an example of how to use create_log_analytics_entity_type API.
    def create_log_analytics_entity_type(namespace_name, create_log_analytics_entity_type_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#create_log_analytics_entity_type.' if logger

      raise "Missing the required parameter 'namespace_name' when calling create_log_analytics_entity_type." if namespace_name.nil?
      raise "Missing the required parameter 'create_log_analytics_entity_type_details' when calling create_log_analytics_entity_type." if create_log_analytics_entity_type_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/logAnalyticsEntityTypes'.sub('{namespaceName}', namespace_name.to_s)
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
      header_params[:expect] ||= '100-continue'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_log_analytics_entity_type_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#create_log_analytics_entity_type') do
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


    # Creates a new log group in the specified compartment with the input display name. You may also specify optional information such as description, defined tags, and free-form tags.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::CreateLogAnalyticsLogGroupDetails] create_log_analytics_log_group_details Details for the new Log-Analytics group.
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
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsLogGroup LogAnalyticsLogGroup}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/create_log_analytics_log_group.rb.html) to see an example of how to use create_log_analytics_log_group API.
    def create_log_analytics_log_group(namespace_name, create_log_analytics_log_group_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#create_log_analytics_log_group.' if logger

      raise "Missing the required parameter 'namespace_name' when calling create_log_analytics_log_group." if namespace_name.nil?
      raise "Missing the required parameter 'create_log_analytics_log_group_details' when calling create_log_analytics_log_group." if create_log_analytics_log_group_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/logAnalyticsLogGroups'.sub('{namespaceName}', namespace_name.to_s)
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
      header_params[:expect] ||= '100-continue'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_log_analytics_log_group_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#create_log_analytics_log_group') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsLogGroup'
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


    # Creates a rule to collect logs from an object storage bucket.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::CreateLogAnalyticsObjectCollectionRuleDetails] create_log_analytics_object_collection_rule_details Details of the rule to be created.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsObjectCollectionRule LogAnalyticsObjectCollectionRule}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/create_log_analytics_object_collection_rule.rb.html) to see an example of how to use create_log_analytics_object_collection_rule API.
    def create_log_analytics_object_collection_rule(namespace_name, create_log_analytics_object_collection_rule_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#create_log_analytics_object_collection_rule.' if logger

      raise "Missing the required parameter 'namespace_name' when calling create_log_analytics_object_collection_rule." if namespace_name.nil?
      raise "Missing the required parameter 'create_log_analytics_object_collection_rule_details' when calling create_log_analytics_object_collection_rule." if create_log_analytics_object_collection_rule_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/logAnalyticsObjectCollectionRules'.sub('{namespaceName}', namespace_name.to_s)
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
      header_params[:expect] ||= '100-continue'

      post_body = @api_client.object_to_http_body(create_log_analytics_object_collection_rule_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#create_log_analytics_object_collection_rule') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsObjectCollectionRule'
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


    # Schedule a task as specified and return task info.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::CreateScheduledTaskDetails] create_scheduled_task_details Scheduled task to be created.
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
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::ScheduledTask ScheduledTask}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/create_scheduled_task.rb.html) to see an example of how to use create_scheduled_task API.
    def create_scheduled_task(namespace_name, create_scheduled_task_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#create_scheduled_task.' if logger

      raise "Missing the required parameter 'namespace_name' when calling create_scheduled_task." if namespace_name.nil?
      raise "Missing the required parameter 'create_scheduled_task_details' when calling create_scheduled_task." if create_scheduled_task_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/scheduledTasks'.sub('{namespaceName}', namespace_name.to_s)
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
      header_params[:expect] ||= '100-continue'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_scheduled_task_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#create_scheduled_task') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::ScheduledTask'
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


    # Deletes the associations between the sources and entities specified.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::DeleteLogAnalyticsAssociationDetails] delete_log_analytics_association_details details for association
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
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/delete_associations.rb.html) to see an example of how to use delete_associations API.
    def delete_associations(namespace_name, delete_log_analytics_association_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#delete_associations.' if logger

      raise "Missing the required parameter 'namespace_name' when calling delete_associations." if namespace_name.nil?
      raise "Missing the required parameter 'delete_log_analytics_association_details' when calling delete_associations." if delete_log_analytics_association_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/associations/actions/delete'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:expect] ||= '100-continue'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(delete_log_analytics_association_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#delete_associations') do
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


    # Deletes field with the specified name.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] field_name The field name.
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
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/delete_field.rb.html) to see an example of how to use delete_field API.
    def delete_field(namespace_name, field_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#delete_field.' if logger

      raise "Missing the required parameter 'namespace_name' when calling delete_field." if namespace_name.nil?
      raise "Missing the required parameter 'field_name' when calling delete_field." if field_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'field_name' must not be blank" if OCI::Internal::Util.blank_string?(field_name)

      path = '/namespaces/{namespaceName}/fields/{fieldName}'.sub('{namespaceName}', namespace_name.to_s).sub('{fieldName}', field_name.to_s)
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
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#delete_field') do
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


    # Deletes label with the specified name.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] label_name The label name.
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
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/delete_label.rb.html) to see an example of how to use delete_label API.
    def delete_label(namespace_name, label_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#delete_label.' if logger

      raise "Missing the required parameter 'namespace_name' when calling delete_label." if namespace_name.nil?
      raise "Missing the required parameter 'label_name' when calling delete_label." if label_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'label_name' must not be blank" if OCI::Internal::Util.blank_string?(label_name)

      path = '/namespaces/{namespaceName}/labels/{labelName}'.sub('{namespaceName}', namespace_name.to_s).sub('{labelName}', label_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#delete_label') do
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


    # Delete log analytics enterprise manager bridge with the given id.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] log_analytics_em_bridge_id The log analytics enterprise manager bridge OCID.
    #
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/delete_log_analytics_em_bridge.rb.html) to see an example of how to use delete_log_analytics_em_bridge API.
    def delete_log_analytics_em_bridge(namespace_name, log_analytics_em_bridge_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#delete_log_analytics_em_bridge.' if logger

      raise "Missing the required parameter 'namespace_name' when calling delete_log_analytics_em_bridge." if namespace_name.nil?
      raise "Missing the required parameter 'log_analytics_em_bridge_id' when calling delete_log_analytics_em_bridge." if log_analytics_em_bridge_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'log_analytics_em_bridge_id' must not be blank" if OCI::Internal::Util.blank_string?(log_analytics_em_bridge_id)

      path = '/namespaces/{namespaceName}/logAnalyticsEmBridges/{logAnalyticsEmBridgeId}'.sub('{namespaceName}', namespace_name.to_s).sub('{logAnalyticsEmBridgeId}', log_analytics_em_bridge_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#delete_log_analytics_em_bridge') do
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


    # Delete log analytics entity with the given id.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] log_analytics_entity_id The log analytics entity OCID.
    #
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/delete_log_analytics_entity.rb.html) to see an example of how to use delete_log_analytics_entity API.
    def delete_log_analytics_entity(namespace_name, log_analytics_entity_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#delete_log_analytics_entity.' if logger

      raise "Missing the required parameter 'namespace_name' when calling delete_log_analytics_entity." if namespace_name.nil?
      raise "Missing the required parameter 'log_analytics_entity_id' when calling delete_log_analytics_entity." if log_analytics_entity_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'log_analytics_entity_id' must not be blank" if OCI::Internal::Util.blank_string?(log_analytics_entity_id)

      path = '/namespaces/{namespaceName}/logAnalyticsEntities/{logAnalyticsEntityId}'.sub('{namespaceName}', namespace_name.to_s).sub('{logAnalyticsEntityId}', log_analytics_entity_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#delete_log_analytics_entity') do
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


    # Delete log analytics entity type with the given name.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] entity_type_name Log analytics entity type name.
    #
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/delete_log_analytics_entity_type.rb.html) to see an example of how to use delete_log_analytics_entity_type API.
    def delete_log_analytics_entity_type(namespace_name, entity_type_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#delete_log_analytics_entity_type.' if logger

      raise "Missing the required parameter 'namespace_name' when calling delete_log_analytics_entity_type." if namespace_name.nil?
      raise "Missing the required parameter 'entity_type_name' when calling delete_log_analytics_entity_type." if entity_type_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'entity_type_name' must not be blank" if OCI::Internal::Util.blank_string?(entity_type_name)

      path = '/namespaces/{namespaceName}/logAnalyticsEntityTypes/{entityTypeName}'.sub('{namespaceName}', namespace_name.to_s).sub('{entityTypeName}', entity_type_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#delete_log_analytics_entity_type') do
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


    # Deletes the specified log group. The log group cannot be part of an active association or have an active upload.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] log_analytics_log_group_id unique logAnalytics log group identifier
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/delete_log_analytics_log_group.rb.html) to see an example of how to use delete_log_analytics_log_group API.
    def delete_log_analytics_log_group(namespace_name, log_analytics_log_group_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#delete_log_analytics_log_group.' if logger

      raise "Missing the required parameter 'namespace_name' when calling delete_log_analytics_log_group." if namespace_name.nil?
      raise "Missing the required parameter 'log_analytics_log_group_id' when calling delete_log_analytics_log_group." if log_analytics_log_group_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'log_analytics_log_group_id' must not be blank" if OCI::Internal::Util.blank_string?(log_analytics_log_group_id)

      path = '/namespaces/{namespaceName}/logAnalyticsLogGroups/{logAnalyticsLogGroupId}'.sub('{namespaceName}', namespace_name.to_s).sub('{logAnalyticsLogGroupId}', log_analytics_log_group_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#delete_log_analytics_log_group') do
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


    # Deletes the configured object storage bucket based collection rule and stop the log collection.
    # It will not delete the existing processed data associated with this bucket from logging analytics storage.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] log_analytics_object_collection_rule_id The Logging Analytics Object Collection Rule [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/delete_log_analytics_object_collection_rule.rb.html) to see an example of how to use delete_log_analytics_object_collection_rule API.
    def delete_log_analytics_object_collection_rule(namespace_name, log_analytics_object_collection_rule_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#delete_log_analytics_object_collection_rule.' if logger

      raise "Missing the required parameter 'namespace_name' when calling delete_log_analytics_object_collection_rule." if namespace_name.nil?
      raise "Missing the required parameter 'log_analytics_object_collection_rule_id' when calling delete_log_analytics_object_collection_rule." if log_analytics_object_collection_rule_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'log_analytics_object_collection_rule_id' must not be blank" if OCI::Internal::Util.blank_string?(log_analytics_object_collection_rule_id)

      path = '/namespaces/{namespaceName}/logAnalyticsObjectCollectionRules/{logAnalyticsObjectCollectionRuleId}'.sub('{namespaceName}', namespace_name.to_s).sub('{logAnalyticsObjectCollectionRuleId}', log_analytics_object_collection_rule_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#delete_log_analytics_object_collection_rule') do
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


    # Deletes lookup with the specified name.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] lookup_name The name of the lookup to operate on.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [BOOLEAN] :is_force is force (default to false)
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/delete_lookup.rb.html) to see an example of how to use delete_lookup API.
    def delete_lookup(namespace_name, lookup_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#delete_lookup.' if logger

      raise "Missing the required parameter 'namespace_name' when calling delete_lookup." if namespace_name.nil?
      raise "Missing the required parameter 'lookup_name' when calling delete_lookup." if lookup_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'lookup_name' must not be blank" if OCI::Internal::Util.blank_string?(lookup_name)

      path = '/namespaces/{namespaceName}/lookups/{lookupName}'.sub('{namespaceName}', namespace_name.to_s).sub('{lookupName}', lookup_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:isForce] = opts[:is_force] if !opts[:is_force].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#delete_lookup') do
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


    # Deletes parser with the specified name.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] parser_name The parser name.
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
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/delete_parser.rb.html) to see an example of how to use delete_parser API.
    def delete_parser(namespace_name, parser_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#delete_parser.' if logger

      raise "Missing the required parameter 'namespace_name' when calling delete_parser." if namespace_name.nil?
      raise "Missing the required parameter 'parser_name' when calling delete_parser." if parser_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'parser_name' must not be blank" if OCI::Internal::Util.blank_string?(parser_name)

      path = '/namespaces/{namespaceName}/parsers/{parserName}'.sub('{namespaceName}', namespace_name.to_s).sub('{parserName}', parser_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#delete_parser') do
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


    # Delete the scheduled task.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] scheduled_task_id Unique scheduledTask id returned from task create.
    #   If invalid will lead to a 404 not found.
    #
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/delete_scheduled_task.rb.html) to see an example of how to use delete_scheduled_task API.
    def delete_scheduled_task(namespace_name, scheduled_task_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#delete_scheduled_task.' if logger

      raise "Missing the required parameter 'namespace_name' when calling delete_scheduled_task." if namespace_name.nil?
      raise "Missing the required parameter 'scheduled_task_id' when calling delete_scheduled_task." if scheduled_task_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'scheduled_task_id' must not be blank" if OCI::Internal::Util.blank_string?(scheduled_task_id)

      path = '/namespaces/{namespaceName}/scheduledTasks/{scheduledTaskId}'.sub('{namespaceName}', namespace_name.to_s).sub('{scheduledTaskId}', scheduled_task_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#delete_scheduled_task') do
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


    # Deletes source with the specified name.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] source_name The source name.
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
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/delete_source.rb.html) to see an example of how to use delete_source API.
    def delete_source(namespace_name, source_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#delete_source.' if logger

      raise "Missing the required parameter 'namespace_name' when calling delete_source." if namespace_name.nil?
      raise "Missing the required parameter 'source_name' when calling delete_source." if source_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'source_name' must not be blank" if OCI::Internal::Util.blank_string?(source_name)

      path = '/namespaces/{namespaceName}/sources/{sourceName}'.sub('{namespaceName}', namespace_name.to_s).sub('{sourceName}', source_name.to_s)
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
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#delete_source') do
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


    # Deletes an Upload by its reference.
    # It deletes all the logs in storage asscoiated with the upload and the corresponding upload metadata.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] upload_reference Unique internal identifier to refer upload container.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/delete_upload.rb.html) to see an example of how to use delete_upload API.
    def delete_upload(namespace_name, upload_reference, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#delete_upload.' if logger

      raise "Missing the required parameter 'namespace_name' when calling delete_upload." if namespace_name.nil?
      raise "Missing the required parameter 'upload_reference' when calling delete_upload." if upload_reference.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'upload_reference' must not be blank" if OCI::Internal::Util.blank_string?(upload_reference)

      path = '/namespaces/{namespaceName}/uploads/{uploadReference}'.sub('{namespaceName}', namespace_name.to_s).sub('{uploadReference}', upload_reference.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#delete_upload') do
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


    # Deletes a specific log file inside an upload by upload file reference.
    # It deletes all the logs from storage associated with the file and the corresponding metadata.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] upload_reference Unique internal identifier to refer upload container.
    # @param [String] file_reference Unique internal identifier to refer upload file.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/delete_upload_file.rb.html) to see an example of how to use delete_upload_file API.
    def delete_upload_file(namespace_name, upload_reference, file_reference, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#delete_upload_file.' if logger

      raise "Missing the required parameter 'namespace_name' when calling delete_upload_file." if namespace_name.nil?
      raise "Missing the required parameter 'upload_reference' when calling delete_upload_file." if upload_reference.nil?
      raise "Missing the required parameter 'file_reference' when calling delete_upload_file." if file_reference.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'upload_reference' must not be blank" if OCI::Internal::Util.blank_string?(upload_reference)
      raise "Parameter value for 'file_reference' must not be blank" if OCI::Internal::Util.blank_string?(file_reference)

      path = '/namespaces/{namespaceName}/uploads/{uploadReference}/files/{fileReference}'.sub('{namespaceName}', namespace_name.to_s).sub('{uploadReference}', upload_reference.to_s).sub('{fileReference}', file_reference.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#delete_upload_file') do
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


    # Suppresses a specific warning inside an upload.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] upload_reference Unique internal identifier to refer upload container.
    # @param [String] warning_reference Unique internal identifier to refer upload warning.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/delete_upload_warning.rb.html) to see an example of how to use delete_upload_warning API.
    def delete_upload_warning(namespace_name, upload_reference, warning_reference, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#delete_upload_warning.' if logger

      raise "Missing the required parameter 'namespace_name' when calling delete_upload_warning." if namespace_name.nil?
      raise "Missing the required parameter 'upload_reference' when calling delete_upload_warning." if upload_reference.nil?
      raise "Missing the required parameter 'warning_reference' when calling delete_upload_warning." if warning_reference.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'upload_reference' must not be blank" if OCI::Internal::Util.blank_string?(upload_reference)
      raise "Parameter value for 'warning_reference' must not be blank" if OCI::Internal::Util.blank_string?(warning_reference)

      path = '/namespaces/{namespaceName}/uploads/{uploadReference}/warnings/{warningReference}'.sub('{namespaceName}', namespace_name.to_s).sub('{uploadReference}', upload_reference.to_s).sub('{warningReference}', warning_reference.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#delete_upload_warning') do
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


    # This API disables archiving.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
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
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::Success Success}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/disable_archiving.rb.html) to see an example of how to use disable_archiving API.
    def disable_archiving(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#disable_archiving.' if logger

      raise "Missing the required parameter 'namespace_name' when calling disable_archiving." if namespace_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/storage/actions/disableArchiving'.sub('{namespaceName}', namespace_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#disable_archiving') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::Success'
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


    # Disables auto association for a log source. In the future, this log source would not be automatically
    # associated with any entity that becomes eligible for association. In addition, you may also optionally
    # remove all existing associations for this log source.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] source_name The source name.
    # @param [OCI::LogAnalytics::Models::DisableAutoAssociationDetails] disable_auto_association_details Details required to disable auto association for the log source.
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
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/disable_auto_association.rb.html) to see an example of how to use disable_auto_association API.
    def disable_auto_association(namespace_name, source_name, disable_auto_association_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#disable_auto_association.' if logger

      raise "Missing the required parameter 'namespace_name' when calling disable_auto_association." if namespace_name.nil?
      raise "Missing the required parameter 'source_name' when calling disable_auto_association." if source_name.nil?
      raise "Missing the required parameter 'disable_auto_association_details' when calling disable_auto_association." if disable_auto_association_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'source_name' must not be blank" if OCI::Internal::Util.blank_string?(source_name)

      path = '/namespaces/{namespaceName}/sources/{sourceName}/actions/disableAutoAssociation'.sub('{namespaceName}', namespace_name.to_s).sub('{sourceName}', source_name.to_s)
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
      header_params[:expect] ||= '100-continue'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(disable_auto_association_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#disable_auto_association') do
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


    # Disable one or more event types in a source.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] source_name The source name.
    # @param [OCI::LogAnalytics::Models::EventTypeDetails] disable_event_type_details Details of event types to be disabled in the source.
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
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/disable_source_event_types.rb.html) to see an example of how to use disable_source_event_types API.
    def disable_source_event_types(namespace_name, source_name, disable_event_type_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#disable_source_event_types.' if logger

      raise "Missing the required parameter 'namespace_name' when calling disable_source_event_types." if namespace_name.nil?
      raise "Missing the required parameter 'source_name' when calling disable_source_event_types." if source_name.nil?
      raise "Missing the required parameter 'disable_event_type_details' when calling disable_source_event_types." if disable_event_type_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'source_name' must not be blank" if OCI::Internal::Util.blank_string?(source_name)

      path = '/namespaces/{namespaceName}/sources/{sourceName}/actions/disableEventTypes'.sub('{namespaceName}', namespace_name.to_s).sub('{sourceName}', source_name.to_s)
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
      header_params[:expect] ||= '100-continue'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(disable_event_type_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#disable_source_event_types') do
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


    # THis API enables archiving.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
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
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::Success Success}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/enable_archiving.rb.html) to see an example of how to use enable_archiving API.
    def enable_archiving(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#enable_archiving.' if logger

      raise "Missing the required parameter 'namespace_name' when calling enable_archiving." if namespace_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/storage/actions/enableArchiving'.sub('{namespaceName}', namespace_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#enable_archiving') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::Success'
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


    # Enables auto association for a log source. This would initiate immediate association of the source
    # to any eligible entities it is not already associated with, and would also ensure the log source gets
    # associated with entities that are added or become eligible in the future.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] source_name The source name.
    # @param [OCI::LogAnalytics::Models::EnableAutoAssociationDetails] enable_auto_association_details Details required to enable auto association for the log source.
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
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/enable_auto_association.rb.html) to see an example of how to use enable_auto_association API.
    def enable_auto_association(namespace_name, source_name, enable_auto_association_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#enable_auto_association.' if logger

      raise "Missing the required parameter 'namespace_name' when calling enable_auto_association." if namespace_name.nil?
      raise "Missing the required parameter 'source_name' when calling enable_auto_association." if source_name.nil?
      raise "Missing the required parameter 'enable_auto_association_details' when calling enable_auto_association." if enable_auto_association_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'source_name' must not be blank" if OCI::Internal::Util.blank_string?(source_name)

      path = '/namespaces/{namespaceName}/sources/{sourceName}/actions/enableAutoAssociation'.sub('{namespaceName}', namespace_name.to_s).sub('{sourceName}', source_name.to_s)
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
      header_params[:expect] ||= '100-continue'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(enable_auto_association_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#enable_auto_association') do
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


    # Enable one or more event types in a source. An event type and version can be enabled only in one source.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] source_name The source name.
    # @param [OCI::LogAnalytics::Models::EventTypeDetails] enable_event_type_details Details of event types to be enabled in the source.
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
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/enable_source_event_types.rb.html) to see an example of how to use enable_source_event_types API.
    def enable_source_event_types(namespace_name, source_name, enable_event_type_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#enable_source_event_types.' if logger

      raise "Missing the required parameter 'namespace_name' when calling enable_source_event_types." if namespace_name.nil?
      raise "Missing the required parameter 'source_name' when calling enable_source_event_types." if source_name.nil?
      raise "Missing the required parameter 'enable_event_type_details' when calling enable_source_event_types." if enable_event_type_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'source_name' must not be blank" if OCI::Internal::Util.blank_string?(source_name)

      path = '/namespaces/{namespaceName}/sources/{sourceName}/actions/enableEventTypes'.sub('{namespaceName}', namespace_name.to_s).sub('{sourceName}', source_name.to_s)
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
      header_params[:expect] ||= '100-continue'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(enable_event_type_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#enable_source_event_types') do
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


    # This API estimates the size of data to be purged based based on time interval, purge query etc.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::EstimatePurgeDataSizeDetails] estimate_purge_data_size_details This is the input to estimate the size of data to be purged.
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
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::EstimatePurgeDataSizeResult EstimatePurgeDataSizeResult}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/estimate_purge_data_size.rb.html) to see an example of how to use estimate_purge_data_size API.
    def estimate_purge_data_size(namespace_name, estimate_purge_data_size_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#estimate_purge_data_size.' if logger

      raise "Missing the required parameter 'namespace_name' when calling estimate_purge_data_size." if namespace_name.nil?
      raise "Missing the required parameter 'estimate_purge_data_size_details' when calling estimate_purge_data_size." if estimate_purge_data_size_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/storage/actions/estimatePurgeDataSize'.sub('{namespaceName}', namespace_name.to_s)
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
      header_params[:expect] ||= '100-continue'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(estimate_purge_data_size_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#estimate_purge_data_size') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::EstimatePurgeDataSizeResult'
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


    # This API gives an active storage usage estimate for archived data to be recalled and the time range of such data.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::EstimateRecallDataSizeDetails] estimate_recall_data_size_details This is the input to estimate the size of data to be recalled.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::EstimateRecallDataSizeResult EstimateRecallDataSizeResult}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/estimate_recall_data_size.rb.html) to see an example of how to use estimate_recall_data_size API.
    def estimate_recall_data_size(namespace_name, estimate_recall_data_size_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#estimate_recall_data_size.' if logger

      raise "Missing the required parameter 'namespace_name' when calling estimate_recall_data_size." if namespace_name.nil?
      raise "Missing the required parameter 'estimate_recall_data_size_details' when calling estimate_recall_data_size." if estimate_recall_data_size_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/storage/actions/estimateRecallDataSize'.sub('{namespaceName}', namespace_name.to_s)
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
      header_params[:expect] ||= '100-continue'

      post_body = @api_client.object_to_http_body(estimate_recall_data_size_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#estimate_recall_data_size') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::EstimateRecallDataSizeResult'
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


    # This API gives an active storage usage estimate for recalled data to be released and the time range of such data.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::EstimateReleaseDataSizeDetails] estimate_release_data_size_details This is the input to estimate the size of recalled data to be released.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::EstimateReleaseDataSizeResult EstimateReleaseDataSizeResult}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/estimate_release_data_size.rb.html) to see an example of how to use estimate_release_data_size API.
    def estimate_release_data_size(namespace_name, estimate_release_data_size_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#estimate_release_data_size.' if logger

      raise "Missing the required parameter 'namespace_name' when calling estimate_release_data_size." if namespace_name.nil?
      raise "Missing the required parameter 'estimate_release_data_size_details' when calling estimate_release_data_size." if estimate_release_data_size_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/storage/actions/estimateReleaseDataSize'.sub('{namespaceName}', namespace_name.to_s)
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
      header_params[:expect] ||= '100-continue'

      post_body = @api_client.object_to_http_body(estimate_release_data_size_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#estimate_release_data_size') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::EstimateReleaseDataSizeResult'
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


    # Exports all custom details of the specified sources, parsers, fields and labels, in zip format.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::ExportContent] export_custom_content_details content to export
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
    # @option opts [String, IO] :response_target Streaming http body into a file (specified by file name or File object) or IO object if the block is not given
    # @option [Block] &block Streaming http body to the block
    # @return [Response] A Response object with data of type String if response_target and block are not given, otherwise with nil data
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/export_custom_content.rb.html) to see an example of how to use export_custom_content API.
    def export_custom_content(namespace_name, export_custom_content_details, opts = {}, &block)
      logger.debug 'Calling operation LogAnalyticsClient#export_custom_content.' if logger

      raise "Missing the required parameter 'namespace_name' when calling export_custom_content." if namespace_name.nil?
      raise "Missing the required parameter 'export_custom_content_details' when calling export_custom_content." if export_custom_content_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/contents/actions/exportCustomContent'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = opts[:accept] if opts[:accept]
      header_params[:accept] ||= 'application/octet-stream'
      header_params[:'accept-encoding'] = opts[:accept_encoding] if opts[:accept_encoding]
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:expect] ||= '100-continue'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(export_custom_content_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#export_custom_content') do
        if !block.nil?
          @api_client.call_api(
            :POST,
            path,
            endpoint,
            header_params: header_params,
            query_params: query_params,
            operation_signing_strategy: operation_signing_strategy,
            body: post_body,
            return_type: 'Stream',
            &block
          )
        elsif opts[:response_target]
          if opts[:response_target].respond_to? :write
            @api_client.call_api(
              :POST,
              path,
              endpoint,
              header_params: header_params,
              query_params: query_params,
              operation_signing_strategy: operation_signing_strategy,
              body: post_body,
              return_type: 'Stream',
              &proc { |chunk, _response| opts[:response_target].write(chunk) }
            )
          elsif opts[:response_target].is_a?(String)
            File.open(opts[:response_target], 'wb') do |output|
              return @api_client.call_api(
                :POST,
                path,
                endpoint,
                header_params: header_params,
                query_params: query_params,
                operation_signing_strategy: operation_signing_strategy,
                body: post_body,
                return_type: 'Stream',
                &proc { |chunk, _response| output.write(chunk) }
              )
            end
          end
        else
          @api_client.call_api(
            :POST,
            path,
            endpoint,
            header_params: header_params,
            query_params: query_params,
            operation_signing_strategy: operation_signing_strategy,
            body: post_body,
            return_type: 'String'
          )
        end
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Export data based on query. Endpoint returns a stream of data. Endpoint is synchronous. Queries must deliver first result within 60 seconds or calls are subject to timeout.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::ExportDetails] export_details Query to be exported
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String, IO] :response_target Streaming http body into a file (specified by file name or File object) or IO object if the block is not given
    # @option [Block] &block Streaming http body to the block
    # @return [Response] A Response object with data of type String if response_target and block are not given, otherwise with nil data
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/export_query_result.rb.html) to see an example of how to use export_query_result API.
    def export_query_result(namespace_name, export_details, opts = {}, &block)
      logger.debug 'Calling operation LogAnalyticsClient#export_query_result.' if logger

      raise "Missing the required parameter 'namespace_name' when calling export_query_result." if namespace_name.nil?
      raise "Missing the required parameter 'export_details' when calling export_query_result." if export_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/search/actions/export'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = opts[:accept] if opts[:accept]
      header_params[:accept] ||= 'application/octet-stream'
      header_params[:'accept-encoding'] = opts[:accept_encoding] if opts[:accept_encoding]
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:expect] ||= '100-continue'

      post_body = @api_client.object_to_http_body(export_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#export_query_result') do
        if !block.nil?
          @api_client.call_api(
            :POST,
            path,
            endpoint,
            header_params: header_params,
            query_params: query_params,
            operation_signing_strategy: operation_signing_strategy,
            body: post_body,
            return_type: 'Stream',
            &block
          )
        elsif opts[:response_target]
          if opts[:response_target].respond_to? :write
            @api_client.call_api(
              :POST,
              path,
              endpoint,
              header_params: header_params,
              query_params: query_params,
              operation_signing_strategy: operation_signing_strategy,
              body: post_body,
              return_type: 'Stream',
              &proc { |chunk, _response| opts[:response_target].write(chunk) }
            )
          elsif opts[:response_target].is_a?(String)
            File.open(opts[:response_target], 'wb') do |output|
              return @api_client.call_api(
                :POST,
                path,
                endpoint,
                header_params: header_params,
                query_params: query_params,
                operation_signing_strategy: operation_signing_strategy,
                body: post_body,
                return_type: 'Stream',
                &proc { |chunk, _response| output.write(chunk) }
              )
            end
          end
        else
          @api_client.call_api(
            :POST,
            path,
            endpoint,
            header_params: header_params,
            query_params: query_params,
            operation_signing_strategy: operation_signing_strategy,
            body: post_body,
            return_type: 'String'
          )
        end
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Extracts the field paths from the example json or xml content.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::LogAnalyticsParser] logan_parser_details parser definition
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :parser_type The parser type - possible values are XML, JSON or DELIMITED. (default to JSON)
    #   Allowed values are: XML, JSON, DELIMITED
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::ExtractLogFieldResults ExtractLogFieldResults}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/extract_structured_log_field_paths.rb.html) to see an example of how to use extract_structured_log_field_paths API.
    def extract_structured_log_field_paths(namespace_name, logan_parser_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#extract_structured_log_field_paths.' if logger

      raise "Missing the required parameter 'namespace_name' when calling extract_structured_log_field_paths." if namespace_name.nil?
      raise "Missing the required parameter 'logan_parser_details' when calling extract_structured_log_field_paths." if logan_parser_details.nil?

      if opts[:parser_type] && !%w[XML JSON DELIMITED].include?(opts[:parser_type])
        raise 'Invalid value for "parser_type", must be one of XML, JSON, DELIMITED.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/parsers/actions/extractLogFieldPaths'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:parserType] = opts[:parser_type] if opts[:parser_type]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:expect] ||= '100-continue'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(logan_parser_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#extract_structured_log_field_paths') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::ExtractLogFieldResults'
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


    # Extracts the header paths from the example json or xml content.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::LogAnalyticsParser] logan_parser_details parser definition
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :parser_type The parser type - possible values are XML, JSON or DELIMITED. (default to JSON)
    #   Allowed values are: XML, JSON, DELIMITED
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::ExtractLogHeaderResults ExtractLogHeaderResults}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/extract_structured_log_header_paths.rb.html) to see an example of how to use extract_structured_log_header_paths API.
    def extract_structured_log_header_paths(namespace_name, logan_parser_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#extract_structured_log_header_paths.' if logger

      raise "Missing the required parameter 'namespace_name' when calling extract_structured_log_header_paths." if namespace_name.nil?
      raise "Missing the required parameter 'logan_parser_details' when calling extract_structured_log_header_paths." if logan_parser_details.nil?

      if opts[:parser_type] && !%w[XML JSON DELIMITED].include?(opts[:parser_type])
        raise 'Invalid value for "parser_type", must be one of XML, JSON, DELIMITED.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/parsers/actions/extractLogHeaderPaths'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:parserType] = opts[:parser_type] if opts[:parser_type]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:expect] ||= '100-continue'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(logan_parser_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#extract_structured_log_header_paths') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::ExtractLogHeaderResults'
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


    # Each filter specifies an operator, a field and one or more values to be inserted into the provided query as criteria.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::FilterDetails] filter_details Query string and filters to add or remove
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::FilterOutput FilterOutput}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/filter.rb.html) to see an example of how to use filter API.
    def filter(namespace_name, filter_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#filter.' if logger

      raise "Missing the required parameter 'namespace_name' when calling filter." if namespace_name.nil?
      raise "Missing the required parameter 'filter_details' when calling filter." if filter_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/search/actions/filter'.sub('{namespaceName}', namespace_name.to_s)
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
      header_params[:expect] ||= '100-continue'

      post_body = @api_client.object_to_http_body(filter_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#filter') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::FilterOutput'
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


    # Returns the count of source associations for entities in the specified compartment.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::AssociationSummaryReport AssociationSummaryReport}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/get_association_summary.rb.html) to see an example of how to use get_association_summary API.
    def get_association_summary(namespace_name, compartment_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_association_summary.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_association_summary." if namespace_name.nil?
      raise "Missing the required parameter 'compartment_id' when calling get_association_summary." if compartment_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/associationSummary'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_association_summary') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::AssociationSummaryReport'
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


    # Gets detailed information about the category with the specified name.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] category_name The category name.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsCategory LogAnalyticsCategory}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/get_category.rb.html) to see an example of how to use get_category API.
    def get_category(namespace_name, category_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_category.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_category." if namespace_name.nil?
      raise "Missing the required parameter 'category_name' when calling get_category." if category_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'category_name' must not be blank" if OCI::Internal::Util.blank_string?(category_name)

      path = '/namespaces/{namespaceName}/categories/{categoryName}'.sub('{namespaceName}', namespace_name.to_s).sub('{categoryName}', category_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_category') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsCategory'
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


    # Extracts column names from the input SQL query.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] sql_query The SQL query from which column names are to be extracted.
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
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::ColumnNameCollection ColumnNameCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/get_column_names.rb.html) to see an example of how to use get_column_names API.
    def get_column_names(namespace_name, sql_query, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_column_names.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_column_names." if namespace_name.nil?
      raise "Missing the required parameter 'sql_query' when calling get_column_names." if sql_query.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/sources/sqlColumnNames'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:sqlQuery] = sql_query

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_column_names') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::ColumnNameCollection'
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


    # Returns detailed information about the configuration work request with the specified id.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] work_request_id Work Request Identifier [OCID] (https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) for the asynchronous request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsConfigWorkRequest LogAnalyticsConfigWorkRequest}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/get_config_work_request.rb.html) to see an example of how to use get_config_work_request API.
    def get_config_work_request(namespace_name, work_request_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_config_work_request.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_config_work_request." if namespace_name.nil?
      raise "Missing the required parameter 'work_request_id' when calling get_config_work_request." if work_request_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/namespaces/{namespaceName}/configWorkRequests/{workRequestId}'.sub('{namespaceName}', namespace_name.to_s).sub('{workRequestId}', work_request_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_config_work_request') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsConfigWorkRequest'
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


    # Gets detailed information about the field with the specified name.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] field_name The field name.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsField LogAnalyticsField}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/get_field.rb.html) to see an example of how to use get_field API.
    def get_field(namespace_name, field_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_field.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_field." if namespace_name.nil?
      raise "Missing the required parameter 'field_name' when calling get_field." if field_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'field_name' must not be blank" if OCI::Internal::Util.blank_string?(field_name)

      path = '/namespaces/{namespaceName}/fields/{fieldName}'.sub('{namespaceName}', namespace_name.to_s).sub('{fieldName}', field_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_field') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsField'
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


    # Returns the count of fields. You may optionally specify isShowDetail=true to view a summary of each field data type.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [BOOLEAN] :is_show_detail A boolean indicating whether or not to display detailed field summary information
    #    (default to false)
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::FieldSummaryReport FieldSummaryReport}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/get_fields_summary.rb.html) to see an example of how to use get_fields_summary API.
    def get_fields_summary(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_fields_summary.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_fields_summary." if namespace_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/fieldSummary'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:isShowDetail] = opts[:is_show_detail] if !opts[:is_show_detail].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_fields_summary') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::FieldSummaryReport'
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


    # Gets detailed information about the label with the specified name.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] label_name The label name.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsLabel LogAnalyticsLabel}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/get_label.rb.html) to see an example of how to use get_label API.
    def get_label(namespace_name, label_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_label.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_label." if namespace_name.nil?
      raise "Missing the required parameter 'label_name' when calling get_label." if label_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'label_name' must not be blank" if OCI::Internal::Util.blank_string?(label_name)

      path = '/namespaces/{namespaceName}/labels/{labelName}'.sub('{namespaceName}', namespace_name.to_s).sub('{labelName}', label_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_label') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsLabel'
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


    # Returns the count of labels.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LabelSummaryReport LabelSummaryReport}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/get_label_summary.rb.html) to see an example of how to use get_label_summary API.
    def get_label_summary(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_label_summary.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_label_summary." if namespace_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/labelSummary'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_label_summary') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LabelSummaryReport'
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


    # Retrieve the log analytics enterprise manager bridge with the given id.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] log_analytics_em_bridge_id The log analytics enterprise manager bridge OCID.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsEmBridge LogAnalyticsEmBridge}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/get_log_analytics_em_bridge.rb.html) to see an example of how to use get_log_analytics_em_bridge API.
    def get_log_analytics_em_bridge(namespace_name, log_analytics_em_bridge_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_log_analytics_em_bridge.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_log_analytics_em_bridge." if namespace_name.nil?
      raise "Missing the required parameter 'log_analytics_em_bridge_id' when calling get_log_analytics_em_bridge." if log_analytics_em_bridge_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'log_analytics_em_bridge_id' must not be blank" if OCI::Internal::Util.blank_string?(log_analytics_em_bridge_id)

      path = '/namespaces/{namespaceName}/logAnalyticsEmBridges/{logAnalyticsEmBridgeId}'.sub('{namespaceName}', namespace_name.to_s).sub('{logAnalyticsEmBridgeId}', log_analytics_em_bridge_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_log_analytics_em_bridge') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsEmBridge'
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


    # Returns log analytics enterprise manager bridges summary report.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsEmBridgeSummaryReport LogAnalyticsEmBridgeSummaryReport}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/get_log_analytics_em_bridge_summary.rb.html) to see an example of how to use get_log_analytics_em_bridge_summary API.
    def get_log_analytics_em_bridge_summary(namespace_name, compartment_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_log_analytics_em_bridge_summary.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_log_analytics_em_bridge_summary." if namespace_name.nil?
      raise "Missing the required parameter 'compartment_id' when calling get_log_analytics_em_bridge_summary." if compartment_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/logAnalyticsEmBridges/emBridgeSummary'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_log_analytics_em_bridge_summary') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsEmBridgeSummaryReport'
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


    # Returns log analytics entities count summary report.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsEntitySummaryReport LogAnalyticsEntitySummaryReport}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/get_log_analytics_entities_summary.rb.html) to see an example of how to use get_log_analytics_entities_summary API.
    def get_log_analytics_entities_summary(namespace_name, compartment_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_log_analytics_entities_summary.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_log_analytics_entities_summary." if namespace_name.nil?
      raise "Missing the required parameter 'compartment_id' when calling get_log_analytics_entities_summary." if compartment_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/logAnalyticsEntities/entitySummary'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_log_analytics_entities_summary') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsEntitySummaryReport'
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


    # Retrieve the log analytics entity with the given id.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] log_analytics_entity_id The log analytics entity OCID.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsEntity LogAnalyticsEntity}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/get_log_analytics_entity.rb.html) to see an example of how to use get_log_analytics_entity API.
    def get_log_analytics_entity(namespace_name, log_analytics_entity_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_log_analytics_entity.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_log_analytics_entity." if namespace_name.nil?
      raise "Missing the required parameter 'log_analytics_entity_id' when calling get_log_analytics_entity." if log_analytics_entity_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'log_analytics_entity_id' must not be blank" if OCI::Internal::Util.blank_string?(log_analytics_entity_id)

      path = '/namespaces/{namespaceName}/logAnalyticsEntities/{logAnalyticsEntityId}'.sub('{namespaceName}', namespace_name.to_s).sub('{logAnalyticsEntityId}', log_analytics_entity_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_log_analytics_entity') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsEntity'
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


    # Retrieve the log analytics entity type with the given name.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] entity_type_name Log analytics entity type name.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsEntityType LogAnalyticsEntityType}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/get_log_analytics_entity_type.rb.html) to see an example of how to use get_log_analytics_entity_type API.
    def get_log_analytics_entity_type(namespace_name, entity_type_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_log_analytics_entity_type.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_log_analytics_entity_type." if namespace_name.nil?
      raise "Missing the required parameter 'entity_type_name' when calling get_log_analytics_entity_type." if entity_type_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'entity_type_name' must not be blank" if OCI::Internal::Util.blank_string?(entity_type_name)

      path = '/namespaces/{namespaceName}/logAnalyticsEntityTypes/{entityTypeName}'.sub('{namespaceName}', namespace_name.to_s).sub('{entityTypeName}', entity_type_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_log_analytics_entity_type') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsEntityType'
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


    # Gets detailed information about the specified log group such as display name, description, defined tags, and free-form tags.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] log_analytics_log_group_id unique logAnalytics log group identifier
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsLogGroup LogAnalyticsLogGroup}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/get_log_analytics_log_group.rb.html) to see an example of how to use get_log_analytics_log_group API.
    def get_log_analytics_log_group(namespace_name, log_analytics_log_group_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_log_analytics_log_group.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_log_analytics_log_group." if namespace_name.nil?
      raise "Missing the required parameter 'log_analytics_log_group_id' when calling get_log_analytics_log_group." if log_analytics_log_group_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'log_analytics_log_group_id' must not be blank" if OCI::Internal::Util.blank_string?(log_analytics_log_group_id)

      path = '/namespaces/{namespaceName}/logAnalyticsLogGroups/{logAnalyticsLogGroupId}'.sub('{namespaceName}', namespace_name.to_s).sub('{logAnalyticsLogGroupId}', log_analytics_log_group_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_log_analytics_log_group') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsLogGroup'
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


    # Returns the count of log groups in a compartment.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogGroupSummaryReport LogGroupSummaryReport}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/get_log_analytics_log_groups_summary.rb.html) to see an example of how to use get_log_analytics_log_groups_summary API.
    def get_log_analytics_log_groups_summary(namespace_name, compartment_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_log_analytics_log_groups_summary.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_log_analytics_log_groups_summary." if namespace_name.nil?
      raise "Missing the required parameter 'compartment_id' when calling get_log_analytics_log_groups_summary." if compartment_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/logAnalyticsLogGroupsSummary'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_log_analytics_log_groups_summary') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogGroupSummaryReport'
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


    # Gets a configured object storage based collection rule by given id
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] log_analytics_object_collection_rule_id The Logging Analytics Object Collection Rule [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsObjectCollectionRule LogAnalyticsObjectCollectionRule}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/get_log_analytics_object_collection_rule.rb.html) to see an example of how to use get_log_analytics_object_collection_rule API.
    def get_log_analytics_object_collection_rule(namespace_name, log_analytics_object_collection_rule_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_log_analytics_object_collection_rule.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_log_analytics_object_collection_rule." if namespace_name.nil?
      raise "Missing the required parameter 'log_analytics_object_collection_rule_id' when calling get_log_analytics_object_collection_rule." if log_analytics_object_collection_rule_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'log_analytics_object_collection_rule_id' must not be blank" if OCI::Internal::Util.blank_string?(log_analytics_object_collection_rule_id)

      path = '/namespaces/{namespaceName}/logAnalyticsObjectCollectionRules/{logAnalyticsObjectCollectionRuleId}'.sub('{namespaceName}', namespace_name.to_s).sub('{logAnalyticsObjectCollectionRuleId}', log_analytics_object_collection_rule_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_log_analytics_object_collection_rule') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsObjectCollectionRule'
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


    # This API returns the count of distinct log sets.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogSetsCount LogSetsCount}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/get_log_sets_count.rb.html) to see an example of how to use get_log_sets_count API.
    def get_log_sets_count(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_log_sets_count.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_log_sets_count." if namespace_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/storage/logSetsCount'.sub('{namespaceName}', namespace_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_log_sets_count') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogSetsCount'
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


    # Gets detailed information about the lookup with the specified name.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] lookup_name The name of the lookup to operate on.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsLookup LogAnalyticsLookup}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/get_lookup.rb.html) to see an example of how to use get_lookup API.
    def get_lookup(namespace_name, lookup_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_lookup.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_lookup." if namespace_name.nil?
      raise "Missing the required parameter 'lookup_name' when calling get_lookup." if lookup_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'lookup_name' must not be blank" if OCI::Internal::Util.blank_string?(lookup_name)

      path = '/namespaces/{namespaceName}/lookups/{lookupName}'.sub('{namespaceName}', namespace_name.to_s).sub('{lookupName}', lookup_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_lookup') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsLookup'
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


    # Returns the count of user created and oracle defined lookups.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LookupSummaryReport LookupSummaryReport}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/get_lookup_summary.rb.html) to see an example of how to use get_lookup_summary API.
    def get_lookup_summary(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_lookup_summary.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_lookup_summary." if namespace_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/lookupSummary'.sub('{namespaceName}', namespace_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_lookup_summary') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LookupSummaryReport'
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


    # This API gets the namespace details of a tenancy already onboarded in Logging Analytics Application
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::Namespace Namespace}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/get_namespace.rb.html) to see an example of how to use get_namespace API.
    def get_namespace(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_namespace.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_namespace." if namespace_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}'.sub('{namespaceName}', namespace_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_namespace') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::Namespace'
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


    # Gets detailed information about the parser with the specified name.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] parser_name The parser name.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsParser LogAnalyticsParser}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/get_parser.rb.html) to see an example of how to use get_parser API.
    def get_parser(namespace_name, parser_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_parser.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_parser." if namespace_name.nil?
      raise "Missing the required parameter 'parser_name' when calling get_parser." if parser_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'parser_name' must not be blank" if OCI::Internal::Util.blank_string?(parser_name)

      path = '/namespaces/{namespaceName}/parsers/{parserName}'.sub('{namespaceName}', namespace_name.to_s).sub('{parserName}', parser_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_parser') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsParser'
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


    # Returns the count of parsers.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::ParserSummaryReport ParserSummaryReport}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/get_parser_summary.rb.html) to see an example of how to use get_parser_summary API.
    def get_parser_summary(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_parser_summary.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_parser_summary." if namespace_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/parsersSummary'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_parser_summary') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::ParserSummaryReport'
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


    # Lists the preferences of the tenant. Currently, only \"DEFAULT_HOMEPAGE\" is supported.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The attribute used to sort the returned preferences. (default to name)
    #   Allowed values are: name
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsPreferenceCollection LogAnalyticsPreferenceCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/get_preferences.rb.html) to see an example of how to use get_preferences API.
    def get_preferences(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_preferences.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_preferences." if namespace_name.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[name].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of name.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/preferences'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_preferences') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsPreferenceCollection'
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


    # Returns the intermediate results for a query that was specified to run asynchronously if the query has not completed,
    # otherwise the final query results identified by a queryWorkRequestId returned when submitting the query execute asynchronously.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] work_request_id Work Request Identifier [OCID] (https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) for the asynchronous request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [Integer] :limit Maximum number of results to return in this request.  Note a limit=-1 returns all results from pageId onwards up to maxtotalCount. (default to 10)
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [BOOLEAN] :should_include_columns Include columns in response (default to true)
    # @option opts [BOOLEAN] :should_include_fields Include fields in response (default to true)
    # @option opts [String] :output_mode Specifies the format for the returned results. (default to JSON_ROWS)
    #   Allowed values are: JSON_ROWS
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::QueryAggregation QueryAggregation}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/get_query_result.rb.html) to see an example of how to use get_query_result API.
    def get_query_result(namespace_name, work_request_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_query_result.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_query_result." if namespace_name.nil?
      raise "Missing the required parameter 'work_request_id' when calling get_query_result." if work_request_id.nil?

      if opts[:output_mode] && !%w[JSON_ROWS].include?(opts[:output_mode])
        raise 'Invalid value for "output_mode", must be one of JSON_ROWS.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/search/actions/query'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:workRequestId] = work_request_id
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:shouldIncludeColumns] = opts[:should_include_columns] if !opts[:should_include_columns].nil?
      query_params[:shouldIncludeFields] = opts[:should_include_fields] if !opts[:should_include_fields].nil?
      query_params[:outputMode] = opts[:output_mode] if opts[:output_mode]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_query_result') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::QueryAggregation'
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


    # Retrieve work request details by workRequestId. This endpoint can be polled for status tracking of work request. Clients should poll using the interval returned in the retry-after header.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] work_request_id Work Request Identifier [OCID] (https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) for the asynchronous request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::QueryWorkRequest QueryWorkRequest}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/get_query_work_request.rb.html) to see an example of how to use get_query_work_request API.
    def get_query_work_request(namespace_name, work_request_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_query_work_request.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_query_work_request." if namespace_name.nil?
      raise "Missing the required parameter 'work_request_id' when calling get_query_work_request." if work_request_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/namespaces/{namespaceName}/queryWorkRequests/{workRequestId}'.sub('{namespaceName}', namespace_name.to_s).sub('{workRequestId}', work_request_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_query_work_request') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::QueryWorkRequest'
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


    # Get the scheduled task for the specified task identifier.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] scheduled_task_id Unique scheduledTask id returned from task create.
    #   If invalid will lead to a 404 not found.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::ScheduledTask ScheduledTask}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/get_scheduled_task.rb.html) to see an example of how to use get_scheduled_task API.
    def get_scheduled_task(namespace_name, scheduled_task_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_scheduled_task.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_scheduled_task." if namespace_name.nil?
      raise "Missing the required parameter 'scheduled_task_id' when calling get_scheduled_task." if scheduled_task_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'scheduled_task_id' must not be blank" if OCI::Internal::Util.blank_string?(scheduled_task_id)

      path = '/namespaces/{namespaceName}/scheduledTasks/{scheduledTaskId}'.sub('{namespaceName}', namespace_name.to_s).sub('{scheduledTaskId}', scheduled_task_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_scheduled_task') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::ScheduledTask'
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


    # Gets detailed information about the source with the specified name.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] source_name The source name.
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsSource LogAnalyticsSource}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/get_source.rb.html) to see an example of how to use get_source API.
    def get_source(namespace_name, source_name, compartment_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_source.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_source." if namespace_name.nil?
      raise "Missing the required parameter 'source_name' when calling get_source." if source_name.nil?
      raise "Missing the required parameter 'compartment_id' when calling get_source." if compartment_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'source_name' must not be blank" if OCI::Internal::Util.blank_string?(source_name)

      path = '/namespaces/{namespaceName}/sources/{sourceName}'.sub('{namespaceName}', namespace_name.to_s).sub('{sourceName}', source_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_source') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsSource'
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


    # Returns the count of sources.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::SourceSummaryReport SourceSummaryReport}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/get_source_summary.rb.html) to see an example of how to use get_source_summary API.
    def get_source_summary(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_source_summary.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_source_summary." if namespace_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/sourceSummary'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_source_summary') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::SourceSummaryReport'
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


    # This API gets the storage configuration of a tenancy
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::Storage Storage}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/get_storage.rb.html) to see an example of how to use get_storage API.
    def get_storage(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_storage.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_storage." if namespace_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/storage'.sub('{namespaceName}', namespace_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_storage') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::Storage'
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


    # This API gets storage usage information of a tenancy.  Storage usage information includes active, archived or recalled
    # data.  The unit of return data is in bytes.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::StorageUsage StorageUsage}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/get_storage_usage.rb.html) to see an example of how to use get_storage_usage API.
    def get_storage_usage(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_storage_usage.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_storage_usage." if namespace_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/storage/usage'.sub('{namespaceName}', namespace_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_storage_usage') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::StorageUsage'
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


    # This API returns work request details specified by {workRequestId}. This API can be polled for status tracking of
    # work request.  Clients should poll using the interval returned in retry-after header.
    #
    # @param [String] work_request_id Work Request Identifier [OCID] (https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) for the asynchronous request.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::StorageWorkRequest StorageWorkRequest}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/get_storage_work_request.rb.html) to see an example of how to use get_storage_work_request API.
    def get_storage_work_request(work_request_id, namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_storage_work_request.' if logger

      raise "Missing the required parameter 'work_request_id' when calling get_storage_work_request." if work_request_id.nil?
      raise "Missing the required parameter 'namespace_name' when calling get_storage_work_request." if namespace_name.nil?
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/storageWorkRequests/{workRequestId}'.sub('{workRequestId}', work_request_id.to_s).sub('{namespaceName}', namespace_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_storage_work_request') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::StorageWorkRequest'
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


    # This API retrieves details of the configured bucket that stores unprocessed payloads.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::UnprocessedDataBucket UnprocessedDataBucket}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/get_unprocessed_data_bucket.rb.html) to see an example of how to use get_unprocessed_data_bucket API.
    def get_unprocessed_data_bucket(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_unprocessed_data_bucket.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_unprocessed_data_bucket." if namespace_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/unprocessedDataBucket'.sub('{namespaceName}', namespace_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_unprocessed_data_bucket') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::UnprocessedDataBucket'
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


    # Gets an On-Demand Upload info by reference.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] upload_reference Unique internal identifier to refer upload container.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::Upload Upload}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/get_upload.rb.html) to see an example of how to use get_upload API.
    def get_upload(namespace_name, upload_reference, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_upload.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_upload." if namespace_name.nil?
      raise "Missing the required parameter 'upload_reference' when calling get_upload." if upload_reference.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'upload_reference' must not be blank" if OCI::Internal::Util.blank_string?(upload_reference)

      path = '/namespaces/{namespaceName}/uploads/{uploadReference}'.sub('{namespaceName}', namespace_name.to_s).sub('{uploadReference}', upload_reference.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_upload') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::Upload'
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


    # Gets the status of the work request with the given ID.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] work_request_id Work Request Identifier [OCID] (https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) for the asynchronous request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::WorkRequest WorkRequest}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/get_work_request.rb.html) to see an example of how to use get_work_request API.
    def get_work_request(namespace_name, work_request_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_work_request.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_work_request." if namespace_name.nil?
      raise "Missing the required parameter 'work_request_id' when calling get_work_request." if work_request_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/namespaces/{namespaceName}/workRequests/{workRequestId}'.sub('{namespaceName}', namespace_name.to_s).sub('{workRequestId}', work_request_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_work_request') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::WorkRequest'
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


    # Imports the specified custom content from the input in zip format.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String, IO] import_custom_content_file_body The file to upload which contains the custom content.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [BOOLEAN] :is_overwrite A flag indicating whether or not to overwrite existing content if a conflict is
    #   found during import content operation.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :expect A value of `100-continue` requests preliminary verification of the request method, path, and headers before the request body is sent.
    #   If no error results from such verification, the server will send a 100 (Continue) interim response to indicate readiness for the request body.
    #   The only allowed value for this parameter is \"100-Continue\" (case-insensitive).
    #
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsImportCustomContent LogAnalyticsImportCustomContent}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/import_custom_content.rb.html) to see an example of how to use import_custom_content API.
    def import_custom_content(namespace_name, import_custom_content_file_body, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#import_custom_content.' if logger

      raise "Missing the required parameter 'namespace_name' when calling import_custom_content." if namespace_name.nil?
      raise "Missing the required parameter 'import_custom_content_file_body' when calling import_custom_content." if import_custom_content_file_body.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/contents/actions/importCustomContent'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:isOverwrite] = opts[:is_overwrite] if !opts[:is_overwrite].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:expect] = opts[:expect] if opts[:expect]
      # rubocop:enable Style/NegatedIf
      header_params[:'content-type'] ||= 'application/octet-stream'
      header_params[:expect] ||= '100-continue'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(import_custom_content_file_body)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#import_custom_content') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsImportCustomContent'
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


    # Lists the entities in the specified compartment which are (in)eligible for association with this source.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] source_name The source name.
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :type The entity type - either eligible or ineligible for association. (default to ELIGIBLE)
    #   Allowed values are: ELIGIBLE, INELIGIBLE
    # @option opts [String] :search_text The text used for filtering returned entities.  Search text is applicable to the
    #   entity name and the entity description.
    #
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_by The attribute used to sort the returned entities (default to entityName)
    #   Allowed values are: entityName, entityTypeName, host, agentId
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::AssociableEntityCollection AssociableEntityCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_associable_entities.rb.html) to see an example of how to use list_associable_entities API.
    def list_associable_entities(namespace_name, source_name, compartment_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_associable_entities.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_associable_entities." if namespace_name.nil?
      raise "Missing the required parameter 'source_name' when calling list_associable_entities." if source_name.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_associable_entities." if compartment_id.nil?

      if opts[:type] && !%w[ELIGIBLE INELIGIBLE].include?(opts[:type])
        raise 'Invalid value for "type", must be one of ELIGIBLE, INELIGIBLE.'
      end

      if opts[:sort_by] && !%w[entityName entityTypeName host agentId].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of entityName, entityTypeName, host, agentId.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'source_name' must not be blank" if OCI::Internal::Util.blank_string?(source_name)

      path = '/namespaces/{namespaceName}/sources/{sourceName}/associableEntities'.sub('{namespaceName}', namespace_name.to_s).sub('{sourceName}', source_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:type] = opts[:type] if opts[:type]
      query_params[:searchText] = opts[:search_text] if opts[:search_text]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_associable_entities') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::AssociableEntityCollection'
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


    # Lists the association details of entities in the specified compartment that are associated with at least one source.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :entity_id The entity OCID.
    #
    # @option opts [String] :entity_type The entity type used for filtering.  Only associations on an entity with the
    #   specified type will be returned.
    #
    # @option opts [String] :entity_type_display_name The entity type display name used for filtering.  Only items associated with the entity
    #   with the specified type display name will be returned.
    #
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The attribute used to sort the returned entities (default to entityName)
    #   Allowed values are: entityName, entityTypeDisplayName, associationCount
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsAssociatedEntityCollection LogAnalyticsAssociatedEntityCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_associated_entities.rb.html) to see an example of how to use list_associated_entities API.
    def list_associated_entities(namespace_name, compartment_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_associated_entities.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_associated_entities." if namespace_name.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_associated_entities." if compartment_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[entityName entityTypeDisplayName associationCount].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of entityName, entityTypeDisplayName, associationCount.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/associatedEntities'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:entityId] = opts[:entity_id] if opts[:entity_id]
      query_params[:entityType] = opts[:entity_type] if opts[:entity_type]
      query_params[:entityTypeDisplayName] = opts[:entity_type_display_name] if opts[:entity_type_display_name]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_associated_entities') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsAssociatedEntityCollection'
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


    # Gets information related to auto association for the source with the specified name.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] source_name The source name.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_by The attribute used to sort the returned auto association information. (default to isEnabled)
    #   Allowed values are: isEnabled
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::AutoAssociationCollection AutoAssociationCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_auto_associations.rb.html) to see an example of how to use list_auto_associations API.
    def list_auto_associations(namespace_name, source_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_auto_associations.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_auto_associations." if namespace_name.nil?
      raise "Missing the required parameter 'source_name' when calling list_auto_associations." if source_name.nil?

      if opts[:sort_by] && !%w[isEnabled].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of isEnabled.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'source_name' must not be blank" if OCI::Internal::Util.blank_string?(source_name)

      path = '/namespaces/{namespaceName}/sources/{sourceName}/autoAssociations'.sub('{namespaceName}', namespace_name.to_s).sub('{sourceName}', source_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_auto_associations') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::AutoAssociationCollection'
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


    # Returns a list of categories, containing detailed information about them. You may limit the number of results, provide sorting order, and filter by information such as category name or description.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :category_type A comma-separated list of category types used for filtering. Only categories of the
    #   specified types will be returned.
    #
    # @option opts [String] :category_display_text The category display text used for filtering. Only categories matching the specified display
    #   name or description will be returned.
    #
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The attribute used to sort the returned categories (default to displayName)
    #   Allowed values are: displayName, type
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :name A filter to return only log analytics entities whose name matches the entire name given. The match
    #   is case-insensitive.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsCategoryCollection LogAnalyticsCategoryCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_categories.rb.html) to see an example of how to use list_categories API.
    def list_categories(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_categories.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_categories." if namespace_name.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[displayName type].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of displayName, type.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/categories'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:categoryType] = opts[:category_type] if opts[:category_type]
      query_params[:categoryDisplayText] = opts[:category_display_text] if opts[:category_display_text]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:name] = opts[:name] if opts[:name]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_categories') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsCategoryCollection'
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


    # Returns the list of configuration work requests such as association or lookup operations, containing detailed information about them. You may paginate or limit the number of results.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The attribute used to sort the returned work requests (default to timeAccepted)
    #   Allowed values are: timeAccepted
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsConfigWorkRequestCollection LogAnalyticsConfigWorkRequestCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_config_work_requests.rb.html) to see an example of how to use list_config_work_requests API.
    def list_config_work_requests(namespace_name, compartment_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_config_work_requests.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_config_work_requests." if namespace_name.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_config_work_requests." if compartment_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[timeAccepted].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeAccepted.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/configWorkRequests'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_config_work_requests') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsConfigWorkRequestCollection'
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


    # Return a list of log analytics entities associated with input source log analytics entity.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] log_analytics_entity_id The log analytics entity OCID.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :direct_or_all_associations Indicates whether to return direct associated entities or direct and inferred associated entities.
    #    (default to DIRECT)
    #   Allowed values are: DIRECT, ALL
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort entities by. Only one sort order may be provided. Default order for timeCreated and timeUpdated
    #   is descending. Default order for entity name is ascending. If no value is specified timeCreated is default.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, timeUpdated, name
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsEntityCollection LogAnalyticsEntityCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_entity_associations.rb.html) to see an example of how to use list_entity_associations API.
    def list_entity_associations(namespace_name, log_analytics_entity_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_entity_associations.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_entity_associations." if namespace_name.nil?
      raise "Missing the required parameter 'log_analytics_entity_id' when calling list_entity_associations." if log_analytics_entity_id.nil?

      if opts[:direct_or_all_associations] && !%w[DIRECT ALL].include?(opts[:direct_or_all_associations])
        raise 'Invalid value for "direct_or_all_associations", must be one of DIRECT, ALL.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[timeCreated timeUpdated name].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, timeUpdated, name.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'log_analytics_entity_id' must not be blank" if OCI::Internal::Util.blank_string?(log_analytics_entity_id)

      path = '/namespaces/{namespaceName}/logAnalyticsEntities/{logAnalyticsEntityId}/entityAssociations'.sub('{namespaceName}', namespace_name.to_s).sub('{logAnalyticsEntityId}', log_analytics_entity_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:directOrAllAssociations] = opts[:direct_or_all_associations] if opts[:direct_or_all_associations]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_entity_associations') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsEntityCollection'
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


    # Returns the list of source associations for the specified entity.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :entity_id The entity OCID.
    #
    # @option opts [String] :entity_type The entity type used for filtering.  Only associations on an entity with the
    #   specified type will be returned.
    #
    # @option opts [String] :entity_type_display_name The entity type display name used for filtering.  Only items associated with the entity
    #   with the specified type display name will be returned.
    #
    # @option opts [String] :life_cycle_state The life cycle state used for filtering.  Only associations with the specified
    #   life cycle state will be returned.
    #    (default to ALL)
    #   Allowed values are: ALL, ACCEPTED, IN_PROGRESS, SUCCEEDED, FAILED
    # @option opts [BOOLEAN] :is_show_total A flag indicating whether or not to return the total number of items returned.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The attribute used to sort the returned associations (default to sourceDisplayName)
    #   Allowed values are: sourceDisplayName, timeLastAttempted, status
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsAssociationCollection LogAnalyticsAssociationCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_entity_source_associations.rb.html) to see an example of how to use list_entity_source_associations API.
    def list_entity_source_associations(namespace_name, compartment_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_entity_source_associations.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_entity_source_associations." if namespace_name.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_entity_source_associations." if compartment_id.nil?

      if opts[:life_cycle_state] && !%w[ALL ACCEPTED IN_PROGRESS SUCCEEDED FAILED].include?(opts[:life_cycle_state])
        raise 'Invalid value for "life_cycle_state", must be one of ALL, ACCEPTED, IN_PROGRESS, SUCCEEDED, FAILED.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[sourceDisplayName timeLastAttempted status].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of sourceDisplayName, timeLastAttempted, status.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/entityAssociations'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:entityId] = opts[:entity_id] if opts[:entity_id]
      query_params[:entityType] = opts[:entity_type] if opts[:entity_type]
      query_params[:entityTypeDisplayName] = opts[:entity_type_display_name] if opts[:entity_type_display_name]
      query_params[:lifeCycleState] = opts[:life_cycle_state] if opts[:life_cycle_state]
      query_params[:isShowTotal] = opts[:is_show_total] if !opts[:is_show_total].nil?
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_entity_source_associations') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsAssociationCollection'
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


    # Returns a list of log fields, containing detailed information about them. You may limit the number of results, provide sorting order, and filter by specifying various options including parser and source names.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [BOOLEAN] :is_match_all A flag indicating how to handle filtering when multiple filter criteria are specified.
    #   A value of true will always result in the most expansive list of items being returned.
    #   For example, if two field lists are supplies as filter criteria, a value of true will
    #   result in any item matching a field in either list being returned, while a value of
    #   false will result in a list of items which only have fields contained in both input lists.
    #
    # @option opts [String] :source_ids A list of source IDs used for filtering.  Only fields used by the specified
    #   sources will be returned.
    #
    # @option opts [String] :source_names A list of source names used for filtering.  Only fields used by the specified
    #   sources will be returned.
    #
    # @option opts [String] :parser_type The parser type used for filtering.  Only items with, or associated with, parsers
    #   of the specified type will be returned.
    #    (default to ALL)
    #   Allowed values are: ALL, REGEX, XML, JSON, ODL, DELIMITED
    # @option opts [String] :parser_ids A list of parser names used for filtering.  Only fields used by the specified
    #   parsers will be returned.
    #
    # @option opts [String] :parser_names A list of parser names used for filtering.  Only fields used by the specified
    #   parsers will be returned.
    #
    # @option opts [BOOLEAN] :is_include_parser isIncludeParser (default to true)
    # @option opts [String] :filter filter
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The attribute used to sort the returned fields (default to name)
    #   Allowed values are: name, dataType
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsFieldCollection LogAnalyticsFieldCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_fields.rb.html) to see an example of how to use list_fields API.
    def list_fields(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_fields.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_fields." if namespace_name.nil?

      if opts[:parser_type] && !%w[ALL REGEX XML JSON ODL DELIMITED].include?(opts[:parser_type])
        raise 'Invalid value for "parser_type", must be one of ALL, REGEX, XML, JSON, ODL, DELIMITED.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[name dataType].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of name, dataType.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/fields'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:isMatchAll] = opts[:is_match_all] if !opts[:is_match_all].nil?
      query_params[:sourceIds] = opts[:source_ids] if opts[:source_ids]
      query_params[:sourceNames] = opts[:source_names] if opts[:source_names]
      query_params[:parserType] = opts[:parser_type] if opts[:parser_type]
      query_params[:parserIds] = opts[:parser_ids] if opts[:parser_ids]
      query_params[:parserNames] = opts[:parser_names] if opts[:parser_names]
      query_params[:isIncludeParser] = opts[:is_include_parser] if !opts[:is_include_parser].nil?
      query_params[:filter] = opts[:filter] if opts[:filter]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_fields') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsFieldCollection'
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


    # Lists the available problem priorities that could be associated with a label.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LabelPriorityCollection LabelPriorityCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_label_priorities.rb.html) to see an example of how to use list_label_priorities API.
    def list_label_priorities(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_label_priorities.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_label_priorities." if namespace_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/labelPriorities'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_label_priorities') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LabelPriorityCollection'
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


    # Lists sources using the label, along with configuration details like base field, operator and condition.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :label_name The label name used for filtering.  Only items with, or associated with, the
    #   specified label name will be returned.
    #
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :label_source_sort_by The attribute used to sort the returned sources (default to sourceDisplayName)
    #   Allowed values are: sourceDisplayName, labelFieldDisplayName
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LabelSourceCollection LabelSourceCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_label_source_details.rb.html) to see an example of how to use list_label_source_details API.
    def list_label_source_details(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_label_source_details.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_label_source_details." if namespace_name.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:label_source_sort_by] && !%w[sourceDisplayName labelFieldDisplayName].include?(opts[:label_source_sort_by])
        raise 'Invalid value for "label_source_sort_by", must be one of sourceDisplayName, labelFieldDisplayName.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/labelSourceDetails'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:labelName] = opts[:label_name] if opts[:label_name]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:labelSourceSortBy] = opts[:label_source_sort_by] if opts[:label_source_sort_by]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_label_source_details') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LabelSourceCollection'
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


    # Returns a list of labels, containing detailed information about them. You may limit the number of results, provide sorting order, and filter by information such as label name, display name, description and priority.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :label_name The label name used for filtering.  Only items with, or associated with, the
    #   specified label name will be returned.
    #
    # @option opts [String] :label_display_text The label display text used for filtering.  Only labels with the specified name or
    #   description will be returned.
    #
    # @option opts [String] :is_system The system value used for filtering.  Only items with the specified system value
    #   will be returned.  Valid values are built in, custom (for user defined items), or
    #   all (for all items, regardless of system value).
    #    (default to ALL)
    #   Allowed values are: ALL, CUSTOM, BUILT_IN
    # @option opts [String] :label_priority The label priority used for filtering.  Only labels with the specified
    #   priority will be returned.
    #    (default to NONE)
    #   Allowed values are: NONE, LOW, MEDIUM, HIGH
    # @option opts [BOOLEAN] :is_count_pop A flag indicating whether or not to count the label usage per source and per rule.
    #
    # @option opts [BOOLEAN] :is_alias_pop A flag indicating whether or not return the aliases used by each label.
    #
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :label_sort_by The attribute used to sort the returned labels (default to name)
    #   Allowed values are: name, priority, sourceUsing
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsLabelCollection LogAnalyticsLabelCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_labels.rb.html) to see an example of how to use list_labels API.
    def list_labels(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_labels.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_labels." if namespace_name.nil?

      if opts[:is_system] && !%w[ALL CUSTOM BUILT_IN].include?(opts[:is_system])
        raise 'Invalid value for "is_system", must be one of ALL, CUSTOM, BUILT_IN.'
      end

      if opts[:label_priority] && !%w[NONE LOW MEDIUM HIGH].include?(opts[:label_priority])
        raise 'Invalid value for "label_priority", must be one of NONE, LOW, MEDIUM, HIGH.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:label_sort_by] && !%w[name priority sourceUsing].include?(opts[:label_sort_by])
        raise 'Invalid value for "label_sort_by", must be one of name, priority, sourceUsing.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/labels'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:labelName] = opts[:label_name] if opts[:label_name]
      query_params[:labelDisplayText] = opts[:label_display_text] if opts[:label_display_text]
      query_params[:isSystem] = opts[:is_system] if opts[:is_system]
      query_params[:labelPriority] = opts[:label_priority] if opts[:label_priority]
      query_params[:isCountPop] = opts[:is_count_pop] if !opts[:is_count_pop].nil?
      query_params[:isAliasPop] = opts[:is_alias_pop] if !opts[:is_alias_pop].nil?
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:labelSortBy] = opts[:label_sort_by] if opts[:label_sort_by]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_labels') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsLabelCollection'
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


    # Return a list of log analytics enterprise manager bridges.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A filter to return only log analytics enterprise manager bridge name whose name matches the entire name given. The match
    #   is case-insensitive.
    #
    # @option opts [Array<String>] :lifecycle_state A filter to return only log analytics enterprise manager bridges matching all the lifecycle states specified for this parameter.
    #    (default to [])
    #   Allowed values are: CREATING, ACTIVE, DELETED, NEEDS_ATTENTION
    # @option opts [String] :lifecycle_details_contains A filter to return only log analytics enterprise manager bridges whose lifecycleDetails contains the specified string.
    #
    # @option opts [Array<String>] :import_status Filter by the processing status of the latest upload from enterprise manager.
    #    (default to [])
    #   Allowed values are: NOT_STARTED, SUCCESS, IN_PROGRESS, FAILED, PARTIAL_SUCCESS
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort enterprise manager bridges by. Only one sort order may be provided. Default order for timeCreated and timeUpdated
    #   is descending. Default order for enterprise manager name is ascending. If no value is specified timeCreated is default.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, timeUpdated, displayName
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsEmBridgeCollection LogAnalyticsEmBridgeCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_log_analytics_em_bridges.rb.html) to see an example of how to use list_log_analytics_em_bridges API.
    def list_log_analytics_em_bridges(namespace_name, compartment_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_log_analytics_em_bridges.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_log_analytics_em_bridges." if namespace_name.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_log_analytics_em_bridges." if compartment_id.nil?


      lifecycle_state_allowable_values = %w[CREATING ACTIVE DELETED NEEDS_ATTENTION]
      if opts[:lifecycle_state] && !opts[:lifecycle_state].empty?
        opts[:lifecycle_state].each do |val_to_check|
          unless lifecycle_state_allowable_values.include?(val_to_check)
            raise 'Invalid value for "lifecycle_state", must be one of CREATING, ACTIVE, DELETED, NEEDS_ATTENTION.'
          end
        end
      end


      import_status_allowable_values = %w[NOT_STARTED SUCCESS IN_PROGRESS FAILED PARTIAL_SUCCESS]
      if opts[:import_status] && !opts[:import_status].empty?
        opts[:import_status].each do |val_to_check|
          unless import_status_allowable_values.include?(val_to_check)
            raise 'Invalid value for "import_status", must be one of NOT_STARTED, SUCCESS, IN_PROGRESS, FAILED, PARTIAL_SUCCESS.'
          end
        end
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[timeCreated timeUpdated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, timeUpdated, displayName.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/logAnalyticsEmBridges'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:lifecycleState] = OCI::ApiClient.build_collection_params(opts[:lifecycle_state], :multi) if opts[:lifecycle_state] && !opts[:lifecycle_state].empty?
      query_params[:lifecycleDetailsContains] = opts[:lifecycle_details_contains] if opts[:lifecycle_details_contains]
      query_params[:importStatus] = OCI::ApiClient.build_collection_params(opts[:import_status], :multi) if opts[:import_status] && !opts[:import_status].empty?
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_log_analytics_em_bridges') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsEmBridgeCollection'
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


    # Return a list of log analytics entities.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :name A filter to return only log analytics entities whose name matches the entire name given. The match
    #   is case-insensitive.
    #
    # @option opts [String] :name_contains A filter to return only log analytics entities whose name contains the name given. The match
    #   is case-insensitive.
    #
    # @option opts [Array<String>] :entity_type_name A filter to return only log analytics entities whose entityTypeName matches the entire log analytics entity type name of
    #   one of the entityTypeNames given in the list. The match is case-insensitive.
    #    (default to [])
    # @option opts [String] :cloud_resource_id A filter to return only log analytics entities whose cloudResourceId matches the cloudResourceId given.
    #
    # @option opts [String] :lifecycle_state A filter to return only those log analytics entities with the specified lifecycle state. The state
    #   value is case-insensitive.
    #    (default to ACTIVE)
    # @option opts [String] :lifecycle_details_contains A filter to return only log analytics entities whose lifecycleDetails contains the specified string.
    #
    # @option opts [String] :is_management_agent_id_null A filter to return only those log analytics entities whose managementAgentId is null or is not null.
    #
    #   Allowed values are: true, false
    # @option opts [String] :hostname A filter to return only log analytics entities whose hostname matches the entire hostname given.
    #
    # @option opts [String] :hostname_contains A filter to return only log analytics entities whose hostname contains the substring given.
    #   The match is case-insensitive.
    #
    # @option opts [String] :source_id A filter to return only log analytics entities whose sourceId matches the sourceId given.
    #
    # @option opts [Array<String>] :creation_source_type A filter to return only those log analytics entities with the specified auto-creation source.
    #    (default to [])
    #   Allowed values are: EM_BRIDGE, SERVICE_CONNECTOR_HUB, NONE
    # @option opts [String] :creation_source_details A filter to return only log analytics entities whose auto-creation source details contains the specified string.
    #
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort entities by. Only one sort order may be provided. Default order for timeCreated and timeUpdated
    #   is descending. Default order for entity name is ascending. If no value is specified timeCreated is default.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, timeUpdated, name
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsEntityCollection LogAnalyticsEntityCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_log_analytics_entities.rb.html) to see an example of how to use list_log_analytics_entities API.
    def list_log_analytics_entities(namespace_name, compartment_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_log_analytics_entities.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_log_analytics_entities." if namespace_name.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_log_analytics_entities." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::LogAnalytics::Models::ENTITY_LIFECYCLE_STATES_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::LogAnalytics::Models::ENTITY_LIFECYCLE_STATES_ENUM.'
      end

      if opts[:is_management_agent_id_null] && !%w[true false].include?(opts[:is_management_agent_id_null])
        raise 'Invalid value for "is_management_agent_id_null", must be one of true, false.'
      end


      creation_source_type_allowable_values = %w[EM_BRIDGE SERVICE_CONNECTOR_HUB NONE]
      if opts[:creation_source_type] && !opts[:creation_source_type].empty?
        opts[:creation_source_type].each do |val_to_check|
          unless creation_source_type_allowable_values.include?(val_to_check)
            raise 'Invalid value for "creation_source_type", must be one of EM_BRIDGE, SERVICE_CONNECTOR_HUB, NONE.'
          end
        end
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[timeCreated timeUpdated name].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, timeUpdated, name.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/logAnalyticsEntities'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:nameContains] = opts[:name_contains] if opts[:name_contains]
      query_params[:entityTypeName] = OCI::ApiClient.build_collection_params(opts[:entity_type_name], :multi) if opts[:entity_type_name] && !opts[:entity_type_name].empty?
      query_params[:cloudResourceId] = opts[:cloud_resource_id] if opts[:cloud_resource_id]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:lifecycleDetailsContains] = opts[:lifecycle_details_contains] if opts[:lifecycle_details_contains]
      query_params[:isManagementAgentIdNull] = opts[:is_management_agent_id_null] if opts[:is_management_agent_id_null]
      query_params[:hostname] = opts[:hostname] if opts[:hostname]
      query_params[:hostnameContains] = opts[:hostname_contains] if opts[:hostname_contains]
      query_params[:sourceId] = opts[:source_id] if opts[:source_id]
      query_params[:creationSourceType] = OCI::ApiClient.build_collection_params(opts[:creation_source_type], :multi) if opts[:creation_source_type] && !opts[:creation_source_type].empty?
      query_params[:creationSourceDetails] = opts[:creation_source_details] if opts[:creation_source_details]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_log_analytics_entities') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsEntityCollection'
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


    # Return a log analytics entity topology collection that contains a set of log analytics entities and a set of relationships between those, for the input source entity.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] log_analytics_entity_id The log analytics entity OCID.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :lifecycle_state A filter to return only those log analytics entities with the specified lifecycle state. The state
    #   value is case-insensitive.
    #    (default to ACTIVE)
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort entities by. Only one sort order may be provided. Default order for timeCreated and timeUpdated
    #   is descending. Default order for entity name is ascending. If no value is specified timeCreated is default.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, timeUpdated, name
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsEntityTopologyCollection LogAnalyticsEntityTopologyCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_log_analytics_entity_topology.rb.html) to see an example of how to use list_log_analytics_entity_topology API.
    def list_log_analytics_entity_topology(namespace_name, log_analytics_entity_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_log_analytics_entity_topology.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_log_analytics_entity_topology." if namespace_name.nil?
      raise "Missing the required parameter 'log_analytics_entity_id' when calling list_log_analytics_entity_topology." if log_analytics_entity_id.nil?

      if opts[:lifecycle_state] && !OCI::LogAnalytics::Models::ENTITY_LIFECYCLE_STATES_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::LogAnalytics::Models::ENTITY_LIFECYCLE_STATES_ENUM.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[timeCreated timeUpdated name].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, timeUpdated, name.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'log_analytics_entity_id' must not be blank" if OCI::Internal::Util.blank_string?(log_analytics_entity_id)

      path = '/namespaces/{namespaceName}/logAnalyticsEntities/{logAnalyticsEntityId}/entityTopology'.sub('{namespaceName}', namespace_name.to_s).sub('{logAnalyticsEntityId}', log_analytics_entity_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_log_analytics_entity_topology') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsEntityTopologyCollection'
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


    # Return a list of log analytics entity types.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :name A filter to return only log analytics entity types whose name matches the entire name given. The match is
    #   case-insensitive.
    #
    # @option opts [String] :name_contains A filter to return only log analytics entity types whose name or internalName contains name given. The match
    #   is case-insensitive.
    #
    # @option opts [String] :cloud_type A filter to return CLOUD or NON_CLOUD entity types.
    #    (default to CLOUD)
    # @option opts [String] :lifecycle_state A filter to return only those log analytics entities with the specified lifecycle state. The state
    #   value is case-insensitive.
    #    (default to ACTIVE)
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for timeCreated and timeUpdated
    #   is descending. Default order for name is ascending. If no value is specified timeCreated is default.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, timeUpdated, name
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsEntityTypeCollection LogAnalyticsEntityTypeCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_log_analytics_entity_types.rb.html) to see an example of how to use list_log_analytics_entity_types API.
    def list_log_analytics_entity_types(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_log_analytics_entity_types.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_log_analytics_entity_types." if namespace_name.nil?

      if opts[:cloud_type] && !OCI::LogAnalytics::Models::ENTITY_CLOUD_TYPE_ENUM.include?(opts[:cloud_type])
        raise 'Invalid value for "cloud_type", must be one of the values in OCI::LogAnalytics::Models::ENTITY_CLOUD_TYPE_ENUM.'
      end

      if opts[:lifecycle_state] && !OCI::LogAnalytics::Models::ENTITY_LIFECYCLE_STATES_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::LogAnalytics::Models::ENTITY_LIFECYCLE_STATES_ENUM.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[timeCreated timeUpdated name].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, timeUpdated, name.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/logAnalyticsEntityTypes'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:nameContains] = opts[:name_contains] if opts[:name_contains]
      query_params[:cloudType] = opts[:cloud_type] if opts[:cloud_type]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_log_analytics_entity_types') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsEntityTypeCollection'
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


    # Returns a list of log groups in a compartment. You may limit the number of log groups, provide sorting options, and filter the results by specifying a display name.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A filter to return only log analytics log groups whose displayName matches the entire display name given.
    #   The match is case-insensitive.
    #
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for timeCreated is descending. Default order for displayName is ascending. If no value is specified timeCreated is default.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, timeUpdated, displayName
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsLogGroupSummaryCollection LogAnalyticsLogGroupSummaryCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_log_analytics_log_groups.rb.html) to see an example of how to use list_log_analytics_log_groups API.
    def list_log_analytics_log_groups(namespace_name, compartment_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_log_analytics_log_groups.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_log_analytics_log_groups." if namespace_name.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_log_analytics_log_groups." if compartment_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[timeCreated timeUpdated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, timeUpdated, displayName.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/logAnalyticsLogGroups'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_log_analytics_log_groups') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsLogGroupSummaryCollection'
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


    # Gets list of collection rules.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :name A filter to return rules only matching with this name.
    # @option opts [String] :lifecycle_state Lifecycle state filter.
    #    (default to ACTIVE)
    # @option opts [Integer] :limit The maximum number of items to return. (default to 50)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for timeUpdated is descending.
    #   Default order for name is ascending. If no value is specified timeUpdated is default.
    #    (default to timeUpdated)
    #   Allowed values are: timeUpdated, timeCreated, name
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsObjectCollectionRuleCollection LogAnalyticsObjectCollectionRuleCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_log_analytics_object_collection_rules.rb.html) to see an example of how to use list_log_analytics_object_collection_rules API.
    def list_log_analytics_object_collection_rules(namespace_name, compartment_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_log_analytics_object_collection_rules.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_log_analytics_object_collection_rules." if namespace_name.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_log_analytics_object_collection_rules." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::LogAnalytics::Models::LIFECYCLE_STATES_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::LogAnalytics::Models::LIFECYCLE_STATES_ENUM.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[timeUpdated timeCreated name].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeUpdated, timeCreated, name.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/logAnalyticsObjectCollectionRules'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:name] = opts[:name] if opts[:name]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_log_analytics_object_collection_rules') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsObjectCollectionRuleCollection'
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


    # This API returns a list of log sets.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [Array<String>] :log_set_name_contains If this filter is present, each of the logsets returned must contain the value of this filter.
    #
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogSetCollection LogSetCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_log_sets.rb.html) to see an example of how to use list_log_sets API.
    def list_log_sets(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_log_sets.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_log_sets." if namespace_name.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/storage/logSets'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:logSetNameContains] = OCI::ApiClient.build_collection_params(opts[:log_set_name_contains], :multi) if opts[:log_set_name_contains] && !opts[:log_set_name_contains].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_log_sets') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogSetCollection'
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


    # Returns a list of lookups, containing detailed information about them. You may limit the number of results, provide sorting order, and filter by information such as lookup name, description and type.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] type The lookup type.  Valid values are Lookup or Dictionary.
    #   Allowed values are: Lookup, Dictionary
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :lookup_display_text The lookup text used for filtering.  Only lookups with the specified name
    #   or description will be returned.
    #
    # @option opts [String] :is_system The system value used for filtering.  Only items with the specified system value
    #   will be returned.  Valid values are built in, custom (for user defined items), or
    #   all (for all items, regardless of system value).
    #    (default to ALL)
    #   Allowed values are: ALL, CUSTOM, BUILT_IN
    # @option opts [String] :sort_by sort by field (default to name)
    #   Allowed values are: displayName, status, type, updatedTime, creationType
    # @option opts [String] :status The lookup status used for filtering when fetching a list of lookups. (default to ALL)
    #   Allowed values are: ALL, SUCCESSFUL, FAILED, INPROGRESS
    # @option opts [String] :categories A comma-separated list of categories used for filtering
    # @option opts [BOOLEAN] :is_hide_special A flag indicating whether or not to return OMC annotated or hidden lookups.
    #    (default to true)
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsLookupCollection LogAnalyticsLookupCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_lookups.rb.html) to see an example of how to use list_lookups API.
    def list_lookups(namespace_name, type, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_lookups.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_lookups." if namespace_name.nil?
      raise "Missing the required parameter 'type' when calling list_lookups." if type.nil?
      unless %w[Lookup Dictionary].include?(type)
        raise "Invalid value for 'type', must be one of Lookup, Dictionary."
      end

      if opts[:is_system] && !%w[ALL CUSTOM BUILT_IN].include?(opts[:is_system])
        raise 'Invalid value for "is_system", must be one of ALL, CUSTOM, BUILT_IN.'
      end

      if opts[:sort_by] && !%w[displayName status type updatedTime creationType].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of displayName, status, type, updatedTime, creationType.'
      end

      if opts[:status] && !%w[ALL SUCCESSFUL FAILED INPROGRESS].include?(opts[:status])
        raise 'Invalid value for "status", must be one of ALL, SUCCESSFUL, FAILED, INPROGRESS.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/lookups'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:type] = type
      query_params[:lookupDisplayText] = opts[:lookup_display_text] if opts[:lookup_display_text]
      query_params[:isSystem] = opts[:is_system] if opts[:is_system]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:status] = opts[:status] if opts[:status]
      query_params[:categories] = opts[:categories] if opts[:categories]
      query_params[:isHideSpecial] = opts[:is_hide_special] if !opts[:is_hide_special].nil?
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_lookups') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsLookupCollection'
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


    # Lists the types of log sources supported.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_by The attribute used to sort the returned items (default to name)
    #   Allowed values are: name
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsMetaSourceTypeCollection LogAnalyticsMetaSourceTypeCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_meta_source_types.rb.html) to see an example of how to use list_meta_source_types API.
    def list_meta_source_types(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_meta_source_types.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_meta_source_types." if namespace_name.nil?

      if opts[:sort_by] && !%w[name].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of name.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/sourceMetaTypes'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_meta_source_types') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsMetaSourceTypeCollection'
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


    # Given a tenancy OCID, this API returns the namespace of the tenancy if it is valid and subscribed to the region.  The
    # result also indicates if the tenancy is onboarded with Logging Analytics.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::NamespaceCollection NamespaceCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_namespaces.rb.html) to see an example of how to use list_namespaces API.
    def list_namespaces(compartment_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_namespaces.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_namespaces." if compartment_id.nil?

      path = '/namespaces'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_namespaces') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::NamespaceCollection'
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


    # Lists the parser functions defined for the specified parser.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :parser_name The parser name used for filtering.
    #
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_by The attribute used to sort the returned items (default to name)
    #   Allowed values are: name
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsParserFunctionCollection LogAnalyticsParserFunctionCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_parser_functions.rb.html) to see an example of how to use list_parser_functions API.
    def list_parser_functions(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_parser_functions.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_parser_functions." if namespace_name.nil?

      if opts[:sort_by] && !%w[name].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of name.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/parserFunctions'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:parserName] = opts[:parser_name] if opts[:parser_name]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_parser_functions') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsParserFunctionCollection'
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


    # Lists the parser meta plugins available for defining parser functions.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_by The attribute used to sort the returned items (default to name)
    #   Allowed values are: name
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsParserMetaPluginCollection LogAnalyticsParserMetaPluginCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_parser_meta_plugins.rb.html) to see an example of how to use list_parser_meta_plugins API.
    def list_parser_meta_plugins(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_parser_meta_plugins.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_parser_meta_plugins." if namespace_name.nil?

      if opts[:sort_by] && !%w[name].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of name.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/parserMetaPlugins'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_parser_meta_plugins') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsParserMetaPluginCollection'
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


    # Returns a list of parsers, containing detailed information about them. You may limit the number of results, provide sorting order, and filter by information such as parser name, type, display name and description.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [BOOLEAN] :is_match_all A flag indicating how to handle filtering when multiple filter criteria are specified.
    #   A value of true will always result in the most expansive list of items being returned.
    #   For example, if two field lists are supplies as filter criteria, a value of true will
    #   result in any item matching a field in either list being returned, while a value of
    #   false will result in a list of items which only have fields contained in both input lists.
    #
    # @option opts [String] :source_type The source type used for filtering.  Only parsers associated with a source of the
    #   specified type will be returned.
    #    (default to OS_FILE)
    #   Allowed values are: OS_FILE, SYSLOG, ODL, OS_WINDOWS_SYS
    # @option opts [String] :parser_name The parser name used for filtering.
    #
    # @option opts [String] :parser_display_text The parser display text used for filtering.  Only parsers with the specified name
    #   or description will be returned.
    #
    # @option opts [String] :parser_type The parser type used for filtering.  Only items with, or associated with, parsers
    #   of the specified type will be returned.
    #    (default to ALL)
    #   Allowed values are: ALL, REGEX, XML, JSON, ODL, DELIMITED
    # @option opts [String] :categories A comma-separated list of categories used for filtering
    # @option opts [String] :is_system The system value used for filtering.  Only items with the specified system value
    #   will be returned.  Valid values are built in, custom (for user defined items), or
    #   all (for all items, regardless of system value).
    #    (default to ALL)
    #   Allowed values are: ALL, CUSTOM, BUILT_IN
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The attribute used to sort the returned parsers (default to name)
    #   Allowed values are: name, type, sourcesCount, timeUpdated
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsParserCollection LogAnalyticsParserCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_parsers.rb.html) to see an example of how to use list_parsers API.
    def list_parsers(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_parsers.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_parsers." if namespace_name.nil?

      if opts[:source_type] && !%w[OS_FILE SYSLOG ODL OS_WINDOWS_SYS].include?(opts[:source_type])
        raise 'Invalid value for "source_type", must be one of OS_FILE, SYSLOG, ODL, OS_WINDOWS_SYS.'
      end

      if opts[:parser_type] && !%w[ALL REGEX XML JSON ODL DELIMITED].include?(opts[:parser_type])
        raise 'Invalid value for "parser_type", must be one of ALL, REGEX, XML, JSON, ODL, DELIMITED.'
      end

      if opts[:is_system] && !%w[ALL CUSTOM BUILT_IN].include?(opts[:is_system])
        raise 'Invalid value for "is_system", must be one of ALL, CUSTOM, BUILT_IN.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[name type sourcesCount timeUpdated].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of name, type, sourcesCount, timeUpdated.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/parsers'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:isMatchAll] = opts[:is_match_all] if !opts[:is_match_all].nil?
      query_params[:sourceType] = opts[:source_type] if opts[:source_type]
      query_params[:parserName] = opts[:parser_name] if opts[:parser_name]
      query_params[:parserDisplayText] = opts[:parser_display_text] if opts[:parser_display_text]
      query_params[:parserType] = opts[:parser_type] if opts[:parser_type]
      query_params[:categories] = opts[:categories] if opts[:categories]
      query_params[:isSystem] = opts[:is_system] if opts[:is_system]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_parsers') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsParserCollection'
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


    # List active asynchronous queries.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :mode Filter based on job execution mode (default to ALL)
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for timeStarted is descending. If no value is specified timeStarted is default.
    #    (default to tinmeStarted)
    #   Allowed values are: timeStarted, timeExpires
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::QueryWorkRequestCollection QueryWorkRequestCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_query_work_requests.rb.html) to see an example of how to use list_query_work_requests API.
    def list_query_work_requests(namespace_name, compartment_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_query_work_requests.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_query_work_requests." if namespace_name.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_query_work_requests." if compartment_id.nil?

      if opts[:mode] && !OCI::LogAnalytics::Models::JOB_MODE_FILTER_ENUM.include?(opts[:mode])
        raise 'Invalid value for "mode", must be one of the values in OCI::LogAnalytics::Models::JOB_MODE_FILTER_ENUM.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[timeStarted timeExpires].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeStarted, timeExpires.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/queryWorkRequests'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:mode] = opts[:mode] if opts[:mode]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_query_work_requests') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::QueryWorkRequestCollection'
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


    # This API returns the list of recalled data of a tenancy.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_by This is the query parameter of which field to sort by. Only one sort order may be provided. Default order for timeDataStarted
    #   is descending. If no value is specified timeDataStarted is default.
    #    (default to timeDataStarted)
    #   Allowed values are: timeStarted, timeDataStarted
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [DateTime] :time_data_started_greater_than_or_equal This is the start of the time range for recalled data
    # @option opts [DateTime] :time_data_ended_less_than This is the end of the time range for recalled data
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::RecalledDataCollection RecalledDataCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_recalled_data.rb.html) to see an example of how to use list_recalled_data API.
    def list_recalled_data(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_recalled_data.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_recalled_data." if namespace_name.nil?

      if opts[:sort_by] && !%w[timeStarted timeDataStarted].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeStarted, timeDataStarted.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/storage/recalledData'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:timeDataStartedGreaterThanOrEqual] = opts[:time_data_started_greater_than_or_equal] if opts[:time_data_started_greater_than_or_equal]
      query_params[:timeDataEndedLessThan] = opts[:time_data_ended_less_than] if opts[:time_data_ended_less_than]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_recalled_data') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::RecalledDataCollection'
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


    # Returns a list of resources and their category assignments.
    # You may limit the number of results, provide sorting order, and filter by information such as resource type.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :categories A comma-separated list of categories used for filtering
    # @option opts [String] :resource_types A comma-separated list of resource types used for filtering. Only resources of the types
    #   specified will be returned. Examples include SOURCE, PARSER, LOOKUP, etc.
    #
    # @option opts [String] :resource_ids A comma-separated list of resource unique identifiers used for filtering. Only resources
    #   with matching unique identifiers will be returned.
    #
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The attribute used to sort the returned category resources. (default to categoryName)
    #   Allowed values are: resourceType, categoryName, resourceId
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsResourceCategoryCollection LogAnalyticsResourceCategoryCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_resource_categories.rb.html) to see an example of how to use list_resource_categories API.
    def list_resource_categories(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_resource_categories.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_resource_categories." if namespace_name.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[resourceType categoryName resourceId].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of resourceType, categoryName, resourceId.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/categories/resourceCategories'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:categories] = opts[:categories] if opts[:categories]
      query_params[:resourceTypes] = opts[:resource_types] if opts[:resource_types]
      query_params[:resourceIds] = opts[:resource_ids] if opts[:resource_ids]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_resource_categories') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsResourceCategoryCollection'
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


    # Lists scheduled tasks.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] task_type Required parameter to specify schedule task type.
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :display_name A filter to return only resources that match the given display name exactly.
    #    (default to null)
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for timeCreated is descending. Default order for displayName is ascending. If no value is specified timeCreated is default.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, timeUpdated, displayName
    # @option opts [String] :saved_search_id A filter to return only scheduled tasks whose stream action savedSearchId matches the given
    #   ManagementSavedSearch id [OCID] exactly.
    #    (default to null)
    # @option opts [String] :display_name_contains A filter to return only resources whose display name contains the substring.
    #    (default to null)
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::ScheduledTaskCollection ScheduledTaskCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_scheduled_tasks.rb.html) to see an example of how to use list_scheduled_tasks API.
    def list_scheduled_tasks(namespace_name, task_type, compartment_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_scheduled_tasks.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_scheduled_tasks." if namespace_name.nil?
      raise "Missing the required parameter 'task_type' when calling list_scheduled_tasks." if task_type.nil?
      unless OCI::LogAnalytics::Models::TASK_TYPE_ENUM.include?(task_type)
        raise 'Invalid value for "task_type", must be one of the values in OCI::LogAnalytics::Models::TASK_TYPE_ENUM.'
      end

      raise "Missing the required parameter 'compartment_id' when calling list_scheduled_tasks." if compartment_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[timeCreated timeUpdated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, timeUpdated, displayName.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/scheduledTasks'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:taskType] = task_type
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:savedSearchId] = opts[:saved_search_id] if opts[:saved_search_id]
      query_params[:displayNameContains] = opts[:display_name_contains] if opts[:display_name_contains]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_scheduled_tasks') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::ScheduledTaskCollection'
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


    # Returns the list of entity associations in the input compartment for the specified source.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] source_name The souce name used for filtering associations.
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :entity_id The entity OCID.
    #
    # @option opts [String] :life_cycle_state The life cycle state used for filtering.  Only associations with the specified
    #   life cycle state will be returned.
    #    (default to ALL)
    #   Allowed values are: ALL, ACCEPTED, IN_PROGRESS, SUCCEEDED, FAILED
    # @option opts [BOOLEAN] :is_show_total A flag indicating whether or not to return the total number of items returned.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The attribute used to sort the returned associations (default to entityName)
    #   Allowed values are: entityName, timeLastAttempted, status
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsAssociationCollection LogAnalyticsAssociationCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_source_associations.rb.html) to see an example of how to use list_source_associations API.
    def list_source_associations(namespace_name, source_name, compartment_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_source_associations.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_source_associations." if namespace_name.nil?
      raise "Missing the required parameter 'source_name' when calling list_source_associations." if source_name.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_source_associations." if compartment_id.nil?

      if opts[:life_cycle_state] && !%w[ALL ACCEPTED IN_PROGRESS SUCCEEDED FAILED].include?(opts[:life_cycle_state])
        raise 'Invalid value for "life_cycle_state", must be one of ALL, ACCEPTED, IN_PROGRESS, SUCCEEDED, FAILED.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[entityName timeLastAttempted status].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of entityName, timeLastAttempted, status.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/sourceAssociations'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:sourceName] = source_name
      query_params[:compartmentId] = compartment_id
      query_params[:entityId] = opts[:entity_id] if opts[:entity_id]
      query_params[:lifeCycleState] = opts[:life_cycle_state] if opts[:life_cycle_state]
      query_params[:isShowTotal] = opts[:is_show_total] if !opts[:is_show_total].nil?
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_source_associations') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsAssociationCollection'
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


    # Lists the event types mapped to the source with the specified name. The event type string could be the fully qualified name or a prefix that matches the event type.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] source_name The source name.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_text The text used for filtering event types by name or description.
    #
    # @option opts [String] :is_system The system value used for filtering.  Only items with the specified system value
    #   will be returned.  Valid values are built in, custom (for user defined items), or
    #   all (for all items, regardless of system value).
    #    (default to ALL)
    #   Allowed values are: ALL, CUSTOM, BUILT_IN
    # @option opts [BOOLEAN] :is_enabled The enabled flag used for filtering.  Only items with the specified enabled value
    #   will be returned.
    #    (default to true)
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_by The attribute used to sort the returned source event types. (default to timeUpdated)
    #   Allowed values are: eventType, timeUpdated
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::EventTypeCollection EventTypeCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_source_event_types.rb.html) to see an example of how to use list_source_event_types API.
    def list_source_event_types(namespace_name, source_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_source_event_types.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_source_event_types." if namespace_name.nil?
      raise "Missing the required parameter 'source_name' when calling list_source_event_types." if source_name.nil?

      if opts[:is_system] && !%w[ALL CUSTOM BUILT_IN].include?(opts[:is_system])
        raise 'Invalid value for "is_system", must be one of ALL, CUSTOM, BUILT_IN.'
      end

      if opts[:sort_by] && !%w[eventType timeUpdated].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of eventType, timeUpdated.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'source_name' must not be blank" if OCI::Internal::Util.blank_string?(source_name)

      path = '/namespaces/{namespaceName}/sources/{sourceName}/eventTypes'.sub('{namespaceName}', namespace_name.to_s).sub('{sourceName}', source_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:displayText] = opts[:display_text] if opts[:display_text]
      query_params[:isSystem] = opts[:is_system] if opts[:is_system]
      query_params[:isEnabled] = opts[:is_enabled] if !opts[:is_enabled].nil?
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_source_event_types') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::EventTypeCollection'
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


    # Lists the extended field definitions for the source with the specified name.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] source_name The source name.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_by The attribute used to sort the returned source patterns (default to baseFieldName)
    #   Allowed values are: baseFieldName, regularExpression
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsSourceExtendedFieldDefinitionCollection LogAnalyticsSourceExtendedFieldDefinitionCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_source_extended_field_definitions.rb.html) to see an example of how to use list_source_extended_field_definitions API.
    def list_source_extended_field_definitions(namespace_name, source_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_source_extended_field_definitions.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_source_extended_field_definitions." if namespace_name.nil?
      raise "Missing the required parameter 'source_name' when calling list_source_extended_field_definitions." if source_name.nil?

      if opts[:sort_by] && !%w[baseFieldName regularExpression].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of baseFieldName, regularExpression.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'source_name' must not be blank" if OCI::Internal::Util.blank_string?(source_name)

      path = '/namespaces/{namespaceName}/sources/{sourceName}/extendedFieldDefinitions'.sub('{namespaceName}', namespace_name.to_s).sub('{sourceName}', source_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_source_extended_field_definitions') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsSourceExtendedFieldDefinitionCollection'
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


    # Lists the supported conditional operators that could be used for matching log field values to generate a label. You may use patterns to specify a condition. If a log entry matches that condition, it is tagged with the corresponding label.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_by The attribute used to sort the returned items (default to name)
    #   Allowed values are: name
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsLabelOperatorCollection LogAnalyticsLabelOperatorCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_source_label_operators.rb.html) to see an example of how to use list_source_label_operators API.
    def list_source_label_operators(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_source_label_operators.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_source_label_operators." if namespace_name.nil?

      if opts[:sort_by] && !%w[name].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of name.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/sourceLabelOperators'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_source_label_operators') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsLabelOperatorCollection'
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


    # Lists the functions that could be used to enrich log entries based on meaningful information extracted from the log fields.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_by The attribute used to sort the returned items (default to name)
    #   Allowed values are: name
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsMetaFunctionCollection LogAnalyticsMetaFunctionCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_source_meta_functions.rb.html) to see an example of how to use list_source_meta_functions API.
    def list_source_meta_functions(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_source_meta_functions.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_source_meta_functions." if namespace_name.nil?

      if opts[:sort_by] && !%w[name].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of name.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/sourceMetaFunctions'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_source_meta_functions') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsMetaFunctionCollection'
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


    # Lists the source patterns for the source with the specified name.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] source_name The source name.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [BOOLEAN] :is_include is included source patterns
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_by The attribute used to sort the returned source patterns (default to patternText)
    #   Allowed values are: patternText
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsSourcePatternCollection LogAnalyticsSourcePatternCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_source_patterns.rb.html) to see an example of how to use list_source_patterns API.
    def list_source_patterns(namespace_name, source_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_source_patterns.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_source_patterns." if namespace_name.nil?
      raise "Missing the required parameter 'source_name' when calling list_source_patterns." if source_name.nil?

      if opts[:sort_by] && !%w[patternText].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of patternText.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'source_name' must not be blank" if OCI::Internal::Util.blank_string?(source_name)

      path = '/namespaces/{namespaceName}/sources/{sourceName}/patterns'.sub('{namespaceName}', namespace_name.to_s).sub('{sourceName}', source_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:isInclude] = opts[:is_include] if !opts[:is_include].nil?
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_source_patterns') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsSourcePatternCollection'
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


    # Returns a list of sources, containing detailed information about them. You may limit the number of results, provide sorting order, and filter by information such as display name, description and entity type.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :entity_type A filter to return only sources associated with entities of the specified type.
    #   The match is case-insensitive.
    #
    # @option opts [String] :source_display_text The source display text used for filtering.  Only sources with the specified name
    #   or description will be returned.
    #
    # @option opts [String] :is_system The system value used for filtering.  Only items with the specified system value
    #   will be returned.  Valid values are built in, custom (for user defined items), or
    #   all (for all items, regardless of system value).
    #    (default to ALL)
    #   Allowed values are: ALL, CUSTOM, BUILT_IN
    # @option opts [BOOLEAN] :is_auto_associated An auto-associate flag used for filtering.  Only sources which are marked for automatic
    #   association will be returned.
    #
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The attribute used to sort the returned sources (default to name)
    #   Allowed values are: name, timeUpdated, associationCount, sourceType
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :name A filter to return only log analytics entities whose name matches the entire name given. The match
    #   is case-insensitive.
    #
    # @option opts [String] :categories A comma-separated list of categories used for filtering
    # @option opts [BOOLEAN] :is_simplified A flag specifying whether or not to return all source information, or a subset of the
    #   information about each source.  A value of true will return only the source unique
    #   identifier and the source name.  A value of false will return all source information
    #   (such as author, updated date, system flag, etc.)
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsSourceCollection LogAnalyticsSourceCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_sources.rb.html) to see an example of how to use list_sources API.
    def list_sources(namespace_name, compartment_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_sources.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_sources." if namespace_name.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_sources." if compartment_id.nil?

      if opts[:is_system] && !%w[ALL CUSTOM BUILT_IN].include?(opts[:is_system])
        raise 'Invalid value for "is_system", must be one of ALL, CUSTOM, BUILT_IN.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[name timeUpdated associationCount sourceType].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of name, timeUpdated, associationCount, sourceType.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/sources'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:entityType] = opts[:entity_type] if opts[:entity_type]
      query_params[:sourceDisplayText] = opts[:source_display_text] if opts[:source_display_text]
      query_params[:isSystem] = opts[:is_system] if opts[:is_system]
      query_params[:isAutoAssociated] = opts[:is_auto_associated] if !opts[:is_auto_associated].nil?
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:categories] = opts[:categories] if opts[:categories]
      query_params[:isSimplified] = opts[:is_simplified] if !opts[:is_simplified].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_sources') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsSourceCollection'
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


    # This API returns the list of work request errors if any.
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [String] work_request_id Work Request Identifier [OCID] (https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) for the asynchronous request.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for timeCreated is descending. If no value is specified timeCreated is default.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::WorkRequestErrorCollection WorkRequestErrorCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_storage_work_request_errors.rb.html) to see an example of how to use list_storage_work_request_errors API.
    def list_storage_work_request_errors(compartment_id, work_request_id, namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_storage_work_request_errors.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_storage_work_request_errors." if compartment_id.nil?
      raise "Missing the required parameter 'work_request_id' when calling list_storage_work_request_errors." if work_request_id.nil?
      raise "Missing the required parameter 'namespace_name' when calling list_storage_work_request_errors." if namespace_name.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[timeCreated].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated.'
      end
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/storageWorkRequests/{workRequestId}/errors'.sub('{workRequestId}', work_request_id.to_s).sub('{namespaceName}', namespace_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_storage_work_request_errors') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::WorkRequestErrorCollection'
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


    # This API lists storage work requests.  Use query parameters to narrow down or sort the result list.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by This is the query parameter of which field to sort by. Only one sort order may be provided. Default order for timeAccepted
    #   is descending. If no value is specified timeAccepted is default.
    #    (default to timeAccepted)
    #   Allowed values are: timeAccepted, timeExpires, timeFinished
    # @option opts [String] :operation_type The is the work request type query parameter
    # @option opts [String] :status The is the work request status query parameter
    # @option opts [DateTime] :time_started The is the query parameter of when the processing of work request was started
    # @option opts [DateTime] :time_finished The is the query parameter of when the processing of work request was finished
    # @option opts [String] :policy_name This is the query parameter of purge policy name
    # @option opts [String] :policy_id This is the query parameter of purge policy ID
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::StorageWorkRequestCollection StorageWorkRequestCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_storage_work_requests.rb.html) to see an example of how to use list_storage_work_requests API.
    def list_storage_work_requests(compartment_id, namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_storage_work_requests.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_storage_work_requests." if compartment_id.nil?
      raise "Missing the required parameter 'namespace_name' when calling list_storage_work_requests." if namespace_name.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[timeAccepted timeExpires timeFinished].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeAccepted, timeExpires, timeFinished.'
      end

      if opts[:operation_type] && !OCI::LogAnalytics::Models::STORAGE_OPERATION_TYPE_ENUM.include?(opts[:operation_type])
        raise 'Invalid value for "operation_type", must be one of the values in OCI::LogAnalytics::Models::STORAGE_OPERATION_TYPE_ENUM.'
      end

      if opts[:status] && !OCI::LogAnalytics::Models::WORK_REQUEST_STATUS_ENUM.include?(opts[:status])
        raise 'Invalid value for "status", must be one of the values in OCI::LogAnalytics::Models::WORK_REQUEST_STATUS_ENUM.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/storageWorkRequests'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:operationType] = opts[:operation_type] if opts[:operation_type]
      query_params[:status] = opts[:status] if opts[:status]
      query_params[:timeStarted] = opts[:time_started] if opts[:time_started]
      query_params[:timeFinished] = opts[:time_finished] if opts[:time_finished]
      query_params[:policyName] = opts[:policy_name] if opts[:policy_name]
      query_params[:policyId] = opts[:policy_id] if opts[:policy_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_storage_work_requests') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::StorageWorkRequestCollection'
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


    # Gets list of character encodings which are supported by on-demand upload.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return. (default to 100)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::CharEncodingCollection CharEncodingCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_supported_char_encodings.rb.html) to see an example of how to use list_supported_char_encodings API.
    def list_supported_char_encodings(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_supported_char_encodings.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_supported_char_encodings." if namespace_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/supportedCharEncodings'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_supported_char_encodings') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::CharEncodingCollection'
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


    # Gets list of timezones which are supported by on-demand upload.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return. (default to 100)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::TimezoneCollection TimezoneCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_supported_timezones.rb.html) to see an example of how to use list_supported_timezones API.
    def list_supported_timezones(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_supported_timezones.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_supported_timezones." if namespace_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/supportedTimezones'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_supported_timezones') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::TimezoneCollection'
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


    # Gets list of files in an upload along with its processing state.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] upload_reference Unique internal identifier to refer upload container.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return. (default to 50)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for timeStarted is descending.
    #   timeCreated, fileName and logGroup are deprecated. Instead use timestarted, name, logGroup accordingly.
    #    (default to timeStarted)
    #   Allowed values are: timeStarted, name, logGroupName, sourceName, status, timeCreated, fileName, logGroup
    # @option opts [String] :search_str This can be used to filter upload files based on the file, log group and log source names.
    # @option opts [Array<String>] :status Upload File processing state. (default to [])
    #   Allowed values are: IN_PROGRESS, SUCCESSFUL, FAILED
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::UploadFileCollection UploadFileCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_upload_files.rb.html) to see an example of how to use list_upload_files API.
    def list_upload_files(namespace_name, upload_reference, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_upload_files.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_upload_files." if namespace_name.nil?
      raise "Missing the required parameter 'upload_reference' when calling list_upload_files." if upload_reference.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[timeStarted name logGroupName sourceName status timeCreated fileName logGroup].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeStarted, name, logGroupName, sourceName, status, timeCreated, fileName, logGroup.'
      end


      status_allowable_values = %w[IN_PROGRESS SUCCESSFUL FAILED]
      if opts[:status] && !opts[:status].empty?
        opts[:status].each do |val_to_check|
          unless status_allowable_values.include?(val_to_check)
            raise 'Invalid value for "status", must be one of IN_PROGRESS, SUCCESSFUL, FAILED.'
          end
        end
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'upload_reference' must not be blank" if OCI::Internal::Util.blank_string?(upload_reference)

      path = '/namespaces/{namespaceName}/uploads/{uploadReference}/files'.sub('{namespaceName}', namespace_name.to_s).sub('{uploadReference}', upload_reference.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:searchStr] = opts[:search_str] if opts[:search_str]
      query_params[:status] = OCI::ApiClient.build_collection_params(opts[:status], :multi) if opts[:status] && !opts[:status].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_upload_files') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::UploadFileCollection'
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


    # Gets list of warnings in an upload caused by incorrect configuration.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] upload_reference Unique internal identifier to refer upload container.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return. (default to 50)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::UploadWarningCollection UploadWarningCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_upload_warnings.rb.html) to see an example of how to use list_upload_warnings API.
    def list_upload_warnings(namespace_name, upload_reference, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_upload_warnings.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_upload_warnings." if namespace_name.nil?
      raise "Missing the required parameter 'upload_reference' when calling list_upload_warnings." if upload_reference.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'upload_reference' must not be blank" if OCI::Internal::Util.blank_string?(upload_reference)

      path = '/namespaces/{namespaceName}/uploads/{uploadReference}/warnings'.sub('{namespaceName}', namespace_name.to_s).sub('{uploadReference}', upload_reference.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_upload_warnings') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::UploadWarningCollection'
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


    # Gets a list of all On-demand uploads.
    # To use this and other API operations, you must be authorized in an IAM policy.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :name Name of the upload container.
    # @option opts [String] :name_contains A filter to return only uploads whose name contains the given name.
    #
    # @option opts [Integer] :limit The maximum number of items to return. (default to 50)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for timeUpdated is descending.
    #   Default order for name is ascending. If no value is specified timeUpdated is default.
    #    (default to timeUpdated)
    #   Allowed values are: timeUpdated, timeCreated, name
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :warnings_filter Use this for filtering uploads w.r.t warnings. Only one value is allowed. If no value is specified then ALL is taken as default,
    #   which means that all the uploads with and without warnings will be returned.
    #    (default to ALL)
    #   Allowed values are: WITH_WARNINGS, WITHOUT_WARNINGS, ALL
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::UploadCollection UploadCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_uploads.rb.html) to see an example of how to use list_uploads API.
    def list_uploads(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_uploads.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_uploads." if namespace_name.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[timeUpdated timeCreated name].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeUpdated, timeCreated, name.'
      end

      if opts[:warnings_filter] && !%w[WITH_WARNINGS WITHOUT_WARNINGS ALL].include?(opts[:warnings_filter])
        raise 'Invalid value for "warnings_filter", must be one of WITH_WARNINGS, WITHOUT_WARNINGS, ALL.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/uploads'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:nameContains] = opts[:name_contains] if opts[:name_contains]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:warningsFilter] = opts[:warnings_filter] if opts[:warnings_filter]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_uploads') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::UploadCollection'
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


    # Returns a list of collection warnings, containing detailed information about them. You may limit the number of results, provide sorting order, and filter by information such as start time, end time, warning type, warning state, source name, source pattern and entity name.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :warning_state The warning state used for filtering.  A value of SUPPRESSED will return only
    #   suppressed warnings, a value of UNSUPPRESSED will return only unsuppressed
    #   warnings, and a value of ALL will return all warnings regardless of their
    #   suppression state.  Default is UNSUPPRESSED.
    #    (default to UNSUPPRESSED)
    #   Allowed values are: ALL, SUPPRESSED, UNSUPPRESSED
    # @option opts [String] :source_name The source name.
    # @option opts [String] :source_pattern The source pattern used for filtering.  Only warnings associated with a source with the
    #   specified pattern will be returned.
    #
    # @option opts [String] :warning_message warning message query parameter
    # @option opts [String] :entity_name The entity name used for filtering.  Only warnings associated with an entity with the
    #   specified name will be returned.
    #
    # @option opts [String] :entity_type The entity type used for filtering.  Only associations on an entity with the
    #   specified type will be returned.
    #
    # @option opts [String] :warning_type The warning type query parameter.
    # @option opts [BOOLEAN] :is_no_source A flag indicating whether to filter warnings based on source display name or on warning level.
    #   A value of true will filter based on warning level (rule, source, or pattern), while a
    #   value of false will filter based on source display name.
    #
    # @option opts [String] :start_time The warning start date query parameter.
    # @option opts [String] :end_time The warning end date query parameter.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The attribute used to sort the returned warnings (default to InitialWarningDate)
    #   Allowed values are: EntityType, SourceName, PatternText, FirstReported, WarningMessage, Host, EntityName, InitialWarningDate
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsWarningCollection LogAnalyticsWarningCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_warnings.rb.html) to see an example of how to use list_warnings API.
    def list_warnings(namespace_name, compartment_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_warnings.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_warnings." if namespace_name.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_warnings." if compartment_id.nil?

      if opts[:warning_state] && !%w[ALL SUPPRESSED UNSUPPRESSED].include?(opts[:warning_state])
        raise 'Invalid value for "warning_state", must be one of ALL, SUPPRESSED, UNSUPPRESSED.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[EntityType SourceName PatternText FirstReported WarningMessage Host EntityName InitialWarningDate].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of EntityType, SourceName, PatternText, FirstReported, WarningMessage, Host, EntityName, InitialWarningDate.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/warnings'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:warningState] = opts[:warning_state] if opts[:warning_state]
      query_params[:sourceName] = opts[:source_name] if opts[:source_name]
      query_params[:sourcePattern] = opts[:source_pattern] if opts[:source_pattern]
      query_params[:warningMessage] = opts[:warning_message] if opts[:warning_message]
      query_params[:entityName] = opts[:entity_name] if opts[:entity_name]
      query_params[:entityType] = opts[:entity_type] if opts[:entity_type]
      query_params[:warningType] = opts[:warning_type] if opts[:warning_type]
      query_params[:isNoSource] = opts[:is_no_source] if !opts[:is_no_source].nil?
      query_params[:startTime] = opts[:start_time] if opts[:start_time]
      query_params[:endTime] = opts[:end_time] if opts[:end_time]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_warnings') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsWarningCollection'
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


    # Return a (paginated) list of errors for a given work request.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] work_request_id Work Request Identifier [OCID] (https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) for the asynchronous request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::WorkRequestErrorCollection WorkRequestErrorCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_work_request_errors.rb.html) to see an example of how to use list_work_request_errors API.
    def list_work_request_errors(namespace_name, work_request_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_work_request_errors.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_work_request_errors." if namespace_name.nil?
      raise "Missing the required parameter 'work_request_id' when calling list_work_request_errors." if work_request_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/namespaces/{namespaceName}/workRequests/{workRequestId}/errors'.sub('{namespaceName}', namespace_name.to_s).sub('{workRequestId}', work_request_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_work_request_errors') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::WorkRequestErrorCollection'
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


    # Return a (paginated) list of logs for a given work request.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] work_request_id Work Request Identifier [OCID] (https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) for the asynchronous request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::WorkRequestLogCollection WorkRequestLogCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_work_request_logs.rb.html) to see an example of how to use list_work_request_logs API.
    def list_work_request_logs(namespace_name, work_request_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_work_request_logs.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_work_request_logs." if namespace_name.nil?
      raise "Missing the required parameter 'work_request_id' when calling list_work_request_logs." if work_request_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/namespaces/{namespaceName}/workRequests/{workRequestId}/logs'.sub('{namespaceName}', namespace_name.to_s).sub('{workRequestId}', work_request_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_work_request_logs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::WorkRequestLogCollection'
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


    # Lists the work requests in a compartment.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::WorkRequestCollection WorkRequestCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/list_work_requests.rb.html) to see an example of how to use list_work_requests API.
    def list_work_requests(namespace_name, compartment_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_work_requests.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_work_requests." if namespace_name.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_work_requests." if compartment_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/workRequests'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_work_requests') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::WorkRequestCollection'
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


    # Off-boards a tenant from Logging Analytics
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
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
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/offboard_namespace.rb.html) to see an example of how to use offboard_namespace API.
    def offboard_namespace(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#offboard_namespace.' if logger

      raise "Missing the required parameter 'namespace_name' when calling offboard_namespace." if namespace_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/actions/offboard'.sub('{namespaceName}', namespace_name.to_s)
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

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#offboard_namespace') do
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


    # On-boards a tenant to Logging Analytics.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
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
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/onboard_namespace.rb.html) to see an example of how to use onboard_namespace API.
    def onboard_namespace(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#onboard_namespace.' if logger

      raise "Missing the required parameter 'namespace_name' when calling onboard_namespace." if namespace_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/actions/onboard'.sub('{namespaceName}', namespace_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#onboard_namespace') do
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


    # Describe query
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::ParseQueryDetails] parse_query_details Query string to be parsed
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::ParseQueryOutput ParseQueryOutput}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/parse_query.rb.html) to see an example of how to use parse_query API.
    def parse_query(namespace_name, parse_query_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#parse_query.' if logger

      raise "Missing the required parameter 'namespace_name' when calling parse_query." if namespace_name.nil?
      raise "Missing the required parameter 'parse_query_details' when calling parse_query." if parse_query_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/search/actions/parse'.sub('{namespaceName}', namespace_name.to_s)
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
      header_params[:expect] ||= '100-continue'

      post_body = @api_client.object_to_http_body(parse_query_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#parse_query') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::ParseQueryOutput'
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


    # Pause the scheduled task specified by {scheduledTaskId}.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] scheduled_task_id Unique scheduledTask id returned from task create.
    #   If invalid will lead to a 404 not found.
    #
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
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::ScheduledTask ScheduledTask}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/pause_scheduled_task.rb.html) to see an example of how to use pause_scheduled_task API.
    def pause_scheduled_task(namespace_name, scheduled_task_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#pause_scheduled_task.' if logger

      raise "Missing the required parameter 'namespace_name' when calling pause_scheduled_task." if namespace_name.nil?
      raise "Missing the required parameter 'scheduled_task_id' when calling pause_scheduled_task." if scheduled_task_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'scheduled_task_id' must not be blank" if OCI::Internal::Util.blank_string?(scheduled_task_id)

      path = '/namespaces/{namespaceName}/scheduledTasks/{scheduledTaskId}/actions/pause'.sub('{namespaceName}', namespace_name.to_s).sub('{scheduledTaskId}', scheduled_task_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#pause_scheduled_task') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::ScheduledTask'
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


    # This API submits a work request to purge data. Only data from log groups that the user has permission to delete
    # will be purged.  To purge all data, the user must have permission to all log groups.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::PurgeStorageDataDetails] purge_storage_data_details This is the input to purge old data.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/purge_storage_data.rb.html) to see an example of how to use purge_storage_data API.
    def purge_storage_data(namespace_name, purge_storage_data_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#purge_storage_data.' if logger

      raise "Missing the required parameter 'namespace_name' when calling purge_storage_data." if namespace_name.nil?
      raise "Missing the required parameter 'purge_storage_data_details' when calling purge_storage_data." if purge_storage_data_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/storage/actions/purgeData'.sub('{namespaceName}', namespace_name.to_s)
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
      header_params[:expect] ||= '100-continue'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(purge_storage_data_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#purge_storage_data') do
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


    # Put the work request specified by {workRequestId} into the background. Backgrounded queries will preserve query results on query completion for up to 7 days for recall. After 7 days the results and query expire.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] work_request_id Work Request Identifier [OCID] (https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) for the asynchronous request.
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
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::QueryWorkRequest QueryWorkRequest}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/put_query_work_request_background.rb.html) to see an example of how to use put_query_work_request_background API.
    def put_query_work_request_background(namespace_name, work_request_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#put_query_work_request_background.' if logger

      raise "Missing the required parameter 'namespace_name' when calling put_query_work_request_background." if namespace_name.nil?
      raise "Missing the required parameter 'work_request_id' when calling put_query_work_request_background." if work_request_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/namespaces/{namespaceName}/queryWorkRequests/{workRequestId}/actions/background'.sub('{namespaceName}', namespace_name.to_s).sub('{workRequestId}', work_request_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#put_query_work_request_background') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::QueryWorkRequest'
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


    # Performs a log analytics search, if shouldRunAsync is false returns the query results once they become available subject to 60 second timeout. If a query is subject to exceed that time then it should be run asynchronously. Asynchronous query submissions return the queryWorkRequestId to use for execution tracking, query submission lifecycle actions and to poll for query results.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::QueryDetails] query_details Query to be executed.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [Integer] :limit Maximum number of results to return in this request.  Note a limit=-1 returns all results from pageId onwards up to maxtotalCount. (default to 10)
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::QueryAggregation QueryAggregation}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/query.rb.html) to see an example of how to use query API.
    def query(namespace_name, query_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#query.' if logger

      raise "Missing the required parameter 'namespace_name' when calling query." if namespace_name.nil?
      raise "Missing the required parameter 'query_details' when calling query." if query_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/search/actions/query'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:expect] ||= '100-continue'

      post_body = @api_client.object_to_http_body(query_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#query') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::QueryAggregation'
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


    # This API submits a work request to recall archived data based on time interval and data type.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::RecallArchivedDataDetails] recall_archived_data_details This is the input to recall archived data.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/recall_archived_data.rb.html) to see an example of how to use recall_archived_data API.
    def recall_archived_data(namespace_name, recall_archived_data_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#recall_archived_data.' if logger

      raise "Missing the required parameter 'namespace_name' when calling recall_archived_data." if namespace_name.nil?
      raise "Missing the required parameter 'recall_archived_data_details' when calling recall_archived_data." if recall_archived_data_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/storage/actions/recallArchivedData'.sub('{namespaceName}', namespace_name.to_s)
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
      header_params[:expect] ||= '100-continue'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(recall_archived_data_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#recall_archived_data') do
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


    # Creates a lookup with the specified name, type and description. The csv file containing the lookup content is passed in as binary data in the request.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] type The lookup type.  Valid values are Lookup or Dictionary.
    #   Allowed values are: Lookup, Dictionary
    # @param [String, IO] register_lookup_content_file_body file containing data for lookup creation
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :name A filter to return only log analytics entities whose name matches the entire name given. The match
    #   is case-insensitive.
    #
    # @option opts [String] :description The description for a created lookup.
    #
    # @option opts [String] :char_encoding The character encoding of the uploaded file. (default to UTF-8)
    # @option opts [BOOLEAN] :is_hidden A flag indicating whether or not the new lookup should be hidden.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :expect A value of `100-continue` requests preliminary verification of the request method, path, and headers before the request body is sent.
    #   If no error results from such verification, the server will send a 100 (Continue) interim response to indicate readiness for the request body.
    #   The only allowed value for this parameter is \"100-Continue\" (case-insensitive).
    #
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsLookup LogAnalyticsLookup}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/register_lookup.rb.html) to see an example of how to use register_lookup API.
    def register_lookup(namespace_name, type, register_lookup_content_file_body, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#register_lookup.' if logger

      raise "Missing the required parameter 'namespace_name' when calling register_lookup." if namespace_name.nil?
      raise "Missing the required parameter 'type' when calling register_lookup." if type.nil?
      unless %w[Lookup Dictionary].include?(type)
        raise "Invalid value for 'type', must be one of Lookup, Dictionary."
      end
      raise "Missing the required parameter 'register_lookup_content_file_body' when calling register_lookup." if register_lookup_content_file_body.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/lookups/actions/register'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:type] = type
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:description] = opts[:description] if opts[:description]
      query_params[:charEncoding] = opts[:char_encoding] if opts[:char_encoding]
      query_params[:isHidden] = opts[:is_hidden] if !opts[:is_hidden].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:expect] = opts[:expect] if opts[:expect]
      # rubocop:enable Style/NegatedIf
      header_params[:'content-type'] ||= 'application/octet-stream'
      header_params[:expect] ||= '100-continue'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(register_lookup_content_file_body)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#register_lookup') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsLookup'
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


    # This API submits a work request to release recalled data based on time interval and data type.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::ReleaseRecalledDataDetails] release_recalled_data_details This is the input to release recalled data
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/release_recalled_data.rb.html) to see an example of how to use release_recalled_data API.
    def release_recalled_data(namespace_name, release_recalled_data_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#release_recalled_data.' if logger

      raise "Missing the required parameter 'namespace_name' when calling release_recalled_data." if namespace_name.nil?
      raise "Missing the required parameter 'release_recalled_data_details' when calling release_recalled_data." if release_recalled_data_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/storage/actions/releaseRecalledData'.sub('{namespaceName}', namespace_name.to_s)
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
      header_params[:expect] ||= '100-continue'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(release_recalled_data_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#release_recalled_data') do
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


    # Delete association between input source log analytics entity and destination entities.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] log_analytics_entity_id The log analytics entity OCID.
    #
    # @param [OCI::LogAnalytics::Models::RemoveEntityAssociationsDetails] remove_entity_associations_details This parameter specifies the entity OCIDs with which associations are to be deleted.
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
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/remove_entity_associations.rb.html) to see an example of how to use remove_entity_associations API.
    def remove_entity_associations(namespace_name, log_analytics_entity_id, remove_entity_associations_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#remove_entity_associations.' if logger

      raise "Missing the required parameter 'namespace_name' when calling remove_entity_associations." if namespace_name.nil?
      raise "Missing the required parameter 'log_analytics_entity_id' when calling remove_entity_associations." if log_analytics_entity_id.nil?
      raise "Missing the required parameter 'remove_entity_associations_details' when calling remove_entity_associations." if remove_entity_associations_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'log_analytics_entity_id' must not be blank" if OCI::Internal::Util.blank_string?(log_analytics_entity_id)

      path = '/namespaces/{namespaceName}/logAnalyticsEntities/{logAnalyticsEntityId}/actions/removeEntityAssociations'.sub('{namespaceName}', namespace_name.to_s).sub('{logAnalyticsEntityId}', log_analytics_entity_id.to_s)
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
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:expect] ||= '100-continue'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(remove_entity_associations_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#remove_entity_associations') do
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


    # Removes the tenant preferences. Currently, only \"DEFAULT_HOMEPAGE\" is supported.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::LogAnalyticsPreferenceDetails] remove_preferences_details Details of the tenant preferences to delete.
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
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/remove_preferences.rb.html) to see an example of how to use remove_preferences API.
    def remove_preferences(namespace_name, remove_preferences_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#remove_preferences.' if logger

      raise "Missing the required parameter 'namespace_name' when calling remove_preferences." if namespace_name.nil?
      raise "Missing the required parameter 'remove_preferences_details' when calling remove_preferences." if remove_preferences_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/preferences/actions/removePreferences'.sub('{namespaceName}', namespace_name.to_s)
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
      header_params[:expect] ||= '100-continue'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(remove_preferences_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#remove_preferences') do
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


    # Removes the category assignments of DASHBOARD and SAVEDSEARCH resources.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::LogAnalyticsResourceCategoryDetails] remove_resource_categories_details Details for removing the specified category assignments of resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/remove_resource_categories.rb.html) to see an example of how to use remove_resource_categories API.
    def remove_resource_categories(namespace_name, remove_resource_categories_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#remove_resource_categories.' if logger

      raise "Missing the required parameter 'namespace_name' when calling remove_resource_categories." if namespace_name.nil?
      raise "Missing the required parameter 'remove_resource_categories_details' when calling remove_resource_categories." if remove_resource_categories_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/categories/actions/removeResourceCategories'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:expect] ||= '100-continue'

      post_body = @api_client.object_to_http_body(remove_resource_categories_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#remove_resource_categories') do
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


    # Remove one or more event types from a source.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] source_name The source name.
    # @param [OCI::LogAnalytics::Models::EventTypeDetails] remove_event_type_details Details of event types to be removed from the source.
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
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/remove_source_event_types.rb.html) to see an example of how to use remove_source_event_types API.
    def remove_source_event_types(namespace_name, source_name, remove_event_type_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#remove_source_event_types.' if logger

      raise "Missing the required parameter 'namespace_name' when calling remove_source_event_types." if namespace_name.nil?
      raise "Missing the required parameter 'source_name' when calling remove_source_event_types." if source_name.nil?
      raise "Missing the required parameter 'remove_event_type_details' when calling remove_source_event_types." if remove_event_type_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'source_name' must not be blank" if OCI::Internal::Util.blank_string?(source_name)

      path = '/namespaces/{namespaceName}/sources/{sourceName}/actions/removeEventTypes'.sub('{namespaceName}', namespace_name.to_s).sub('{sourceName}', source_name.to_s)
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
      header_params[:expect] ||= '100-continue'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(remove_event_type_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#remove_source_event_types') do
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


    # Resume the scheduled task specified by {scheduledTaskId}.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] scheduled_task_id Unique scheduledTask id returned from task create.
    #   If invalid will lead to a 404 not found.
    #
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
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::ScheduledTask ScheduledTask}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/resume_scheduled_task.rb.html) to see an example of how to use resume_scheduled_task API.
    def resume_scheduled_task(namespace_name, scheduled_task_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#resume_scheduled_task.' if logger

      raise "Missing the required parameter 'namespace_name' when calling resume_scheduled_task." if namespace_name.nil?
      raise "Missing the required parameter 'scheduled_task_id' when calling resume_scheduled_task." if scheduled_task_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'scheduled_task_id' must not be blank" if OCI::Internal::Util.blank_string?(scheduled_task_id)

      path = '/namespaces/{namespaceName}/scheduledTasks/{scheduledTaskId}/actions/resume'.sub('{namespaceName}', namespace_name.to_s).sub('{scheduledTaskId}', scheduled_task_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#resume_scheduled_task') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::ScheduledTask'
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


    # Execute the saved search acceleration task in the foreground.
    # The ScheduledTask taskType must be ACCELERATION.
    # Optionally specify time range (timeStart and timeEnd). The default is all time.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] scheduled_task_id Unique scheduledTask id returned from task create.
    #   If invalid will lead to a 404 not found.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [DateTime] :time_start Optional parameter to specify start of time range, in the format defined by RFC3339.
    #   Default value is beginning of time.
    #
    # @option opts [DateTime] :time_end Optional parameter to specify end of time range, in the format defined by RFC3339.
    #   Default value is end of time.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/run.rb.html) to see an example of how to use run API.
    def run(namespace_name, scheduled_task_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#run.' if logger

      raise "Missing the required parameter 'namespace_name' when calling run." if namespace_name.nil?
      raise "Missing the required parameter 'scheduled_task_id' when calling run." if scheduled_task_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'scheduled_task_id' must not be blank" if OCI::Internal::Util.blank_string?(scheduled_task_id)

      path = '/namespaces/{namespaceName}/scheduledTasks/{scheduledTaskId}/actions/run'.sub('{namespaceName}', namespace_name.to_s).sub('{scheduledTaskId}', scheduled_task_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:timeStart] = opts[:time_start] if opts[:time_start]
      query_params[:timeEnd] = opts[:time_end] if opts[:time_end]

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#run') do
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


    # This API configures a bucket to store unprocessed payloads.
    # While processing there could be reasons a payload cannot be processed (mismatched structure, corrupted archive format, etc),
    # if configured the payload would be uploaded to the bucket for verification.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] bucket_name Name of the Object Storage bucket.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [BOOLEAN] :is_enabled The enabled flag used for filtering.  Only items with the specified enabled value
    #   will be returned.
    #    (default to true)
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::UnprocessedDataBucket UnprocessedDataBucket}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/set_unprocessed_data_bucket.rb.html) to see an example of how to use set_unprocessed_data_bucket API.
    def set_unprocessed_data_bucket(namespace_name, bucket_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#set_unprocessed_data_bucket.' if logger

      raise "Missing the required parameter 'namespace_name' when calling set_unprocessed_data_bucket." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling set_unprocessed_data_bucket." if bucket_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/actions/setUnprocessedDataBucket'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:bucketName] = bucket_name
      query_params[:isEnabled] = opts[:is_enabled] if !opts[:is_enabled].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#set_unprocessed_data_bucket') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::UnprocessedDataBucket'
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


    # Returns a context specific list of either commands, fields, or values to append to the end of the specified query string if applicable.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::SuggestDetails] suggest_details Query string seeking suggestions for.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::SuggestOutput SuggestOutput}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/suggest.rb.html) to see an example of how to use suggest API.
    def suggest(namespace_name, suggest_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#suggest.' if logger

      raise "Missing the required parameter 'namespace_name' when calling suggest." if namespace_name.nil?
      raise "Missing the required parameter 'suggest_details' when calling suggest." if suggest_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/search/actions/suggest'.sub('{namespaceName}', namespace_name.to_s)
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
      header_params[:expect] ||= '100-continue'

      post_body = @api_client.object_to_http_body(suggest_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#suggest') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::SuggestOutput'
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


    # Supresses a list of warnings. Any unsuppressed warnings in the input list would be suppressed. Warnings in the input list which are already suppressed will not be modified.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::WarningReferenceDetails] warning_reference_details list of agent warning references to suppress
    # @param [String] compartment_id The ID of the compartment in which to list resources.
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
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/suppress_warning.rb.html) to see an example of how to use suppress_warning API.
    def suppress_warning(namespace_name, warning_reference_details, compartment_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#suppress_warning.' if logger

      raise "Missing the required parameter 'namespace_name' when calling suppress_warning." if namespace_name.nil?
      raise "Missing the required parameter 'warning_reference_details' when calling suppress_warning." if warning_reference_details.nil?
      raise "Missing the required parameter 'compartment_id' when calling suppress_warning." if compartment_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/warnings/actions/suppress'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:expect] ||= '100-continue'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(warning_reference_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#suppress_warning') do
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


    # Tests the parser definition against the specified example content to ensure fields are successfully extracted.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::TestParserPayloadDetails] test_parser_payload_details Details for test payload
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :scope The scope used when testing a parser.
    #   Allowed values are: LOG_LINES, LOG_ENTRIES, LOG_LINES_LOG_ENTRIES
    # @option opts [String] :req_origin_module The module to test.  A value of 'ParserFunctionTest' will result in testing of
    #   the parser functions.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::ParserTestResult ParserTestResult}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/test_parser.rb.html) to see an example of how to use test_parser API.
    def test_parser(namespace_name, test_parser_payload_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#test_parser.' if logger

      raise "Missing the required parameter 'namespace_name' when calling test_parser." if namespace_name.nil?
      raise "Missing the required parameter 'test_parser_payload_details' when calling test_parser." if test_parser_payload_details.nil?

      if opts[:scope] && !%w[LOG_LINES LOG_ENTRIES LOG_LINES_LOG_ENTRIES].include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of LOG_LINES, LOG_ENTRIES, LOG_LINES_LOG_ENTRIES.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/parsers/actions/test'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:scope] = opts[:scope] if opts[:scope]
      query_params[:reqOriginModule] = opts[:req_origin_module] if opts[:req_origin_module]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:expect] ||= '100-continue'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(test_parser_payload_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#test_parser') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::ParserTestResult'
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


    # Unsupresses a list of warnings. Any suppressed warnings in the input list would be unsuppressed. Warnings in the input list which are already unsuppressed will not be modified.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::WarningReferenceDetails] warning_reference_details warnings list
    # @param [String] compartment_id The ID of the compartment in which to list resources.
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
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/unsuppress_warning.rb.html) to see an example of how to use unsuppress_warning API.
    def unsuppress_warning(namespace_name, warning_reference_details, compartment_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#unsuppress_warning.' if logger

      raise "Missing the required parameter 'namespace_name' when calling unsuppress_warning." if namespace_name.nil?
      raise "Missing the required parameter 'warning_reference_details' when calling unsuppress_warning." if warning_reference_details.nil?
      raise "Missing the required parameter 'compartment_id' when calling unsuppress_warning." if compartment_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/warnings/actions/unsuppress'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:expect] ||= '100-continue'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(warning_reference_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#unsuppress_warning') do
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


    # Update log analytics enterprise manager bridge with the given id.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] log_analytics_em_bridge_id The log analytics enterprise manager bridge OCID.
    #
    # @param [OCI::LogAnalytics::Models::UpdateLogAnalyticsEmBridgeDetails] update_log_analytics_em_bridge_details Log analytics enterprise manager information to be updated.
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
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsEmBridge LogAnalyticsEmBridge}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/update_log_analytics_em_bridge.rb.html) to see an example of how to use update_log_analytics_em_bridge API.
    def update_log_analytics_em_bridge(namespace_name, log_analytics_em_bridge_id, update_log_analytics_em_bridge_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#update_log_analytics_em_bridge.' if logger

      raise "Missing the required parameter 'namespace_name' when calling update_log_analytics_em_bridge." if namespace_name.nil?
      raise "Missing the required parameter 'log_analytics_em_bridge_id' when calling update_log_analytics_em_bridge." if log_analytics_em_bridge_id.nil?
      raise "Missing the required parameter 'update_log_analytics_em_bridge_details' when calling update_log_analytics_em_bridge." if update_log_analytics_em_bridge_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'log_analytics_em_bridge_id' must not be blank" if OCI::Internal::Util.blank_string?(log_analytics_em_bridge_id)

      path = '/namespaces/{namespaceName}/logAnalyticsEmBridges/{logAnalyticsEmBridgeId}'.sub('{namespaceName}', namespace_name.to_s).sub('{logAnalyticsEmBridgeId}', log_analytics_em_bridge_id.to_s)
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
      header_params[:expect] ||= '100-continue'

      post_body = @api_client.object_to_http_body(update_log_analytics_em_bridge_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#update_log_analytics_em_bridge') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsEmBridge'
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


    # Update the log analytics entity with the given id.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] log_analytics_entity_id The log analytics entity OCID.
    #
    # @param [OCI::LogAnalytics::Models::UpdateLogAnalyticsEntityDetails] update_log_analytics_entity_details Log analytics entity information to be updated.
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
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsEntity LogAnalyticsEntity}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/update_log_analytics_entity.rb.html) to see an example of how to use update_log_analytics_entity API.
    def update_log_analytics_entity(namespace_name, log_analytics_entity_id, update_log_analytics_entity_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#update_log_analytics_entity.' if logger

      raise "Missing the required parameter 'namespace_name' when calling update_log_analytics_entity." if namespace_name.nil?
      raise "Missing the required parameter 'log_analytics_entity_id' when calling update_log_analytics_entity." if log_analytics_entity_id.nil?
      raise "Missing the required parameter 'update_log_analytics_entity_details' when calling update_log_analytics_entity." if update_log_analytics_entity_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'log_analytics_entity_id' must not be blank" if OCI::Internal::Util.blank_string?(log_analytics_entity_id)

      path = '/namespaces/{namespaceName}/logAnalyticsEntities/{logAnalyticsEntityId}'.sub('{namespaceName}', namespace_name.to_s).sub('{logAnalyticsEntityId}', log_analytics_entity_id.to_s)
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
      header_params[:expect] ||= '100-continue'

      post_body = @api_client.object_to_http_body(update_log_analytics_entity_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#update_log_analytics_entity') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsEntity'
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


    # Update custom log analytics entity type. Out of box entity types cannot be udpated.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::UpdateLogAnalyticsEntityTypeDetails] update_log_analytics_entity_type_details Log analytics entity type update details.
    # @param [String] entity_type_name Log analytics entity type name.
    #
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/update_log_analytics_entity_type.rb.html) to see an example of how to use update_log_analytics_entity_type API.
    def update_log_analytics_entity_type(namespace_name, update_log_analytics_entity_type_details, entity_type_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#update_log_analytics_entity_type.' if logger

      raise "Missing the required parameter 'namespace_name' when calling update_log_analytics_entity_type." if namespace_name.nil?
      raise "Missing the required parameter 'update_log_analytics_entity_type_details' when calling update_log_analytics_entity_type." if update_log_analytics_entity_type_details.nil?
      raise "Missing the required parameter 'entity_type_name' when calling update_log_analytics_entity_type." if entity_type_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'entity_type_name' must not be blank" if OCI::Internal::Util.blank_string?(entity_type_name)

      path = '/namespaces/{namespaceName}/logAnalyticsEntityTypes/{entityTypeName}'.sub('{namespaceName}', namespace_name.to_s).sub('{entityTypeName}', entity_type_name.to_s)
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
      header_params[:expect] ||= '100-continue'

      post_body = @api_client.object_to_http_body(update_log_analytics_entity_type_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#update_log_analytics_entity_type') do
        @api_client.call_api(
          :PUT,
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


    # Updates the specified log group's display name, description, defined tags, and free-form tags.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] log_analytics_log_group_id unique logAnalytics log group identifier
    # @param [OCI::LogAnalytics::Models::UpdateLogAnalyticsLogGroupDetails] update_log_analytics_log_group_details The information to be updated.
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
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsLogGroup LogAnalyticsLogGroup}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/update_log_analytics_log_group.rb.html) to see an example of how to use update_log_analytics_log_group API.
    def update_log_analytics_log_group(namespace_name, log_analytics_log_group_id, update_log_analytics_log_group_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#update_log_analytics_log_group.' if logger

      raise "Missing the required parameter 'namespace_name' when calling update_log_analytics_log_group." if namespace_name.nil?
      raise "Missing the required parameter 'log_analytics_log_group_id' when calling update_log_analytics_log_group." if log_analytics_log_group_id.nil?
      raise "Missing the required parameter 'update_log_analytics_log_group_details' when calling update_log_analytics_log_group." if update_log_analytics_log_group_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'log_analytics_log_group_id' must not be blank" if OCI::Internal::Util.blank_string?(log_analytics_log_group_id)

      path = '/namespaces/{namespaceName}/logAnalyticsLogGroups/{logAnalyticsLogGroupId}'.sub('{namespaceName}', namespace_name.to_s).sub('{logAnalyticsLogGroupId}', log_analytics_log_group_id.to_s)
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
      header_params[:expect] ||= '100-continue'

      post_body = @api_client.object_to_http_body(update_log_analytics_log_group_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#update_log_analytics_log_group') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsLogGroup'
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


    # Updates configuration of the object collection rule for the given id.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] log_analytics_object_collection_rule_id The Logging Analytics Object Collection Rule [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    # @param [OCI::LogAnalytics::Models::UpdateLogAnalyticsObjectCollectionRuleDetails] update_log_analytics_object_collection_rule_details The rule config to be updated.
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
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsObjectCollectionRule LogAnalyticsObjectCollectionRule}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/update_log_analytics_object_collection_rule.rb.html) to see an example of how to use update_log_analytics_object_collection_rule API.
    def update_log_analytics_object_collection_rule(namespace_name, log_analytics_object_collection_rule_id, update_log_analytics_object_collection_rule_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#update_log_analytics_object_collection_rule.' if logger

      raise "Missing the required parameter 'namespace_name' when calling update_log_analytics_object_collection_rule." if namespace_name.nil?
      raise "Missing the required parameter 'log_analytics_object_collection_rule_id' when calling update_log_analytics_object_collection_rule." if log_analytics_object_collection_rule_id.nil?
      raise "Missing the required parameter 'update_log_analytics_object_collection_rule_details' when calling update_log_analytics_object_collection_rule." if update_log_analytics_object_collection_rule_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'log_analytics_object_collection_rule_id' must not be blank" if OCI::Internal::Util.blank_string?(log_analytics_object_collection_rule_id)

      path = '/namespaces/{namespaceName}/logAnalyticsObjectCollectionRules/{logAnalyticsObjectCollectionRuleId}'.sub('{namespaceName}', namespace_name.to_s).sub('{logAnalyticsObjectCollectionRuleId}', log_analytics_object_collection_rule_id.to_s)
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
      header_params[:expect] ||= '100-continue'

      post_body = @api_client.object_to_http_body(update_log_analytics_object_collection_rule_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#update_log_analytics_object_collection_rule') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsObjectCollectionRule'
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


    # Updates the metadata of the specified lookup, such as the lookup description.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] lookup_name The name of the lookup to operate on.
    # @param [OCI::LogAnalytics::Models::UpdateLookupMetadataDetails] update_lookup_metadata_details The information required to update a lookup.
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
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsLookup LogAnalyticsLookup}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/update_lookup.rb.html) to see an example of how to use update_lookup API.
    def update_lookup(namespace_name, lookup_name, update_lookup_metadata_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#update_lookup.' if logger

      raise "Missing the required parameter 'namespace_name' when calling update_lookup." if namespace_name.nil?
      raise "Missing the required parameter 'lookup_name' when calling update_lookup." if lookup_name.nil?
      raise "Missing the required parameter 'update_lookup_metadata_details' when calling update_lookup." if update_lookup_metadata_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'lookup_name' must not be blank" if OCI::Internal::Util.blank_string?(lookup_name)

      path = '/namespaces/{namespaceName}/lookups/{lookupName}'.sub('{namespaceName}', namespace_name.to_s).sub('{lookupName}', lookup_name.to_s)
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
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf
      header_params[:expect] ||= '100-continue'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(update_lookup_metadata_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#update_lookup') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsLookup'
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


    # Updates the lookup content. The csv file containing the content to be updated is passed in as binary data in the request.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] lookup_name The name of the lookup to operate on.
    # @param [String, IO] update_lookup_file_body The file to use for the lookup update.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [BOOLEAN] :is_force is force (default to false)
    # @option opts [String] :char_encoding The character encoding of the uploaded file. (default to UTF-8)
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :expect A value of `100-continue` requests preliminary verification of the request method, path, and headers before the request body is sent.
    #   If no error results from such verification, the server will send a 100 (Continue) interim response to indicate readiness for the request body.
    #   The only allowed value for this parameter is \"100-Continue\" (case-insensitive).
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/update_lookup_data.rb.html) to see an example of how to use update_lookup_data API.
    def update_lookup_data(namespace_name, lookup_name, update_lookup_file_body, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#update_lookup_data.' if logger

      raise "Missing the required parameter 'namespace_name' when calling update_lookup_data." if namespace_name.nil?
      raise "Missing the required parameter 'lookup_name' when calling update_lookup_data." if lookup_name.nil?
      raise "Missing the required parameter 'update_lookup_file_body' when calling update_lookup_data." if update_lookup_file_body.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'lookup_name' must not be blank" if OCI::Internal::Util.blank_string?(lookup_name)

      path = '/namespaces/{namespaceName}/lookups/{lookupName}/actions/updateData'.sub('{namespaceName}', namespace_name.to_s).sub('{lookupName}', lookup_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:isForce] = opts[:is_force] if !opts[:is_force].nil?
      query_params[:charEncoding] = opts[:char_encoding] if opts[:char_encoding]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:expect] = opts[:expect] if opts[:expect]
      # rubocop:enable Style/NegatedIf
      header_params[:'content-type'] ||= 'application/octet-stream'
      header_params[:expect] ||= '100-continue'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(update_lookup_file_body)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#update_lookup_data') do
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


    # Updates the tenant preferences. Currently, only \"DEFAULT_HOMEPAGE\" is supported.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::LogAnalyticsPreferenceDetails] update_preferences_details Details of the tenant preferences to update.
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
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/update_preferences.rb.html) to see an example of how to use update_preferences API.
    def update_preferences(namespace_name, update_preferences_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#update_preferences.' if logger

      raise "Missing the required parameter 'namespace_name' when calling update_preferences." if namespace_name.nil?
      raise "Missing the required parameter 'update_preferences_details' when calling update_preferences." if update_preferences_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/preferences/actions/updatePreferences'.sub('{namespaceName}', namespace_name.to_s)
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
      header_params[:expect] ||= '100-continue'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(update_preferences_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#update_preferences') do
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


    # Updates the category assignments of DASHBOARD and SAVEDSEARCH resources.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::LogAnalyticsResourceCategoryDetails] update_resource_categories_details Details for updating the specified category assignments of resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/update_resource_categories.rb.html) to see an example of how to use update_resource_categories API.
    def update_resource_categories(namespace_name, update_resource_categories_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#update_resource_categories.' if logger

      raise "Missing the required parameter 'namespace_name' when calling update_resource_categories." if namespace_name.nil?
      raise "Missing the required parameter 'update_resource_categories_details' when calling update_resource_categories." if update_resource_categories_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/categories/actions/updateResourceCategories'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:expect] ||= '100-continue'

      post_body = @api_client.object_to_http_body(update_resource_categories_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#update_resource_categories') do
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


    # Update the scheduled task. Schedules may be updated only for taskType SAVED_SEARCH and PURGE.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] scheduled_task_id Unique scheduledTask id returned from task create.
    #   If invalid will lead to a 404 not found.
    #
    # @param [OCI::LogAnalytics::Models::UpdateScheduledTaskDetails] update_scheduled_task_details Update details.
    #   Schedules may be updated only for taskType SAVED_SEARCH and PURGE.
    #
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
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::ScheduledTask ScheduledTask}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/update_scheduled_task.rb.html) to see an example of how to use update_scheduled_task API.
    def update_scheduled_task(namespace_name, scheduled_task_id, update_scheduled_task_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#update_scheduled_task.' if logger

      raise "Missing the required parameter 'namespace_name' when calling update_scheduled_task." if namespace_name.nil?
      raise "Missing the required parameter 'scheduled_task_id' when calling update_scheduled_task." if scheduled_task_id.nil?
      raise "Missing the required parameter 'update_scheduled_task_details' when calling update_scheduled_task." if update_scheduled_task_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'scheduled_task_id' must not be blank" if OCI::Internal::Util.blank_string?(scheduled_task_id)

      path = '/namespaces/{namespaceName}/scheduledTasks/{scheduledTaskId}'.sub('{namespaceName}', namespace_name.to_s).sub('{scheduledTaskId}', scheduled_task_id.to_s)
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
      header_params[:expect] ||= '100-continue'

      post_body = @api_client.object_to_http_body(update_scheduled_task_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#update_scheduled_task') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::ScheduledTask'
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


    # This API updates the archiving configuration
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::UpdateStorageDetails] update_storage_details This is the archiving configuration
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
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::Storage Storage}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/update_storage.rb.html) to see an example of how to use update_storage API.
    def update_storage(namespace_name, update_storage_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#update_storage.' if logger

      raise "Missing the required parameter 'namespace_name' when calling update_storage." if namespace_name.nil?
      raise "Missing the required parameter 'update_storage_details' when calling update_storage." if update_storage_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/storage'.sub('{namespaceName}', namespace_name.to_s)
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
      header_params[:expect] ||= '100-continue'

      post_body = @api_client.object_to_http_body(update_storage_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#update_storage') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::Storage'
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


    # Accepts log events for processing by Logging Analytics.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] log_group_id The log group OCID that gets mapped to the uploaded logs.
    #
    # @param [String, IO] upload_log_events_file_details Log events data to be uploaded. The data could be uploaded with or without logSet information depending on whether logSet is enabled for the tenancy or not. Supported formats include
    #   1. json file : logSet (if needed) should be sent as \"logSet\" query parameter
    #   2. gzip file : logSet (if needed) should be sent as \"logSet\" query parameter
    #   3. zip file : containing multiple json files. LogSet information (if needed) should be appended to every filename in the zip.
    #      Supported filename format with logSet detail is &lt;filename&gt;_logSet=&lt;logset&gt;.json
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :log_set The log set that gets associated with the uploaded logs.
    #
    # @option opts [String] :payload_type Identifies the type of request payload.
    #    (default to JSON)
    # @option opts [String] :content_type The content type of the log data.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :expect A value of `100-continue` requests preliminary verification of the request method, path, and headers before the request body is sent.
    #   If no error results from such verification, the server will send a 100 (Continue) interim response to indicate readiness for the request body.
    #   The only allowed value for this parameter is \"100-Continue\" (case-insensitive).
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/upload_log_events_file.rb.html) to see an example of how to use upload_log_events_file API.
    def upload_log_events_file(namespace_name, log_group_id, upload_log_events_file_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#upload_log_events_file.' if logger

      raise "Missing the required parameter 'namespace_name' when calling upload_log_events_file." if namespace_name.nil?
      raise "Missing the required parameter 'log_group_id' when calling upload_log_events_file." if log_group_id.nil?
      raise "Missing the required parameter 'upload_log_events_file_details' when calling upload_log_events_file." if upload_log_events_file_details.nil?

      if opts[:payload_type] && !OCI::LogAnalytics::Models::PAYLOAD_TYPE_ENUM.include?(opts[:payload_type])
        raise 'Invalid value for "payload_type", must be one of the values in OCI::LogAnalytics::Models::PAYLOAD_TYPE_ENUM.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/actions/uploadLogEventsFile'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :exclude_body

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:logGroupId] = log_group_id
      query_params[:logSet] = opts[:log_set] if opts[:log_set]
      query_params[:payloadType] = opts[:payload_type] if opts[:payload_type]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'content-type'] = opts[:content_type] if opts[:content_type]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:expect] = opts[:expect] if opts[:expect]
      # rubocop:enable Style/NegatedIf
      header_params[:'content-type'] ||= 'application/octet-stream'
      header_params[:expect] ||= '100-continue'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(upload_log_events_file_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#upload_log_events_file') do
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


    # Accepts log data for processing by Logging Analytics.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] upload_name The name of the upload. This can be considered as a container name where different kind of logs will be collected and searched together. This upload name/id can further be used for retrieving the details of the upload, including its status or deleting the upload.
    #
    # @param [String] log_source_name Name of the log source that will be used to process the files being uploaded.
    #
    # @param [String] filename The name of the file being uploaded. The extension of the filename part will be used to detect the type of file (like zip, tar).
    #
    # @param [String] opc_meta_loggrpid The log group OCID to which the log data in this upload will be mapped to.
    #
    # @param [String, IO] upload_log_file_body Log data
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :entity_id The entity OCID.
    #
    # @option opts [String] :timezone Timezone to be used when processing log entries whose timestamps do not include an explicit timezone. When this property is not specified, the timezone of the entity specified is used. If the entity is also not specified or do not have a valid timezone then UTC is used
    #
    # @option opts [String] :char_encoding Character encoding to be used to detect the encoding type of file(s) being uploaded.
    #   When this property is not specified, system detected character encoding will be used.
    #
    # @option opts [String] :date_format This property is used to specify the format of the date. This is to be used for ambiguous dates like 12/11/10. This property can take any of the following values -  MONTH_DAY_YEAR, DAY_MONTH_YEAR, YEAR_MONTH_DAY, MONTH_DAY, DAY_MONTH.
    #
    # @option opts [String] :date_year Used to indicate the year where the log entries timestamp do not mention year (Ex: Nov  8 20:45:56).
    #
    # @option opts [BOOLEAN] :invalidate_cache This property can be used to reset configuration cache in case of an issue with the upload. (default to false)
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :content_md5 The base-64 encoded MD5 hash of the body. If the Content-MD5 header is present, Logging Analytics performs an integrity check
    #   on the body of the HTTP request by computing the MD5 hash for the body and comparing it to the MD5 hash supplied in the header.
    #   If the two hashes do not match, the log data is rejected and an HTTP-400 Unmatched Content MD5 error is returned with the message:
    #
    #   \"The computed MD5 of the request body (ACTUAL_MD5) does not match the Content-MD5 header (HEADER_MD5)\"
    #
    # @option opts [String] :content_type The content type of the log data.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :log_set The log set that gets associated with the uploaded logs.
    #
    # @option opts [String] :expect A value of `100-continue` requests preliminary verification of the request method, path, and headers before the request body is sent.
    #   If no error results from such verification, the server will send a 100 (Continue) interim response to indicate readiness for the request body.
    #   The only allowed value for this parameter is \"100-Continue\" (case-insensitive).
    #
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::Upload Upload}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/upload_log_file.rb.html) to see an example of how to use upload_log_file API.
    def upload_log_file(namespace_name, upload_name, log_source_name, filename, opc_meta_loggrpid, upload_log_file_body, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#upload_log_file.' if logger

      raise "Missing the required parameter 'namespace_name' when calling upload_log_file." if namespace_name.nil?
      raise "Missing the required parameter 'upload_name' when calling upload_log_file." if upload_name.nil?
      raise "Missing the required parameter 'log_source_name' when calling upload_log_file." if log_source_name.nil?
      raise "Missing the required parameter 'filename' when calling upload_log_file." if filename.nil?
      raise "Missing the required parameter 'opc_meta_loggrpid' when calling upload_log_file." if opc_meta_loggrpid.nil?
      raise "Missing the required parameter 'upload_log_file_body' when calling upload_log_file." if upload_log_file_body.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/actions/uploadLogFile'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :exclude_body

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:uploadName] = upload_name
      query_params[:logSourceName] = log_source_name
      query_params[:filename] = filename
      query_params[:entityId] = opts[:entity_id] if opts[:entity_id]
      query_params[:timezone] = opts[:timezone] if opts[:timezone]
      query_params[:charEncoding] = opts[:char_encoding] if opts[:char_encoding]
      query_params[:dateFormat] = opts[:date_format] if opts[:date_format]
      query_params[:dateYear] = opts[:date_year] if opts[:date_year]
      query_params[:invalidateCache] = opts[:invalidate_cache] if !opts[:invalidate_cache].nil?
      query_params[:logSet] = opts[:log_set] if opts[:log_set]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'opc-meta-loggrpid'] = opc_meta_loggrpid
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'content-md5'] = opts[:content_md5] if opts[:content_md5]
      header_params[:'content-type'] = opts[:content_type] if opts[:content_type]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:expect] = opts[:expect] if opts[:expect]
      # rubocop:enable Style/NegatedIf
      header_params[:'content-type'] ||= 'application/octet-stream'
      header_params[:expect] ||= '100-continue'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(upload_log_file_body)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#upload_log_file') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::Upload'
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


    # Creates or updates associations between sources and entities. All entities should belong to the specified input compartment.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::UpsertLogAnalyticsAssociationDetails] upsert_log_analytics_association_details list of association details
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [BOOLEAN] :is_from_republish isFromRepublish
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/upsert_associations.rb.html) to see an example of how to use upsert_associations API.
    def upsert_associations(namespace_name, upsert_log_analytics_association_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#upsert_associations.' if logger

      raise "Missing the required parameter 'namespace_name' when calling upsert_associations." if namespace_name.nil?
      raise "Missing the required parameter 'upsert_log_analytics_association_details' when calling upsert_associations." if upsert_log_analytics_association_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/associations/actions/upsert'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:isFromRepublish] = opts[:is_from_republish] if !opts[:is_from_republish].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:expect] ||= '100-continue'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(upsert_log_analytics_association_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#upsert_associations') do
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


    # Creates or updates a field that could be used in parser expressions to extract and assign value. To create a field, specify its display name. A name would be generated for the field. For subsequent calls to update the field, include the name attribute.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::UpsertLogAnalyticsFieldDetails] upsert_log_analytics_field_details Details for the new LogAnalyticsFieldDetails.
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
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsField LogAnalyticsField}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/upsert_field.rb.html) to see an example of how to use upsert_field API.
    def upsert_field(namespace_name, upsert_log_analytics_field_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#upsert_field.' if logger

      raise "Missing the required parameter 'namespace_name' when calling upsert_field." if namespace_name.nil?
      raise "Missing the required parameter 'upsert_log_analytics_field_details' when calling upsert_field." if upsert_log_analytics_field_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/fields/actions/upsert'.sub('{namespaceName}', namespace_name.to_s)
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
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf
      header_params[:expect] ||= '100-continue'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(upsert_log_analytics_field_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#upsert_field') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsField'
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


    # Creates or updates a label that could be used to tag a log entry. You may optionally designate the label as a problem, and assign it a priority. You may also provide its related terms (aliases). To create a label, specify its display name. A name would be generated for the label. For subsequent calls to update the label, include the name attribute.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::UpsertLogAnalyticsLabelDetails] upsert_log_analytics_label_details Details for the new LogAnalyticsTagDetails.
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
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsLabel LogAnalyticsLabel}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/upsert_label.rb.html) to see an example of how to use upsert_label API.
    def upsert_label(namespace_name, upsert_log_analytics_label_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#upsert_label.' if logger

      raise "Missing the required parameter 'namespace_name' when calling upsert_label." if namespace_name.nil?
      raise "Missing the required parameter 'upsert_log_analytics_label_details' when calling upsert_label." if upsert_log_analytics_label_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/labels/actions/upsert'.sub('{namespaceName}', namespace_name.to_s)
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
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf
      header_params[:expect] ||= '100-continue'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(upsert_log_analytics_label_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#upsert_label') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsLabel'
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


    # Creates or updates a parser, which defines how fields are extracted from a log entry.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::UpsertLogAnalyticsParserDetails] upsert_log_analytics_parser_details Details for the new LoganParserDetails.
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
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsParser LogAnalyticsParser}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/upsert_parser.rb.html) to see an example of how to use upsert_parser API.
    def upsert_parser(namespace_name, upsert_log_analytics_parser_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#upsert_parser.' if logger

      raise "Missing the required parameter 'namespace_name' when calling upsert_parser." if namespace_name.nil?
      raise "Missing the required parameter 'upsert_log_analytics_parser_details' when calling upsert_parser." if upsert_log_analytics_parser_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/parsers/actions/upsert'.sub('{namespaceName}', namespace_name.to_s)
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
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf
      header_params[:expect] ||= '100-continue'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(upsert_log_analytics_parser_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#upsert_parser') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsParser'
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


    # Creates or updates a log source. You may also specify parsers, labels, extended fields etc., for the source.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::UpsertLogAnalyticsSourceDetails] upsert_log_analytics_source_details Details for the new LoganSourceDetails.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :create_like_source_id The unique identifier of the source to use as the reference for a create like
    #   operation.
    #
    # @option opts [BOOLEAN] :is_incremental A flag indicating whether or not the update of a source is incremental or not.  If incremental,
    #   the name of the source must be specified.
    #
    # @option opts [BOOLEAN] :is_ignore_warning is ignore warning
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsSource LogAnalyticsSource}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/upsert_source.rb.html) to see an example of how to use upsert_source API.
    def upsert_source(namespace_name, upsert_log_analytics_source_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#upsert_source.' if logger

      raise "Missing the required parameter 'namespace_name' when calling upsert_source." if namespace_name.nil?
      raise "Missing the required parameter 'upsert_log_analytics_source_details' when calling upsert_source." if upsert_log_analytics_source_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/sources/actions/upsert'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:createLikeSourceId] = opts[:create_like_source_id] if opts[:create_like_source_id]
      query_params[:isIncremental] = opts[:is_incremental] if !opts[:is_incremental].nil?
      query_params[:isIgnoreWarning] = opts[:is_ignore_warning] if !opts[:is_ignore_warning].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf
      header_params[:expect] ||= '100-continue'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(upsert_log_analytics_source_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#upsert_source') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsSource'
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


    # Checks if the passed in entities could be associated with the specified sources. The validation is performed to ensure that the entities have the relevant property values that are used in the corresponding source patterns.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::UpsertLogAnalyticsAssociationDetails] upsert_log_analytics_association_details Details for the new log analytics associations.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The attribute used to sort the returned association parameters (default to sourceDisplayName)
    #   Allowed values are: sourceDisplayName, status
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsAssociationParameterCollection LogAnalyticsAssociationParameterCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/validate_association_parameters.rb.html) to see an example of how to use validate_association_parameters API.
    def validate_association_parameters(namespace_name, upsert_log_analytics_association_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#validate_association_parameters.' if logger

      raise "Missing the required parameter 'namespace_name' when calling validate_association_parameters." if namespace_name.nil?
      raise "Missing the required parameter 'upsert_log_analytics_association_details' when calling validate_association_parameters." if upsert_log_analytics_association_details.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[sourceDisplayName status].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of sourceDisplayName, status.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/associations/actions/validateParameters'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:expect] ||= '100-continue'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(upsert_log_analytics_association_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#validate_association_parameters') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsAssociationParameterCollection'
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


    # Validates a log file to check whether it is eligible to be uploaded or not.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] object_location Location of the log file.
    # @param [String] filename The name of the file being uploaded. The extension of the filename part will be used to detect the type of file (like zip, tar).
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::FileValidationResponse FileValidationResponse}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/validate_file.rb.html) to see an example of how to use validate_file API.
    def validate_file(namespace_name, object_location, filename, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#validate_file.' if logger

      raise "Missing the required parameter 'namespace_name' when calling validate_file." if namespace_name.nil?
      raise "Missing the required parameter 'object_location' when calling validate_file." if object_location.nil?
      raise "Missing the required parameter 'filename' when calling validate_file." if filename.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/uploads/actions/validateFile'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:objectLocation] = object_location
      query_params[:filename] = filename

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#validate_file') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::FileValidationResponse'
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


    # Checks if the specified input is a valid log source definition.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::UpsertLogAnalyticsSourceDetails] upsert_log_analytics_source_details Details for the new LoganSourceDetails.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :create_like_source_id The unique identifier of the source to use as the reference for a create like
    #   operation.
    #
    # @option opts [BOOLEAN] :is_incremental A flag indicating whether or not the update of a source is incremental or not.  If incremental,
    #   the name of the source must be specified.
    #
    # @option opts [BOOLEAN] :is_ignore_warning is ignore warning
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::SourceValidateResults SourceValidateResults}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/validate_source.rb.html) to see an example of how to use validate_source API.
    def validate_source(namespace_name, upsert_log_analytics_source_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#validate_source.' if logger

      raise "Missing the required parameter 'namespace_name' when calling validate_source." if namespace_name.nil?
      raise "Missing the required parameter 'upsert_log_analytics_source_details' when calling validate_source." if upsert_log_analytics_source_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/sources/actions/validate'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:createLikeSourceId] = opts[:create_like_source_id] if opts[:create_like_source_id]
      query_params[:isIncremental] = opts[:is_incremental] if !opts[:is_incremental].nil?
      query_params[:isIgnoreWarning] = opts[:is_ignore_warning] if !opts[:is_ignore_warning].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:expect] ||= '100-continue'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(upsert_log_analytics_source_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#validate_source') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::SourceValidateResults'
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


    # Checks if the specified input contains valid extended field definitions against the provided example content.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::LogAnalyticsSource] log_analytics_source Details for the new LogAnalyticsSource.
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
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::ExtendedFieldsValidationResult ExtendedFieldsValidationResult}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/validate_source_extended_field_details.rb.html) to see an example of how to use validate_source_extended_field_details API.
    def validate_source_extended_field_details(namespace_name, log_analytics_source, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#validate_source_extended_field_details.' if logger

      raise "Missing the required parameter 'namespace_name' when calling validate_source_extended_field_details." if namespace_name.nil?
      raise "Missing the required parameter 'log_analytics_source' when calling validate_source_extended_field_details." if log_analytics_source.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/sources/actions/validateExtendedFields'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:expect] ||= '100-continue'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(log_analytics_source)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#validate_source_extended_field_details') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::ExtendedFieldsValidationResult'
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


    # Validates the source mapping for a given file and provides match status and the parsed representation of log data.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] object_location Location of the log file.
    # @param [String] filename The name of the file being uploaded. The extension of the filename part will be used to detect the type of file (like zip, tar).
    #
    # @param [String] log_source_name Name of the log source that will be used to process the files being uploaded.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::SourceMappingResponse SourceMappingResponse}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/validate_source_mapping.rb.html) to see an example of how to use validate_source_mapping API.
    def validate_source_mapping(namespace_name, object_location, filename, log_source_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#validate_source_mapping.' if logger

      raise "Missing the required parameter 'namespace_name' when calling validate_source_mapping." if namespace_name.nil?
      raise "Missing the required parameter 'object_location' when calling validate_source_mapping." if object_location.nil?
      raise "Missing the required parameter 'filename' when calling validate_source_mapping." if filename.nil?
      raise "Missing the required parameter 'log_source_name' when calling validate_source_mapping." if log_source_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/uploads/actions/validateSourceMapping'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:objectLocation] = object_location
      query_params[:filename] = filename
      query_params[:logSourceName] = log_source_name

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#validate_source_mapping') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::SourceMappingResponse'
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


    # Verify the accelerated saved search task specified by {scheduledTaskId}.
    # For internal use only.
    # Optionally specify whether to return accelerated search results; the default is false.
    # The ScheduledTask taskType must be ACCELERATION.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] scheduled_task_id Unique scheduledTask id returned from task create.
    #   If invalid will lead to a 404 not found.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [BOOLEAN] :should_include_results Optional parameter to specify whether to include acceleration results.
    #   Default value is false;
    #    (default to false)
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::VerifyOutput VerifyOutput}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/loganalytics/verify.rb.html) to see an example of how to use verify API.
    def verify(namespace_name, scheduled_task_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#verify.' if logger

      raise "Missing the required parameter 'namespace_name' when calling verify." if namespace_name.nil?
      raise "Missing the required parameter 'scheduled_task_id' when calling verify." if scheduled_task_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'scheduled_task_id' must not be blank" if OCI::Internal::Util.blank_string?(scheduled_task_id)

      path = '/namespaces/{namespaceName}/scheduledTasks/{scheduledTaskId}/actions/verify'.sub('{namespaceName}', namespace_name.to_s).sub('{scheduledTaskId}', scheduled_task_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:shouldIncludeResults] = opts[:should_include_results] if !opts[:should_include_results].nil?

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#verify') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::VerifyOutput'
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
