# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # API for the Web Application Acceleration service.
  # Use this API to manage regional Web App Acceleration policies such as Caching and Compression
  # for accelerating HTTP services.
  class Waa::WaaClient
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


    # Creates a new WaaClient.
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
        @endpoint = endpoint + '/20211230'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "WaaClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://waa.{region}.oci.{secondLevelDomain}') + '/20211230'
      logger.info "WaaClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Moves a Web App Acceleration resource from one compartment to another.
    # When provided, If-Match is checked against ETag values of the resource.
    #
    # @param [String] web_app_acceleration_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WebAppAcceleration.
    # @param [OCI::Waa::Models::ChangeWebAppAccelerationCompartmentDetails] change_web_app_acceleration_compartment_details The information to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource,
    #   set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/waa/change_web_app_acceleration_compartment.rb.html) to see an example of how to use change_web_app_acceleration_compartment API.
    def change_web_app_acceleration_compartment(web_app_acceleration_id, change_web_app_acceleration_compartment_details, opts = {})
      logger.debug 'Calling operation WaaClient#change_web_app_acceleration_compartment.' if logger

      raise "Missing the required parameter 'web_app_acceleration_id' when calling change_web_app_acceleration_compartment." if web_app_acceleration_id.nil?
      raise "Missing the required parameter 'change_web_app_acceleration_compartment_details' when calling change_web_app_acceleration_compartment." if change_web_app_acceleration_compartment_details.nil?
      raise "Parameter value for 'web_app_acceleration_id' must not be blank" if OCI::Internal::Util.blank_string?(web_app_acceleration_id)

      path = '/webAppAccelerations/{webAppAccelerationId}/actions/changeCompartment'.sub('{webAppAccelerationId}', web_app_acceleration_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_web_app_acceleration_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaaClient#change_web_app_acceleration_compartment') do
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


    # Moves a WebAppAccelerationfPolicy resource from one compartment to another.
    # When provided, If-Match is checked against ETag values of the resource.
    #
    # @param [String] web_app_acceleration_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WebAppAccelerationPolicy.
    # @param [OCI::Waa::Models::ChangeWebAppAccelerationPolicyCompartmentDetails] change_web_app_acceleration_policy_compartment_details The information to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource,
    #   set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/waa/change_web_app_acceleration_policy_compartment.rb.html) to see an example of how to use change_web_app_acceleration_policy_compartment API.
    def change_web_app_acceleration_policy_compartment(web_app_acceleration_policy_id, change_web_app_acceleration_policy_compartment_details, opts = {})
      logger.debug 'Calling operation WaaClient#change_web_app_acceleration_policy_compartment.' if logger

      raise "Missing the required parameter 'web_app_acceleration_policy_id' when calling change_web_app_acceleration_policy_compartment." if web_app_acceleration_policy_id.nil?
      raise "Missing the required parameter 'change_web_app_acceleration_policy_compartment_details' when calling change_web_app_acceleration_policy_compartment." if change_web_app_acceleration_policy_compartment_details.nil?
      raise "Parameter value for 'web_app_acceleration_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(web_app_acceleration_policy_id)

      path = '/webAppAccelerationPolicies/{webAppAccelerationPolicyId}/actions/changeCompartment'.sub('{webAppAccelerationPolicyId}', web_app_acceleration_policy_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_web_app_acceleration_policy_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaaClient#change_web_app_acceleration_policy_compartment') do
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


    # Creates a new WebAppAcceleration.
    #
    # @param [OCI::Waa::Models::CreateWebAppAccelerationDetails] create_web_app_acceleration_details Details for the new WebAppAcceleration.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::Waa::Models::WebAppAcceleration WebAppAcceleration}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/waa/create_web_app_acceleration.rb.html) to see an example of how to use create_web_app_acceleration API.
    def create_web_app_acceleration(create_web_app_acceleration_details, opts = {})
      logger.debug 'Calling operation WaaClient#create_web_app_acceleration.' if logger

      raise "Missing the required parameter 'create_web_app_acceleration_details' when calling create_web_app_acceleration." if create_web_app_acceleration_details.nil?

      path = '/webAppAccelerations'
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

      post_body = @api_client.object_to_http_body(create_web_app_acceleration_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaaClient#create_web_app_acceleration') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Waa::Models::WebAppAcceleration'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new WebAppAccelerationPolicy.
    #
    # @param [OCI::Waa::Models::CreateWebAppAccelerationPolicyDetails] create_web_app_acceleration_policy_details Details for the new WebAppAccelerationPolicy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::Waa::Models::WebAppAccelerationPolicy WebAppAccelerationPolicy}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/waa/create_web_app_acceleration_policy.rb.html) to see an example of how to use create_web_app_acceleration_policy API.
    def create_web_app_acceleration_policy(create_web_app_acceleration_policy_details, opts = {})
      logger.debug 'Calling operation WaaClient#create_web_app_acceleration_policy.' if logger

      raise "Missing the required parameter 'create_web_app_acceleration_policy_details' when calling create_web_app_acceleration_policy." if create_web_app_acceleration_policy_details.nil?

      path = '/webAppAccelerationPolicies'
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

      post_body = @api_client.object_to_http_body(create_web_app_acceleration_policy_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaaClient#create_web_app_acceleration_policy') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Waa::Models::WebAppAccelerationPolicy'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Deletes a WebAppAcceleration resource identified by the OCID.
    # @param [String] web_app_acceleration_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WebAppAcceleration.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource,
    #   set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/waa/delete_web_app_acceleration.rb.html) to see an example of how to use delete_web_app_acceleration API.
    def delete_web_app_acceleration(web_app_acceleration_id, opts = {})
      logger.debug 'Calling operation WaaClient#delete_web_app_acceleration.' if logger

      raise "Missing the required parameter 'web_app_acceleration_id' when calling delete_web_app_acceleration." if web_app_acceleration_id.nil?
      raise "Parameter value for 'web_app_acceleration_id' must not be blank" if OCI::Internal::Util.blank_string?(web_app_acceleration_id)

      path = '/webAppAccelerations/{webAppAccelerationId}'.sub('{webAppAccelerationId}', web_app_acceleration_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaaClient#delete_web_app_acceleration') do
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


    # Deletes a WebAppAccelerationPolicy resource identified by the OCID.
    # @param [String] web_app_acceleration_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WebAppAccelerationPolicy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource,
    #   set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/waa/delete_web_app_acceleration_policy.rb.html) to see an example of how to use delete_web_app_acceleration_policy API.
    def delete_web_app_acceleration_policy(web_app_acceleration_policy_id, opts = {})
      logger.debug 'Calling operation WaaClient#delete_web_app_acceleration_policy.' if logger

      raise "Missing the required parameter 'web_app_acceleration_policy_id' when calling delete_web_app_acceleration_policy." if web_app_acceleration_policy_id.nil?
      raise "Parameter value for 'web_app_acceleration_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(web_app_acceleration_policy_id)

      path = '/webAppAccelerationPolicies/{webAppAccelerationPolicyId}'.sub('{webAppAccelerationPolicyId}', web_app_acceleration_policy_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaaClient#delete_web_app_acceleration_policy') do
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


    # Gets a WebAppAcceleration by OCID.
    # @param [String] web_app_acceleration_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WebAppAcceleration.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::Waa::Models::WebAppAcceleration WebAppAcceleration}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/waa/get_web_app_acceleration.rb.html) to see an example of how to use get_web_app_acceleration API.
    def get_web_app_acceleration(web_app_acceleration_id, opts = {})
      logger.debug 'Calling operation WaaClient#get_web_app_acceleration.' if logger

      raise "Missing the required parameter 'web_app_acceleration_id' when calling get_web_app_acceleration." if web_app_acceleration_id.nil?
      raise "Parameter value for 'web_app_acceleration_id' must not be blank" if OCI::Internal::Util.blank_string?(web_app_acceleration_id)

      path = '/webAppAccelerations/{webAppAccelerationId}'.sub('{webAppAccelerationId}', web_app_acceleration_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaaClient#get_web_app_acceleration') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Waa::Models::WebAppAcceleration'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a WebAppAccelerationPolicy with the given OCID.
    # @param [String] web_app_acceleration_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WebAppAccelerationPolicy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::Waa::Models::WebAppAccelerationPolicy WebAppAccelerationPolicy}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/waa/get_web_app_acceleration_policy.rb.html) to see an example of how to use get_web_app_acceleration_policy API.
    def get_web_app_acceleration_policy(web_app_acceleration_policy_id, opts = {})
      logger.debug 'Calling operation WaaClient#get_web_app_acceleration_policy.' if logger

      raise "Missing the required parameter 'web_app_acceleration_policy_id' when calling get_web_app_acceleration_policy." if web_app_acceleration_policy_id.nil?
      raise "Parameter value for 'web_app_acceleration_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(web_app_acceleration_policy_id)

      path = '/webAppAccelerationPolicies/{webAppAccelerationPolicyId}'.sub('{webAppAccelerationPolicyId}', web_app_acceleration_policy_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaaClient#get_web_app_acceleration_policy') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Waa::Models::WebAppAccelerationPolicy'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of all WebAppAccelerationPolicies in a compartment.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Array<OCI::Waa::Models::OCI::Waa::Models::WebAppAccelerationPolicyLifecycleState>] :lifecycle_state A filter to return only resources that match the given lifecycleState.
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given.
    # @option opts [String] :id A filter to return only the WebAppAccelerationPolicy with the given [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @option opts [Integer] :limit The maximum number of items to return. (default to 100)
    # @option opts [String] :page A token representing the position at which to start retrieving results.
    #   This must come from the `opc-next-page` header field of a previous response.
    #
    # @option opts [String] :sort_order The sort order to use, either 'ASC' or 'DESC'.
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided.
    #   Default order for timeCreated is descending.
    #   Default order for displayName is ascending.
    #   If no value is specified timeCreated is default.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, displayName
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::Waa::Models::WebAppAccelerationPolicyCollection WebAppAccelerationPolicyCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/waa/list_web_app_acceleration_policies.rb.html) to see an example of how to use list_web_app_acceleration_policies API.
    def list_web_app_acceleration_policies(compartment_id, opts = {})
      logger.debug 'Calling operation WaaClient#list_web_app_acceleration_policies.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_web_app_acceleration_policies." if compartment_id.nil?

      if opts[:sort_order] && !OCI::Waa::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Waa::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end

      path = '/webAppAccelerationPolicies'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:lifecycleState] = OCI::ApiClient.build_collection_params(opts[:lifecycle_state], :multi) if opts[:lifecycle_state] && !opts[:lifecycle_state].empty?
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:id] = opts[:id] if opts[:id]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaaClient#list_web_app_acceleration_policies') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Waa::Models::WebAppAccelerationPolicyCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of all WebAppAccelerations in a compartment.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :id A filter to return only the WebAppAcceleration with the given [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @option opts [String] :web_app_acceleration_policy_id A filter to return only the WebAppAcceleration with the given
    #   [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of related WebAppAccelerationPolicy.
    #
    # @option opts [Array<OCI::Waa::Models::OCI::Waa::Models::WebAppAccelerationLifecycleState>] :lifecycle_state A filter to return only resources that match the given lifecycleState.
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 100)
    # @option opts [String] :page A token representing the position at which to start retrieving results.
    #   This must come from the `opc-next-page` header field of a previous response.
    #
    # @option opts [String] :sort_order The sort order to use, either 'ASC' or 'DESC'.
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided.
    #   Default order for timeCreated is descending.
    #   Default order for displayName is ascending.
    #   If no value is specified timeCreated is default.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, displayName
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::Waa::Models::WebAppAccelerationCollection WebAppAccelerationCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/waa/list_web_app_accelerations.rb.html) to see an example of how to use list_web_app_accelerations API.
    def list_web_app_accelerations(compartment_id, opts = {})
      logger.debug 'Calling operation WaaClient#list_web_app_accelerations.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_web_app_accelerations." if compartment_id.nil?

      if opts[:sort_order] && !OCI::Waa::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Waa::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end

      path = '/webAppAccelerations'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:id] = opts[:id] if opts[:id]
      query_params[:webAppAccelerationPolicyId] = opts[:web_app_acceleration_policy_id] if opts[:web_app_acceleration_policy_id]
      query_params[:lifecycleState] = OCI::ApiClient.build_collection_params(opts[:lifecycle_state], :multi) if opts[:lifecycle_state] && !opts[:lifecycle_state].empty?
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaaClient#list_web_app_accelerations') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Waa::Models::WebAppAccelerationCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Clears resources from the cache of the WebAppAcceleration. Each new request for a purged resource will be
    # forwarded to the origin server to fetch a new version of the resource.
    #
    # @param [String] web_app_acceleration_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WebAppAcceleration.
    # @param [OCI::Waa::Models::PurgeWebAppAccelerationCacheDetails] purge_web_app_acceleration_cache_details Options for the cache purge.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/waa/purge_web_app_acceleration_cache.rb.html) to see an example of how to use purge_web_app_acceleration_cache API.
    def purge_web_app_acceleration_cache(web_app_acceleration_id, purge_web_app_acceleration_cache_details, opts = {})
      logger.debug 'Calling operation WaaClient#purge_web_app_acceleration_cache.' if logger

      raise "Missing the required parameter 'web_app_acceleration_id' when calling purge_web_app_acceleration_cache." if web_app_acceleration_id.nil?
      raise "Missing the required parameter 'purge_web_app_acceleration_cache_details' when calling purge_web_app_acceleration_cache." if purge_web_app_acceleration_cache_details.nil?
      raise "Parameter value for 'web_app_acceleration_id' must not be blank" if OCI::Internal::Util.blank_string?(web_app_acceleration_id)

      path = '/webAppAccelerations/{webAppAccelerationId}/actions/purgeCache'.sub('{webAppAccelerationId}', web_app_acceleration_id.to_s)
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

      post_body = @api_client.object_to_http_body(purge_web_app_acceleration_cache_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaaClient#purge_web_app_acceleration_cache') do
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


    # Updates the WebAppAcceleration identified by the OCID.
    # @param [String] web_app_acceleration_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WebAppAcceleration.
    # @param [OCI::Waa::Models::UpdateWebAppAccelerationDetails] update_web_app_acceleration_details The information to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource,
    #   set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/waa/update_web_app_acceleration.rb.html) to see an example of how to use update_web_app_acceleration API.
    def update_web_app_acceleration(web_app_acceleration_id, update_web_app_acceleration_details, opts = {})
      logger.debug 'Calling operation WaaClient#update_web_app_acceleration.' if logger

      raise "Missing the required parameter 'web_app_acceleration_id' when calling update_web_app_acceleration." if web_app_acceleration_id.nil?
      raise "Missing the required parameter 'update_web_app_acceleration_details' when calling update_web_app_acceleration." if update_web_app_acceleration_details.nil?
      raise "Parameter value for 'web_app_acceleration_id' must not be blank" if OCI::Internal::Util.blank_string?(web_app_acceleration_id)

      path = '/webAppAccelerations/{webAppAccelerationId}'.sub('{webAppAccelerationId}', web_app_acceleration_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_web_app_acceleration_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaaClient#update_web_app_acceleration') do
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


    # Update the WebAppAccelerationPolicy identified by the OCID.
    # @param [String] web_app_acceleration_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WebAppAccelerationPolicy.
    # @param [OCI::Waa::Models::UpdateWebAppAccelerationPolicyDetails] update_web_app_acceleration_policy_details The information to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource,
    #   set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/waa/update_web_app_acceleration_policy.rb.html) to see an example of how to use update_web_app_acceleration_policy API.
    def update_web_app_acceleration_policy(web_app_acceleration_policy_id, update_web_app_acceleration_policy_details, opts = {})
      logger.debug 'Calling operation WaaClient#update_web_app_acceleration_policy.' if logger

      raise "Missing the required parameter 'web_app_acceleration_policy_id' when calling update_web_app_acceleration_policy." if web_app_acceleration_policy_id.nil?
      raise "Missing the required parameter 'update_web_app_acceleration_policy_details' when calling update_web_app_acceleration_policy." if update_web_app_acceleration_policy_details.nil?
      raise "Parameter value for 'web_app_acceleration_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(web_app_acceleration_policy_id)

      path = '/webAppAccelerationPolicies/{webAppAccelerationPolicyId}'.sub('{webAppAccelerationPolicyId}', web_app_acceleration_policy_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_web_app_acceleration_policy_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaaClient#update_web_app_acceleration_policy') do
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

    private

    def applicable_retry_config(opts = {})
      return @retry_config unless opts.key?(:retry_config)

      opts[:retry_config]
    end
  end
end
# rubocop:enable Lint/UnneededCopDisableDirective, Metrics/LineLength
