# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # This site describes all the Rest endpoints of OSP Gateway.
  class OspGateway::SubscriptionServiceClient
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


    # Creates a new SubscriptionServiceClient.
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
        @endpoint = endpoint + '/20191001'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "SubscriptionServiceClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://ospap.oracle.com') + '/20191001'
      logger.info "SubscriptionServiceClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # PSD2 authorization for subscription payment
    # @param [String] osp_home_region The home region's public name of the logged in user.
    #
    # @param [String] subscription_id Subscription id(OCID).
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    #
    # @param [OCI::OspGateway::Models::AuthorizeSubscriptionPaymentDetails] authorize_subscription_payment_details subscription payment request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_retry_token For requests that are not idempotent (creates being the main place of interest), THE APIs should take a header
    #   called opc-retry-token to identify the customer desire across requests, to introduce some level of idempotency.
    #
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::OspGateway::Models::AuthorizeSubscriptionPaymentReceipt AuthorizeSubscriptionPaymentReceipt}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/ospgateway/authorize_subscription_payment.rb.html) to see an example of how to use authorize_subscription_payment API.
    def authorize_subscription_payment(osp_home_region, subscription_id, compartment_id, authorize_subscription_payment_details, opts = {})
      logger.debug 'Calling operation SubscriptionServiceClient#authorize_subscription_payment.' if logger

      raise "Missing the required parameter 'osp_home_region' when calling authorize_subscription_payment." if osp_home_region.nil?
      raise "Missing the required parameter 'subscription_id' when calling authorize_subscription_payment." if subscription_id.nil?
      raise "Missing the required parameter 'compartment_id' when calling authorize_subscription_payment." if compartment_id.nil?
      raise "Missing the required parameter 'authorize_subscription_payment_details' when calling authorize_subscription_payment." if authorize_subscription_payment_details.nil?
      raise "Parameter value for 'subscription_id' must not be blank" if OCI::Internal::Util.blank_string?(subscription_id)

      path = '/subscriptions/{subscriptionId}/actions/psd2auth'.sub('{subscriptionId}', subscription_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:ospHomeRegion] = osp_home_region
      query_params[:compartmentId] = compartment_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(authorize_subscription_payment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'SubscriptionServiceClient#authorize_subscription_payment') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::OspGateway::Models::AuthorizeSubscriptionPaymentReceipt'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Get the subscription plan.
    # @param [String] subscription_id Subscription id(OCID).
    # @param [String] osp_home_region The home region's public name of the logged in user.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::OspGateway::Models::Subscription Subscription}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/ospgateway/get_subscription.rb.html) to see an example of how to use get_subscription API.
    def get_subscription(subscription_id, osp_home_region, compartment_id, opts = {})
      logger.debug 'Calling operation SubscriptionServiceClient#get_subscription.' if logger

      raise "Missing the required parameter 'subscription_id' when calling get_subscription." if subscription_id.nil?
      raise "Missing the required parameter 'osp_home_region' when calling get_subscription." if osp_home_region.nil?
      raise "Missing the required parameter 'compartment_id' when calling get_subscription." if compartment_id.nil?
      raise "Parameter value for 'subscription_id' must not be blank" if OCI::Internal::Util.blank_string?(subscription_id)

      path = '/subscriptions/{subscriptionId}'.sub('{subscriptionId}', subscription_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:ospHomeRegion] = osp_home_region
      query_params[:compartmentId] = compartment_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'SubscriptionServiceClient#get_subscription') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::OspGateway::Models::Subscription'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Get the subscription data for the compartment
    # @param [String] osp_home_region The home region's public name of the logged in user.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :page For list pagination. The value of the opc-next-page response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to return in a paginated \"List\" call.
    #    (default to 500)
    # @option opts [String] :sort_by The field to sort by. Only one field can be selected for sorting.
    #    (default to INVOICE_NO)
    #   Allowed values are: INVOICE_NO, REF_NO, STATUS, TYPE, INVOICE_DATE, DUE_DATE, PAYM_REF, TOTAL_AMOUNT, BALANCE_DUE
    # @option opts [String] :sort_order The sort order to use (ascending or descending).
    #    (default to ASC)
    #   Allowed values are: ASC, DESC
    # @return [Response] A Response object with data of type {OCI::OspGateway::Models::SubscriptionCollection SubscriptionCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/ospgateway/list_subscriptions.rb.html) to see an example of how to use list_subscriptions API.
    def list_subscriptions(osp_home_region, compartment_id, opts = {})
      logger.debug 'Calling operation SubscriptionServiceClient#list_subscriptions.' if logger

      raise "Missing the required parameter 'osp_home_region' when calling list_subscriptions." if osp_home_region.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_subscriptions." if compartment_id.nil?

      if opts[:sort_by] && !%w[INVOICE_NO REF_NO STATUS TYPE INVOICE_DATE DUE_DATE PAYM_REF TOTAL_AMOUNT BALANCE_DUE].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of INVOICE_NO, REF_NO, STATUS, TYPE, INVOICE_DATE, DUE_DATE, PAYM_REF, TOTAL_AMOUNT, BALANCE_DUE.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      path = '/subscriptions'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:ospHomeRegion] = osp_home_region
      query_params[:compartmentId] = compartment_id
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'SubscriptionServiceClient#list_subscriptions') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::OspGateway::Models::SubscriptionCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Pay a subscription
    # @param [String] osp_home_region The home region's public name of the logged in user.
    #
    # @param [String] subscription_id Subscription id(OCID).
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    #
    # @param [OCI::OspGateway::Models::PaySubscriptionDetails] pay_subscription_details subscription payment request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_retry_token For requests that are not idempotent (creates being the main place of interest), THE APIs should take a header
    #   called opc-retry-token to identify the customer desire across requests, to introduce some level of idempotency.
    #
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::OspGateway::Models::PaySubscriptionReceipt PaySubscriptionReceipt}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/ospgateway/pay_subscription.rb.html) to see an example of how to use pay_subscription API.
    def pay_subscription(osp_home_region, subscription_id, compartment_id, pay_subscription_details, opts = {})
      logger.debug 'Calling operation SubscriptionServiceClient#pay_subscription.' if logger

      raise "Missing the required parameter 'osp_home_region' when calling pay_subscription." if osp_home_region.nil?
      raise "Missing the required parameter 'subscription_id' when calling pay_subscription." if subscription_id.nil?
      raise "Missing the required parameter 'compartment_id' when calling pay_subscription." if compartment_id.nil?
      raise "Missing the required parameter 'pay_subscription_details' when calling pay_subscription." if pay_subscription_details.nil?
      raise "Parameter value for 'subscription_id' must not be blank" if OCI::Internal::Util.blank_string?(subscription_id)

      path = '/subscriptions/{subscriptionId}/actions/pay'.sub('{subscriptionId}', subscription_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:ospHomeRegion] = osp_home_region
      query_params[:compartmentId] = compartment_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(pay_subscription_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'SubscriptionServiceClient#pay_subscription') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::OspGateway::Models::PaySubscriptionReceipt'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Update plan of the subscription.
    # @param [String] subscription_id Subscription id(OCID).
    # @param [String] osp_home_region The home region's public name of the logged in user.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    #
    # @param [OCI::OspGateway::Models::UpdateSubscriptionDetails] update_subscription_details Subscription update request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::OspGateway::Models::Subscription Subscription}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/ospgateway/update_subscription.rb.html) to see an example of how to use update_subscription API.
    def update_subscription(subscription_id, osp_home_region, compartment_id, update_subscription_details, opts = {})
      logger.debug 'Calling operation SubscriptionServiceClient#update_subscription.' if logger

      raise "Missing the required parameter 'subscription_id' when calling update_subscription." if subscription_id.nil?
      raise "Missing the required parameter 'osp_home_region' when calling update_subscription." if osp_home_region.nil?
      raise "Missing the required parameter 'compartment_id' when calling update_subscription." if compartment_id.nil?
      raise "Missing the required parameter 'update_subscription_details' when calling update_subscription." if update_subscription_details.nil?
      raise "Parameter value for 'subscription_id' must not be blank" if OCI::Internal::Util.blank_string?(subscription_id)

      path = '/subscriptions/{subscriptionId}'.sub('{subscriptionId}', subscription_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:ospHomeRegion] = osp_home_region
      query_params[:compartmentId] = compartment_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_subscription_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'SubscriptionServiceClient#update_subscription') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::OspGateway::Models::Subscription'
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
