# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Use the Usage Proxy API to list Oracle Support Rewards, view related detailed usage information, and manage users who redeem rewards. For more information, see [Oracle Support Rewards Overview](/iaas/Content/Billing/Concepts/supportrewardsoverview.htm).
  class Usage::RewardsClient
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


    # Creates a new RewardsClient.
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
        @endpoint = endpoint + '/20190111'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "RewardsClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://identity.{region}.oci.{secondLevelDomain}') + '/20190111'
      logger.info "RewardsClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Adds the list of redeemable user email IDs for a subscription ID.
    #
    # @param [OCI::Usage::Models::CreateRedeemableUserDetails] create_redeemable_user_details CreateRedeemableUserDetails inforamtion.
    #
    # @param [String] tenancy_id The OCID of the tenancy.
    # @param [String] subscription_id The subscription ID for which rewards information is requested for.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :user_id The user ID of the person to send a copy of an email.
    # @option opts [String] :opc_request_id Unique, Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted, only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error, without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type {OCI::Usage::Models::RedeemableUserCollection RedeemableUserCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/usage/create_redeemable_user.rb.html) to see an example of how to use create_redeemable_user API.
    def create_redeemable_user(create_redeemable_user_details, tenancy_id, subscription_id, opts = {})
      logger.debug 'Calling operation RewardsClient#create_redeemable_user.' if logger

      raise "Missing the required parameter 'create_redeemable_user_details' when calling create_redeemable_user." if create_redeemable_user_details.nil?
      raise "Missing the required parameter 'tenancy_id' when calling create_redeemable_user." if tenancy_id.nil?
      raise "Missing the required parameter 'subscription_id' when calling create_redeemable_user." if subscription_id.nil?
      raise "Parameter value for 'subscription_id' must not be blank" if OCI::Internal::Util.blank_string?(subscription_id)

      path = '/subscriptions/{subscriptionId}/redeemableUsers'.sub('{subscriptionId}', subscription_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:tenancyId] = tenancy_id
      query_params[:userId] = opts[:user_id] if opts[:user_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_redeemable_user_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'RewardsClient#create_redeemable_user') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Usage::Models::RedeemableUserCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Deletes the list of redeemable user email IDs for a subscription ID.
    #
    # @param [String] email_id The email ID that needs to be deleted.
    # @param [String] tenancy_id The OCID of the tenancy.
    # @param [String] subscription_id The subscription ID for which rewards information is requested for.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique, Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted, only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/usage/delete_redeemable_user.rb.html) to see an example of how to use delete_redeemable_user API.
    def delete_redeemable_user(email_id, tenancy_id, subscription_id, opts = {})
      logger.debug 'Calling operation RewardsClient#delete_redeemable_user.' if logger

      raise "Missing the required parameter 'email_id' when calling delete_redeemable_user." if email_id.nil?
      raise "Missing the required parameter 'tenancy_id' when calling delete_redeemable_user." if tenancy_id.nil?
      raise "Missing the required parameter 'subscription_id' when calling delete_redeemable_user." if subscription_id.nil?
      raise "Parameter value for 'subscription_id' must not be blank" if OCI::Internal::Util.blank_string?(subscription_id)

      path = '/subscriptions/{subscriptionId}/redeemableUsers'.sub('{subscriptionId}', subscription_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:emailId] = email_id
      query_params[:tenancyId] = tenancy_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'RewardsClient#delete_redeemable_user') do
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


    # Provides product information that is specific to a reward usage period and its usage details.
    #
    # @param [String] tenancy_id The OCID of the tenancy.
    # @param [String] subscription_id The subscription ID for which rewards information is requested for.
    # @param [String] usage_period_key The SPM Identifier for the usage period.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique, Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String] :page The value of the 'opc-next-page' response header from the previous call.
    # @option opts [Integer] :limit The maximum number of items to return in the paginated response. (default to 50)
    # @option opts [String] :sort_order The sort order to use, which can be ascending (ASC) or descending (DESC). (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Supports one sort order. (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, TIMESTART
    # @option opts [String] :producttype The field to specify the type of product. (default to ALL)
    #   Allowed values are: ALL, ELIGIBLE, INELIGIBLE
    # @return [Response] A Response object with data of type {OCI::Usage::Models::ProductCollection ProductCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/usage/list_products.rb.html) to see an example of how to use list_products API.
    def list_products(tenancy_id, subscription_id, usage_period_key, opts = {})
      logger.debug 'Calling operation RewardsClient#list_products.' if logger

      raise "Missing the required parameter 'tenancy_id' when calling list_products." if tenancy_id.nil?
      raise "Missing the required parameter 'subscription_id' when calling list_products." if subscription_id.nil?
      raise "Missing the required parameter 'usage_period_key' when calling list_products." if usage_period_key.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIMECREATED TIMESTART].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, TIMESTART.'
      end

      if opts[:producttype] && !%w[ALL ELIGIBLE INELIGIBLE].include?(opts[:producttype])
        raise 'Invalid value for "producttype", must be one of ALL, ELIGIBLE, INELIGIBLE.'
      end
      raise "Parameter value for 'subscription_id' must not be blank" if OCI::Internal::Util.blank_string?(subscription_id)

      path = '/subscriptions/{subscriptionId}/products'.sub('{subscriptionId}', subscription_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:tenancyId] = tenancy_id
      query_params[:usagePeriodKey] = usage_period_key
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:producttype] = opts[:producttype] if opts[:producttype]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'RewardsClient#list_products') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Usage::Models::ProductCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Provides the email IDs of users that can redeem rewards for the given subscription ID.
    #
    # @param [String] tenancy_id The OCID of the tenancy.
    # @param [String] subscription_id The subscription ID for which rewards information is requested for.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique, Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String] :page The value of the 'opc-next-page' response header from the previous call.
    # @option opts [Integer] :limit The maximum number of items to return in the paginated response. (default to 50)
    # @option opts [String] :sort_order The sort order to use, which can be ascending (ASC) or descending (DESC). (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Supports one sort order. (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, TIMESTART
    # @return [Response] A Response object with data of type {OCI::Usage::Models::RedeemableUserCollection RedeemableUserCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/usage/list_redeemable_users.rb.html) to see an example of how to use list_redeemable_users API.
    def list_redeemable_users(tenancy_id, subscription_id, opts = {})
      logger.debug 'Calling operation RewardsClient#list_redeemable_users.' if logger

      raise "Missing the required parameter 'tenancy_id' when calling list_redeemable_users." if tenancy_id.nil?
      raise "Missing the required parameter 'subscription_id' when calling list_redeemable_users." if subscription_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIMECREATED TIMESTART].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, TIMESTART.'
      end
      raise "Parameter value for 'subscription_id' must not be blank" if OCI::Internal::Util.blank_string?(subscription_id)

      path = '/subscriptions/{subscriptionId}/redeemableUsers'.sub('{subscriptionId}', subscription_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:tenancyId] = tenancy_id
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'RewardsClient#list_redeemable_users') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Usage::Models::RedeemableUserCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns the list of rewards for a subscription ID.
    #
    # @param [String] tenancy_id The OCID of the tenancy.
    # @param [String] subscription_id The subscription ID for which rewards information is requested for.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique, Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Usage::Models::RewardCollection RewardCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/usage/list_rewards.rb.html) to see an example of how to use list_rewards API.
    def list_rewards(tenancy_id, subscription_id, opts = {})
      logger.debug 'Calling operation RewardsClient#list_rewards.' if logger

      raise "Missing the required parameter 'tenancy_id' when calling list_rewards." if tenancy_id.nil?
      raise "Missing the required parameter 'subscription_id' when calling list_rewards." if subscription_id.nil?
      raise "Parameter value for 'subscription_id' must not be blank" if OCI::Internal::Util.blank_string?(subscription_id)

      path = '/subscriptions/{subscriptionId}/rewards'.sub('{subscriptionId}', subscription_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:tenancyId] = tenancy_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'RewardsClient#list_rewards') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Usage::Models::RewardCollection'
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
