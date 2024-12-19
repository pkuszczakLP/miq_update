# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Use the Threat Intelligence API to view indicators of compromise and related items. For more information, see [Overview of Threat Intelligence](/Content/ThreatIntelligence/Concepts/threatintelligenceoverview.htm).
  class ThreatIntelligence::ThreatintelClient
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


    # Creates a new ThreatintelClient.
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
        @endpoint = endpoint + '/20210831'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "ThreatintelClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://api-threatintel.{region}.oci.{secondLevelDomain}') + '/20210831'
      logger.info "ThreatintelClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a detailed indicator by identifier
    # @param [String] indicator_id unique indicator identifier
    # @param [String] compartment_id The ID of the tenancy to use to filter results.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::ThreatIntelligence::Models::Indicator Indicator}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/threatintelligence/get_indicator.rb.html) to see an example of how to use get_indicator API.
    def get_indicator(indicator_id, compartment_id, opts = {})
      logger.debug 'Calling operation ThreatintelClient#get_indicator.' if logger

      raise "Missing the required parameter 'indicator_id' when calling get_indicator." if indicator_id.nil?
      raise "Missing the required parameter 'compartment_id' when calling get_indicator." if compartment_id.nil?
      raise "Parameter value for 'indicator_id' must not be blank" if OCI::Internal::Util.blank_string?(indicator_id)

      path = '/indicators/{indicatorId}'.sub('{indicatorId}', indicator_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ThreatintelClient#get_indicator') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ThreatIntelligence::Models::Indicator'
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


    # Get the current count of each indicator type.  Results can be sorted ASC or DESC by count.
    # @param [String] compartment_id The ID of the tenancy to use to filter results.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :sort_order The sort order to use, either 'ASC' or 'DESC'.
    # @return [Response] A Response object with data of type {OCI::ThreatIntelligence::Models::IndicatorCountCollection IndicatorCountCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/threatintelligence/list_indicator_counts.rb.html) to see an example of how to use list_indicator_counts API.
    def list_indicator_counts(compartment_id, opts = {})
      logger.debug 'Calling operation ThreatintelClient#list_indicator_counts.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_indicator_counts." if compartment_id.nil?

      if opts[:sort_order] && !OCI::ThreatIntelligence::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::ThreatIntelligence::Models::SORT_ORDER_ENUM.'
      end

      path = '/indicatorCounts'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ThreatintelClient#list_indicator_counts') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ThreatIntelligence::Models::IndicatorCountCollection'
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


    # Returns a list of IndicatorSummary objects.
    #
    # @param [String] compartment_id The ID of the tenancy to use to filter results.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Array<String>] :threat_type_name The result set will include indicators that have any of the provided threat types. To filter for multiple threat types repeat the query parameter.
    # @option opts [String] :type The indicator type of entities to be returned.
    # @option opts [String] :value The indicator value of entities to be returned.
    # @option opts [Integer] :confidence_greater_than_or_equal_to The minimum confidence score of entities to be returned.
    # @option opts [DateTime] :time_updated_greater_than_or_equal_to The oldest update time of entities to be returned.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page A token representing the position at which to start retrieving results. This must come from the `opc-next-page` header field of a previous response.
    # @option opts [String] :sort_order The sort order to use, either 'ASC' or 'DESC'.
    # @option opts [String] :sort_by The field to sort by. Only one field to sort by may be provided.
    #    (default to timeUpdated)
    #   Allowed values are: confidence, timeUpdated
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::ThreatIntelligence::Models::IndicatorSummaryCollection IndicatorSummaryCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/threatintelligence/list_indicators.rb.html) to see an example of how to use list_indicators API.
    def list_indicators(compartment_id, opts = {})
      logger.debug 'Calling operation ThreatintelClient#list_indicators.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_indicators." if compartment_id.nil?

      if opts[:type] && !OCI::ThreatIntelligence::Models::INDICATOR_TYPE_ENUM.include?(opts[:type])
        raise 'Invalid value for "type", must be one of the values in OCI::ThreatIntelligence::Models::INDICATOR_TYPE_ENUM.'
      end

      if opts[:sort_order] && !OCI::ThreatIntelligence::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::ThreatIntelligence::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[confidence timeUpdated].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of confidence, timeUpdated.'
      end

      path = '/indicators'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:threatTypeName] = OCI::ApiClient.build_collection_params(opts[:threat_type_name], :multi) if opts[:threat_type_name] && !opts[:threat_type_name].empty?
      query_params[:type] = opts[:type] if opts[:type]
      query_params[:value] = opts[:value] if opts[:value]
      query_params[:confidenceGreaterThanOrEqualTo] = opts[:confidence_greater_than_or_equal_to] if opts[:confidence_greater_than_or_equal_to]
      query_params[:timeUpdatedGreaterThanOrEqualTo] = opts[:time_updated_greater_than_or_equal_to] if opts[:time_updated_greater_than_or_equal_to]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ThreatintelClient#list_indicators') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ThreatIntelligence::Models::IndicatorSummaryCollection'
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


    # Gets a list of threat types that are available to use as parameters when querying indicators.
    # This is sorted by threat type name according to the sort order query param.
    #
    # @param [String] compartment_id The ID of the tenancy to use to filter results.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page A token representing the position at which to start retrieving results. This must come from the `opc-next-page` header field of a previous response.
    # @option opts [String] :sort_order The sort order to use, either 'ASC' or 'DESC'.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::ThreatIntelligence::Models::ThreatTypesCollection ThreatTypesCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/threatintelligence/list_threat_types.rb.html) to see an example of how to use list_threat_types API.
    def list_threat_types(compartment_id, opts = {})
      logger.debug 'Calling operation ThreatintelClient#list_threat_types.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_threat_types." if compartment_id.nil?

      if opts[:sort_order] && !OCI::ThreatIntelligence::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::ThreatIntelligence::Models::SORT_ORDER_ENUM.'
      end

      path = '/threatTypes'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ThreatintelClient#list_threat_types') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ThreatIntelligence::Models::ThreatTypesCollection'
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
