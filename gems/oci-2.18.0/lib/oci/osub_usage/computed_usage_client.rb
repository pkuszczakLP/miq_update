# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # OneSubscription API Common set of Subscription Plan Management (SPM) Usage Computation resources
  class OsubUsage::ComputedUsageClient
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


    # Creates a new ComputedUsageClient.
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
        @endpoint = endpoint + '/oalapp/service/onesubs/proxy/20210501'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "ComputedUsageClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://csaap-e.oracle.com') + '/oalapp/service/onesubs/proxy/20210501'
      logger.info "ComputedUsageClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # This is an API which returns Computed Usage corresponding to the id passed
    #
    # @param [String] computed_usage_id The Computed Usage Id
    # @param [String] compartment_id The OCID of the root compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Array<String>] :fields Partial response refers to an optimization technique offered
    #   by the RESTful web APIs to return only the information
    #   (fields) required by the client. This parameter is used to control what fields to
    #   return.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :x_one_origin_region The OCI home region name in case home region is not us-ashburn-1 (IAD), e.g. ap-mumbai-1, us-phoenix-1 etc.
    #
    # @return [Response] A Response object with data of type {OCI::OsubUsage::Models::ComputedUsage ComputedUsage}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osubusage/get_computed_usage.rb.html) to see an example of how to use get_computed_usage API.
    def get_computed_usage(computed_usage_id, compartment_id, opts = {})
      logger.debug 'Calling operation ComputedUsageClient#get_computed_usage.' if logger

      raise "Missing the required parameter 'computed_usage_id' when calling get_computed_usage." if computed_usage_id.nil?
      raise "Missing the required parameter 'compartment_id' when calling get_computed_usage." if compartment_id.nil?
      raise "Parameter value for 'computed_usage_id' must not be blank" if OCI::Internal::Util.blank_string?(computed_usage_id)

      path = '/computedUsages/{computedUsageId}'.sub('{computedUsageId}', computed_usage_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'x-one-origin-region'] = opts[:x_one_origin_region] if opts[:x_one_origin_region]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputedUsageClient#get_computed_usage') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::OsubUsage::Models::ComputedUsage'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # This is a collection API which returns a list of aggregated computed usage details (there can be multiple Parent Products under a given SubID each of which is represented under Subscription Service Line # in SPM).
    #
    # @param [String] compartment_id The OCID of the root compartment.
    # @param [String] subscription_id Subscription Id is an identifier associated to the service used for filter the Computed Usage in SPM.
    #
    # @param [DateTime] time_from Initial date to filter Computed Usage data in SPM. In the case of non aggregated data the time period between of fromDate and toDate , expressed in RFC 3339 timestamp format.
    #
    # @param [DateTime] time_to Final date to filter Computed Usage data in SPM, expressed in RFC 3339 timestamp format.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :parent_product Product part number for subscribed service line, called parent product.
    #
    # @option opts [String] :grouping Grouping criteria to use for aggregate the computed Usage, either hourly (`HOURLY`), daily (`DAILY`), monthly(`MONTHLY`) or none (`NONE`) to not follow a grouping criteria by date.
    #    (default to MONTHLY)
    #   Allowed values are: HOURLY, DAILY, MONTHLY, NONE
    # @option opts [Integer] :limit The maximum number aggregatedComputedUsages of items to return within the Subscription \"List\" call, this
    #   counts the overall count across all items
    #   Example: `500`
    #    (default to 1000)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :x_one_origin_region The OCI home region name in case home region is not us-ashburn-1 (IAD), e.g. ap-mumbai-1, us-phoenix-1 etc.
    #
    # @return [Response] A Response object with data of type Array<{OCI::OsubUsage::Models::ComputedUsageAggregatedSummary ComputedUsageAggregatedSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osubusage/list_computed_usage_aggregateds.rb.html) to see an example of how to use list_computed_usage_aggregateds API.
    def list_computed_usage_aggregateds(compartment_id, subscription_id, time_from, time_to, opts = {})
      logger.debug 'Calling operation ComputedUsageClient#list_computed_usage_aggregateds.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_computed_usage_aggregateds." if compartment_id.nil?
      raise "Missing the required parameter 'subscription_id' when calling list_computed_usage_aggregateds." if subscription_id.nil?
      raise "Missing the required parameter 'time_from' when calling list_computed_usage_aggregateds." if time_from.nil?
      raise "Missing the required parameter 'time_to' when calling list_computed_usage_aggregateds." if time_to.nil?

      if opts[:grouping] && !%w[HOURLY DAILY MONTHLY NONE].include?(opts[:grouping])
        raise 'Invalid value for "grouping", must be one of HOURLY, DAILY, MONTHLY, NONE.'
      end

      path = '/computedUsages/aggregated'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:subscriptionId] = subscription_id
      query_params[:timeFrom] = time_from
      query_params[:timeTo] = time_to
      query_params[:parentProduct] = opts[:parent_product] if opts[:parent_product]
      query_params[:grouping] = opts[:grouping] if opts[:grouping]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'x-one-origin-region'] = opts[:x_one_origin_region] if opts[:x_one_origin_region]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputedUsageClient#list_computed_usage_aggregateds') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::OsubUsage::Models::ComputedUsageAggregatedSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # This is a collection API which returns a list of Computed Usages for given filters.
    #
    # @param [String] compartment_id The OCID of the root compartment.
    # @param [String] subscription_id Subscription Id is an identifier associated to the service used for filter the Computed Usage in SPM.
    #
    # @param [DateTime] time_from Initial date to filter Computed Usage data in SPM. In the case of non aggregated data the time period between of fromDate and toDate , expressed in RFC 3339 timestamp format.
    #
    # @param [DateTime] time_to Final date to filter Computed Usage data in SPM, expressed in RFC 3339 timestamp format.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :parent_product Product part number for subscribed service line, called parent product.
    #
    # @option opts [String] :computed_product Product part number for Computed Usage .
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    #   Example: `500`
    #    (default to 1000)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #    (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. You can provide one sort order (`sortOrder`).
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, timeOfArrival, timeMeteredOn
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :x_one_origin_region The OCI home region name in case home region is not us-ashburn-1 (IAD), e.g. ap-mumbai-1, us-phoenix-1 etc.
    #
    # @return [Response] A Response object with data of type Array<{OCI::OsubUsage::Models::ComputedUsageSummary ComputedUsageSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osubusage/list_computed_usages.rb.html) to see an example of how to use list_computed_usages API.
    def list_computed_usages(compartment_id, subscription_id, time_from, time_to, opts = {})
      logger.debug 'Calling operation ComputedUsageClient#list_computed_usages.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_computed_usages." if compartment_id.nil?
      raise "Missing the required parameter 'subscription_id' when calling list_computed_usages." if subscription_id.nil?
      raise "Missing the required parameter 'time_from' when calling list_computed_usages." if time_from.nil?
      raise "Missing the required parameter 'time_to' when calling list_computed_usages." if time_to.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[timeCreated timeOfArrival timeMeteredOn].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, timeOfArrival, timeMeteredOn.'
      end

      path = '/computedUsages'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:subscriptionId] = subscription_id
      query_params[:timeFrom] = time_from
      query_params[:timeTo] = time_to
      query_params[:parentProduct] = opts[:parent_product] if opts[:parent_product]
      query_params[:computedProduct] = opts[:computed_product] if opts[:computed_product]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'x-one-origin-region'] = opts[:x_one_origin_region] if opts[:x_one_origin_region]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputedUsageClient#list_computed_usages') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::OsubUsage::Models::ComputedUsageSummary>'
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
