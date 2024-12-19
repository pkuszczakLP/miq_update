# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # This describes the network load balancer API.
  class NetworkLoadBalancer::NetworkLoadBalancerClient
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


    # Creates a new NetworkLoadBalancerClient.
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
        @endpoint = endpoint + '/20200501'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "NetworkLoadBalancerClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://network-load-balancer-api.{region}.oci.{secondLevelDomain}') + '/20200501'
      logger.info "NetworkLoadBalancerClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Moves a network load balancer into a different compartment within the same tenancy. For information about moving resources
    # between compartments, see [Moving Resources to a Different Compartment](https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/managingcompartments.htm#moveRes).
    #
    # @param [String] network_load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network load balancer to update.
    # @param [OCI::NetworkLoadBalancer::Models::ChangeNetworkLoadBalancerCompartmentDetails] change_network_load_balancer_compartment_details The configuration details for moving a network load balancer to a different compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you must contact Oracle about a
    #   particular request, then provide the request identifier.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so that it can be retried in case of a timeout or
    #   server error without risk of rerunning that same action. Retry tokens expire after 24
    #   hours but they can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the current etag value of the resource.
    #    (default to )
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/networkloadbalancer/change_network_load_balancer_compartment.rb.html) to see an example of how to use change_network_load_balancer_compartment API.
    def change_network_load_balancer_compartment(network_load_balancer_id, change_network_load_balancer_compartment_details, opts = {})
      logger.debug 'Calling operation NetworkLoadBalancerClient#change_network_load_balancer_compartment.' if logger

      raise "Missing the required parameter 'network_load_balancer_id' when calling change_network_load_balancer_compartment." if network_load_balancer_id.nil?
      raise "Missing the required parameter 'change_network_load_balancer_compartment_details' when calling change_network_load_balancer_compartment." if change_network_load_balancer_compartment_details.nil?
      raise "Parameter value for 'network_load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(network_load_balancer_id)

      path = '/networkLoadBalancers/{networkLoadBalancerId}/actions/changeCompartment'.sub('{networkLoadBalancerId}', network_load_balancer_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_network_load_balancer_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'NetworkLoadBalancerClient#change_network_load_balancer_compartment') do
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


    # Adds a backend server to a backend set.
    # @param [String] network_load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network load balancer to update.
    # @param [OCI::NetworkLoadBalancer::Models::CreateBackendDetails] create_backend_details The details to add a backend server to a backend set.
    # @param [String] backend_set_name The name of the backend set to which to add the backend server.
    #
    #   Example: `example_backend_set`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you must contact Oracle about a
    #   particular request, then provide the request identifier.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so that it can be retried in case of a timeout or
    #   server error without risk of rerunning that same action. Retry tokens expire after 24
    #   hours but they can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the current etag value of the resource.
    #    (default to )
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/networkloadbalancer/create_backend.rb.html) to see an example of how to use create_backend API.
    def create_backend(network_load_balancer_id, create_backend_details, backend_set_name, opts = {})
      logger.debug 'Calling operation NetworkLoadBalancerClient#create_backend.' if logger

      raise "Missing the required parameter 'network_load_balancer_id' when calling create_backend." if network_load_balancer_id.nil?
      raise "Missing the required parameter 'create_backend_details' when calling create_backend." if create_backend_details.nil?
      raise "Missing the required parameter 'backend_set_name' when calling create_backend." if backend_set_name.nil?
      raise "Parameter value for 'network_load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(network_load_balancer_id)
      raise "Parameter value for 'backend_set_name' must not be blank" if OCI::Internal::Util.blank_string?(backend_set_name)

      path = '/networkLoadBalancers/{networkLoadBalancerId}/backendSets/{backendSetName}/backends'.sub('{networkLoadBalancerId}', network_load_balancer_id.to_s).sub('{backendSetName}', backend_set_name.to_s)
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

      post_body = @api_client.object_to_http_body(create_backend_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'NetworkLoadBalancerClient#create_backend') do
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


    # Adds a backend set to a network load balancer.
    # @param [String] network_load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network load balancer to update.
    # @param [OCI::NetworkLoadBalancer::Models::CreateBackendSetDetails] create_backend_set_details The details for adding a backend set.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you must contact Oracle about a
    #   particular request, then provide the request identifier.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so that it can be retried in case of a timeout or
    #   server error without risk of rerunning that same action. Retry tokens expire after 24
    #   hours but they can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the current etag value of the resource.
    #    (default to )
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/networkloadbalancer/create_backend_set.rb.html) to see an example of how to use create_backend_set API.
    def create_backend_set(network_load_balancer_id, create_backend_set_details, opts = {})
      logger.debug 'Calling operation NetworkLoadBalancerClient#create_backend_set.' if logger

      raise "Missing the required parameter 'network_load_balancer_id' when calling create_backend_set." if network_load_balancer_id.nil?
      raise "Missing the required parameter 'create_backend_set_details' when calling create_backend_set." if create_backend_set_details.nil?
      raise "Parameter value for 'network_load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(network_load_balancer_id)

      path = '/networkLoadBalancers/{networkLoadBalancerId}/backendSets'.sub('{networkLoadBalancerId}', network_load_balancer_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_backend_set_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'NetworkLoadBalancerClient#create_backend_set') do
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


    # Adds a listener to a network load balancer.
    # @param [String] network_load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network load balancer to update.
    # @param [OCI::NetworkLoadBalancer::Models::CreateListenerDetails] create_listener_details Details to add a listener.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you must contact Oracle about a
    #   particular request, then provide the request identifier.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so that it can be retried in case of a timeout or
    #   server error without risk of rerunning that same action. Retry tokens expire after 24
    #   hours but they can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the current etag value of the resource.
    #    (default to )
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/networkloadbalancer/create_listener.rb.html) to see an example of how to use create_listener API.
    def create_listener(network_load_balancer_id, create_listener_details, opts = {})
      logger.debug 'Calling operation NetworkLoadBalancerClient#create_listener.' if logger

      raise "Missing the required parameter 'network_load_balancer_id' when calling create_listener." if network_load_balancer_id.nil?
      raise "Missing the required parameter 'create_listener_details' when calling create_listener." if create_listener_details.nil?
      raise "Parameter value for 'network_load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(network_load_balancer_id)

      path = '/networkLoadBalancers/{networkLoadBalancerId}/listeners'.sub('{networkLoadBalancerId}', network_load_balancer_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_listener_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'NetworkLoadBalancerClient#create_listener') do
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


    # Creates a network load balancer.
    #
    # @param [OCI::NetworkLoadBalancer::Models::CreateNetworkLoadBalancerDetails] create_network_load_balancer_details Details for the new network load balancer.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so that it can be retried in case of a timeout or
    #   server error without risk of rerunning that same action. Retry tokens expire after 24
    #   hours but they can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you must contact Oracle about a
    #   particular request, then provide the request identifier.
    #
    # @return [Response] A Response object with data of type {OCI::NetworkLoadBalancer::Models::NetworkLoadBalancer NetworkLoadBalancer}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/networkloadbalancer/create_network_load_balancer.rb.html) to see an example of how to use create_network_load_balancer API.
    def create_network_load_balancer(create_network_load_balancer_details, opts = {})
      logger.debug 'Calling operation NetworkLoadBalancerClient#create_network_load_balancer.' if logger

      raise "Missing the required parameter 'create_network_load_balancer_details' when calling create_network_load_balancer." if create_network_load_balancer_details.nil?

      path = '/networkLoadBalancers'
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

      post_body = @api_client.object_to_http_body(create_network_load_balancer_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'NetworkLoadBalancerClient#create_network_load_balancer') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::NetworkLoadBalancer::Models::NetworkLoadBalancer'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Removes a backend server from a given network load balancer and backend set.
    # @param [String] network_load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network load balancer to update.
    # @param [String] backend_set_name The name of the backend set associated with the backend server.
    #
    #   Example: `example_backend_set`
    #
    # @param [String] backend_name The name of the backend server to remove.
    #   If the backend was created with an explicitly specified name, that name should be used here.
    #   If the backend was created without explicitly specifying the name, but was created using ipAddress, this is specified as <ipAddress>:<port>.
    #   If the backend was created without explicitly specifying the name, but was created using targetId, this is specified as <targetId>:<port>.
    #
    #   Example: `10.0.0.3:8080` or `ocid1.privateip..oc1.<var>&lt;unique_ID&gt;</var>:8080`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you must contact Oracle about a
    #   particular request, then provide the request identifier.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the current etag value of the resource.
    #    (default to )
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/networkloadbalancer/delete_backend.rb.html) to see an example of how to use delete_backend API.
    def delete_backend(network_load_balancer_id, backend_set_name, backend_name, opts = {})
      logger.debug 'Calling operation NetworkLoadBalancerClient#delete_backend.' if logger

      raise "Missing the required parameter 'network_load_balancer_id' when calling delete_backend." if network_load_balancer_id.nil?
      raise "Missing the required parameter 'backend_set_name' when calling delete_backend." if backend_set_name.nil?
      raise "Missing the required parameter 'backend_name' when calling delete_backend." if backend_name.nil?
      raise "Parameter value for 'network_load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(network_load_balancer_id)
      raise "Parameter value for 'backend_set_name' must not be blank" if OCI::Internal::Util.blank_string?(backend_set_name)
      raise "Parameter value for 'backend_name' must not be blank" if OCI::Internal::Util.blank_string?(backend_name)

      path = '/networkLoadBalancers/{networkLoadBalancerId}/backendSets/{backendSetName}/backends/{backendName}'.sub('{networkLoadBalancerId}', network_load_balancer_id.to_s).sub('{backendSetName}', backend_set_name.to_s).sub('{backendName}', backend_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'NetworkLoadBalancerClient#delete_backend') do
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


    # Deletes the specified backend set. Note that deleting a backend set removes its backend servers from the network load balancer.
    #
    # Before you can delete a backend set, you must remove it from any active listeners.
    #
    # @param [String] network_load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network load balancer to update.
    # @param [String] backend_set_name The name of the backend set to delete.
    #
    #   Example: `example_backend_set`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you must contact Oracle about a
    #   particular request, then provide the request identifier.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the current etag value of the resource.
    #    (default to )
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/networkloadbalancer/delete_backend_set.rb.html) to see an example of how to use delete_backend_set API.
    def delete_backend_set(network_load_balancer_id, backend_set_name, opts = {})
      logger.debug 'Calling operation NetworkLoadBalancerClient#delete_backend_set.' if logger

      raise "Missing the required parameter 'network_load_balancer_id' when calling delete_backend_set." if network_load_balancer_id.nil?
      raise "Missing the required parameter 'backend_set_name' when calling delete_backend_set." if backend_set_name.nil?
      raise "Parameter value for 'network_load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(network_load_balancer_id)
      raise "Parameter value for 'backend_set_name' must not be blank" if OCI::Internal::Util.blank_string?(backend_set_name)

      path = '/networkLoadBalancers/{networkLoadBalancerId}/backendSets/{backendSetName}'.sub('{networkLoadBalancerId}', network_load_balancer_id.to_s).sub('{backendSetName}', backend_set_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'NetworkLoadBalancerClient#delete_backend_set') do
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


    # Deletes a listener from a network load balancer.
    # @param [String] network_load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network load balancer to update.
    # @param [String] listener_name The name of the listener to delete.
    #
    #   Example: `example_listener`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you must contact Oracle about a
    #   particular request, then provide the request identifier.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the current etag value of the resource.
    #    (default to )
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/networkloadbalancer/delete_listener.rb.html) to see an example of how to use delete_listener API.
    def delete_listener(network_load_balancer_id, listener_name, opts = {})
      logger.debug 'Calling operation NetworkLoadBalancerClient#delete_listener.' if logger

      raise "Missing the required parameter 'network_load_balancer_id' when calling delete_listener." if network_load_balancer_id.nil?
      raise "Missing the required parameter 'listener_name' when calling delete_listener." if listener_name.nil?
      raise "Parameter value for 'network_load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(network_load_balancer_id)
      raise "Parameter value for 'listener_name' must not be blank" if OCI::Internal::Util.blank_string?(listener_name)

      path = '/networkLoadBalancers/{networkLoadBalancerId}/listeners/{listenerName}'.sub('{networkLoadBalancerId}', network_load_balancer_id.to_s).sub('{listenerName}', listener_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'NetworkLoadBalancerClient#delete_listener') do
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


    # Deletes a network load balancer resource by identifier.
    # @param [String] network_load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network load balancer to update.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the current etag value of the resource.
    #    (default to )
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you must contact Oracle about a
    #   particular request, then provide the request identifier.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/networkloadbalancer/delete_network_load_balancer.rb.html) to see an example of how to use delete_network_load_balancer API.
    def delete_network_load_balancer(network_load_balancer_id, opts = {})
      logger.debug 'Calling operation NetworkLoadBalancerClient#delete_network_load_balancer.' if logger

      raise "Missing the required parameter 'network_load_balancer_id' when calling delete_network_load_balancer." if network_load_balancer_id.nil?
      raise "Parameter value for 'network_load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(network_load_balancer_id)

      path = '/networkLoadBalancers/{networkLoadBalancerId}'.sub('{networkLoadBalancerId}', network_load_balancer_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'NetworkLoadBalancerClient#delete_network_load_balancer') do
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


    # Retrieves the configuration information for the specified backend server.
    # @param [String] network_load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network load balancer to update.
    # @param [String] backend_set_name The name of the backend set that includes the backend server.
    #
    #   Example: `example_backend_set`
    #
    # @param [String] backend_name The name of the backend server to retrieve.
    #   If the backend was created with an explicitly specified name, that name should be used here.
    #   If the backend was created without explicitly specifying the name, but was created using ipAddress, this is specified as <ipAddress>:<port>.
    #   If the backend was created without explicitly specifying the name, but was created using targetId, this is specified as <targetId>:<port>.
    #
    #   Example: `10.0.0.3:8080` or `ocid1.privateip..oc1.<var>&lt;unique_ID&gt;</var>:8080`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you must contact Oracle about a
    #   particular request, then provide the request identifier.
    #
    # @option opts [String] :if_none_match The system returns the requested resource, with a 200 status, only if the resource has no etag
    #   matching the one specified. If the condition fails for the GET and HEAD methods, then the system returns the
    #   HTTP status code `304 (Not Modified)`.
    #
    #   Example: `example-etag`
    #    (default to )
    # @return [Response] A Response object with data of type {OCI::NetworkLoadBalancer::Models::Backend Backend}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/networkloadbalancer/get_backend.rb.html) to see an example of how to use get_backend API.
    def get_backend(network_load_balancer_id, backend_set_name, backend_name, opts = {})
      logger.debug 'Calling operation NetworkLoadBalancerClient#get_backend.' if logger

      raise "Missing the required parameter 'network_load_balancer_id' when calling get_backend." if network_load_balancer_id.nil?
      raise "Missing the required parameter 'backend_set_name' when calling get_backend." if backend_set_name.nil?
      raise "Missing the required parameter 'backend_name' when calling get_backend." if backend_name.nil?
      raise "Parameter value for 'network_load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(network_load_balancer_id)
      raise "Parameter value for 'backend_set_name' must not be blank" if OCI::Internal::Util.blank_string?(backend_set_name)
      raise "Parameter value for 'backend_name' must not be blank" if OCI::Internal::Util.blank_string?(backend_name)

      path = '/networkLoadBalancers/{networkLoadBalancerId}/backendSets/{backendSetName}/backends/{backendName}'.sub('{networkLoadBalancerId}', network_load_balancer_id.to_s).sub('{backendSetName}', backend_set_name.to_s).sub('{backendName}', backend_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'NetworkLoadBalancerClient#get_backend') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::NetworkLoadBalancer::Models::Backend'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Retrieves the current health status of the specified backend server.
    # @param [String] network_load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network load balancer to update.
    # @param [String] backend_set_name The name of the backend set associated with the backend server for which to retrieve the health status.
    #
    #   Example: `example_backend_set`
    #
    # @param [String] backend_name The name of the backend server to retrieve health status for.
    #   If the backend was created with an explicitly specified name, that name should be used here.
    #   If the backend was created without explicitly specifying the name, but was created using ipAddress, this is specified as <ipAddress>:<port>.
    #   If the backend was created without explicitly specifying the name, but was created using targetId, this is specified as <targetId>:<port>.
    #
    #   Example: `10.0.0.3:8080` or `ocid1.privateip..oc1.<var>&lt;unique_ID&gt;</var>:8080`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you must contact Oracle about a
    #   particular request, then provide the request identifier.
    #
    # @return [Response] A Response object with data of type {OCI::NetworkLoadBalancer::Models::BackendHealth BackendHealth}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/networkloadbalancer/get_backend_health.rb.html) to see an example of how to use get_backend_health API.
    def get_backend_health(network_load_balancer_id, backend_set_name, backend_name, opts = {})
      logger.debug 'Calling operation NetworkLoadBalancerClient#get_backend_health.' if logger

      raise "Missing the required parameter 'network_load_balancer_id' when calling get_backend_health." if network_load_balancer_id.nil?
      raise "Missing the required parameter 'backend_set_name' when calling get_backend_health." if backend_set_name.nil?
      raise "Missing the required parameter 'backend_name' when calling get_backend_health." if backend_name.nil?
      raise "Parameter value for 'network_load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(network_load_balancer_id)
      raise "Parameter value for 'backend_set_name' must not be blank" if OCI::Internal::Util.blank_string?(backend_set_name)
      raise "Parameter value for 'backend_name' must not be blank" if OCI::Internal::Util.blank_string?(backend_name)

      path = '/networkLoadBalancers/{networkLoadBalancerId}/backendSets/{backendSetName}/backends/{backendName}/health'.sub('{networkLoadBalancerId}', network_load_balancer_id.to_s).sub('{backendSetName}', backend_set_name.to_s).sub('{backendName}', backend_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'NetworkLoadBalancerClient#get_backend_health') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::NetworkLoadBalancer::Models::BackendHealth'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Retrieves the configuration information for the specified backend set.
    # @param [String] network_load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network load balancer to update.
    # @param [String] backend_set_name The name of the backend set to retrieve.
    #
    #   Example: `example_backend_set`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you must contact Oracle about a
    #   particular request, then provide the request identifier.
    #
    # @option opts [String] :if_none_match The system returns the requested resource, with a 200 status, only if the resource has no etag
    #   matching the one specified. If the condition fails for the GET and HEAD methods, then the system returns the
    #   HTTP status code `304 (Not Modified)`.
    #
    #   Example: `example-etag`
    #    (default to )
    # @return [Response] A Response object with data of type {OCI::NetworkLoadBalancer::Models::BackendSet BackendSet}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/networkloadbalancer/get_backend_set.rb.html) to see an example of how to use get_backend_set API.
    def get_backend_set(network_load_balancer_id, backend_set_name, opts = {})
      logger.debug 'Calling operation NetworkLoadBalancerClient#get_backend_set.' if logger

      raise "Missing the required parameter 'network_load_balancer_id' when calling get_backend_set." if network_load_balancer_id.nil?
      raise "Missing the required parameter 'backend_set_name' when calling get_backend_set." if backend_set_name.nil?
      raise "Parameter value for 'network_load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(network_load_balancer_id)
      raise "Parameter value for 'backend_set_name' must not be blank" if OCI::Internal::Util.blank_string?(backend_set_name)

      path = '/networkLoadBalancers/{networkLoadBalancerId}/backendSets/{backendSetName}'.sub('{networkLoadBalancerId}', network_load_balancer_id.to_s).sub('{backendSetName}', backend_set_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'NetworkLoadBalancerClient#get_backend_set') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::NetworkLoadBalancer::Models::BackendSet'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Retrieves the health status for the specified backend set.
    # @param [String] network_load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network load balancer to update.
    # @param [String] backend_set_name The name of the backend set for which to retrieve the health status.
    #
    #   Example: `example_backend_set`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you must contact Oracle about a
    #   particular request, then provide the request identifier.
    #
    # @return [Response] A Response object with data of type {OCI::NetworkLoadBalancer::Models::BackendSetHealth BackendSetHealth}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/networkloadbalancer/get_backend_set_health.rb.html) to see an example of how to use get_backend_set_health API.
    def get_backend_set_health(network_load_balancer_id, backend_set_name, opts = {})
      logger.debug 'Calling operation NetworkLoadBalancerClient#get_backend_set_health.' if logger

      raise "Missing the required parameter 'network_load_balancer_id' when calling get_backend_set_health." if network_load_balancer_id.nil?
      raise "Missing the required parameter 'backend_set_name' when calling get_backend_set_health." if backend_set_name.nil?
      raise "Parameter value for 'network_load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(network_load_balancer_id)
      raise "Parameter value for 'backend_set_name' must not be blank" if OCI::Internal::Util.blank_string?(backend_set_name)

      path = '/networkLoadBalancers/{networkLoadBalancerId}/backendSets/{backendSetName}/health'.sub('{networkLoadBalancerId}', network_load_balancer_id.to_s).sub('{backendSetName}', backend_set_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'NetworkLoadBalancerClient#get_backend_set_health') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::NetworkLoadBalancer::Models::BackendSetHealth'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Retrieves the health check policy information for a given network load balancer and backend set.
    # @param [String] network_load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network load balancer to update.
    # @param [String] backend_set_name The name of the backend set associated with the health check policy to be retrieved.
    #
    #   Example: `example_backend_set`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you must contact Oracle about a
    #   particular request, then provide the request identifier.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so that it can be retried in case of a timeout or
    #   server error without risk of rerunning that same action. Retry tokens expire after 24
    #   hours but they can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :if_none_match The system returns the requested resource, with a 200 status, only if the resource has no etag
    #   matching the one specified. If the condition fails for the GET and HEAD methods, then the system returns the
    #   HTTP status code `304 (Not Modified)`.
    #
    #   Example: `example-etag`
    #    (default to )
    # @return [Response] A Response object with data of type {OCI::NetworkLoadBalancer::Models::HealthChecker HealthChecker}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/networkloadbalancer/get_health_checker.rb.html) to see an example of how to use get_health_checker API.
    def get_health_checker(network_load_balancer_id, backend_set_name, opts = {})
      logger.debug 'Calling operation NetworkLoadBalancerClient#get_health_checker.' if logger

      raise "Missing the required parameter 'network_load_balancer_id' when calling get_health_checker." if network_load_balancer_id.nil?
      raise "Missing the required parameter 'backend_set_name' when calling get_health_checker." if backend_set_name.nil?
      raise "Parameter value for 'network_load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(network_load_balancer_id)
      raise "Parameter value for 'backend_set_name' must not be blank" if OCI::Internal::Util.blank_string?(backend_set_name)

      path = '/networkLoadBalancers/{networkLoadBalancerId}/backendSets/{backendSetName}/healthChecker'.sub('{networkLoadBalancerId}', network_load_balancer_id.to_s).sub('{backendSetName}', backend_set_name.to_s)
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
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'NetworkLoadBalancerClient#get_health_checker') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::NetworkLoadBalancer::Models::HealthChecker'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Retrieves listener properties associated with a given network load balancer and listener name.
    # @param [String] network_load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network load balancer to update.
    # @param [String] listener_name The name of the listener to get.
    #
    #   Example: `example_listener`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you must contact Oracle about a
    #   particular request, then provide the request identifier.
    #
    # @option opts [String] :if_none_match The system returns the requested resource, with a 200 status, only if the resource has no etag
    #   matching the one specified. If the condition fails for the GET and HEAD methods, then the system returns the
    #   HTTP status code `304 (Not Modified)`.
    #
    #   Example: `example-etag`
    #    (default to )
    # @return [Response] A Response object with data of type {OCI::NetworkLoadBalancer::Models::Listener Listener}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/networkloadbalancer/get_listener.rb.html) to see an example of how to use get_listener API.
    def get_listener(network_load_balancer_id, listener_name, opts = {})
      logger.debug 'Calling operation NetworkLoadBalancerClient#get_listener.' if logger

      raise "Missing the required parameter 'network_load_balancer_id' when calling get_listener." if network_load_balancer_id.nil?
      raise "Missing the required parameter 'listener_name' when calling get_listener." if listener_name.nil?
      raise "Parameter value for 'network_load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(network_load_balancer_id)
      raise "Parameter value for 'listener_name' must not be blank" if OCI::Internal::Util.blank_string?(listener_name)

      path = '/networkLoadBalancers/{networkLoadBalancerId}/listeners/{listenerName}'.sub('{networkLoadBalancerId}', network_load_balancer_id.to_s).sub('{listenerName}', listener_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'NetworkLoadBalancerClient#get_listener') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::NetworkLoadBalancer::Models::Listener'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Retrieves network load balancer configuration information by identifier.
    # @param [String] network_load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network load balancer to update.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_none_match The system returns the requested resource, with a 200 status, only if the resource has no etag
    #   matching the one specified. If the condition fails for the GET and HEAD methods, then the system returns the
    #   HTTP status code `304 (Not Modified)`.
    #
    #   Example: `example-etag`
    #    (default to )
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you must contact Oracle about a
    #   particular request, then provide the request identifier.
    #
    # @return [Response] A Response object with data of type {OCI::NetworkLoadBalancer::Models::NetworkLoadBalancer NetworkLoadBalancer}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/networkloadbalancer/get_network_load_balancer.rb.html) to see an example of how to use get_network_load_balancer API.
    def get_network_load_balancer(network_load_balancer_id, opts = {})
      logger.debug 'Calling operation NetworkLoadBalancerClient#get_network_load_balancer.' if logger

      raise "Missing the required parameter 'network_load_balancer_id' when calling get_network_load_balancer." if network_load_balancer_id.nil?
      raise "Parameter value for 'network_load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(network_load_balancer_id)

      path = '/networkLoadBalancers/{networkLoadBalancerId}'.sub('{networkLoadBalancerId}', network_load_balancer_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'NetworkLoadBalancerClient#get_network_load_balancer') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::NetworkLoadBalancer::Models::NetworkLoadBalancer'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Retrieves the health status for the specified network load balancer.
    # @param [String] network_load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network load balancer to update.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you must contact Oracle about a
    #   particular request, then provide the request identifier.
    #
    # @return [Response] A Response object with data of type {OCI::NetworkLoadBalancer::Models::NetworkLoadBalancerHealth NetworkLoadBalancerHealth}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/networkloadbalancer/get_network_load_balancer_health.rb.html) to see an example of how to use get_network_load_balancer_health API.
    def get_network_load_balancer_health(network_load_balancer_id, opts = {})
      logger.debug 'Calling operation NetworkLoadBalancerClient#get_network_load_balancer_health.' if logger

      raise "Missing the required parameter 'network_load_balancer_id' when calling get_network_load_balancer_health." if network_load_balancer_id.nil?
      raise "Parameter value for 'network_load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(network_load_balancer_id)

      path = '/networkLoadBalancers/{networkLoadBalancerId}/health'.sub('{networkLoadBalancerId}', network_load_balancer_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'NetworkLoadBalancerClient#get_network_load_balancer_health') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::NetworkLoadBalancer::Models::NetworkLoadBalancerHealth'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Retrieves the details of the work request with the given identifier.
    # @param [String] work_request_id The identifier of the asynchronous request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you must contact Oracle about a
    #   particular request, then provide the request identifier.
    #
    # @return [Response] A Response object with data of type {OCI::NetworkLoadBalancer::Models::WorkRequest WorkRequest}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/networkloadbalancer/get_work_request.rb.html) to see an example of how to use get_work_request API.
    def get_work_request(work_request_id, opts = {})
      logger.debug 'Calling operation NetworkLoadBalancerClient#get_work_request.' if logger

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'NetworkLoadBalancerClient#get_work_request') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::NetworkLoadBalancer::Models::WorkRequest'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists all backend sets associated with a given network load balancer.
    # @param [String] network_load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network load balancer to update.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you must contact Oracle about a
    #   particular request, then provide the request identifier.
    #
    # @option opts [String] :if_none_match The system returns the requested resource, with a 200 status, only if the resource has no etag
    #   matching the one specified. If the condition fails for the GET and HEAD methods, then the system returns the
    #   HTTP status code `304 (Not Modified)`.
    #
    #   Example: `example-etag`
    #    (default to )
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page or items to return, in a paginated \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #    (default to 10)
    # @option opts [String] :page The page token representing the page from which to start retrieving results.
    #   For list pagination. The value of the `opc-next-page` response header from the previous \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :sort_order The sort order to use, either 'asc' (ascending) or 'desc' (descending). (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order can be provided. The default order for timeCreated is descending.
    #   The default order for displayName is ascending. If no value is specified, then timeCreated is the default.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, displayName
    # @return [Response] A Response object with data of type {OCI::NetworkLoadBalancer::Models::BackendSetCollection BackendSetCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/networkloadbalancer/list_backend_sets.rb.html) to see an example of how to use list_backend_sets API.
    def list_backend_sets(network_load_balancer_id, opts = {})
      logger.debug 'Calling operation NetworkLoadBalancerClient#list_backend_sets.' if logger

      raise "Missing the required parameter 'network_load_balancer_id' when calling list_backend_sets." if network_load_balancer_id.nil?

      if opts[:sort_order] && !OCI::NetworkLoadBalancer::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::NetworkLoadBalancer::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end
      raise "Parameter value for 'network_load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(network_load_balancer_id)

      path = '/networkLoadBalancers/{networkLoadBalancerId}/backendSets'.sub('{networkLoadBalancerId}', network_load_balancer_id.to_s)
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
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'NetworkLoadBalancerClient#list_backend_sets') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::NetworkLoadBalancer::Models::BackendSetCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the backend servers for a given network load balancer and backend set.
    # @param [String] network_load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network load balancer to update.
    # @param [String] backend_set_name The name of the backend set associated with the backend servers.
    #
    #   Example: `example_backend_set`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you must contact Oracle about a
    #   particular request, then provide the request identifier.
    #
    # @option opts [String] :if_none_match The system returns the requested resource, with a 200 status, only if the resource has no etag
    #   matching the one specified. If the condition fails for the GET and HEAD methods, then the system returns the
    #   HTTP status code `304 (Not Modified)`.
    #
    #   Example: `example-etag`
    #    (default to )
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page or items to return, in a paginated \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #    (default to 10)
    # @option opts [String] :page The page token representing the page from which to start retrieving results.
    #   For list pagination. The value of the `opc-next-page` response header from the previous \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :sort_order The sort order to use, either 'asc' (ascending) or 'desc' (descending). (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order can be provided. The default order for timeCreated is descending.
    #   The default order for displayName is ascending. If no value is specified, then timeCreated is the default.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, displayName
    # @return [Response] A Response object with data of type {OCI::NetworkLoadBalancer::Models::BackendCollection BackendCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/networkloadbalancer/list_backends.rb.html) to see an example of how to use list_backends API.
    def list_backends(network_load_balancer_id, backend_set_name, opts = {})
      logger.debug 'Calling operation NetworkLoadBalancerClient#list_backends.' if logger

      raise "Missing the required parameter 'network_load_balancer_id' when calling list_backends." if network_load_balancer_id.nil?
      raise "Missing the required parameter 'backend_set_name' when calling list_backends." if backend_set_name.nil?

      if opts[:sort_order] && !OCI::NetworkLoadBalancer::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::NetworkLoadBalancer::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end
      raise "Parameter value for 'network_load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(network_load_balancer_id)
      raise "Parameter value for 'backend_set_name' must not be blank" if OCI::Internal::Util.blank_string?(backend_set_name)

      path = '/networkLoadBalancers/{networkLoadBalancerId}/backendSets/{backendSetName}/backends'.sub('{networkLoadBalancerId}', network_load_balancer_id.to_s).sub('{backendSetName}', backend_set_name.to_s)
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
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'NetworkLoadBalancerClient#list_backends') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::NetworkLoadBalancer::Models::BackendCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists all listeners associated with a given network load balancer.
    # @param [String] network_load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network load balancer to update.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you must contact Oracle about a
    #   particular request, then provide the request identifier.
    #
    # @option opts [String] :if_none_match The system returns the requested resource, with a 200 status, only if the resource has no etag
    #   matching the one specified. If the condition fails for the GET and HEAD methods, then the system returns the
    #   HTTP status code `304 (Not Modified)`.
    #
    #   Example: `example-etag`
    #    (default to )
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page or items to return, in a paginated \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #    (default to 10)
    # @option opts [String] :page The page token representing the page from which to start retrieving results.
    #   For list pagination. The value of the `opc-next-page` response header from the previous \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :sort_order The sort order to use, either 'asc' (ascending) or 'desc' (descending). (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order can be provided. The default order for timeCreated is descending.
    #   The default order for displayName is ascending. If no value is specified, then timeCreated is the default.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, displayName
    # @return [Response] A Response object with data of type {OCI::NetworkLoadBalancer::Models::ListenerCollection ListenerCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/networkloadbalancer/list_listeners.rb.html) to see an example of how to use list_listeners API.
    def list_listeners(network_load_balancer_id, opts = {})
      logger.debug 'Calling operation NetworkLoadBalancerClient#list_listeners.' if logger

      raise "Missing the required parameter 'network_load_balancer_id' when calling list_listeners." if network_load_balancer_id.nil?

      if opts[:sort_order] && !OCI::NetworkLoadBalancer::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::NetworkLoadBalancer::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end
      raise "Parameter value for 'network_load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(network_load_balancer_id)

      path = '/networkLoadBalancers/{networkLoadBalancerId}/listeners'.sub('{networkLoadBalancerId}', network_load_balancer_id.to_s)
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
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'NetworkLoadBalancerClient#list_listeners') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::NetworkLoadBalancer::Models::ListenerCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the summary health statuses for all network load balancers in the specified compartment.
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment containing the network load balancers to list.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :sort_order The sort order to use, either 'asc' (ascending) or 'desc' (descending). (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order can be provided. The default order for timeCreated is descending.
    #   The default order for displayName is ascending. If no value is specified, then timeCreated is the default.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, displayName
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you must contact Oracle about a
    #   particular request, then provide the request identifier.
    #
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page or items to return, in a paginated \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #    (default to 10)
    # @option opts [String] :page The page token representing the page from which to start retrieving results.
    #   For list pagination. The value of the `opc-next-page` response header from the previous \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @return [Response] A Response object with data of type {OCI::NetworkLoadBalancer::Models::NetworkLoadBalancerHealthCollection NetworkLoadBalancerHealthCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/networkloadbalancer/list_network_load_balancer_healths.rb.html) to see an example of how to use list_network_load_balancer_healths API.
    def list_network_load_balancer_healths(compartment_id, opts = {})
      logger.debug 'Calling operation NetworkLoadBalancerClient#list_network_load_balancer_healths.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_network_load_balancer_healths." if compartment_id.nil?

      if opts[:sort_order] && !OCI::NetworkLoadBalancer::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::NetworkLoadBalancer::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end

      path = '/networkLoadBalancers/health'
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
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'NetworkLoadBalancerClient#list_network_load_balancer_healths') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::NetworkLoadBalancer::Models::NetworkLoadBalancerHealthCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of network load balancers.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment containing the network load balancers to list.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :lifecycle_state A filter to return only resources that match the given lifecycle state.
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given.
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page or items to return, in a paginated \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #    (default to 10)
    # @option opts [String] :page The page token representing the page from which to start retrieving results.
    #   For list pagination. The value of the `opc-next-page` response header from the previous \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :sort_order The sort order to use, either 'asc' (ascending) or 'desc' (descending). (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order can be provided. The default order for timeCreated is descending.
    #   The default order for displayName is ascending. If no value is specified, then timeCreated is the default.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, displayName
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you must contact Oracle about a
    #   particular request, then provide the request identifier.
    #
    # @return [Response] A Response object with data of type {OCI::NetworkLoadBalancer::Models::NetworkLoadBalancerCollection NetworkLoadBalancerCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/networkloadbalancer/list_network_load_balancers.rb.html) to see an example of how to use list_network_load_balancers API.
    def list_network_load_balancers(compartment_id, opts = {})
      logger.debug 'Calling operation NetworkLoadBalancerClient#list_network_load_balancers.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_network_load_balancers." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::NetworkLoadBalancer::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::NetworkLoadBalancer::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !OCI::NetworkLoadBalancer::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::NetworkLoadBalancer::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end

      path = '/networkLoadBalancers'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'NetworkLoadBalancerClient#list_network_load_balancers') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::NetworkLoadBalancer::Models::NetworkLoadBalancerCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the available network load balancer policies.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you must contact Oracle about a
    #   particular request, then provide the request identifier.
    #
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page or items to return, in a paginated \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #    (default to 10)
    # @option opts [String] :page The page token representing the page from which to start retrieving results.
    #   For list pagination. The value of the `opc-next-page` response header from the previous \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :sort_order The sort order to use, either 'asc' (ascending) or 'desc' (descending). (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order can be provided. The default order for timeCreated is descending.
    #   The default order for displayName is ascending. If no value is specified, then timeCreated is the default.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, displayName
    # @return [Response] A Response object with data of type {OCI::NetworkLoadBalancer::Models::NetworkLoadBalancersPolicyCollection NetworkLoadBalancersPolicyCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/networkloadbalancer/list_network_load_balancers_policies.rb.html) to see an example of how to use list_network_load_balancers_policies API.
    def list_network_load_balancers_policies(opts = {})
      logger.debug 'Calling operation NetworkLoadBalancerClient#list_network_load_balancers_policies.' if logger


      if opts[:sort_order] && !OCI::NetworkLoadBalancer::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::NetworkLoadBalancer::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end

      path = '/networkLoadBalancersPolicies'
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
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'NetworkLoadBalancerClient#list_network_load_balancers_policies') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::NetworkLoadBalancer::Models::NetworkLoadBalancersPolicyCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # This API has been deprecated so it won't return the updated list of supported protocls.
    # Lists all supported traffic protocols.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you must contact Oracle about a
    #   particular request, then provide the request identifier.
    #
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page or items to return, in a paginated \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #    (default to 10)
    # @option opts [String] :page The page token representing the page from which to start retrieving results.
    #   For list pagination. The value of the `opc-next-page` response header from the previous \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :sort_order The sort order to use, either 'asc' (ascending) or 'desc' (descending). (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order can be provided. The default order for timeCreated is descending.
    #   The default order for displayName is ascending. If no value is specified, then timeCreated is the default.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, displayName
    # @return [Response] A Response object with data of type {OCI::NetworkLoadBalancer::Models::NetworkLoadBalancersProtocolCollection NetworkLoadBalancersProtocolCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/networkloadbalancer/list_network_load_balancers_protocols.rb.html) to see an example of how to use list_network_load_balancers_protocols API.
    def list_network_load_balancers_protocols(opts = {})
      logger.debug 'Calling operation NetworkLoadBalancerClient#list_network_load_balancers_protocols.' if logger


      if opts[:sort_order] && !OCI::NetworkLoadBalancer::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::NetworkLoadBalancer::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end

      path = '/networkLoadBalancersProtocols'
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
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'NetworkLoadBalancerClient#list_network_load_balancers_protocols') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::NetworkLoadBalancer::Models::NetworkLoadBalancersProtocolCollection'
        )
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
    # @param [String] work_request_id The identifier of the asynchronous request.
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment containing the network load balancers to list.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you must contact Oracle about a
    #   particular request, then provide the request identifier.
    #
    # @option opts [String] :page The page token representing the page from which to start retrieving results.
    #   For list pagination. The value of the `opc-next-page` response header from the previous \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page or items to return, in a paginated \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #    (default to 10)
    # @return [Response] A Response object with data of type {OCI::NetworkLoadBalancer::Models::WorkRequestErrorCollection WorkRequestErrorCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/networkloadbalancer/list_work_request_errors.rb.html) to see an example of how to use list_work_request_errors API.
    def list_work_request_errors(work_request_id, compartment_id, opts = {})
      logger.debug 'Calling operation NetworkLoadBalancerClient#list_work_request_errors.' if logger

      raise "Missing the required parameter 'work_request_id' when calling list_work_request_errors." if work_request_id.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_work_request_errors." if compartment_id.nil?
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/workRequests/{workRequestId}/errors'.sub('{workRequestId}', work_request_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'NetworkLoadBalancerClient#list_work_request_errors') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::NetworkLoadBalancer::Models::WorkRequestErrorCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a (paginated) list of logs for a given work request.
    #
    # @param [String] work_request_id The identifier of the asynchronous request.
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment containing the network load balancers to list.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you must contact Oracle about a
    #   particular request, then provide the request identifier.
    #
    # @option opts [String] :page The page token representing the page from which to start retrieving results.
    #   For list pagination. The value of the `opc-next-page` response header from the previous \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page or items to return, in a paginated \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #    (default to 10)
    # @return [Response] A Response object with data of type {OCI::NetworkLoadBalancer::Models::WorkRequestLogEntryCollection WorkRequestLogEntryCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/networkloadbalancer/list_work_request_logs.rb.html) to see an example of how to use list_work_request_logs API.
    def list_work_request_logs(work_request_id, compartment_id, opts = {})
      logger.debug 'Calling operation NetworkLoadBalancerClient#list_work_request_logs.' if logger

      raise "Missing the required parameter 'work_request_id' when calling list_work_request_logs." if work_request_id.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_work_request_logs." if compartment_id.nil?
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/workRequests/{workRequestId}/logs'.sub('{workRequestId}', work_request_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'NetworkLoadBalancerClient#list_work_request_logs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::NetworkLoadBalancer::Models::WorkRequestLogEntryCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists all work requests.
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment containing the network load balancers to list.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you must contact Oracle about a
    #   particular request, then provide the request identifier.
    #
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page or items to return, in a paginated \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #    (default to 10)
    # @option opts [String] :page The page token representing the page from which to start retrieving results.
    #   For list pagination. The value of the `opc-next-page` response header from the previous \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @return [Response] A Response object with data of type {OCI::NetworkLoadBalancer::Models::WorkRequestCollection WorkRequestCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/networkloadbalancer/list_work_requests.rb.html) to see an example of how to use list_work_requests API.
    def list_work_requests(compartment_id, opts = {})
      logger.debug 'Calling operation NetworkLoadBalancerClient#list_work_requests.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_work_requests." if compartment_id.nil?

      path = '/workRequests'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'NetworkLoadBalancerClient#list_work_requests') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::NetworkLoadBalancer::Models::WorkRequestCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the configuration of a backend server within the specified backend set.
    # @param [String] network_load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network load balancer to update.
    # @param [OCI::NetworkLoadBalancer::Models::UpdateBackendDetails] update_backend_details Details for updating a backend server.
    # @param [String] backend_set_name The name of the backend set associated with the backend server.
    #
    #   Example: `example_backend_set`
    #
    # @param [String] backend_name The name of the backend server to update.
    #   If the backend was created with an explicitly specified name, that name should be used here.
    #   If the backend was created without explicitly specifying the name, but was created using ipAddress, this is specified as <ipAddress>:<port>.
    #   If the backend was created without explicitly specifying the name, but was created using targetId, this is specified as <targetId>:<port>.
    #
    #   Example: `10.0.0.3:8080` or `ocid1.privateip..oc1.<var>&lt;unique_ID&gt;</var>:8080`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you must contact Oracle about a
    #   particular request, then provide the request identifier.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so that it can be retried in case of a timeout or
    #   server error without risk of rerunning that same action. Retry tokens expire after 24
    #   hours but they can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the current etag value of the resource.
    #    (default to )
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/networkloadbalancer/update_backend.rb.html) to see an example of how to use update_backend API.
    def update_backend(network_load_balancer_id, update_backend_details, backend_set_name, backend_name, opts = {})
      logger.debug 'Calling operation NetworkLoadBalancerClient#update_backend.' if logger

      raise "Missing the required parameter 'network_load_balancer_id' when calling update_backend." if network_load_balancer_id.nil?
      raise "Missing the required parameter 'update_backend_details' when calling update_backend." if update_backend_details.nil?
      raise "Missing the required parameter 'backend_set_name' when calling update_backend." if backend_set_name.nil?
      raise "Missing the required parameter 'backend_name' when calling update_backend." if backend_name.nil?
      raise "Parameter value for 'network_load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(network_load_balancer_id)
      raise "Parameter value for 'backend_set_name' must not be blank" if OCI::Internal::Util.blank_string?(backend_set_name)
      raise "Parameter value for 'backend_name' must not be blank" if OCI::Internal::Util.blank_string?(backend_name)

      path = '/networkLoadBalancers/{networkLoadBalancerId}/backendSets/{backendSetName}/backends/{backendName}'.sub('{networkLoadBalancerId}', network_load_balancer_id.to_s).sub('{backendSetName}', backend_set_name.to_s).sub('{backendName}', backend_name.to_s)
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

      post_body = @api_client.object_to_http_body(update_backend_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'NetworkLoadBalancerClient#update_backend') do
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


    # Updates a backend set.
    # @param [String] network_load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network load balancer to update.
    # @param [OCI::NetworkLoadBalancer::Models::UpdateBackendSetDetails] update_backend_set_details The details to update a backend set.
    # @param [String] backend_set_name The name of the backend set to update.
    #
    #   Example: `example_backend_set`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you must contact Oracle about a
    #   particular request, then provide the request identifier.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so that it can be retried in case of a timeout or
    #   server error without risk of rerunning that same action. Retry tokens expire after 24
    #   hours but they can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the current etag value of the resource.
    #    (default to )
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/networkloadbalancer/update_backend_set.rb.html) to see an example of how to use update_backend_set API.
    def update_backend_set(network_load_balancer_id, update_backend_set_details, backend_set_name, opts = {})
      logger.debug 'Calling operation NetworkLoadBalancerClient#update_backend_set.' if logger

      raise "Missing the required parameter 'network_load_balancer_id' when calling update_backend_set." if network_load_balancer_id.nil?
      raise "Missing the required parameter 'update_backend_set_details' when calling update_backend_set." if update_backend_set_details.nil?
      raise "Missing the required parameter 'backend_set_name' when calling update_backend_set." if backend_set_name.nil?
      raise "Parameter value for 'network_load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(network_load_balancer_id)
      raise "Parameter value for 'backend_set_name' must not be blank" if OCI::Internal::Util.blank_string?(backend_set_name)

      path = '/networkLoadBalancers/{networkLoadBalancerId}/backendSets/{backendSetName}'.sub('{networkLoadBalancerId}', network_load_balancer_id.to_s).sub('{backendSetName}', backend_set_name.to_s)
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

      post_body = @api_client.object_to_http_body(update_backend_set_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'NetworkLoadBalancerClient#update_backend_set') do
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


    # Updates the health check policy for a given network load balancer and backend set.
    # @param [String] network_load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network load balancer to update.
    # @param [OCI::NetworkLoadBalancer::Models::UpdateHealthCheckerDetails] update_health_checker_details The health check policy configuration details.
    # @param [String] backend_set_name The name of the backend set associated with the health check policy to be retrieved.
    #
    #   Example: `example_backend_set`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you must contact Oracle about a
    #   particular request, then provide the request identifier.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so that it can be retried in case of a timeout or
    #   server error without risk of rerunning that same action. Retry tokens expire after 24
    #   hours but they can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the current etag value of the resource.
    #    (default to )
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/networkloadbalancer/update_health_checker.rb.html) to see an example of how to use update_health_checker API.
    def update_health_checker(network_load_balancer_id, update_health_checker_details, backend_set_name, opts = {})
      logger.debug 'Calling operation NetworkLoadBalancerClient#update_health_checker.' if logger

      raise "Missing the required parameter 'network_load_balancer_id' when calling update_health_checker." if network_load_balancer_id.nil?
      raise "Missing the required parameter 'update_health_checker_details' when calling update_health_checker." if update_health_checker_details.nil?
      raise "Missing the required parameter 'backend_set_name' when calling update_health_checker." if backend_set_name.nil?
      raise "Parameter value for 'network_load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(network_load_balancer_id)
      raise "Parameter value for 'backend_set_name' must not be blank" if OCI::Internal::Util.blank_string?(backend_set_name)

      path = '/networkLoadBalancers/{networkLoadBalancerId}/backendSets/{backendSetName}/healthChecker'.sub('{networkLoadBalancerId}', network_load_balancer_id.to_s).sub('{backendSetName}', backend_set_name.to_s)
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

      post_body = @api_client.object_to_http_body(update_health_checker_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'NetworkLoadBalancerClient#update_health_checker') do
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


    # Updates a listener for a given network load balancer.
    # @param [String] network_load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network load balancer to update.
    # @param [OCI::NetworkLoadBalancer::Models::UpdateListenerDetails] update_listener_details Details to update a listener.
    # @param [String] listener_name The name of the listener to update.
    #
    #   Example: `example_listener`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you must contact Oracle about a
    #   particular request, then provide the request identifier.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so that it can be retried in case of a timeout or
    #   server error without risk of rerunning that same action. Retry tokens expire after 24
    #   hours but they can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the current etag value of the resource.
    #    (default to )
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/networkloadbalancer/update_listener.rb.html) to see an example of how to use update_listener API.
    def update_listener(network_load_balancer_id, update_listener_details, listener_name, opts = {})
      logger.debug 'Calling operation NetworkLoadBalancerClient#update_listener.' if logger

      raise "Missing the required parameter 'network_load_balancer_id' when calling update_listener." if network_load_balancer_id.nil?
      raise "Missing the required parameter 'update_listener_details' when calling update_listener." if update_listener_details.nil?
      raise "Missing the required parameter 'listener_name' when calling update_listener." if listener_name.nil?
      raise "Parameter value for 'network_load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(network_load_balancer_id)
      raise "Parameter value for 'listener_name' must not be blank" if OCI::Internal::Util.blank_string?(listener_name)

      path = '/networkLoadBalancers/{networkLoadBalancerId}/listeners/{listenerName}'.sub('{networkLoadBalancerId}', network_load_balancer_id.to_s).sub('{listenerName}', listener_name.to_s)
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

      post_body = @api_client.object_to_http_body(update_listener_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'NetworkLoadBalancerClient#update_listener') do
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


    # Updates the network load balancer
    # @param [String] network_load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network load balancer to update.
    # @param [OCI::NetworkLoadBalancer::Models::UpdateNetworkLoadBalancerDetails] update_network_load_balancer_details The information to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the current etag value of the resource.
    #    (default to )
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you must contact Oracle about a
    #   particular request, then provide the request identifier.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/networkloadbalancer/update_network_load_balancer.rb.html) to see an example of how to use update_network_load_balancer API.
    def update_network_load_balancer(network_load_balancer_id, update_network_load_balancer_details, opts = {})
      logger.debug 'Calling operation NetworkLoadBalancerClient#update_network_load_balancer.' if logger

      raise "Missing the required parameter 'network_load_balancer_id' when calling update_network_load_balancer." if network_load_balancer_id.nil?
      raise "Missing the required parameter 'update_network_load_balancer_details' when calling update_network_load_balancer." if update_network_load_balancer_details.nil?
      raise "Parameter value for 'network_load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(network_load_balancer_id)

      path = '/networkLoadBalancers/{networkLoadBalancerId}'.sub('{networkLoadBalancerId}', network_load_balancer_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_network_load_balancer_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'NetworkLoadBalancerClient#update_network_load_balancer') do
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


    # Updates the network security groups associated with the specified network load balancer.
    # @param [String] network_load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network load balancer to update.
    # @param [OCI::NetworkLoadBalancer::Models::UpdateNetworkSecurityGroupsDetails] update_network_security_groups_details The details for updating the network security groups associated with the specified network load balancer.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you must contact Oracle about a
    #   particular request, then provide the request identifier.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so that it can be retried in case of a timeout or
    #   server error without risk of rerunning that same action. Retry tokens expire after 24
    #   hours but they can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the current etag value of the resource.
    #    (default to )
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/networkloadbalancer/update_network_security_groups.rb.html) to see an example of how to use update_network_security_groups API.
    def update_network_security_groups(network_load_balancer_id, update_network_security_groups_details, opts = {})
      logger.debug 'Calling operation NetworkLoadBalancerClient#update_network_security_groups.' if logger

      raise "Missing the required parameter 'network_load_balancer_id' when calling update_network_security_groups." if network_load_balancer_id.nil?
      raise "Missing the required parameter 'update_network_security_groups_details' when calling update_network_security_groups." if update_network_security_groups_details.nil?
      raise "Parameter value for 'network_load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(network_load_balancer_id)

      path = '/networkLoadBalancers/{networkLoadBalancerId}/networkSecurityGroups'.sub('{networkLoadBalancerId}', network_load_balancer_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_network_security_groups_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'NetworkLoadBalancerClient#update_network_security_groups') do
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
