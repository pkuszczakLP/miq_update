# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # API for the DNS service. Use this API to manage DNS zones, records, and other DNS resources.
  # For more information, see [Overview of the DNS Service](/iaas/Content/DNS/Concepts/dnszonemanagement.htm).
  class Dns::DnsClient
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


    # Creates a new DnsClient.
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
        @endpoint = endpoint + '/20180115'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "DnsClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://dns.{region}.oci.{secondLevelDomain}') + '/20180115'
      logger.info "DnsClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Moves a resolver into a different compartment along with its protected default view and any endpoints.
    #
    # Zones in the default view are not moved. VCN-dedicated resolvers are initially created in the same compartment
    # as their corresponding VCN, but can then be moved to a different compartment.
    #
    # @param [String] resolver_id The OCID of the target resolver.
    # @param [OCI::Dns::Models::ChangeResolverCompartmentDetails] change_resolver_compartment_details Details for moving a resolver, along with its protected default view and endpoints, into a
    #   different compartment.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The `If-Match` header field makes the request method conditional on the
    #   existence of at least one current representation of the target resource,
    #   when the field-value is `*`, or having a current representation of the
    #   target resource that has an entity-tag matching a member of the list of
    #   entity-tags provided in the field-value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case
    #   of a timeout or server error without risk of executing that same action
    #   again. Retry tokens expire after 24 hours, but can be invalidated before
    #   then due to conflicting operations (for example, if a resource has been
    #   deleted and purged from the system, then a retry of the original creation
    #   request may be rejected).
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/change_resolver_compartment.rb.html) to see an example of how to use change_resolver_compartment API.
    def change_resolver_compartment(resolver_id, change_resolver_compartment_details, opts = {})
      logger.debug 'Calling operation DnsClient#change_resolver_compartment.' if logger

      raise "Missing the required parameter 'resolver_id' when calling change_resolver_compartment." if resolver_id.nil?
      raise "Missing the required parameter 'change_resolver_compartment_details' when calling change_resolver_compartment." if change_resolver_compartment_details.nil?

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end
      raise "Parameter value for 'resolver_id' must not be blank" if OCI::Internal::Util.blank_string?(resolver_id)

      path = '/resolvers/{resolverId}/actions/changeCompartment'.sub('{resolverId}', resolver_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:scope] = opts[:scope] if opts[:scope]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(change_resolver_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#change_resolver_compartment') do
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


    # Moves a steering policy into a different compartment.
    #
    # @param [String] steering_policy_id The OCID of the target steering policy.
    # @param [OCI::Dns::Models::ChangeSteeringPolicyCompartmentDetails] change_steering_policy_compartment_details Details for moving a steering policy into a different compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The `If-Match` header field makes the request method conditional on the
    #   existence of at least one current representation of the target resource,
    #   when the field-value is `*`, or having a current representation of the
    #   target resource that has an entity-tag matching a member of the list of
    #   entity-tags provided in the field-value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case
    #   of a timeout or server error without risk of executing that same action
    #   again. Retry tokens expire after 24 hours, but can be invalidated before
    #   then due to conflicting operations (for example, if a resource has been
    #   deleted and purged from the system, then a retry of the original creation
    #   request may be rejected).
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/change_steering_policy_compartment.rb.html) to see an example of how to use change_steering_policy_compartment API.
    def change_steering_policy_compartment(steering_policy_id, change_steering_policy_compartment_details, opts = {})
      logger.debug 'Calling operation DnsClient#change_steering_policy_compartment.' if logger

      raise "Missing the required parameter 'steering_policy_id' when calling change_steering_policy_compartment." if steering_policy_id.nil?
      raise "Missing the required parameter 'change_steering_policy_compartment_details' when calling change_steering_policy_compartment." if change_steering_policy_compartment_details.nil?

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end
      raise "Parameter value for 'steering_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(steering_policy_id)

      path = '/steeringPolicies/{steeringPolicyId}/actions/changeCompartment'.sub('{steeringPolicyId}', steering_policy_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:scope] = opts[:scope] if opts[:scope]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(change_steering_policy_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#change_steering_policy_compartment') do
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


    # Moves a TSIG key into a different compartment.
    #
    # @param [String] tsig_key_id The OCID of the target TSIG key.
    # @param [OCI::Dns::Models::ChangeTsigKeyCompartmentDetails] change_tsig_key_compartment_details Details for moving a TSIG key into a different compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The `If-Match` header field makes the request method conditional on the
    #   existence of at least one current representation of the target resource,
    #   when the field-value is `*`, or having a current representation of the
    #   target resource that has an entity-tag matching a member of the list of
    #   entity-tags provided in the field-value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case
    #   of a timeout or server error without risk of executing that same action
    #   again. Retry tokens expire after 24 hours, but can be invalidated before
    #   then due to conflicting operations (for example, if a resource has been
    #   deleted and purged from the system, then a retry of the original creation
    #   request may be rejected).
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/change_tsig_key_compartment.rb.html) to see an example of how to use change_tsig_key_compartment API.
    def change_tsig_key_compartment(tsig_key_id, change_tsig_key_compartment_details, opts = {})
      logger.debug 'Calling operation DnsClient#change_tsig_key_compartment.' if logger

      raise "Missing the required parameter 'tsig_key_id' when calling change_tsig_key_compartment." if tsig_key_id.nil?
      raise "Missing the required parameter 'change_tsig_key_compartment_details' when calling change_tsig_key_compartment." if change_tsig_key_compartment_details.nil?

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end
      raise "Parameter value for 'tsig_key_id' must not be blank" if OCI::Internal::Util.blank_string?(tsig_key_id)

      path = '/tsigKeys/{tsigKeyId}/actions/changeCompartment'.sub('{tsigKeyId}', tsig_key_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:scope] = opts[:scope] if opts[:scope]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(change_tsig_key_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#change_tsig_key_compartment') do
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


    # Moves a view into a different compartment.
    #
    # To change the compartment of a protected view, change the compartment of its corresponding resolver.
    #
    # @param [String] view_id The OCID of the target view.
    # @param [OCI::Dns::Models::ChangeViewCompartmentDetails] change_view_compartment_details Details for moving a view into a different compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The `If-Match` header field makes the request method conditional on the
    #   existence of at least one current representation of the target resource,
    #   when the field-value is `*`, or having a current representation of the
    #   target resource that has an entity-tag matching a member of the list of
    #   entity-tags provided in the field-value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case
    #   of a timeout or server error without risk of executing that same action
    #   again. Retry tokens expire after 24 hours, but can be invalidated before
    #   then due to conflicting operations (for example, if a resource has been
    #   deleted and purged from the system, then a retry of the original creation
    #   request may be rejected).
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/change_view_compartment.rb.html) to see an example of how to use change_view_compartment API.
    def change_view_compartment(view_id, change_view_compartment_details, opts = {})
      logger.debug 'Calling operation DnsClient#change_view_compartment.' if logger

      raise "Missing the required parameter 'view_id' when calling change_view_compartment." if view_id.nil?
      raise "Missing the required parameter 'change_view_compartment_details' when calling change_view_compartment." if change_view_compartment_details.nil?

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end
      raise "Parameter value for 'view_id' must not be blank" if OCI::Internal::Util.blank_string?(view_id)

      path = '/views/{viewId}/actions/changeCompartment'.sub('{viewId}', view_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:scope] = opts[:scope] if opts[:scope]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(change_view_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#change_view_compartment') do
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


    # Moves a zone into a different compartment.
    #
    # Protected zones cannot have their compartment changed. When the zone name is provided as a path
    # parameter and `PRIVATE` is used for the scope query parameter then the viewId query parameter is
    # required.
    #
    # **Note:** All SteeringPolicyAttachment objects associated with this zone will also be moved into
    # the provided compartment.
    #
    # @param [String] zone_id The OCID of the target zone.
    # @param [OCI::Dns::Models::ChangeZoneCompartmentDetails] change_zone_compartment_details Details for moving a zone into a different compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The `If-Match` header field makes the request method conditional on the
    #   existence of at least one current representation of the target resource,
    #   when the field-value is `*`, or having a current representation of the
    #   target resource that has an entity-tag matching a member of the list of
    #   entity-tags provided in the field-value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case
    #   of a timeout or server error without risk of executing that same action
    #   again. Retry tokens expire after 24 hours, but can be invalidated before
    #   then due to conflicting operations (for example, if a resource has been
    #   deleted and purged from the system, then a retry of the original creation
    #   request may be rejected).
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/change_zone_compartment.rb.html) to see an example of how to use change_zone_compartment API.
    def change_zone_compartment(zone_id, change_zone_compartment_details, opts = {})
      logger.debug 'Calling operation DnsClient#change_zone_compartment.' if logger

      raise "Missing the required parameter 'zone_id' when calling change_zone_compartment." if zone_id.nil?
      raise "Missing the required parameter 'change_zone_compartment_details' when calling change_zone_compartment." if change_zone_compartment_details.nil?

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end
      raise "Parameter value for 'zone_id' must not be blank" if OCI::Internal::Util.blank_string?(zone_id)

      path = '/zones/{zoneId}/actions/changeCompartment'.sub('{zoneId}', zone_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:scope] = opts[:scope] if opts[:scope]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(change_zone_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#change_zone_compartment') do
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


    # Creates a new resolver endpoint in the same compartment as the resolver.
    #
    # @param [String] resolver_id The OCID of the target resolver.
    # @param [OCI::Dns::Models::CreateResolverEndpointDetails] create_resolver_endpoint_details Details for creating a new resolver endpoint.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case
    #   of a timeout or server error without risk of executing that same action
    #   again. Retry tokens expire after 24 hours, but can be invalidated before
    #   then due to conflicting operations (for example, if a resource has been
    #   deleted and purged from the system, then a retry of the original creation
    #   request may be rejected).
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @return [Response] A Response object with data of type {OCI::Dns::Models::ResolverEndpoint ResolverEndpoint}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/create_resolver_endpoint.rb.html) to see an example of how to use create_resolver_endpoint API.
    def create_resolver_endpoint(resolver_id, create_resolver_endpoint_details, opts = {})
      logger.debug 'Calling operation DnsClient#create_resolver_endpoint.' if logger

      raise "Missing the required parameter 'resolver_id' when calling create_resolver_endpoint." if resolver_id.nil?
      raise "Missing the required parameter 'create_resolver_endpoint_details' when calling create_resolver_endpoint." if create_resolver_endpoint_details.nil?

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end
      raise "Parameter value for 'resolver_id' must not be blank" if OCI::Internal::Util.blank_string?(resolver_id)

      path = '/resolvers/{resolverId}/endpoints'.sub('{resolverId}', resolver_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:scope] = opts[:scope] if opts[:scope]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_resolver_endpoint_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#create_resolver_endpoint') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::ResolverEndpoint'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new steering policy in the specified compartment. For more information on
    # creating policies with templates, see [Traffic Management API Guide](https://docs.cloud.oracle.com/iaas/Content/TrafficManagement/Concepts/trafficmanagementapi.htm).
    #
    # @param [OCI::Dns::Models::CreateSteeringPolicyDetails] create_steering_policy_details Details for creating a new steering policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case
    #   of a timeout or server error without risk of executing that same action
    #   again. Retry tokens expire after 24 hours, but can be invalidated before
    #   then due to conflicting operations (for example, if a resource has been
    #   deleted and purged from the system, then a retry of the original creation
    #   request may be rejected).
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @return [Response] A Response object with data of type {OCI::Dns::Models::SteeringPolicy SteeringPolicy}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/create_steering_policy.rb.html) to see an example of how to use create_steering_policy API.
    def create_steering_policy(create_steering_policy_details, opts = {})
      logger.debug 'Calling operation DnsClient#create_steering_policy.' if logger

      raise "Missing the required parameter 'create_steering_policy_details' when calling create_steering_policy." if create_steering_policy_details.nil?

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end

      path = '/steeringPolicies'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:scope] = opts[:scope] if opts[:scope]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_steering_policy_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#create_steering_policy') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::SteeringPolicy'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new attachment between a steering policy and a domain, giving the
    # policy permission to answer queries for the specified domain. A steering policy must
    # be attached to a domain for the policy to answer DNS queries for that domain.
    #
    # For the purposes of access control, the attachment is automatically placed
    # into the same compartment as the domain's zone.
    #
    # @param [OCI::Dns::Models::CreateSteeringPolicyAttachmentDetails] create_steering_policy_attachment_details Details for creating a new steering policy attachment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case
    #   of a timeout or server error without risk of executing that same action
    #   again. Retry tokens expire after 24 hours, but can be invalidated before
    #   then due to conflicting operations (for example, if a resource has been
    #   deleted and purged from the system, then a retry of the original creation
    #   request may be rejected).
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @return [Response] A Response object with data of type {OCI::Dns::Models::SteeringPolicyAttachment SteeringPolicyAttachment}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/create_steering_policy_attachment.rb.html) to see an example of how to use create_steering_policy_attachment API.
    def create_steering_policy_attachment(create_steering_policy_attachment_details, opts = {})
      logger.debug 'Calling operation DnsClient#create_steering_policy_attachment.' if logger

      raise "Missing the required parameter 'create_steering_policy_attachment_details' when calling create_steering_policy_attachment." if create_steering_policy_attachment_details.nil?

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end

      path = '/steeringPolicyAttachments'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:scope] = opts[:scope] if opts[:scope]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_steering_policy_attachment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#create_steering_policy_attachment') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::SteeringPolicyAttachment'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new TSIG key in the specified compartment. There is no
    # `opc-retry-token` header since TSIG key names must be globally unique.
    #
    # @param [OCI::Dns::Models::CreateTsigKeyDetails] create_tsig_key_details Details for creating a new TSIG key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @return [Response] A Response object with data of type {OCI::Dns::Models::TsigKey TsigKey}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/create_tsig_key.rb.html) to see an example of how to use create_tsig_key API.
    def create_tsig_key(create_tsig_key_details, opts = {})
      logger.debug 'Calling operation DnsClient#create_tsig_key.' if logger

      raise "Missing the required parameter 'create_tsig_key_details' when calling create_tsig_key." if create_tsig_key_details.nil?

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end

      path = '/tsigKeys'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:scope] = opts[:scope] if opts[:scope]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(create_tsig_key_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#create_tsig_key') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::TsigKey'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new view in the specified compartment.
    #
    # @param [OCI::Dns::Models::CreateViewDetails] create_view_details Details for creating a new view.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case
    #   of a timeout or server error without risk of executing that same action
    #   again. Retry tokens expire after 24 hours, but can be invalidated before
    #   then due to conflicting operations (for example, if a resource has been
    #   deleted and purged from the system, then a retry of the original creation
    #   request may be rejected).
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @return [Response] A Response object with data of type {OCI::Dns::Models::View View}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/create_view.rb.html) to see an example of how to use create_view API.
    def create_view(create_view_details, opts = {})
      logger.debug 'Calling operation DnsClient#create_view.' if logger

      raise "Missing the required parameter 'create_view_details' when calling create_view." if create_view_details.nil?

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end

      path = '/views'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:scope] = opts[:scope] if opts[:scope]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_view_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#create_view') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::View'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new zone in the specified compartment.
    #
    # Private zones must have a zone type of `PRIMARY`. Creating a private zone at or under `oraclevcn.com`
    # within the default protected view of a VCN-dedicated resolver is not permitted.
    #
    # @param [OCI::Dns::Models::CreateZoneBaseDetails] create_zone_details Details for creating a new zone.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [String] :compartment_id The OCID of the compartment the zone belongs to.
    #
    #   This parameter is deprecated and should be omitted.
    #
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @option opts [String] :view_id The OCID of the view the resource is associated with.
    # @return [Response] A Response object with data of type {OCI::Dns::Models::Zone Zone}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/create_zone.rb.html) to see an example of how to use create_zone API.
    def create_zone(create_zone_details, opts = {})
      logger.debug 'Calling operation DnsClient#create_zone.' if logger

      raise "Missing the required parameter 'create_zone_details' when calling create_zone." if create_zone_details.nil?

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end

      path = '/zones'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:scope] = opts[:scope] if opts[:scope]
      query_params[:viewId] = opts[:view_id] if opts[:view_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(create_zone_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#create_zone') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::Zone'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Deletes all records at the specified zone and domain.
    #
    # When the zone name is provided as a path parameter and `PRIVATE` is used for the scope query parameter
    # then the viewId query parameter is required.
    #
    # @param [String] zone_name_or_id The name or OCID of the target zone.
    # @param [String] domain The target fully-qualified domain name (FQDN) within the target zone.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The `If-Match` header field makes the request method conditional on the
    #   existence of at least one current representation of the target resource,
    #   when the field-value is `*`, or having a current representation of the
    #   target resource that has an entity-tag matching a member of the list of
    #   entity-tags provided in the field-value.
    #
    # @option opts [String] :if_unmodified_since The `If-Unmodified-Since` header field makes the request method
    #   conditional on the selected representation's last modification date being
    #   earlier than or equal to the date provided in the field-value.  This
    #   field accomplishes the same purpose as If-Match for cases where the user
    #   agent does not have an entity-tag for the representation.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @option opts [String] :view_id The OCID of the view the resource is associated with.
    # @option opts [String] :compartment_id The OCID of the compartment the zone belongs to.
    #
    #   This parameter is deprecated and should be omitted.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/delete_domain_records.rb.html) to see an example of how to use delete_domain_records API.
    def delete_domain_records(zone_name_or_id, domain, opts = {})
      logger.debug 'Calling operation DnsClient#delete_domain_records.' if logger

      raise "Missing the required parameter 'zone_name_or_id' when calling delete_domain_records." if zone_name_or_id.nil?
      raise "Missing the required parameter 'domain' when calling delete_domain_records." if domain.nil?

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end
      raise "Parameter value for 'zone_name_or_id' must not be blank" if OCI::Internal::Util.blank_string?(zone_name_or_id)
      raise "Parameter value for 'domain' must not be blank" if OCI::Internal::Util.blank_string?(domain)

      path = '/zones/{zoneNameOrId}/records/{domain}'.sub('{zoneNameOrId}', zone_name_or_id.to_s).sub('{domain}', domain.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:scope] = opts[:scope] if opts[:scope]
      query_params[:viewId] = opts[:view_id] if opts[:view_id]
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-unmodified-since'] = opts[:if_unmodified_since] if opts[:if_unmodified_since]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#delete_domain_records') do
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


    # Deletes the specified resolver endpoint.
    #
    # Note that attempting to delete a resolver endpoint in the DELETED lifecycle state will result in
    # a `404` response to be consistent with other operations of the API. Resolver endpoints may not
    # be deleted if they are referenced by a resolver rule.
    #
    # @param [String] resolver_id The OCID of the target resolver.
    # @param [String] resolver_endpoint_name The name of the target resolver endpoint.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The `If-Match` header field makes the request method conditional on the
    #   existence of at least one current representation of the target resource,
    #   when the field-value is `*`, or having a current representation of the
    #   target resource that has an entity-tag matching a member of the list of
    #   entity-tags provided in the field-value.
    #
    # @option opts [String] :if_unmodified_since The `If-Unmodified-Since` header field makes the request method
    #   conditional on the selected representation's last modification date being
    #   earlier than or equal to the date provided in the field-value.  This
    #   field accomplishes the same purpose as If-Match for cases where the user
    #   agent does not have an entity-tag for the representation.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/delete_resolver_endpoint.rb.html) to see an example of how to use delete_resolver_endpoint API.
    def delete_resolver_endpoint(resolver_id, resolver_endpoint_name, opts = {})
      logger.debug 'Calling operation DnsClient#delete_resolver_endpoint.' if logger

      raise "Missing the required parameter 'resolver_id' when calling delete_resolver_endpoint." if resolver_id.nil?
      raise "Missing the required parameter 'resolver_endpoint_name' when calling delete_resolver_endpoint." if resolver_endpoint_name.nil?

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end
      raise "Parameter value for 'resolver_id' must not be blank" if OCI::Internal::Util.blank_string?(resolver_id)
      raise "Parameter value for 'resolver_endpoint_name' must not be blank" if OCI::Internal::Util.blank_string?(resolver_endpoint_name)

      path = '/resolvers/{resolverId}/endpoints/{resolverEndpointName}'.sub('{resolverId}', resolver_id.to_s).sub('{resolverEndpointName}', resolver_endpoint_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:scope] = opts[:scope] if opts[:scope]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-unmodified-since'] = opts[:if_unmodified_since] if opts[:if_unmodified_since]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#delete_resolver_endpoint') do
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


    # Deletes all records in the specified RRSet.
    #
    # When the zone name is provided as a path parameter and `PRIVATE` is used for the scope
    # query parameter then the viewId query parameter is required.
    #
    # @param [String] zone_name_or_id The name or OCID of the target zone.
    # @param [String] domain The target fully-qualified domain name (FQDN) within the target zone.
    # @param [String] rtype The type of the target RRSet within the target zone.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The `If-Match` header field makes the request method conditional on the
    #   existence of at least one current representation of the target resource,
    #   when the field-value is `*`, or having a current representation of the
    #   target resource that has an entity-tag matching a member of the list of
    #   entity-tags provided in the field-value.
    #
    # @option opts [String] :if_unmodified_since The `If-Unmodified-Since` header field makes the request method
    #   conditional on the selected representation's last modification date being
    #   earlier than or equal to the date provided in the field-value.  This
    #   field accomplishes the same purpose as If-Match for cases where the user
    #   agent does not have an entity-tag for the representation.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [String] :compartment_id The OCID of the compartment the zone belongs to.
    #
    #   This parameter is deprecated and should be omitted.
    #
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @option opts [String] :view_id The OCID of the view the resource is associated with.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/delete_rr_set.rb.html) to see an example of how to use delete_rr_set API.
    def delete_rr_set(zone_name_or_id, domain, rtype, opts = {})
      logger.debug 'Calling operation DnsClient#delete_rr_set.' if logger

      raise "Missing the required parameter 'zone_name_or_id' when calling delete_rr_set." if zone_name_or_id.nil?
      raise "Missing the required parameter 'domain' when calling delete_rr_set." if domain.nil?
      raise "Missing the required parameter 'rtype' when calling delete_rr_set." if rtype.nil?

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end
      raise "Parameter value for 'zone_name_or_id' must not be blank" if OCI::Internal::Util.blank_string?(zone_name_or_id)
      raise "Parameter value for 'domain' must not be blank" if OCI::Internal::Util.blank_string?(domain)
      raise "Parameter value for 'rtype' must not be blank" if OCI::Internal::Util.blank_string?(rtype)

      path = '/zones/{zoneNameOrId}/records/{domain}/{rtype}'.sub('{zoneNameOrId}', zone_name_or_id.to_s).sub('{domain}', domain.to_s).sub('{rtype}', rtype.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:scope] = opts[:scope] if opts[:scope]
      query_params[:viewId] = opts[:view_id] if opts[:view_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-unmodified-since'] = opts[:if_unmodified_since] if opts[:if_unmodified_since]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#delete_rr_set') do
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


    # Deletes the specified steering policy.
    #
    # A `204` response indicates that the delete has been successful.
    # Deletion will fail if the policy is attached to any zones. To detach a
    # policy from a zone, see `DeleteSteeringPolicyAttachment`.
    #
    # @param [String] steering_policy_id The OCID of the target steering policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The `If-Match` header field makes the request method conditional on the
    #   existence of at least one current representation of the target resource,
    #   when the field-value is `*`, or having a current representation of the
    #   target resource that has an entity-tag matching a member of the list of
    #   entity-tags provided in the field-value.
    #
    # @option opts [String] :if_unmodified_since The `If-Unmodified-Since` header field makes the request method
    #   conditional on the selected representation's last modification date being
    #   earlier than or equal to the date provided in the field-value.  This
    #   field accomplishes the same purpose as If-Match for cases where the user
    #   agent does not have an entity-tag for the representation.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/delete_steering_policy.rb.html) to see an example of how to use delete_steering_policy API.
    def delete_steering_policy(steering_policy_id, opts = {})
      logger.debug 'Calling operation DnsClient#delete_steering_policy.' if logger

      raise "Missing the required parameter 'steering_policy_id' when calling delete_steering_policy." if steering_policy_id.nil?

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end
      raise "Parameter value for 'steering_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(steering_policy_id)

      path = '/steeringPolicies/{steeringPolicyId}'.sub('{steeringPolicyId}', steering_policy_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:scope] = opts[:scope] if opts[:scope]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-unmodified-since'] = opts[:if_unmodified_since] if opts[:if_unmodified_since]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#delete_steering_policy') do
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


    # Deletes the specified steering policy attachment.
    # A `204` response indicates that the delete has been successful.
    #
    # @param [String] steering_policy_attachment_id The OCID of the target steering policy attachment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The `If-Match` header field makes the request method conditional on the
    #   existence of at least one current representation of the target resource,
    #   when the field-value is `*`, or having a current representation of the
    #   target resource that has an entity-tag matching a member of the list of
    #   entity-tags provided in the field-value.
    #
    # @option opts [String] :if_unmodified_since The `If-Unmodified-Since` header field makes the request method
    #   conditional on the selected representation's last modification date being
    #   earlier than or equal to the date provided in the field-value.  This
    #   field accomplishes the same purpose as If-Match for cases where the user
    #   agent does not have an entity-tag for the representation.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/delete_steering_policy_attachment.rb.html) to see an example of how to use delete_steering_policy_attachment API.
    def delete_steering_policy_attachment(steering_policy_attachment_id, opts = {})
      logger.debug 'Calling operation DnsClient#delete_steering_policy_attachment.' if logger

      raise "Missing the required parameter 'steering_policy_attachment_id' when calling delete_steering_policy_attachment." if steering_policy_attachment_id.nil?

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end
      raise "Parameter value for 'steering_policy_attachment_id' must not be blank" if OCI::Internal::Util.blank_string?(steering_policy_attachment_id)

      path = '/steeringPolicyAttachments/{steeringPolicyAttachmentId}'.sub('{steeringPolicyAttachmentId}', steering_policy_attachment_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:scope] = opts[:scope] if opts[:scope]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-unmodified-since'] = opts[:if_unmodified_since] if opts[:if_unmodified_since]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#delete_steering_policy_attachment') do
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


    # Deletes the specified TSIG key.
    #
    # @param [String] tsig_key_id The OCID of the target TSIG key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The `If-Match` header field makes the request method conditional on the
    #   existence of at least one current representation of the target resource,
    #   when the field-value is `*`, or having a current representation of the
    #   target resource that has an entity-tag matching a member of the list of
    #   entity-tags provided in the field-value.
    #
    # @option opts [String] :if_unmodified_since The `If-Unmodified-Since` header field makes the request method
    #   conditional on the selected representation's last modification date being
    #   earlier than or equal to the date provided in the field-value.  This
    #   field accomplishes the same purpose as If-Match for cases where the user
    #   agent does not have an entity-tag for the representation.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/delete_tsig_key.rb.html) to see an example of how to use delete_tsig_key API.
    def delete_tsig_key(tsig_key_id, opts = {})
      logger.debug 'Calling operation DnsClient#delete_tsig_key.' if logger

      raise "Missing the required parameter 'tsig_key_id' when calling delete_tsig_key." if tsig_key_id.nil?

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end
      raise "Parameter value for 'tsig_key_id' must not be blank" if OCI::Internal::Util.blank_string?(tsig_key_id)

      path = '/tsigKeys/{tsigKeyId}'.sub('{tsigKeyId}', tsig_key_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:scope] = opts[:scope] if opts[:scope]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-unmodified-since'] = opts[:if_unmodified_since] if opts[:if_unmodified_since]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#delete_tsig_key') do
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


    # Deletes the specified view.
    #
    # Note that attempting to delete a view in the DELETED lifecycleState will result in a `404`
    # response to be consistent with other operations of the API. Views cannot be
    # deleted if they are referenced by non-deleted zones or resolvers.
    # Protected views cannot be deleted.
    #
    # @param [String] view_id The OCID of the target view.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The `If-Match` header field makes the request method conditional on the
    #   existence of at least one current representation of the target resource,
    #   when the field-value is `*`, or having a current representation of the
    #   target resource that has an entity-tag matching a member of the list of
    #   entity-tags provided in the field-value.
    #
    # @option opts [String] :if_unmodified_since The `If-Unmodified-Since` header field makes the request method
    #   conditional on the selected representation's last modification date being
    #   earlier than or equal to the date provided in the field-value.  This
    #   field accomplishes the same purpose as If-Match for cases where the user
    #   agent does not have an entity-tag for the representation.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/delete_view.rb.html) to see an example of how to use delete_view API.
    def delete_view(view_id, opts = {})
      logger.debug 'Calling operation DnsClient#delete_view.' if logger

      raise "Missing the required parameter 'view_id' when calling delete_view." if view_id.nil?

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end
      raise "Parameter value for 'view_id' must not be blank" if OCI::Internal::Util.blank_string?(view_id)

      path = '/views/{viewId}'.sub('{viewId}', view_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:scope] = opts[:scope] if opts[:scope]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-unmodified-since'] = opts[:if_unmodified_since] if opts[:if_unmodified_since]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#delete_view') do
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


    # Deletes the specified zone and all its steering policy attachments.
    #
    # A `204` response indicates that the zone has been successfully deleted. Protected zones cannot be deleted.
    # When the zone name is provided as a path parameter and `PRIVATE` is used for the scope query parameter
    # then the viewId query parameter is required.
    #
    # @param [String] zone_name_or_id The name or OCID of the target zone.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The `If-Match` header field makes the request method conditional on the
    #   existence of at least one current representation of the target resource,
    #   when the field-value is `*`, or having a current representation of the
    #   target resource that has an entity-tag matching a member of the list of
    #   entity-tags provided in the field-value.
    #
    # @option opts [String] :if_unmodified_since The `If-Unmodified-Since` header field makes the request method
    #   conditional on the selected representation's last modification date being
    #   earlier than or equal to the date provided in the field-value.  This
    #   field accomplishes the same purpose as If-Match for cases where the user
    #   agent does not have an entity-tag for the representation.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @option opts [String] :view_id The OCID of the view the resource is associated with.
    # @option opts [String] :compartment_id The OCID of the compartment the zone belongs to.
    #
    #   This parameter is deprecated and should be omitted.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/delete_zone.rb.html) to see an example of how to use delete_zone API.
    def delete_zone(zone_name_or_id, opts = {})
      logger.debug 'Calling operation DnsClient#delete_zone.' if logger

      raise "Missing the required parameter 'zone_name_or_id' when calling delete_zone." if zone_name_or_id.nil?

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end
      raise "Parameter value for 'zone_name_or_id' must not be blank" if OCI::Internal::Util.blank_string?(zone_name_or_id)

      path = '/zones/{zoneNameOrId}'.sub('{zoneNameOrId}', zone_name_or_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:scope] = opts[:scope] if opts[:scope]
      query_params[:viewId] = opts[:view_id] if opts[:view_id]
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-unmodified-since'] = opts[:if_unmodified_since] if opts[:if_unmodified_since]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#delete_zone') do
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


    # Gets a list of all records at the specified zone and domain.
    #
    # The results are sorted by `rtype` in alphabetical order by default. You can optionally filter and/or sort
    # the results using the listed parameters. When the zone name is provided as a path parameter and `PRIVATE`
    # is used for the scope query parameter then the viewId query parameter is required.
    #
    # @param [String] zone_name_or_id The name or OCID of the target zone.
    # @param [String] domain The target fully-qualified domain name (FQDN) within the target zone.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_none_match The `If-None-Match` header field makes the request method conditional on
    #   the absence of any current representation of the target resource, when
    #   the field-value is `*`, or having a selected representation with an
    #   entity-tag that does not match any of those listed in the field-value.
    #
    # @option opts [String] :if_modified_since The `If-Modified-Since` header field makes a GET or HEAD request method
    #   conditional on the selected representation's modification date being more
    #   recent than the date provided in the field-value.  Transfer of the
    #   selected representation's data is avoided if that data has not changed.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a page of the collection.
    #    (default to 50)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [String] :zone_version The version of the zone for which data is requested.
    #
    # @option opts [String] :rtype Search by record type.
    #   Will match any record whose [type](https://www.iana.org/assignments/dns-parameters/dns-parameters.xhtml#dns-parameters-4) (case-insensitive) equals the provided value.
    #
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @option opts [String] :view_id The OCID of the view the resource is associated with.
    # @option opts [String] :sort_by The field by which to sort records. (default to rtype)
    #   Allowed values are: rtype, ttl
    # @option opts [String] :sort_order The order to sort the resources.
    #    (default to ASC)
    # @option opts [String] :compartment_id The OCID of the compartment the zone belongs to.
    #
    #   This parameter is deprecated and should be omitted.
    #
    # @return [Response] A Response object with data of type {OCI::Dns::Models::RecordCollection RecordCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/get_domain_records.rb.html) to see an example of how to use get_domain_records API.
    def get_domain_records(zone_name_or_id, domain, opts = {})
      logger.debug 'Calling operation DnsClient#get_domain_records.' if logger

      raise "Missing the required parameter 'zone_name_or_id' when calling get_domain_records." if zone_name_or_id.nil?
      raise "Missing the required parameter 'domain' when calling get_domain_records." if domain.nil?

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end

      if opts[:sort_by] && !%w[rtype ttl].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of rtype, ttl.'
      end

      if opts[:sort_order] && !OCI::Dns::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Dns::Models::SORT_ORDER_ENUM.'
      end
      raise "Parameter value for 'zone_name_or_id' must not be blank" if OCI::Internal::Util.blank_string?(zone_name_or_id)
      raise "Parameter value for 'domain' must not be blank" if OCI::Internal::Util.blank_string?(domain)

      path = '/zones/{zoneNameOrId}/records/{domain}'.sub('{zoneNameOrId}', zone_name_or_id.to_s).sub('{domain}', domain.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:zoneVersion] = opts[:zone_version] if opts[:zone_version]
      query_params[:rtype] = opts[:rtype] if opts[:rtype]
      query_params[:scope] = opts[:scope] if opts[:scope]
      query_params[:viewId] = opts[:view_id] if opts[:view_id]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      header_params[:'if-modified-since'] = opts[:if_modified_since] if opts[:if_modified_since]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#get_domain_records') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::RecordCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets information about a specific resolver.
    #
    # Note that attempting to get a resolver in the DELETED lifecycleState will result in a `404`
    # response to be consistent with other operations of the API.
    #
    # @param [String] resolver_id The OCID of the target resolver.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_modified_since The `If-Modified-Since` header field makes a GET or HEAD request method
    #   conditional on the selected representation's modification date being more
    #   recent than the date provided in the field-value.  Transfer of the
    #   selected representation's data is avoided if that data has not changed.
    #
    # @option opts [String] :if_none_match The `If-None-Match` header field makes the request method conditional on
    #   the absence of any current representation of the target resource, when
    #   the field-value is `*`, or having a selected representation with an
    #   entity-tag that does not match any of those listed in the field-value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @return [Response] A Response object with data of type {OCI::Dns::Models::Resolver Resolver}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/get_resolver.rb.html) to see an example of how to use get_resolver API.
    def get_resolver(resolver_id, opts = {})
      logger.debug 'Calling operation DnsClient#get_resolver.' if logger

      raise "Missing the required parameter 'resolver_id' when calling get_resolver." if resolver_id.nil?

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end
      raise "Parameter value for 'resolver_id' must not be blank" if OCI::Internal::Util.blank_string?(resolver_id)

      path = '/resolvers/{resolverId}'.sub('{resolverId}', resolver_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:scope] = opts[:scope] if opts[:scope]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-modified-since'] = opts[:if_modified_since] if opts[:if_modified_since]
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#get_resolver') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::Resolver'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets information about a specific resolver endpoint.
    #
    # Note that attempting to get a resolver endpoint in the DELETED lifecycle state will result
    # in a `404` response to be consistent with other operations of the API.
    #
    # @param [String] resolver_id The OCID of the target resolver.
    # @param [String] resolver_endpoint_name The name of the target resolver endpoint.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_modified_since The `If-Modified-Since` header field makes a GET or HEAD request method
    #   conditional on the selected representation's modification date being more
    #   recent than the date provided in the field-value.  Transfer of the
    #   selected representation's data is avoided if that data has not changed.
    #
    # @option opts [String] :if_none_match The `If-None-Match` header field makes the request method conditional on
    #   the absence of any current representation of the target resource, when
    #   the field-value is `*`, or having a selected representation with an
    #   entity-tag that does not match any of those listed in the field-value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @return [Response] A Response object with data of type {OCI::Dns::Models::ResolverEndpoint ResolverEndpoint}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/get_resolver_endpoint.rb.html) to see an example of how to use get_resolver_endpoint API.
    def get_resolver_endpoint(resolver_id, resolver_endpoint_name, opts = {})
      logger.debug 'Calling operation DnsClient#get_resolver_endpoint.' if logger

      raise "Missing the required parameter 'resolver_id' when calling get_resolver_endpoint." if resolver_id.nil?
      raise "Missing the required parameter 'resolver_endpoint_name' when calling get_resolver_endpoint." if resolver_endpoint_name.nil?

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end
      raise "Parameter value for 'resolver_id' must not be blank" if OCI::Internal::Util.blank_string?(resolver_id)
      raise "Parameter value for 'resolver_endpoint_name' must not be blank" if OCI::Internal::Util.blank_string?(resolver_endpoint_name)

      path = '/resolvers/{resolverId}/endpoints/{resolverEndpointName}'.sub('{resolverId}', resolver_id.to_s).sub('{resolverEndpointName}', resolver_endpoint_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:scope] = opts[:scope] if opts[:scope]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-modified-since'] = opts[:if_modified_since] if opts[:if_modified_since]
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#get_resolver_endpoint') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::ResolverEndpoint'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of all records in the specified RRSet.
    #
    # The results are sorted by `recordHash` by default. When the zone name is provided as a path parameter
    # and `PRIVATE` is used for the scope query parameter then the viewId query parameter is required.
    #
    # @param [String] zone_name_or_id The name or OCID of the target zone.
    # @param [String] domain The target fully-qualified domain name (FQDN) within the target zone.
    # @param [String] rtype The type of the target RRSet within the target zone.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_none_match The `If-None-Match` header field makes the request method conditional on
    #   the absence of any current representation of the target resource, when
    #   the field-value is `*`, or having a selected representation with an
    #   entity-tag that does not match any of those listed in the field-value.
    #
    # @option opts [String] :if_modified_since The `If-Modified-Since` header field makes a GET or HEAD request method
    #   conditional on the selected representation's modification date being more
    #   recent than the date provided in the field-value.  Transfer of the
    #   selected representation's data is avoided if that data has not changed.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a page of the collection.
    #    (default to 50)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [String] :zone_version The version of the zone for which data is requested.
    #
    # @option opts [String] :compartment_id The OCID of the compartment the zone belongs to.
    #
    #   This parameter is deprecated and should be omitted.
    #
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @option opts [String] :view_id The OCID of the view the resource is associated with.
    # @return [Response] A Response object with data of type {OCI::Dns::Models::RRSet RRSet}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/get_rr_set.rb.html) to see an example of how to use get_rr_set API.
    def get_rr_set(zone_name_or_id, domain, rtype, opts = {})
      logger.debug 'Calling operation DnsClient#get_rr_set.' if logger

      raise "Missing the required parameter 'zone_name_or_id' when calling get_rr_set." if zone_name_or_id.nil?
      raise "Missing the required parameter 'domain' when calling get_rr_set." if domain.nil?
      raise "Missing the required parameter 'rtype' when calling get_rr_set." if rtype.nil?

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end
      raise "Parameter value for 'zone_name_or_id' must not be blank" if OCI::Internal::Util.blank_string?(zone_name_or_id)
      raise "Parameter value for 'domain' must not be blank" if OCI::Internal::Util.blank_string?(domain)
      raise "Parameter value for 'rtype' must not be blank" if OCI::Internal::Util.blank_string?(rtype)

      path = '/zones/{zoneNameOrId}/records/{domain}/{rtype}'.sub('{zoneNameOrId}', zone_name_or_id.to_s).sub('{domain}', domain.to_s).sub('{rtype}', rtype.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:zoneVersion] = opts[:zone_version] if opts[:zone_version]
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:scope] = opts[:scope] if opts[:scope]
      query_params[:viewId] = opts[:view_id] if opts[:view_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      header_params[:'if-modified-since'] = opts[:if_modified_since] if opts[:if_modified_since]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#get_rr_set') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::RRSet'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets information about the specified steering policy.
    #
    # @param [String] steering_policy_id The OCID of the target steering policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_none_match The `If-None-Match` header field makes the request method conditional on
    #   the absence of any current representation of the target resource, when
    #   the field-value is `*`, or having a selected representation with an
    #   entity-tag that does not match any of those listed in the field-value.
    #
    # @option opts [String] :if_modified_since The `If-Modified-Since` header field makes a GET or HEAD request method
    #   conditional on the selected representation's modification date being more
    #   recent than the date provided in the field-value.  Transfer of the
    #   selected representation's data is avoided if that data has not changed.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @return [Response] A Response object with data of type {OCI::Dns::Models::SteeringPolicy SteeringPolicy}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/get_steering_policy.rb.html) to see an example of how to use get_steering_policy API.
    def get_steering_policy(steering_policy_id, opts = {})
      logger.debug 'Calling operation DnsClient#get_steering_policy.' if logger

      raise "Missing the required parameter 'steering_policy_id' when calling get_steering_policy." if steering_policy_id.nil?

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end
      raise "Parameter value for 'steering_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(steering_policy_id)

      path = '/steeringPolicies/{steeringPolicyId}'.sub('{steeringPolicyId}', steering_policy_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:scope] = opts[:scope] if opts[:scope]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      header_params[:'if-modified-since'] = opts[:if_modified_since] if opts[:if_modified_since]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#get_steering_policy') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::SteeringPolicy'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets information about the specified steering policy attachment.
    #
    # @param [String] steering_policy_attachment_id The OCID of the target steering policy attachment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_none_match The `If-None-Match` header field makes the request method conditional on
    #   the absence of any current representation of the target resource, when
    #   the field-value is `*`, or having a selected representation with an
    #   entity-tag that does not match any of those listed in the field-value.
    #
    # @option opts [String] :if_modified_since The `If-Modified-Since` header field makes a GET or HEAD request method
    #   conditional on the selected representation's modification date being more
    #   recent than the date provided in the field-value.  Transfer of the
    #   selected representation's data is avoided if that data has not changed.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @return [Response] A Response object with data of type {OCI::Dns::Models::SteeringPolicyAttachment SteeringPolicyAttachment}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/get_steering_policy_attachment.rb.html) to see an example of how to use get_steering_policy_attachment API.
    def get_steering_policy_attachment(steering_policy_attachment_id, opts = {})
      logger.debug 'Calling operation DnsClient#get_steering_policy_attachment.' if logger

      raise "Missing the required parameter 'steering_policy_attachment_id' when calling get_steering_policy_attachment." if steering_policy_attachment_id.nil?

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end
      raise "Parameter value for 'steering_policy_attachment_id' must not be blank" if OCI::Internal::Util.blank_string?(steering_policy_attachment_id)

      path = '/steeringPolicyAttachments/{steeringPolicyAttachmentId}'.sub('{steeringPolicyAttachmentId}', steering_policy_attachment_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:scope] = opts[:scope] if opts[:scope]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      header_params[:'if-modified-since'] = opts[:if_modified_since] if opts[:if_modified_since]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#get_steering_policy_attachment') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::SteeringPolicyAttachment'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets information about the specified TSIG key.
    #
    # @param [String] tsig_key_id The OCID of the target TSIG key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_none_match The `If-None-Match` header field makes the request method conditional on
    #   the absence of any current representation of the target resource, when
    #   the field-value is `*`, or having a selected representation with an
    #   entity-tag that does not match any of those listed in the field-value.
    #
    # @option opts [String] :if_modified_since The `If-Modified-Since` header field makes a GET or HEAD request method
    #   conditional on the selected representation's modification date being more
    #   recent than the date provided in the field-value.  Transfer of the
    #   selected representation's data is avoided if that data has not changed.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @return [Response] A Response object with data of type {OCI::Dns::Models::TsigKey TsigKey}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/get_tsig_key.rb.html) to see an example of how to use get_tsig_key API.
    def get_tsig_key(tsig_key_id, opts = {})
      logger.debug 'Calling operation DnsClient#get_tsig_key.' if logger

      raise "Missing the required parameter 'tsig_key_id' when calling get_tsig_key." if tsig_key_id.nil?

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end
      raise "Parameter value for 'tsig_key_id' must not be blank" if OCI::Internal::Util.blank_string?(tsig_key_id)

      path = '/tsigKeys/{tsigKeyId}'.sub('{tsigKeyId}', tsig_key_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:scope] = opts[:scope] if opts[:scope]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      header_params[:'if-modified-since'] = opts[:if_modified_since] if opts[:if_modified_since]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#get_tsig_key') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::TsigKey'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets information about a specific view.
    #
    # Note that attempting to get a
    # view in the DELETED lifecycleState will result in a `404` response to be
    # consistent with other operations of the API.
    #
    # @param [String] view_id The OCID of the target view.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_modified_since The `If-Modified-Since` header field makes a GET or HEAD request method
    #   conditional on the selected representation's modification date being more
    #   recent than the date provided in the field-value.  Transfer of the
    #   selected representation's data is avoided if that data has not changed.
    #
    # @option opts [String] :if_none_match The `If-None-Match` header field makes the request method conditional on
    #   the absence of any current representation of the target resource, when
    #   the field-value is `*`, or having a selected representation with an
    #   entity-tag that does not match any of those listed in the field-value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @return [Response] A Response object with data of type {OCI::Dns::Models::View View}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/get_view.rb.html) to see an example of how to use get_view API.
    def get_view(view_id, opts = {})
      logger.debug 'Calling operation DnsClient#get_view.' if logger

      raise "Missing the required parameter 'view_id' when calling get_view." if view_id.nil?

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end
      raise "Parameter value for 'view_id' must not be blank" if OCI::Internal::Util.blank_string?(view_id)

      path = '/views/{viewId}'.sub('{viewId}', view_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:scope] = opts[:scope] if opts[:scope]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-modified-since'] = opts[:if_modified_since] if opts[:if_modified_since]
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#get_view') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::View'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets information about the specified zone, including its creation date, zone type, and serial.
    #
    # When the zone name is provided as a path parameter and `PRIVATE` is used for the scope query
    # parameter then the viewId query parameter is required.
    #
    # @param [String] zone_name_or_id The name or OCID of the target zone.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_none_match The `If-None-Match` header field makes the request method conditional on
    #   the absence of any current representation of the target resource, when
    #   the field-value is `*`, or having a selected representation with an
    #   entity-tag that does not match any of those listed in the field-value.
    #
    # @option opts [String] :if_modified_since The `If-Modified-Since` header field makes a GET or HEAD request method
    #   conditional on the selected representation's modification date being more
    #   recent than the date provided in the field-value.  Transfer of the
    #   selected representation's data is avoided if that data has not changed.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @option opts [String] :view_id The OCID of the view the resource is associated with.
    # @option opts [String] :compartment_id The OCID of the compartment the zone belongs to.
    #
    #   This parameter is deprecated and should be omitted.
    #
    # @return [Response] A Response object with data of type {OCI::Dns::Models::Zone Zone}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/get_zone.rb.html) to see an example of how to use get_zone API.
    def get_zone(zone_name_or_id, opts = {})
      logger.debug 'Calling operation DnsClient#get_zone.' if logger

      raise "Missing the required parameter 'zone_name_or_id' when calling get_zone." if zone_name_or_id.nil?

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end
      raise "Parameter value for 'zone_name_or_id' must not be blank" if OCI::Internal::Util.blank_string?(zone_name_or_id)

      path = '/zones/{zoneNameOrId}'.sub('{zoneNameOrId}', zone_name_or_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:scope] = opts[:scope] if opts[:scope]
      query_params[:viewId] = opts[:view_id] if opts[:view_id]
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      header_params[:'if-modified-since'] = opts[:if_modified_since] if opts[:if_modified_since]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#get_zone') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::Zone'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the requested zone's zone file.
    #
    # @param [String] zone_name_or_id The name or OCID of the target zone.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_none_match The `If-None-Match` header field makes the request method conditional on
    #   the absence of any current representation of the target resource, when
    #   the field-value is `*`, or having a selected representation with an
    #   entity-tag that does not match any of those listed in the field-value.
    #
    # @option opts [String] :if_modified_since The `If-Modified-Since` header field makes a GET or HEAD request method
    #   conditional on the selected representation's modification date being more
    #   recent than the date provided in the field-value.  Transfer of the
    #   selected representation's data is avoided if that data has not changed.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @option opts [String] :view_id The OCID of the view the resource is associated with.
    # @option opts [String, IO] :response_target Streaming http body into a file (specified by file name or File object) or IO object if the block is not given
    # @option [Block] &block Streaming http body to the block
    # @return [Response] A Response object with data of type String if response_target and block are not given, otherwise with nil data
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/get_zone_content.rb.html) to see an example of how to use get_zone_content API.
    def get_zone_content(zone_name_or_id, opts = {}, &block)
      logger.debug 'Calling operation DnsClient#get_zone_content.' if logger

      raise "Missing the required parameter 'zone_name_or_id' when calling get_zone_content." if zone_name_or_id.nil?

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end
      raise "Parameter value for 'zone_name_or_id' must not be blank" if OCI::Internal::Util.blank_string?(zone_name_or_id)

      path = '/zones/{zoneNameOrId}/content'.sub('{zoneNameOrId}', zone_name_or_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:scope] = opts[:scope] if opts[:scope]
      query_params[:viewId] = opts[:view_id] if opts[:view_id]

      # Header Params
      header_params = {}
      header_params[:accept] = opts[:accept] if opts[:accept]
      header_params[:accept] ||= 'text/dns'
      header_params[:'accept-encoding'] = opts[:accept_encoding] if opts[:accept_encoding]
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      header_params[:'if-modified-since'] = opts[:if_modified_since] if opts[:if_modified_since]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#get_zone_content') do
        if !block.nil?
          @api_client.call_api(
            :GET,
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
              :GET,
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
                :GET,
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
            :GET,
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


    # Gets all records in the specified zone.
    #
    # The results are sorted by `domain` in alphabetical order by default. For more information about records,
    # see [Resource Record (RR) TYPEs](https://www.iana.org/assignments/dns-parameters/dns-parameters.xhtml#dns-parameters-4).
    # When the zone name is provided as a path parameter and `PRIVATE` is used for the scope query parameter
    # then the viewId query parameter is required.
    #
    # @param [String] zone_name_or_id The name or OCID of the target zone.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_none_match The `If-None-Match` header field makes the request method conditional on
    #   the absence of any current representation of the target resource, when
    #   the field-value is `*`, or having a selected representation with an
    #   entity-tag that does not match any of those listed in the field-value.
    #
    # @option opts [String] :if_modified_since The `If-Modified-Since` header field makes a GET or HEAD request method
    #   conditional on the selected representation's modification date being more
    #   recent than the date provided in the field-value.  Transfer of the
    #   selected representation's data is avoided if that data has not changed.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a page of the collection.
    #    (default to 50)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [String] :zone_version The version of the zone for which data is requested.
    #
    # @option opts [String] :domain Search by domain.
    #   Will match any record whose domain (case-insensitive) equals the provided value.
    #
    # @option opts [String] :domain_contains Search by domain.
    #   Will match any record whose domain (case-insensitive) contains the provided value.
    #
    # @option opts [String] :rtype Search by record type.
    #   Will match any record whose [type](https://www.iana.org/assignments/dns-parameters/dns-parameters.xhtml#dns-parameters-4) (case-insensitive) equals the provided value.
    #
    # @option opts [String] :sort_by The field by which to sort records. (default to domain)
    #   Allowed values are: domain, rtype, ttl
    # @option opts [String] :sort_order The order to sort the resources.
    #    (default to ASC)
    # @option opts [String] :compartment_id The OCID of the compartment the zone belongs to.
    #
    #   This parameter is deprecated and should be omitted.
    #
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @option opts [String] :view_id The OCID of the view the resource is associated with.
    # @return [Response] A Response object with data of type {OCI::Dns::Models::RecordCollection RecordCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/get_zone_records.rb.html) to see an example of how to use get_zone_records API.
    def get_zone_records(zone_name_or_id, opts = {})
      logger.debug 'Calling operation DnsClient#get_zone_records.' if logger

      raise "Missing the required parameter 'zone_name_or_id' when calling get_zone_records." if zone_name_or_id.nil?

      if opts[:sort_by] && !%w[domain rtype ttl].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of domain, rtype, ttl.'
      end

      if opts[:sort_order] && !OCI::Dns::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Dns::Models::SORT_ORDER_ENUM.'
      end

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end
      raise "Parameter value for 'zone_name_or_id' must not be blank" if OCI::Internal::Util.blank_string?(zone_name_or_id)

      path = '/zones/{zoneNameOrId}/records'.sub('{zoneNameOrId}', zone_name_or_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:zoneVersion] = opts[:zone_version] if opts[:zone_version]
      query_params[:domain] = opts[:domain] if opts[:domain]
      query_params[:domainContains] = opts[:domain_contains] if opts[:domain_contains]
      query_params[:rtype] = opts[:rtype] if opts[:rtype]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:scope] = opts[:scope] if opts[:scope]
      query_params[:viewId] = opts[:view_id] if opts[:view_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      header_params[:'if-modified-since'] = opts[:if_modified_since] if opts[:if_modified_since]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#get_zone_records') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::RecordCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of all endpoints within a resolver. The collection can be filtered by name or lifecycle state.
    # It can be sorted on creation time or name both in ASC or DESC order. Note that when no lifecycleState
    # query parameter is provided, the collection does not include resolver endpoints in the DELETED
    # lifecycle state to be consistent with other operations of the API.
    #
    # @param [String] resolver_id The OCID of the target resolver.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [String] :name The name of a resource.
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a page of the collection.
    #    (default to 50)
    # @option opts [String] :sort_order The order to sort the resources.
    #    (default to DESC)
    # @option opts [String] :sort_by The field by which to sort resolver endpoints. (default to timeCreated)
    #   Allowed values are: name, timeCreated
    # @option opts [String] :lifecycle_state The state of a resource.
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Dns::Models::ResolverEndpointSummary ResolverEndpointSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/list_resolver_endpoints.rb.html) to see an example of how to use list_resolver_endpoints API.
    def list_resolver_endpoints(resolver_id, opts = {})
      logger.debug 'Calling operation DnsClient#list_resolver_endpoints.' if logger

      raise "Missing the required parameter 'resolver_id' when calling list_resolver_endpoints." if resolver_id.nil?

      if opts[:sort_order] && !OCI::Dns::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Dns::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[name timeCreated].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of name, timeCreated.'
      end

      if opts[:lifecycle_state] && !OCI::Dns::Models::ResolverEndpointSummary::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Dns::Models::ResolverEndpointSummary::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end
      raise "Parameter value for 'resolver_id' must not be blank" if OCI::Internal::Util.blank_string?(resolver_id)

      path = '/resolvers/{resolverId}/endpoints'.sub('{resolverId}', resolver_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:scope] = opts[:scope] if opts[:scope]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#list_resolver_endpoints') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Dns::Models::ResolverEndpointSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of all resolvers within a compartment.
    #
    # The collection can be filtered by display name, id, or lifecycle state. It can be sorted
    # on creation time or displayName both in ASC or DESC order. Note that when no lifecycleState
    # query parameter is provided, the collection does not include resolvers in the DELETED
    # lifecycleState to be consistent with other operations of the API.
    #
    # @param [String] compartment_id The OCID of the compartment the resource belongs to.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [String] :display_name The displayName of a resource.
    # @option opts [String] :id The OCID of a resource.
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a page of the collection.
    #    (default to 50)
    # @option opts [String] :sort_order The order to sort the resources.
    #    (default to DESC)
    # @option opts [String] :sort_by The field by which to sort resolvers. (default to timeCreated)
    #   Allowed values are: displayName, timeCreated
    # @option opts [String] :lifecycle_state The state of a resource.
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Dns::Models::ResolverSummary ResolverSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/list_resolvers.rb.html) to see an example of how to use list_resolvers API.
    def list_resolvers(compartment_id, opts = {})
      logger.debug 'Calling operation DnsClient#list_resolvers.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_resolvers." if compartment_id.nil?

      if opts[:sort_order] && !OCI::Dns::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Dns::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[displayName timeCreated].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of displayName, timeCreated.'
      end

      if opts[:lifecycle_state] && !OCI::Dns::Models::ResolverSummary::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Dns::Models::ResolverSummary::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end

      path = '/resolvers'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:id] = opts[:id] if opts[:id]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:scope] = opts[:scope] if opts[:scope]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#list_resolvers') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Dns::Models::ResolverSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of all steering policies in the specified compartment.
    #
    # @param [String] compartment_id The OCID of the compartment the resource belongs to.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a page of the collection.
    #    (default to 50)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [String] :id The OCID of a resource.
    # @option opts [String] :display_name The displayName of a resource.
    # @option opts [String] :display_name_contains The partial displayName of a resource. Will match any resource whose name
    #   (case-insensitive) contains the provided value.
    #
    # @option opts [String] :health_check_monitor_id Search by health check monitor OCID.
    #   Will match any resource whose health check monitor ID matches the provided value.
    #
    # @option opts [DateTime] :time_created_greater_than_or_equal_to An [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) timestamp that states
    #   all returned resources were created on or after the indicated time.
    #
    # @option opts [DateTime] :time_created_less_than An [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) timestamp that states
    #   all returned resources were created before the indicated time.
    #
    # @option opts [String] :template Search by steering template type.
    #   Will match any resource whose template type matches the provided value.
    #
    # @option opts [String] :lifecycle_state The state of a resource. (default to ACTIVE)
    # @option opts [String] :sort_by The field by which to sort steering policies. If unspecified, defaults to `timeCreated`. (default to timeCreated)
    #   Allowed values are: displayName, timeCreated, template
    # @option opts [String] :sort_order The order to sort the resources.
    #    (default to DESC)
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Dns::Models::SteeringPolicySummary SteeringPolicySummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/list_steering_policies.rb.html) to see an example of how to use list_steering_policies API.
    def list_steering_policies(compartment_id, opts = {})
      logger.debug 'Calling operation DnsClient#list_steering_policies.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_steering_policies." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::Dns::Models::SteeringPolicySummary::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Dns::Models::SteeringPolicySummary::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_by] && !%w[displayName timeCreated template].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of displayName, timeCreated, template.'
      end

      if opts[:sort_order] && !OCI::Dns::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Dns::Models::SORT_ORDER_ENUM.'
      end

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end

      path = '/steeringPolicies'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:id] = opts[:id] if opts[:id]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:displayNameContains] = opts[:display_name_contains] if opts[:display_name_contains]
      query_params[:healthCheckMonitorId] = opts[:health_check_monitor_id] if opts[:health_check_monitor_id]
      query_params[:timeCreatedGreaterThanOrEqualTo] = opts[:time_created_greater_than_or_equal_to] if opts[:time_created_greater_than_or_equal_to]
      query_params[:timeCreatedLessThan] = opts[:time_created_less_than] if opts[:time_created_less_than]
      query_params[:template] = opts[:template] if opts[:template]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:scope] = opts[:scope] if opts[:scope]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#list_steering_policies') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Dns::Models::SteeringPolicySummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the steering policy attachments in the specified compartment.
    #
    # @param [String] compartment_id The OCID of the compartment the resource belongs to.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a page of the collection.
    #    (default to 50)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [String] :id The OCID of a resource.
    # @option opts [String] :display_name The displayName of a resource.
    # @option opts [String] :steering_policy_id Search by steering policy OCID.
    #   Will match any resource whose steering policy ID matches the provided value.
    #
    # @option opts [String] :zone_id Search by zone OCID.
    #   Will match any resource whose zone ID matches the provided value.
    #
    # @option opts [String] :domain Search by domain.
    #   Will match any record whose domain (case-insensitive) equals the provided value.
    #
    # @option opts [String] :domain_contains Search by domain.
    #   Will match any record whose domain (case-insensitive) contains the provided value.
    #
    # @option opts [DateTime] :time_created_greater_than_or_equal_to An [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) timestamp that states
    #   all returned resources were created on or after the indicated time.
    #
    # @option opts [DateTime] :time_created_less_than An [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) timestamp that states
    #   all returned resources were created before the indicated time.
    #
    # @option opts [String] :lifecycle_state The state of a resource. (default to ACTIVE)
    # @option opts [String] :sort_by The field by which to sort steering policy attachments. If unspecified, defaults to `timeCreated`. (default to timeCreated)
    #   Allowed values are: displayName, timeCreated, domainName
    # @option opts [String] :sort_order The order to sort the resources.
    #    (default to DESC)
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Dns::Models::SteeringPolicyAttachmentSummary SteeringPolicyAttachmentSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/list_steering_policy_attachments.rb.html) to see an example of how to use list_steering_policy_attachments API.
    def list_steering_policy_attachments(compartment_id, opts = {})
      logger.debug 'Calling operation DnsClient#list_steering_policy_attachments.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_steering_policy_attachments." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::Dns::Models::SteeringPolicyAttachmentSummary::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Dns::Models::SteeringPolicyAttachmentSummary::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_by] && !%w[displayName timeCreated domainName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of displayName, timeCreated, domainName.'
      end

      if opts[:sort_order] && !OCI::Dns::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Dns::Models::SORT_ORDER_ENUM.'
      end

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end

      path = '/steeringPolicyAttachments'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:id] = opts[:id] if opts[:id]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:steeringPolicyId] = opts[:steering_policy_id] if opts[:steering_policy_id]
      query_params[:zoneId] = opts[:zone_id] if opts[:zone_id]
      query_params[:domain] = opts[:domain] if opts[:domain]
      query_params[:domainContains] = opts[:domain_contains] if opts[:domain_contains]
      query_params[:timeCreatedGreaterThanOrEqualTo] = opts[:time_created_greater_than_or_equal_to] if opts[:time_created_greater_than_or_equal_to]
      query_params[:timeCreatedLessThan] = opts[:time_created_less_than] if opts[:time_created_less_than]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:scope] = opts[:scope] if opts[:scope]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#list_steering_policy_attachments') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Dns::Models::SteeringPolicyAttachmentSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of all TSIG keys in the specified compartment.
    #
    # @param [String] compartment_id The OCID of the compartment the resource belongs to.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a page of the collection.
    #    (default to 50)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [String] :id The OCID of a resource.
    # @option opts [String] :name The name of a resource.
    # @option opts [String] :lifecycle_state The state of a resource.
    # @option opts [String] :sort_by The field by which to sort TSIG keys. If unspecified, defaults to `timeCreated`. (default to timeCreated)
    #   Allowed values are: name, timeCreated
    # @option opts [String] :sort_order The order to sort the resources.
    #    (default to DESC)
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Dns::Models::TsigKeySummary TsigKeySummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/list_tsig_keys.rb.html) to see an example of how to use list_tsig_keys API.
    def list_tsig_keys(compartment_id, opts = {})
      logger.debug 'Calling operation DnsClient#list_tsig_keys.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_tsig_keys." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::Dns::Models::TsigKeySummary::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Dns::Models::TsigKeySummary::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_by] && !%w[name timeCreated].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of name, timeCreated.'
      end

      if opts[:sort_order] && !OCI::Dns::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Dns::Models::SORT_ORDER_ENUM.'
      end

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end

      path = '/tsigKeys'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:id] = opts[:id] if opts[:id]
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:scope] = opts[:scope] if opts[:scope]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#list_tsig_keys') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Dns::Models::TsigKeySummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of all views within a compartment.
    #
    # The collection can be filtered by display name, id, or lifecycle state. It can be sorted
    # on creation time or displayName both in ASC or DESC order. Note that when no lifecycleState
    # query parameter is provided, the collection does not include views in the DELETED
    # lifecycleState to be consistent with other operations of the API.
    #
    # @param [String] compartment_id The OCID of the compartment the resource belongs to.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [String] :display_name The displayName of a resource.
    # @option opts [String] :id The OCID of a resource.
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a page of the collection.
    #    (default to 50)
    # @option opts [String] :sort_order The order to sort the resources.
    #    (default to DESC)
    # @option opts [String] :sort_by The field by which to sort views. (default to timeCreated)
    #   Allowed values are: displayName, timeCreated
    # @option opts [String] :lifecycle_state The state of a resource.
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Dns::Models::ViewSummary ViewSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/list_views.rb.html) to see an example of how to use list_views API.
    def list_views(compartment_id, opts = {})
      logger.debug 'Calling operation DnsClient#list_views.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_views." if compartment_id.nil?

      if opts[:sort_order] && !OCI::Dns::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Dns::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[displayName timeCreated].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of displayName, timeCreated.'
      end

      if opts[:lifecycle_state] && !OCI::Dns::Models::ViewSummary::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Dns::Models::ViewSummary::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end

      path = '/views'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:id] = opts[:id] if opts[:id]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:scope] = opts[:scope] if opts[:scope]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#list_views') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Dns::Models::ViewSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of IP addresses of OCI nameservers for inbound and outbound transfer of zones in the specified
    # compartment (which must be the root compartment of a tenancy) that transfer zone data with external master or
    # downstream nameservers.
    #
    # @param [String] compartment_id The OCID of the compartment the resource belongs to.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Dns::Models::ZoneTransferServer ZoneTransferServer}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/list_zone_transfer_servers.rb.html) to see an example of how to use list_zone_transfer_servers API.
    def list_zone_transfer_servers(compartment_id, opts = {})
      logger.debug 'Calling operation DnsClient#list_zone_transfer_servers.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_zone_transfer_servers." if compartment_id.nil?

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end

      path = '/zoneTransferServers'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:scope] = opts[:scope] if opts[:scope]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#list_zone_transfer_servers') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Dns::Models::ZoneTransferServer>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of all zones in the specified compartment.
    #
    # The collection can be filtered by name, time created, scope, associated view, and zone type.
    # Filtering by view is only supported for private zones.
    #
    # @param [String] compartment_id The OCID of the compartment the resource belongs to.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a page of the collection.
    #    (default to 50)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [String] :name A case-sensitive filter for zone names.
    #   Will match any zone with a name that equals the provided value.
    #
    # @option opts [String] :name_contains Search by zone name.
    #   Will match any zone whose name (case-insensitive) contains the provided value.
    #
    # @option opts [String] :zone_type Search by zone type, `PRIMARY` or `SECONDARY`.
    #   Will match any zone whose type equals the provided value.
    #
    #   Allowed values are: PRIMARY, SECONDARY
    # @option opts [DateTime] :time_created_greater_than_or_equal_to An [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) timestamp that states
    #   all returned resources were created on or after the indicated time.
    #
    # @option opts [DateTime] :time_created_less_than An [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) timestamp that states
    #   all returned resources were created before the indicated time.
    #
    # @option opts [String] :lifecycle_state The state of a resource. (default to ACTIVE)
    #   Allowed values are: ACTIVE, CREATING, DELETED, DELETING, FAILED, UPDATING
    # @option opts [String] :sort_by The field by which to sort zones. (default to timeCreated)
    #   Allowed values are: name, zoneType, timeCreated
    # @option opts [String] :sort_order The order to sort the resources.
    #    (default to DESC)
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @option opts [String] :view_id The OCID of the view the resource is associated with.
    # @option opts [String] :tsig_key_id Search for zones that are associated with a TSIG key.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Dns::Models::ZoneSummary ZoneSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/list_zones.rb.html) to see an example of how to use list_zones API.
    def list_zones(compartment_id, opts = {})
      logger.debug 'Calling operation DnsClient#list_zones.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_zones." if compartment_id.nil?

      if opts[:zone_type] && !%w[PRIMARY SECONDARY].include?(opts[:zone_type])
        raise 'Invalid value for "zone_type", must be one of PRIMARY, SECONDARY.'
      end

      if opts[:lifecycle_state] && !%w[ACTIVE CREATING DELETED DELETING FAILED UPDATING].include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of ACTIVE, CREATING, DELETED, DELETING, FAILED, UPDATING.'
      end

      if opts[:sort_by] && !%w[name zoneType timeCreated].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of name, zoneType, timeCreated.'
      end

      if opts[:sort_order] && !OCI::Dns::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Dns::Models::SORT_ORDER_ENUM.'
      end

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end

      path = '/zones'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:nameContains] = opts[:name_contains] if opts[:name_contains]
      query_params[:zoneType] = opts[:zone_type] if opts[:zone_type]
      query_params[:timeCreatedGreaterThanOrEqualTo] = opts[:time_created_greater_than_or_equal_to] if opts[:time_created_greater_than_or_equal_to]
      query_params[:timeCreatedLessThan] = opts[:time_created_less_than] if opts[:time_created_less_than]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:scope] = opts[:scope] if opts[:scope]
      query_params[:viewId] = opts[:view_id] if opts[:view_id]
      query_params[:tsigKeyId] = opts[:tsig_key_id] if opts[:tsig_key_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#list_zones') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Dns::Models::ZoneSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates records in the specified zone at a domain.
    #
    # You can update one record or all records for the specified zone depending on the changes provided in the
    # request body. You can also add or remove records using this function. When the zone name is provided as
    # a path parameter and `PRIVATE` is used for the scope query parameter then the viewId query parameter is
    # required.
    #
    # @param [String] zone_name_or_id The name or OCID of the target zone.
    # @param [String] domain The target fully-qualified domain name (FQDN) within the target zone.
    # @param [OCI::Dns::Models::PatchDomainRecordsDetails] patch_domain_records_details Operations describing how to modify the collection of records.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The `If-Match` header field makes the request method conditional on the
    #   existence of at least one current representation of the target resource,
    #   when the field-value is `*`, or having a current representation of the
    #   target resource that has an entity-tag matching a member of the list of
    #   entity-tags provided in the field-value.
    #
    # @option opts [String] :if_unmodified_since The `If-Unmodified-Since` header field makes the request method
    #   conditional on the selected representation's last modification date being
    #   earlier than or equal to the date provided in the field-value.  This
    #   field accomplishes the same purpose as If-Match for cases where the user
    #   agent does not have an entity-tag for the representation.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @option opts [String] :view_id The OCID of the view the resource is associated with.
    # @option opts [String] :compartment_id The OCID of the compartment the zone belongs to.
    #
    #   This parameter is deprecated and should be omitted.
    #
    # @return [Response] A Response object with data of type {OCI::Dns::Models::RecordCollection RecordCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/patch_domain_records.rb.html) to see an example of how to use patch_domain_records API.
    def patch_domain_records(zone_name_or_id, domain, patch_domain_records_details, opts = {})
      logger.debug 'Calling operation DnsClient#patch_domain_records.' if logger

      raise "Missing the required parameter 'zone_name_or_id' when calling patch_domain_records." if zone_name_or_id.nil?
      raise "Missing the required parameter 'domain' when calling patch_domain_records." if domain.nil?
      raise "Missing the required parameter 'patch_domain_records_details' when calling patch_domain_records." if patch_domain_records_details.nil?

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end
      raise "Parameter value for 'zone_name_or_id' must not be blank" if OCI::Internal::Util.blank_string?(zone_name_or_id)
      raise "Parameter value for 'domain' must not be blank" if OCI::Internal::Util.blank_string?(domain)

      path = '/zones/{zoneNameOrId}/records/{domain}'.sub('{zoneNameOrId}', zone_name_or_id.to_s).sub('{domain}', domain.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:scope] = opts[:scope] if opts[:scope]
      query_params[:viewId] = opts[:view_id] if opts[:view_id]
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-unmodified-since'] = opts[:if_unmodified_since] if opts[:if_unmodified_since]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(patch_domain_records_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#patch_domain_records') do
        @api_client.call_api(
          :PATCH,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::RecordCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates records in the specified RRSet.
    #
    # When the zone name is provided as a path parameter and `PRIVATE` is used for the scope query
    # parameter then the viewId query parameter is required.
    #
    # @param [String] zone_name_or_id The name or OCID of the target zone.
    # @param [String] domain The target fully-qualified domain name (FQDN) within the target zone.
    # @param [String] rtype The type of the target RRSet within the target zone.
    # @param [OCI::Dns::Models::PatchRRSetDetails] patch_rr_set_details Operations describing how to modify the collection of records.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The `If-Match` header field makes the request method conditional on the
    #   existence of at least one current representation of the target resource,
    #   when the field-value is `*`, or having a current representation of the
    #   target resource that has an entity-tag matching a member of the list of
    #   entity-tags provided in the field-value.
    #
    # @option opts [String] :if_unmodified_since The `If-Unmodified-Since` header field makes the request method
    #   conditional on the selected representation's last modification date being
    #   earlier than or equal to the date provided in the field-value.  This
    #   field accomplishes the same purpose as If-Match for cases where the user
    #   agent does not have an entity-tag for the representation.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @option opts [String] :view_id The OCID of the view the resource is associated with.
    # @option opts [String] :compartment_id The OCID of the compartment the zone belongs to.
    #
    #   This parameter is deprecated and should be omitted.
    #
    # @return [Response] A Response object with data of type {OCI::Dns::Models::RecordCollection RecordCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/patch_rr_set.rb.html) to see an example of how to use patch_rr_set API.
    def patch_rr_set(zone_name_or_id, domain, rtype, patch_rr_set_details, opts = {})
      logger.debug 'Calling operation DnsClient#patch_rr_set.' if logger

      raise "Missing the required parameter 'zone_name_or_id' when calling patch_rr_set." if zone_name_or_id.nil?
      raise "Missing the required parameter 'domain' when calling patch_rr_set." if domain.nil?
      raise "Missing the required parameter 'rtype' when calling patch_rr_set." if rtype.nil?
      raise "Missing the required parameter 'patch_rr_set_details' when calling patch_rr_set." if patch_rr_set_details.nil?

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end
      raise "Parameter value for 'zone_name_or_id' must not be blank" if OCI::Internal::Util.blank_string?(zone_name_or_id)
      raise "Parameter value for 'domain' must not be blank" if OCI::Internal::Util.blank_string?(domain)
      raise "Parameter value for 'rtype' must not be blank" if OCI::Internal::Util.blank_string?(rtype)

      path = '/zones/{zoneNameOrId}/records/{domain}/{rtype}'.sub('{zoneNameOrId}', zone_name_or_id.to_s).sub('{domain}', domain.to_s).sub('{rtype}', rtype.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:scope] = opts[:scope] if opts[:scope]
      query_params[:viewId] = opts[:view_id] if opts[:view_id]
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-unmodified-since'] = opts[:if_unmodified_since] if opts[:if_unmodified_since]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(patch_rr_set_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#patch_rr_set') do
        @api_client.call_api(
          :PATCH,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::RecordCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates a collection of records in the specified zone.
    #
    # You can update one record or all records for the specified zone depending on the changes provided in the
    # request body. You can also add or remove records using this function. When the zone name is provided as
    # a path parameter and `PRIVATE` is used for the scope query parameter then the viewId query parameter is
    # required.
    #
    # @param [String] zone_name_or_id The name or OCID of the target zone.
    # @param [OCI::Dns::Models::PatchZoneRecordsDetails] patch_zone_records_details The operations describing how to modify the collection of records.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The `If-Match` header field makes the request method conditional on the
    #   existence of at least one current representation of the target resource,
    #   when the field-value is `*`, or having a current representation of the
    #   target resource that has an entity-tag matching a member of the list of
    #   entity-tags provided in the field-value.
    #
    # @option opts [String] :if_unmodified_since The `If-Unmodified-Since` header field makes the request method
    #   conditional on the selected representation's last modification date being
    #   earlier than or equal to the date provided in the field-value.  This
    #   field accomplishes the same purpose as If-Match for cases where the user
    #   agent does not have an entity-tag for the representation.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @option opts [String] :view_id The OCID of the view the resource is associated with.
    # @option opts [String] :compartment_id The OCID of the compartment the zone belongs to.
    #
    #   This parameter is deprecated and should be omitted.
    #
    # @return [Response] A Response object with data of type {OCI::Dns::Models::RecordCollection RecordCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/patch_zone_records.rb.html) to see an example of how to use patch_zone_records API.
    def patch_zone_records(zone_name_or_id, patch_zone_records_details, opts = {})
      logger.debug 'Calling operation DnsClient#patch_zone_records.' if logger

      raise "Missing the required parameter 'zone_name_or_id' when calling patch_zone_records." if zone_name_or_id.nil?
      raise "Missing the required parameter 'patch_zone_records_details' when calling patch_zone_records." if patch_zone_records_details.nil?

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end
      raise "Parameter value for 'zone_name_or_id' must not be blank" if OCI::Internal::Util.blank_string?(zone_name_or_id)

      path = '/zones/{zoneNameOrId}/records'.sub('{zoneNameOrId}', zone_name_or_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:scope] = opts[:scope] if opts[:scope]
      query_params[:viewId] = opts[:view_id] if opts[:view_id]
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-unmodified-since'] = opts[:if_unmodified_since] if opts[:if_unmodified_since]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(patch_zone_records_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#patch_zone_records') do
        @api_client.call_api(
          :PATCH,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::RecordCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Replaces records in the specified zone at a domain with the records specified in the request body.
    #
    # If a specified record does not exist, it will be created. If the record exists, then it will be updated to
    # represent the record in the body of the request. If a record in the zone does not exist in the request body,
    # the record will be removed from the zone. When the zone name is provided as a path parameter and `PRIVATE`
    # is used for the scope query parameter then the viewId query parameter is required.
    #
    # @param [String] zone_name_or_id The name or OCID of the target zone.
    # @param [String] domain The target fully-qualified domain name (FQDN) within the target zone.
    # @param [OCI::Dns::Models::UpdateDomainRecordsDetails] update_domain_records_details A full list of records for the domain.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The `If-Match` header field makes the request method conditional on the
    #   existence of at least one current representation of the target resource,
    #   when the field-value is `*`, or having a current representation of the
    #   target resource that has an entity-tag matching a member of the list of
    #   entity-tags provided in the field-value.
    #
    # @option opts [String] :if_unmodified_since The `If-Unmodified-Since` header field makes the request method
    #   conditional on the selected representation's last modification date being
    #   earlier than or equal to the date provided in the field-value.  This
    #   field accomplishes the same purpose as If-Match for cases where the user
    #   agent does not have an entity-tag for the representation.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @option opts [String] :view_id The OCID of the view the resource is associated with.
    # @option opts [String] :compartment_id The OCID of the compartment the zone belongs to.
    #
    #   This parameter is deprecated and should be omitted.
    #
    # @return [Response] A Response object with data of type {OCI::Dns::Models::RecordCollection RecordCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/update_domain_records.rb.html) to see an example of how to use update_domain_records API.
    def update_domain_records(zone_name_or_id, domain, update_domain_records_details, opts = {})
      logger.debug 'Calling operation DnsClient#update_domain_records.' if logger

      raise "Missing the required parameter 'zone_name_or_id' when calling update_domain_records." if zone_name_or_id.nil?
      raise "Missing the required parameter 'domain' when calling update_domain_records." if domain.nil?
      raise "Missing the required parameter 'update_domain_records_details' when calling update_domain_records." if update_domain_records_details.nil?

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end
      raise "Parameter value for 'zone_name_or_id' must not be blank" if OCI::Internal::Util.blank_string?(zone_name_or_id)
      raise "Parameter value for 'domain' must not be blank" if OCI::Internal::Util.blank_string?(domain)

      path = '/zones/{zoneNameOrId}/records/{domain}'.sub('{zoneNameOrId}', zone_name_or_id.to_s).sub('{domain}', domain.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:scope] = opts[:scope] if opts[:scope]
      query_params[:viewId] = opts[:view_id] if opts[:view_id]
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-unmodified-since'] = opts[:if_unmodified_since] if opts[:if_unmodified_since]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_domain_records_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#update_domain_records') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::RecordCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the specified resolver with your new information.
    #
    # @param [String] resolver_id The OCID of the target resolver.
    # @param [OCI::Dns::Models::UpdateResolverDetails] update_resolver_details New data for the resolver.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The `If-Match` header field makes the request method conditional on the
    #   existence of at least one current representation of the target resource,
    #   when the field-value is `*`, or having a current representation of the
    #   target resource that has an entity-tag matching a member of the list of
    #   entity-tags provided in the field-value.
    #
    # @option opts [String] :if_unmodified_since The `If-Unmodified-Since` header field makes the request method
    #   conditional on the selected representation's last modification date being
    #   earlier than or equal to the date provided in the field-value.  This
    #   field accomplishes the same purpose as If-Match for cases where the user
    #   agent does not have an entity-tag for the representation.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @return [Response] A Response object with data of type {OCI::Dns::Models::Resolver Resolver}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/update_resolver.rb.html) to see an example of how to use update_resolver API.
    def update_resolver(resolver_id, update_resolver_details, opts = {})
      logger.debug 'Calling operation DnsClient#update_resolver.' if logger

      raise "Missing the required parameter 'resolver_id' when calling update_resolver." if resolver_id.nil?
      raise "Missing the required parameter 'update_resolver_details' when calling update_resolver." if update_resolver_details.nil?

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end
      raise "Parameter value for 'resolver_id' must not be blank" if OCI::Internal::Util.blank_string?(resolver_id)

      path = '/resolvers/{resolverId}'.sub('{resolverId}', resolver_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:scope] = opts[:scope] if opts[:scope]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-unmodified-since'] = opts[:if_unmodified_since] if opts[:if_unmodified_since]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_resolver_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#update_resolver') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::Resolver'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the specified resolver endpoint with your new information.
    #
    # @param [String] resolver_id The OCID of the target resolver.
    # @param [String] resolver_endpoint_name The name of the target resolver endpoint.
    # @param [OCI::Dns::Models::UpdateResolverEndpointDetails] update_resolver_endpoint_details New data for the resolver endpoint.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The `If-Match` header field makes the request method conditional on the
    #   existence of at least one current representation of the target resource,
    #   when the field-value is `*`, or having a current representation of the
    #   target resource that has an entity-tag matching a member of the list of
    #   entity-tags provided in the field-value.
    #
    # @option opts [String] :if_unmodified_since The `If-Unmodified-Since` header field makes the request method
    #   conditional on the selected representation's last modification date being
    #   earlier than or equal to the date provided in the field-value.  This
    #   field accomplishes the same purpose as If-Match for cases where the user
    #   agent does not have an entity-tag for the representation.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @return [Response] A Response object with data of type {OCI::Dns::Models::ResolverEndpoint ResolverEndpoint}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/update_resolver_endpoint.rb.html) to see an example of how to use update_resolver_endpoint API.
    def update_resolver_endpoint(resolver_id, resolver_endpoint_name, update_resolver_endpoint_details, opts = {})
      logger.debug 'Calling operation DnsClient#update_resolver_endpoint.' if logger

      raise "Missing the required parameter 'resolver_id' when calling update_resolver_endpoint." if resolver_id.nil?
      raise "Missing the required parameter 'resolver_endpoint_name' when calling update_resolver_endpoint." if resolver_endpoint_name.nil?
      raise "Missing the required parameter 'update_resolver_endpoint_details' when calling update_resolver_endpoint." if update_resolver_endpoint_details.nil?

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end
      raise "Parameter value for 'resolver_id' must not be blank" if OCI::Internal::Util.blank_string?(resolver_id)
      raise "Parameter value for 'resolver_endpoint_name' must not be blank" if OCI::Internal::Util.blank_string?(resolver_endpoint_name)

      path = '/resolvers/{resolverId}/endpoints/{resolverEndpointName}'.sub('{resolverId}', resolver_id.to_s).sub('{resolverEndpointName}', resolver_endpoint_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:scope] = opts[:scope] if opts[:scope]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-unmodified-since'] = opts[:if_unmodified_since] if opts[:if_unmodified_since]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_resolver_endpoint_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#update_resolver_endpoint') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::ResolverEndpoint'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Replaces records in the specified RRSet.
    #
    # When the zone name is provided as a path parameter and `PRIVATE` is used for the scope
    # query parameter then the viewId query parameter is required.
    #
    # @param [String] zone_name_or_id The name or OCID of the target zone.
    # @param [String] domain The target fully-qualified domain name (FQDN) within the target zone.
    # @param [String] rtype The type of the target RRSet within the target zone.
    # @param [OCI::Dns::Models::UpdateRRSetDetails] update_rr_set_details A full list of records for the RRSet.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The `If-Match` header field makes the request method conditional on the
    #   existence of at least one current representation of the target resource,
    #   when the field-value is `*`, or having a current representation of the
    #   target resource that has an entity-tag matching a member of the list of
    #   entity-tags provided in the field-value.
    #
    # @option opts [String] :if_unmodified_since The `If-Unmodified-Since` header field makes the request method
    #   conditional on the selected representation's last modification date being
    #   earlier than or equal to the date provided in the field-value.  This
    #   field accomplishes the same purpose as If-Match for cases where the user
    #   agent does not have an entity-tag for the representation.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @option opts [String] :view_id The OCID of the view the resource is associated with.
    # @option opts [String] :compartment_id The OCID of the compartment the zone belongs to.
    #
    #   This parameter is deprecated and should be omitted.
    #
    # @return [Response] A Response object with data of type {OCI::Dns::Models::RecordCollection RecordCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/update_rr_set.rb.html) to see an example of how to use update_rr_set API.
    def update_rr_set(zone_name_or_id, domain, rtype, update_rr_set_details, opts = {})
      logger.debug 'Calling operation DnsClient#update_rr_set.' if logger

      raise "Missing the required parameter 'zone_name_or_id' when calling update_rr_set." if zone_name_or_id.nil?
      raise "Missing the required parameter 'domain' when calling update_rr_set." if domain.nil?
      raise "Missing the required parameter 'rtype' when calling update_rr_set." if rtype.nil?
      raise "Missing the required parameter 'update_rr_set_details' when calling update_rr_set." if update_rr_set_details.nil?

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end
      raise "Parameter value for 'zone_name_or_id' must not be blank" if OCI::Internal::Util.blank_string?(zone_name_or_id)
      raise "Parameter value for 'domain' must not be blank" if OCI::Internal::Util.blank_string?(domain)
      raise "Parameter value for 'rtype' must not be blank" if OCI::Internal::Util.blank_string?(rtype)

      path = '/zones/{zoneNameOrId}/records/{domain}/{rtype}'.sub('{zoneNameOrId}', zone_name_or_id.to_s).sub('{domain}', domain.to_s).sub('{rtype}', rtype.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:scope] = opts[:scope] if opts[:scope]
      query_params[:viewId] = opts[:view_id] if opts[:view_id]
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-unmodified-since'] = opts[:if_unmodified_since] if opts[:if_unmodified_since]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_rr_set_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#update_rr_set') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::RecordCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the configuration of the specified steering policy.
    #
    # @param [String] steering_policy_id The OCID of the target steering policy.
    # @param [OCI::Dns::Models::UpdateSteeringPolicyDetails] update_steering_policy_details New data for the steering policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The `If-Match` header field makes the request method conditional on the
    #   existence of at least one current representation of the target resource,
    #   when the field-value is `*`, or having a current representation of the
    #   target resource that has an entity-tag matching a member of the list of
    #   entity-tags provided in the field-value.
    #
    # @option opts [String] :if_unmodified_since The `If-Unmodified-Since` header field makes the request method
    #   conditional on the selected representation's last modification date being
    #   earlier than or equal to the date provided in the field-value.  This
    #   field accomplishes the same purpose as If-Match for cases where the user
    #   agent does not have an entity-tag for the representation.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @return [Response] A Response object with data of type {OCI::Dns::Models::SteeringPolicy SteeringPolicy}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/update_steering_policy.rb.html) to see an example of how to use update_steering_policy API.
    def update_steering_policy(steering_policy_id, update_steering_policy_details, opts = {})
      logger.debug 'Calling operation DnsClient#update_steering_policy.' if logger

      raise "Missing the required parameter 'steering_policy_id' when calling update_steering_policy." if steering_policy_id.nil?
      raise "Missing the required parameter 'update_steering_policy_details' when calling update_steering_policy." if update_steering_policy_details.nil?

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end
      raise "Parameter value for 'steering_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(steering_policy_id)

      path = '/steeringPolicies/{steeringPolicyId}'.sub('{steeringPolicyId}', steering_policy_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:scope] = opts[:scope] if opts[:scope]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-unmodified-since'] = opts[:if_unmodified_since] if opts[:if_unmodified_since]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_steering_policy_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#update_steering_policy') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::SteeringPolicy'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the specified steering policy attachment with your new information.
    #
    # @param [String] steering_policy_attachment_id The OCID of the target steering policy attachment.
    # @param [OCI::Dns::Models::UpdateSteeringPolicyAttachmentDetails] update_steering_policy_attachment_details New data for the steering policy attachment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The `If-Match` header field makes the request method conditional on the
    #   existence of at least one current representation of the target resource,
    #   when the field-value is `*`, or having a current representation of the
    #   target resource that has an entity-tag matching a member of the list of
    #   entity-tags provided in the field-value.
    #
    # @option opts [String] :if_unmodified_since The `If-Unmodified-Since` header field makes the request method
    #   conditional on the selected representation's last modification date being
    #   earlier than or equal to the date provided in the field-value.  This
    #   field accomplishes the same purpose as If-Match for cases where the user
    #   agent does not have an entity-tag for the representation.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @return [Response] A Response object with data of type {OCI::Dns::Models::SteeringPolicyAttachment SteeringPolicyAttachment}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/update_steering_policy_attachment.rb.html) to see an example of how to use update_steering_policy_attachment API.
    def update_steering_policy_attachment(steering_policy_attachment_id, update_steering_policy_attachment_details, opts = {})
      logger.debug 'Calling operation DnsClient#update_steering_policy_attachment.' if logger

      raise "Missing the required parameter 'steering_policy_attachment_id' when calling update_steering_policy_attachment." if steering_policy_attachment_id.nil?
      raise "Missing the required parameter 'update_steering_policy_attachment_details' when calling update_steering_policy_attachment." if update_steering_policy_attachment_details.nil?

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end
      raise "Parameter value for 'steering_policy_attachment_id' must not be blank" if OCI::Internal::Util.blank_string?(steering_policy_attachment_id)

      path = '/steeringPolicyAttachments/{steeringPolicyAttachmentId}'.sub('{steeringPolicyAttachmentId}', steering_policy_attachment_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:scope] = opts[:scope] if opts[:scope]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-unmodified-since'] = opts[:if_unmodified_since] if opts[:if_unmodified_since]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_steering_policy_attachment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#update_steering_policy_attachment') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::SteeringPolicyAttachment'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the specified TSIG key.
    #
    # @param [String] tsig_key_id The OCID of the target TSIG key.
    # @param [OCI::Dns::Models::UpdateTsigKeyDetails] update_tsig_key_details New data for the TSIG key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The `If-Match` header field makes the request method conditional on the
    #   existence of at least one current representation of the target resource,
    #   when the field-value is `*`, or having a current representation of the
    #   target resource that has an entity-tag matching a member of the list of
    #   entity-tags provided in the field-value.
    #
    # @option opts [String] :if_unmodified_since The `If-Unmodified-Since` header field makes the request method
    #   conditional on the selected representation's last modification date being
    #   earlier than or equal to the date provided in the field-value.  This
    #   field accomplishes the same purpose as If-Match for cases where the user
    #   agent does not have an entity-tag for the representation.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @return [Response] A Response object with data of type {OCI::Dns::Models::TsigKey TsigKey}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/update_tsig_key.rb.html) to see an example of how to use update_tsig_key API.
    def update_tsig_key(tsig_key_id, update_tsig_key_details, opts = {})
      logger.debug 'Calling operation DnsClient#update_tsig_key.' if logger

      raise "Missing the required parameter 'tsig_key_id' when calling update_tsig_key." if tsig_key_id.nil?
      raise "Missing the required parameter 'update_tsig_key_details' when calling update_tsig_key." if update_tsig_key_details.nil?

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end
      raise "Parameter value for 'tsig_key_id' must not be blank" if OCI::Internal::Util.blank_string?(tsig_key_id)

      path = '/tsigKeys/{tsigKeyId}'.sub('{tsigKeyId}', tsig_key_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:scope] = opts[:scope] if opts[:scope]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-unmodified-since'] = opts[:if_unmodified_since] if opts[:if_unmodified_since]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_tsig_key_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#update_tsig_key') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::TsigKey'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the specified view with your new information.
    #
    # @param [String] view_id The OCID of the target view.
    # @param [OCI::Dns::Models::UpdateViewDetails] update_view_details New data for the view.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The `If-Match` header field makes the request method conditional on the
    #   existence of at least one current representation of the target resource,
    #   when the field-value is `*`, or having a current representation of the
    #   target resource that has an entity-tag matching a member of the list of
    #   entity-tags provided in the field-value.
    #
    # @option opts [String] :if_unmodified_since The `If-Unmodified-Since` header field makes the request method
    #   conditional on the selected representation's last modification date being
    #   earlier than or equal to the date provided in the field-value.  This
    #   field accomplishes the same purpose as If-Match for cases where the user
    #   agent does not have an entity-tag for the representation.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @return [Response] A Response object with data of type {OCI::Dns::Models::View View}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/update_view.rb.html) to see an example of how to use update_view API.
    def update_view(view_id, update_view_details, opts = {})
      logger.debug 'Calling operation DnsClient#update_view.' if logger

      raise "Missing the required parameter 'view_id' when calling update_view." if view_id.nil?
      raise "Missing the required parameter 'update_view_details' when calling update_view." if update_view_details.nil?

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end
      raise "Parameter value for 'view_id' must not be blank" if OCI::Internal::Util.blank_string?(view_id)

      path = '/views/{viewId}'.sub('{viewId}', view_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:scope] = opts[:scope] if opts[:scope]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-unmodified-since'] = opts[:if_unmodified_since] if opts[:if_unmodified_since]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_view_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#update_view') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::View'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the zone with the specified information.
    #
    # Global secondary zones may have their external masters updated. For more information about secondary
    # zones, see [Manage DNS Service Zone](https://docs.cloud.oracle.com/iaas/Content/DNS/Tasks/managingdnszones.htm). When the zone name
    # is provided as a path parameter and `PRIVATE` is used for the scope query parameter then the viewId
    # query parameter is required.
    #
    # @param [String] zone_name_or_id The name or OCID of the target zone.
    # @param [OCI::Dns::Models::UpdateZoneDetails] update_zone_details New data for the zone.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The `If-Match` header field makes the request method conditional on the
    #   existence of at least one current representation of the target resource,
    #   when the field-value is `*`, or having a current representation of the
    #   target resource that has an entity-tag matching a member of the list of
    #   entity-tags provided in the field-value.
    #
    # @option opts [String] :if_unmodified_since The `If-Unmodified-Since` header field makes the request method
    #   conditional on the selected representation's last modification date being
    #   earlier than or equal to the date provided in the field-value.  This
    #   field accomplishes the same purpose as If-Match for cases where the user
    #   agent does not have an entity-tag for the representation.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @option opts [String] :view_id The OCID of the view the resource is associated with.
    # @option opts [String] :compartment_id The OCID of the compartment the zone belongs to.
    #
    #   This parameter is deprecated and should be omitted.
    #
    # @return [Response] A Response object with data of type {OCI::Dns::Models::Zone Zone}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/update_zone.rb.html) to see an example of how to use update_zone API.
    def update_zone(zone_name_or_id, update_zone_details, opts = {})
      logger.debug 'Calling operation DnsClient#update_zone.' if logger

      raise "Missing the required parameter 'zone_name_or_id' when calling update_zone." if zone_name_or_id.nil?
      raise "Missing the required parameter 'update_zone_details' when calling update_zone." if update_zone_details.nil?

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end
      raise "Parameter value for 'zone_name_or_id' must not be blank" if OCI::Internal::Util.blank_string?(zone_name_or_id)

      path = '/zones/{zoneNameOrId}'.sub('{zoneNameOrId}', zone_name_or_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:scope] = opts[:scope] if opts[:scope]
      query_params[:viewId] = opts[:view_id] if opts[:view_id]
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-unmodified-since'] = opts[:if_unmodified_since] if opts[:if_unmodified_since]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_zone_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#update_zone') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::Zone'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Replaces records in the specified zone with the records specified in the request body.
    #
    # If a specified record does not exist, it will be created. If the record exists, then it will be updated
    # to represent the record in the body of the request. If a record in the zone does not exist in the
    # request body, the record will be removed from the zone. When the zone name is provided as a path
    # parameter and `PRIVATE` is used for the scope query parameter then the viewId query parameter is
    # required.
    #
    # @param [String] zone_name_or_id The name or OCID of the target zone.
    # @param [OCI::Dns::Models::UpdateZoneRecordsDetails] update_zone_records_details A full list of records for the zone.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The `If-Match` header field makes the request method conditional on the
    #   existence of at least one current representation of the target resource,
    #   when the field-value is `*`, or having a current representation of the
    #   target resource that has an entity-tag matching a member of the list of
    #   entity-tags provided in the field-value.
    #
    # @option opts [String] :if_unmodified_since The `If-Unmodified-Since` header field makes the request method
    #   conditional on the selected representation's last modification date being
    #   earlier than or equal to the date provided in the field-value.  This
    #   field accomplishes the same purpose as If-Match for cases where the user
    #   agent does not have an entity-tag for the representation.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need
    #   to contact Oracle about a particular request, please provide
    #   the request ID.
    #
    # @option opts [String] :scope Specifies to operate only on resources that have a matching DNS scope.
    #
    # @option opts [String] :view_id The OCID of the view the resource is associated with.
    # @option opts [String] :compartment_id The OCID of the compartment the zone belongs to.
    #
    #   This parameter is deprecated and should be omitted.
    #
    # @return [Response] A Response object with data of type {OCI::Dns::Models::RecordCollection RecordCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dns/update_zone_records.rb.html) to see an example of how to use update_zone_records API.
    def update_zone_records(zone_name_or_id, update_zone_records_details, opts = {})
      logger.debug 'Calling operation DnsClient#update_zone_records.' if logger

      raise "Missing the required parameter 'zone_name_or_id' when calling update_zone_records." if zone_name_or_id.nil?
      raise "Missing the required parameter 'update_zone_records_details' when calling update_zone_records." if update_zone_records_details.nil?

      if opts[:scope] && !OCI::Dns::Models::SCOPE_ENUM.include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of the values in OCI::Dns::Models::SCOPE_ENUM.'
      end
      raise "Parameter value for 'zone_name_or_id' must not be blank" if OCI::Internal::Util.blank_string?(zone_name_or_id)

      path = '/zones/{zoneNameOrId}/records'.sub('{zoneNameOrId}', zone_name_or_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:scope] = opts[:scope] if opts[:scope]
      query_params[:viewId] = opts[:view_id] if opts[:view_id]
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-unmodified-since'] = opts[:if_unmodified_since] if opts[:if_unmodified_since]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_zone_records_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#update_zone_records') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::RecordCollection'
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
