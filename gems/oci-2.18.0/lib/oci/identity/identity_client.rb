# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # APIs for managing users, groups, compartments, policies, and identity domains.
  class Identity::IdentityClient
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


    # Creates a new IdentityClient.
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
        @endpoint = endpoint + '/20160918'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "IdentityClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://identity.{region}.oci.{secondLevelDomain}') + '/20160918'
      logger.info "IdentityClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # (For tenancies that support identity domains) Activates a deactivated identity domain. You can only activate identity domains that your user account is not a part of.
    #
    # After you send the request, the `lifecycleDetails` of the identity domain is set to ACTIVATING. When the operation completes, the
    # `lifecycleDetails` is set to null and the `lifecycleState` of the identity domain is set to ACTIVE.
    #
    # To track the progress of the request, submitting an HTTP GET on the /iamWorkRequests/{iamWorkRequestsId} endpoint retrieves
    # the operation's status.
    #
    # @param [String] domain_id The OCID of the identity domain.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/activate_domain.rb.html) to see an example of how to use activate_domain API.
    def activate_domain(domain_id, opts = {})
      logger.debug 'Calling operation IdentityClient#activate_domain.' if logger

      raise "Missing the required parameter 'domain_id' when calling activate_domain." if domain_id.nil?
      raise "Parameter value for 'domain_id' must not be blank" if OCI::Internal::Util.blank_string?(domain_id)

      path = '/domains/{domainId}/actions/activate'.sub('{domainId}', domain_id.to_s)
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

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#activate_domain') do
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


    # Activates the specified MFA TOTP device for the user. Activation requires manual interaction with the Console.
    #
    # @param [String] user_id The OCID of the user.
    # @param [String] mfa_totp_device_id The OCID of the MFA TOTP device.
    # @param [OCI::Identity::Models::MfaTotpToken] mfa_totp_token MFA TOTP token
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::MfaTotpDeviceSummary MfaTotpDeviceSummary}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/activate_mfa_totp_device.rb.html) to see an example of how to use activate_mfa_totp_device API.
    def activate_mfa_totp_device(user_id, mfa_totp_device_id, mfa_totp_token, opts = {})
      logger.debug 'Calling operation IdentityClient#activate_mfa_totp_device.' if logger

      raise "Missing the required parameter 'user_id' when calling activate_mfa_totp_device." if user_id.nil?
      raise "Missing the required parameter 'mfa_totp_device_id' when calling activate_mfa_totp_device." if mfa_totp_device_id.nil?
      raise "Missing the required parameter 'mfa_totp_token' when calling activate_mfa_totp_device." if mfa_totp_token.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)
      raise "Parameter value for 'mfa_totp_device_id' must not be blank" if OCI::Internal::Util.blank_string?(mfa_totp_device_id)

      path = '/users/{userId}/mfaTotpDevices/{mfaTotpDeviceId}/actions/activate'.sub('{userId}', user_id.to_s).sub('{mfaTotpDeviceId}', mfa_totp_device_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(mfa_totp_token)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#activate_mfa_totp_device') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::MfaTotpDeviceSummary'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Add a resource lock to a tag default.
    #
    # @param [String] tag_default_id The OCID of the tag default.
    # @param [OCI::Identity::Models::AddLockDetails] add_lock_details Lock that is going to be added to resource
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::TagDefault TagDefault}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/add_tag_default_lock.rb.html) to see an example of how to use add_tag_default_lock API.
    def add_tag_default_lock(tag_default_id, add_lock_details, opts = {})
      logger.debug 'Calling operation IdentityClient#add_tag_default_lock.' if logger

      raise "Missing the required parameter 'tag_default_id' when calling add_tag_default_lock." if tag_default_id.nil?
      raise "Missing the required parameter 'add_lock_details' when calling add_tag_default_lock." if add_lock_details.nil?
      raise "Parameter value for 'tag_default_id' must not be blank" if OCI::Internal::Util.blank_string?(tag_default_id)

      path = '/tagDefaults/{tagDefaultId}/actions/addLock'.sub('{tagDefaultId}', tag_default_id.to_s)
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
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(add_lock_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#add_tag_default_lock') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::TagDefault'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Add a resource lock to a tag namespace.
    #
    # @param [String] tag_namespace_id The OCID of the tag namespace.
    #
    # @param [OCI::Identity::Models::AddLockDetails] add_lock_details Lock that is going to be added to resource
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::TagNamespace TagNamespace}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/add_tag_namespace_lock.rb.html) to see an example of how to use add_tag_namespace_lock API.
    def add_tag_namespace_lock(tag_namespace_id, add_lock_details, opts = {})
      logger.debug 'Calling operation IdentityClient#add_tag_namespace_lock.' if logger

      raise "Missing the required parameter 'tag_namespace_id' when calling add_tag_namespace_lock." if tag_namespace_id.nil?
      raise "Missing the required parameter 'add_lock_details' when calling add_tag_namespace_lock." if add_lock_details.nil?
      raise "Parameter value for 'tag_namespace_id' must not be blank" if OCI::Internal::Util.blank_string?(tag_namespace_id)

      path = '/tagNamespaces/{tagNamespaceId}/actions/addLock'.sub('{tagNamespaceId}', tag_namespace_id.to_s)
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
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(add_lock_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#add_tag_namespace_lock') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::TagNamespace'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Adds the specified user to the specified group and returns a `UserGroupMembership` object with its own OCID.
    #
    # After you send your request, the new object's `lifecycleState` will temporarily be CREATING. Before using the
    # object, first make sure its `lifecycleState` has changed to ACTIVE.
    #
    # @param [OCI::Identity::Models::AddUserToGroupDetails] add_user_to_group_details Request object for adding a user to a group.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::UserGroupMembership UserGroupMembership}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/add_user_to_group.rb.html) to see an example of how to use add_user_to_group API.
    def add_user_to_group(add_user_to_group_details, opts = {})
      logger.debug 'Calling operation IdentityClient#add_user_to_group.' if logger

      raise "Missing the required parameter 'add_user_to_group_details' when calling add_user_to_group." if add_user_to_group_details.nil?

      path = '/userGroupMemberships/'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(add_user_to_group_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#add_user_to_group') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::UserGroupMembership'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Assembles tag defaults in the specified compartment and any parent compartments to determine
    # the tags to apply. Tag defaults from parent compartments do not override tag defaults
    # referencing the same tag in a compartment lower down the hierarchy. This set of tag defaults
    # includes all tag defaults from the current compartment back to the root compartment.
    #
    # @param [String] compartment_id The OCID of the compartment (remember that the tenancy is simply the root compartment).
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :lifecycle_state A filter to only return resources that match the given lifecycle state.  The state value is case-insensitive.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::TagDefaultSummary TagDefaultSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/assemble_effective_tag_set.rb.html) to see an example of how to use assemble_effective_tag_set API.
    def assemble_effective_tag_set(compartment_id, opts = {})
      logger.debug 'Calling operation IdentityClient#assemble_effective_tag_set.' if logger

      raise "Missing the required parameter 'compartment_id' when calling assemble_effective_tag_set." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::Identity::Models::TagDefaultSummary::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Identity::Models::TagDefaultSummary::LIFECYCLE_STATE_ENUM.'
      end

      path = '/tagDefaults/actions/assembleEffectiveTagSet'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#assemble_effective_tag_set') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::TagDefaultSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Deletes multiple resources in the compartment. All resources must be in the same compartment. You must have the appropriate
    # permissions to delete the resources in the request. This API can only be invoked from the tenancy's
    # [home region](https://docs.cloud.oracle.com/Content/Identity/regions/managingregions.htm#Home). This operation creates a
    # {WorkRequest}. Use the {#get_work_request get_work_request}
    # API to monitor the status of the bulk action.
    #
    # @param [String] compartment_id The OCID of the compartment.
    # @param [OCI::Identity::Models::BulkDeleteResourcesDetails] bulk_delete_resources_details Request object for bulk delete resources in a compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/bulk_delete_resources.rb.html) to see an example of how to use bulk_delete_resources API.
    def bulk_delete_resources(compartment_id, bulk_delete_resources_details, opts = {})
      logger.debug 'Calling operation IdentityClient#bulk_delete_resources.' if logger

      raise "Missing the required parameter 'compartment_id' when calling bulk_delete_resources." if compartment_id.nil?
      raise "Missing the required parameter 'bulk_delete_resources_details' when calling bulk_delete_resources." if bulk_delete_resources_details.nil?
      raise "Parameter value for 'compartment_id' must not be blank" if OCI::Internal::Util.blank_string?(compartment_id)

      path = '/compartments/{compartmentId}/actions/bulkDeleteResources'.sub('{compartmentId}', compartment_id.to_s)
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

      post_body = @api_client.object_to_http_body(bulk_delete_resources_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#bulk_delete_resources') do
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


    # Deletes the specified tag key definitions. This operation triggers a process that removes the
    # tags from all resources in your tenancy. The tag key definitions must be within the same tag namespace.
    #
    # The following actions happen immediately:
    # \u00A0
    #   * If the tag is a cost-tracking tag, the tag no longer counts against your
    #   10 cost-tracking tags limit, even if you do not disable the tag before running this operation.
    #   * If the tag is used with dynamic groups, the rules that contain the tag are no longer
    #   evaluated against the tag.
    #
    # After you start this operation, the state of the tag changes to DELETING, and tag removal
    # from resources begins. This process can take up to 48 hours depending on the number of resources that
    # are tagged and the regions in which those resources reside.
    #
    # When all tags have been removed, the state changes to DELETED. You cannot restore a deleted tag. After the tag state
    # changes to DELETED, you can use the same tag name again.
    #
    # After you start this operation, you cannot start either the {#delete_tag delete_tag} or the {#cascade_delete_tag_namespace cascade_delete_tag_namespace} operation until this process completes.
    #
    # In order to delete tags, you must first retire the tags. Use {#update_tag update_tag}
    # to retire a tag.
    #
    # @param [OCI::Identity::Models::BulkDeleteTagsDetails] bulk_delete_tags_details Request object for deleting tags in bulk.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [BOOLEAN] :is_lock_override Whether to override locks (if any exist). (default to false)
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/bulk_delete_tags.rb.html) to see an example of how to use bulk_delete_tags API.
    def bulk_delete_tags(bulk_delete_tags_details, opts = {})
      logger.debug 'Calling operation IdentityClient#bulk_delete_tags.' if logger

      raise "Missing the required parameter 'bulk_delete_tags_details' when calling bulk_delete_tags." if bulk_delete_tags_details.nil?

      path = '/tags/actions/bulkDelete'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:isLockOverride] = opts[:is_lock_override] if !opts[:is_lock_override].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(bulk_delete_tags_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#bulk_delete_tags') do
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


    # Edits the specified list of tag key definitions for the selected resources.
    # This operation triggers a process that edits the tags on all selected resources. The possible actions are:
    #
    #   * Add a defined tag when the tag does not already exist on the resource.
    #   * Update the value for a defined tag when the tag is present on the resource.
    #   * Add a defined tag when it does not already exist on the resource or update the value for a defined tag when the tag is present on the resource.
    #   * Remove a defined tag from a resource. The tag is removed from the resource regardless of the tag value.
    #
    # See {#bulk_edit_operation_details bulk_edit_operation_details} for more information.
    #
    # The edits can include a combination of operations and tag sets.
    # However, multiple operations cannot apply to one key definition in the same request.
    # For example, if one request adds `tag set-1` to a resource and sets a tag value to `tag set-2`,
    # `tag set-1` and `tag set-2` cannot have any common tag definitions.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [OCI::Identity::Models::BulkEditTagsDetails] :bulk_edit_tags_details The request object for bulk editing tags on resources in the compartment.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/bulk_edit_tags.rb.html) to see an example of how to use bulk_edit_tags API.
    def bulk_edit_tags(opts = {})
      logger.debug 'Calling operation IdentityClient#bulk_edit_tags.' if logger


      path = '/tags/actions/bulkEdit'
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

      post_body = @api_client.object_to_http_body(opts[:bulk_edit_tags_details])

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#bulk_edit_tags') do
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


    # Moves multiple resources from one compartment to another. All resources must be in the same compartment.
    # This API can only be invoked from the tenancy's [home region](https://docs.cloud.oracle.com/Content/Identity/regions/managingregions.htm#Home).
    # To move resources, you must have the appropriate permissions to move the resource in both the source and target
    # compartments. This operation creates a {WorkRequest}.
    # Use the {#get_work_request get_work_request} API to monitor the status of the bulk action.
    #
    # @param [String] compartment_id The OCID of the compartment.
    # @param [OCI::Identity::Models::BulkMoveResourcesDetails] bulk_move_resources_details Request object for bulk move resources in the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/bulk_move_resources.rb.html) to see an example of how to use bulk_move_resources API.
    def bulk_move_resources(compartment_id, bulk_move_resources_details, opts = {})
      logger.debug 'Calling operation IdentityClient#bulk_move_resources.' if logger

      raise "Missing the required parameter 'compartment_id' when calling bulk_move_resources." if compartment_id.nil?
      raise "Missing the required parameter 'bulk_move_resources_details' when calling bulk_move_resources." if bulk_move_resources_details.nil?
      raise "Parameter value for 'compartment_id' must not be blank" if OCI::Internal::Util.blank_string?(compartment_id)

      path = '/compartments/{compartmentId}/actions/bulkMoveResources'.sub('{compartmentId}', compartment_id.to_s)
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

      post_body = @api_client.object_to_http_body(bulk_move_resources_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#bulk_move_resources') do
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


    # Deletes the specified tag namespace. This operation triggers a process that removes all of the tags
    # defined in the specified tag namespace from all resources in your tenancy and then deletes the tag namespace.
    #
    # After you start the delete operation:
    #
    #   * New tag key definitions cannot be created under the namespace.
    #   * The state of the tag namespace changes to DELETING.
    #   * Tag removal from the resources begins.
    #
    # This process can take up to 48 hours depending on the number of tag definitions in the namespace, the number of resources
    # that are tagged, and the locations of the regions in which those resources reside.
    #
    # After all tags are removed, the state changes to DELETED. You cannot restore a deleted tag namespace. After the deleted tag namespace
    # changes its state to DELETED, you can use the name of the deleted tag namespace again.
    #
    # After you start this operation, you cannot start either the {#delete_tag delete_tag} or the {#bulk_delete_tags bulk_delete_tags} operation until this process completes.
    #
    # To delete a tag namespace, you must first retire it. Use {#update_tag_namespace update_tag_namespace}
    # to retire a tag namespace.
    #
    # @param [String] tag_namespace_id The OCID of the tag namespace.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [BOOLEAN] :is_lock_override Whether to override locks (if any exist). (default to false)
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/cascade_delete_tag_namespace.rb.html) to see an example of how to use cascade_delete_tag_namespace API.
    def cascade_delete_tag_namespace(tag_namespace_id, opts = {})
      logger.debug 'Calling operation IdentityClient#cascade_delete_tag_namespace.' if logger

      raise "Missing the required parameter 'tag_namespace_id' when calling cascade_delete_tag_namespace." if tag_namespace_id.nil?
      raise "Parameter value for 'tag_namespace_id' must not be blank" if OCI::Internal::Util.blank_string?(tag_namespace_id)

      path = '/tagNamespaces/{tagNamespaceId}/actions/cascadeDelete'.sub('{tagNamespaceId}', tag_namespace_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:isLockOverride] = opts[:is_lock_override] if !opts[:is_lock_override].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#cascade_delete_tag_namespace') do
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


    # (For tenancies that support identity domains) Moves the identity domain to a different compartment in the tenancy.
    #
    # To track the progress of the request, submitting an HTTP GET on the /iamWorkRequests/{iamWorkRequestsId} endpoint retrieves
    # the operation's status.
    #
    # @param [String] domain_id The OCID of the identity domain.
    # @param [OCI::Identity::Models::ChangeDomainCompartmentDetails] change_domain_compartment_details The request object for moving the identity domain to a different compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/change_domain_compartment.rb.html) to see an example of how to use change_domain_compartment API.
    def change_domain_compartment(domain_id, change_domain_compartment_details, opts = {})
      logger.debug 'Calling operation IdentityClient#change_domain_compartment.' if logger

      raise "Missing the required parameter 'domain_id' when calling change_domain_compartment." if domain_id.nil?
      raise "Missing the required parameter 'change_domain_compartment_details' when calling change_domain_compartment." if change_domain_compartment_details.nil?
      raise "Parameter value for 'domain_id' must not be blank" if OCI::Internal::Util.blank_string?(domain_id)

      path = '/domains/{domainId}/actions/changeCompartment'.sub('{domainId}', domain_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_domain_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#change_domain_compartment') do
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


    # (For tenancies that support identity domains) Changes the license type of the given identity domain. The identity domain's
    # `lifecycleState` must be set to ACTIVE and the requested `licenseType` must be allowed. To retrieve the allowed `licenseType` for
    # the identity domain, use {#list_allowed_domain_license_types list_allowed_domain_license_types}.
    #
    # After you send your request, the `lifecycleDetails` of this identity domain is set to UPDATING. When the update of the identity
    # domain completes, then the `lifecycleDetails` is set to null.
    #
    # To track the progress of the request, submitting an HTTP GET on the /iamWorkRequests/{iamWorkRequestsId} endpoint retrieves
    # the operation's status.
    #
    # @param [String] domain_id The OCID of the identity domain.
    # @param [OCI::Identity::Models::ChangeDomainLicenseTypeDetails] change_domain_license_type_details The request object for an update to the license type of the identity domain.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/change_domain_license_type.rb.html) to see an example of how to use change_domain_license_type API.
    def change_domain_license_type(domain_id, change_domain_license_type_details, opts = {})
      logger.debug 'Calling operation IdentityClient#change_domain_license_type.' if logger

      raise "Missing the required parameter 'domain_id' when calling change_domain_license_type." if domain_id.nil?
      raise "Missing the required parameter 'change_domain_license_type_details' when calling change_domain_license_type." if change_domain_license_type_details.nil?
      raise "Parameter value for 'domain_id' must not be blank" if OCI::Internal::Util.blank_string?(domain_id)

      path = '/domains/{domainId}/actions/changeLicenseType'.sub('{domainId}', domain_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_domain_license_type_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#change_domain_license_type') do
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


    # Moves the specified tag namespace to the specified compartment within the same tenancy.
    #
    # To move the tag namespace, you must have the manage tag-namespaces permission on both compartments.
    # For more information about IAM policies, see [Details for IAM](https://docs.cloud.oracle.com/Content/Identity/policyreference/iampolicyreference.htm).
    #
    # Moving a tag namespace moves all the tag key definitions contained in the tag namespace.
    #
    # @param [String] tag_namespace_id The OCID of the tag namespace.
    #
    # @param [OCI::Identity::Models::ChangeTagNamespaceCompartmentDetail] change_tag_namespace_compartment_detail Request object for changing the compartment of a tag namespace.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [BOOLEAN] :is_lock_override Whether to override locks (if any exist). (default to false)
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/change_tag_namespace_compartment.rb.html) to see an example of how to use change_tag_namespace_compartment API.
    def change_tag_namespace_compartment(tag_namespace_id, change_tag_namespace_compartment_detail, opts = {})
      logger.debug 'Calling operation IdentityClient#change_tag_namespace_compartment.' if logger

      raise "Missing the required parameter 'tag_namespace_id' when calling change_tag_namespace_compartment." if tag_namespace_id.nil?
      raise "Missing the required parameter 'change_tag_namespace_compartment_detail' when calling change_tag_namespace_compartment." if change_tag_namespace_compartment_detail.nil?
      raise "Parameter value for 'tag_namespace_id' must not be blank" if OCI::Internal::Util.blank_string?(tag_namespace_id)

      path = '/tagNamespaces/{tagNamespaceId}/actions/changeCompartment'.sub('{tagNamespaceId}', tag_namespace_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:isLockOverride] = opts[:is_lock_override] if !opts[:is_lock_override].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(change_tag_namespace_compartment_detail)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#change_tag_namespace_compartment') do
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


    # Creates a new auth token for the specified user. For information about what auth tokens are for, see
    # [Managing User Credentials](https://docs.cloud.oracle.com/Content/Identity/access/managing-user-credentials.htm).
    #
    # You must specify a *description* for the auth token (although it can be an empty string). It does not
    # have to be unique, and you can change it anytime with
    # {#update_auth_token update_auth_token}.
    #
    # Every user has permission to create an auth token for *their own user ID*. An administrator in your organization
    # does not need to write a policy to give users this ability. To compare, administrators who have permission to the
    # tenancy can use this operation to create an auth token for any user, including themselves.
    #
    # @param [OCI::Identity::Models::CreateAuthTokenDetails] create_auth_token_details Request object for creating a new auth token.
    # @param [String] user_id The OCID of the user.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::AuthToken AuthToken}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/create_auth_token.rb.html) to see an example of how to use create_auth_token API.
    def create_auth_token(create_auth_token_details, user_id, opts = {})
      logger.debug 'Calling operation IdentityClient#create_auth_token.' if logger

      raise "Missing the required parameter 'create_auth_token_details' when calling create_auth_token." if create_auth_token_details.nil?
      raise "Missing the required parameter 'user_id' when calling create_auth_token." if user_id.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)

      path = '/users/{userId}/authTokens/'.sub('{userId}', user_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_auth_token_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#create_auth_token') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::AuthToken'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new compartment in the specified compartment.
    #
    # Specify the parent compartment's OCID as the compartment ID in the request object. Remember that the tenancy
    # is simply the root compartment. For information about OCIDs, see
    # [Resource Identifiers](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    #
    # You must also specify a *name* for the compartment, which must be unique across all compartments in
    # your tenancy. You can use this name or the OCID when writing policies that apply
    # to the compartment. For more information about policies, see
    # [How Policies Work](https://docs.cloud.oracle.com/Content/Identity/policieshow/how-policies-work.htm).
    #
    # You must also specify a *description* for the compartment (although it can be an empty string). It does
    # not have to be unique, and you can change it anytime with
    # {#update_compartment update_compartment}.
    #
    # After you send your request, the new object's `lifecycleState` will temporarily be CREATING. Before using the
    # object, first make sure its `lifecycleState` has changed to ACTIVE.
    #
    # @param [OCI::Identity::Models::CreateCompartmentDetails] create_compartment_details Request object for creating a new compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::Compartment Compartment}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/create_compartment.rb.html) to see an example of how to use create_compartment API.
    def create_compartment(create_compartment_details, opts = {})
      logger.debug 'Calling operation IdentityClient#create_compartment.' if logger

      raise "Missing the required parameter 'create_compartment_details' when calling create_compartment." if create_compartment_details.nil?

      path = '/compartments/'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#create_compartment') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::Compartment'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new secret key for the specified user. Secret keys are used for authentication with the Object Storage Service's Amazon S3
    # compatible API. The secret key consists of an Access Key/Secret Key pair. For information, see
    # [Managing User Credentials](https://docs.cloud.oracle.com/Content/Identity/access/managing-user-credentials.htm).
    #
    # You must specify a *description* for the secret key (although it can be an empty string). It does not
    # have to be unique, and you can change it anytime with
    # {#update_customer_secret_key update_customer_secret_key}.
    #
    # Every user has permission to create a secret key for *their own user ID*. An administrator in your organization
    # does not need to write a policy to give users this ability. To compare, administrators who have permission to the
    # tenancy can use this operation to create a secret key for any user, including themselves.
    #
    # @param [OCI::Identity::Models::CreateCustomerSecretKeyDetails] create_customer_secret_key_details Request object for creating a new secret key.
    # @param [String] user_id The OCID of the user.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::CustomerSecretKey CustomerSecretKey}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/create_customer_secret_key.rb.html) to see an example of how to use create_customer_secret_key API.
    def create_customer_secret_key(create_customer_secret_key_details, user_id, opts = {})
      logger.debug 'Calling operation IdentityClient#create_customer_secret_key.' if logger

      raise "Missing the required parameter 'create_customer_secret_key_details' when calling create_customer_secret_key." if create_customer_secret_key_details.nil?
      raise "Missing the required parameter 'user_id' when calling create_customer_secret_key." if user_id.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)

      path = '/users/{userId}/customerSecretKeys/'.sub('{userId}', user_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_customer_secret_key_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#create_customer_secret_key') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::CustomerSecretKey'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new DB credential for the specified user.
    #
    # @param [OCI::Identity::Models::CreateDbCredentialDetails] create_db_credential_details Request object for creating a new DB credential with the user.
    # @param [String] user_id The OCID of the user.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::DbCredential DbCredential}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/create_db_credential.rb.html) to see an example of how to use create_db_credential API.
    def create_db_credential(create_db_credential_details, user_id, opts = {})
      logger.debug 'Calling operation IdentityClient#create_db_credential.' if logger

      raise "Missing the required parameter 'create_db_credential_details' when calling create_db_credential." if create_db_credential_details.nil?
      raise "Missing the required parameter 'user_id' when calling create_db_credential." if user_id.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)

      path = '/users/{userId}/dbCredentials/'.sub('{userId}', user_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_db_credential_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#create_db_credential') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::DbCredential'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # (For tenancies that support identity domains) Creates a new identity domain in the tenancy with the identity domain home in `homeRegion`.
    # After you send your request, the temporary `lifecycleState` of this identity domain is set to CREATING and `lifecycleDetails` to UPDATING.
    # When creation of the identity domain completes, this identity domain's `lifecycleState` is set to ACTIVE and `lifecycleDetails` to null.
    #
    # To track the progress of the request, submitting an HTTP GET on the /iamWorkRequests/{iamWorkRequestsId} endpoint retrieves
    # the operation's status.
    #
    # After creating an `identity domain`, first make sure its `lifecycleState` changes from CREATING to ACTIVE before you use it.
    #
    # @param [OCI::Identity::Models::CreateDomainDetails] create_domain_details The request object for creating a new identity domain.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/create_domain.rb.html) to see an example of how to use create_domain API.
    def create_domain(create_domain_details, opts = {})
      logger.debug 'Calling operation IdentityClient#create_domain.' if logger

      raise "Missing the required parameter 'create_domain_details' when calling create_domain." if create_domain_details.nil?

      path = '/domains/'
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

      post_body = @api_client.object_to_http_body(create_domain_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#create_domain') do
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


    # Creates a new dynamic group in your tenancy.
    #
    # You must specify your tenancy's OCID as the compartment ID in the request object (remember that the tenancy
    # is simply the root compartment). Notice that IAM resources (users, groups, compartments, and some policies)
    # reside within the tenancy itself, unlike cloud resources such as compute instances, which typically
    # reside within compartments inside the tenancy. For information about OCIDs, see
    # [Resource Identifiers](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    #
    # You must also specify a *name* for the dynamic group, which must be unique across all dynamic groups in your
    # tenancy, and cannot be changed. Note that this name has to be also unique across all groups in your tenancy.
    # You can use this name or the OCID when writing policies that apply to the dynamic group. For more information
    # about policies, see [How Policies Work](https://docs.cloud.oracle.com/Content/Identity/policieshow/how-policies-work.htm).
    #
    # You must also specify a *description* for the dynamic group (although it can be an empty string). It does not
    # have to be unique, and you can change it anytime with {#update_dynamic_group update_dynamic_group}.
    #
    # After you send your request, the new object's `lifecycleState` will temporarily be CREATING. Before using the
    # object, first make sure its `lifecycleState` has changed to ACTIVE.
    #
    # @param [OCI::Identity::Models::CreateDynamicGroupDetails] create_dynamic_group_details Request object for creating a new dynamic group.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::DynamicGroup DynamicGroup}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/create_dynamic_group.rb.html) to see an example of how to use create_dynamic_group API.
    def create_dynamic_group(create_dynamic_group_details, opts = {})
      logger.debug 'Calling operation IdentityClient#create_dynamic_group.' if logger

      raise "Missing the required parameter 'create_dynamic_group_details' when calling create_dynamic_group." if create_dynamic_group_details.nil?

      path = '/dynamicGroups/'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_dynamic_group_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#create_dynamic_group') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::DynamicGroup'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new group in your tenancy.
    #
    # You must specify your tenancy's OCID as the compartment ID in the request object (remember that the tenancy
    # is simply the root compartment). Notice that IAM resources (users, groups, compartments, and some policies)
    # reside within the tenancy itself, unlike cloud resources such as compute instances, which typically
    # reside within compartments inside the tenancy. For information about OCIDs, see
    # [Resource Identifiers](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    #
    # You must also specify a *name* for the group, which must be unique across all groups in your tenancy and
    # cannot be changed. You can use this name or the OCID when writing policies that apply to the group. For more
    # information about policies, see [How Policies Work](https://docs.cloud.oracle.com/Content/Identity/policieshow/how-policies-work.htm).
    #
    # You must also specify a *description* for the group (although it can be an empty string). It does not
    # have to be unique, and you can change it anytime with {#update_group update_group}.
    #
    # After you send your request, the new object's `lifecycleState` will temporarily be CREATING. Before using the
    # object, first make sure its `lifecycleState` has changed to ACTIVE.
    #
    # After creating the group, you need to put users in it and write policies for it.
    # See {#add_user_to_group add_user_to_group} and
    # {#create_policy create_policy}.
    #
    # @param [OCI::Identity::Models::CreateGroupDetails] create_group_details Request object for creating a new group.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::Group Group}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/create_group.rb.html) to see an example of how to use create_group API.
    def create_group(create_group_details, opts = {})
      logger.debug 'Calling operation IdentityClient#create_group.' if logger

      raise "Missing the required parameter 'create_group_details' when calling create_group." if create_group_details.nil?

      path = '/groups/'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_group_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#create_group') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::Group'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # **Deprecated.** For more information, see [Deprecated IAM Service APIs](https://docs.cloud.oracle.com/Content/Identity/Reference/deprecatediamapis.htm).
    #
    # Creates a new identity provider in your tenancy. For more information, see
    # [Identity Providers and Federation](https://docs.cloud.oracle.com/Content/Identity/Concepts/federation.htm).
    #
    # You must specify your tenancy's OCID as the compartment ID in the request object.
    # Remember that the tenancy is simply the root compartment. For information about
    # OCIDs, see [Resource Identifiers](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    #
    # You must also specify a *name* for the `IdentityProvider`, which must be unique
    # across all `IdentityProvider` objects in your tenancy and cannot be changed.
    #
    # You must also specify a *description* for the `IdentityProvider` (although
    # it can be an empty string). It does not have to be unique, and you can change
    # it anytime with
    # {#update_identity_provider update_identity_provider}.
    #
    # After you send your request, the new object's `lifecycleState` will temporarily
    # be CREATING. Before using the object, first make sure its `lifecycleState` has
    # changed to ACTIVE.
    #
    # @param [OCI::Identity::Models::CreateIdentityProviderDetails] create_identity_provider_details Request object for creating a new SAML2 identity provider.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::IdentityProvider IdentityProvider}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/create_identity_provider.rb.html) to see an example of how to use create_identity_provider API.
    def create_identity_provider(create_identity_provider_details, opts = {})
      logger.debug 'Calling operation IdentityClient#create_identity_provider.' if logger

      raise "Missing the required parameter 'create_identity_provider_details' when calling create_identity_provider." if create_identity_provider_details.nil?

      path = '/identityProviders/'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_identity_provider_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#create_identity_provider') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::IdentityProvider'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # **Deprecated.** For more information, see [Deprecated IAM Service APIs](https://docs.cloud.oracle.com/Content/Identity/Reference/deprecatediamapis.htm).
    #
    # Creates a single mapping between an IdP group and an IAM Service
    # {Group}.
    #
    # @param [OCI::Identity::Models::CreateIdpGroupMappingDetails] create_idp_group_mapping_details Add a mapping from an SAML2.0 identity provider group to a BMC group.
    # @param [String] identity_provider_id The OCID of the identity provider.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::IdpGroupMapping IdpGroupMapping}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/create_idp_group_mapping.rb.html) to see an example of how to use create_idp_group_mapping API.
    def create_idp_group_mapping(create_idp_group_mapping_details, identity_provider_id, opts = {})
      logger.debug 'Calling operation IdentityClient#create_idp_group_mapping.' if logger

      raise "Missing the required parameter 'create_idp_group_mapping_details' when calling create_idp_group_mapping." if create_idp_group_mapping_details.nil?
      raise "Missing the required parameter 'identity_provider_id' when calling create_idp_group_mapping." if identity_provider_id.nil?
      raise "Parameter value for 'identity_provider_id' must not be blank" if OCI::Internal::Util.blank_string?(identity_provider_id)

      path = '/identityProviders/{identityProviderId}/groupMappings/'.sub('{identityProviderId}', identity_provider_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_idp_group_mapping_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#create_idp_group_mapping') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::IdpGroupMapping'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new MFA TOTP device for the user. A user can have one MFA TOTP device.
    #
    # @param [String] user_id The OCID of the user.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::MfaTotpDevice MfaTotpDevice}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/create_mfa_totp_device.rb.html) to see an example of how to use create_mfa_totp_device API.
    def create_mfa_totp_device(user_id, opts = {})
      logger.debug 'Calling operation IdentityClient#create_mfa_totp_device.' if logger

      raise "Missing the required parameter 'user_id' when calling create_mfa_totp_device." if user_id.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)

      path = '/users/{userId}/mfaTotpDevices'.sub('{userId}', user_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#create_mfa_totp_device') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::MfaTotpDevice'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new network source in your tenancy.
    #
    # You must specify your tenancy's OCID as the compartment ID in the request object (remember that the tenancy
    # is simply the root compartment). Notice that IAM resources (users, groups, compartments, and some policies)
    # reside within the tenancy itself, unlike cloud resources such as compute instances, which typically
    # reside within compartments inside the tenancy. For information about OCIDs, see
    # [Resource Identifiers](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    #
    # You must also specify a *name* for the network source, which must be unique across all network sources in your
    # tenancy, and cannot be changed.
    # You can use this name or the OCID when writing policies that apply to the network source. For more information
    # about policies, see [How Policies Work](https://docs.cloud.oracle.com/Content/Identity/policieshow/how-policies-work.htm).
    #
    # You must also specify a *description* for the network source (although it can be an empty string). It does not
    # have to be unique, and you can change it anytime with {#update_network_source update_network_source}.
    #
    # After you send your request, the new object's `lifecycleState` will temporarily be CREATING. Before using the
    # object, first make sure its `lifecycleState` has changed to ACTIVE.
    #
    # After your network resource is created, you can use it in policy to restrict access to only requests made from an allowed
    # IP address specified in your network source. For more information, see [Managing Network Sources](https://docs.cloud.oracle.com/Content/Identity/Tasks/managingnetworksources.htm).
    #
    # @param [OCI::Identity::Models::CreateNetworkSourceDetails] create_network_source_details Request object for creating a new network source.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::NetworkSources NetworkSources}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/create_network_source.rb.html) to see an example of how to use create_network_source API.
    def create_network_source(create_network_source_details, opts = {})
      logger.debug 'Calling operation IdentityClient#create_network_source.' if logger

      raise "Missing the required parameter 'create_network_source_details' when calling create_network_source." if create_network_source_details.nil?

      path = '/networkSources'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_network_source_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#create_network_source') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::NetworkSources'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates Oauth token for the user
    #
    # @param [String] user_id The OCID of the user.
    # @param [OCI::Identity::Models::CreateOAuth2ClientCredentialDetails] create_o_auth2_client_credential_details Request object containing the information required to generate an Oauth token.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::OAuth2ClientCredential OAuth2ClientCredential}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/create_o_auth_client_credential.rb.html) to see an example of how to use create_o_auth_client_credential API.
    def create_o_auth_client_credential(user_id, create_o_auth2_client_credential_details, opts = {})
      logger.debug 'Calling operation IdentityClient#create_o_auth_client_credential.' if logger

      raise "Missing the required parameter 'user_id' when calling create_o_auth_client_credential." if user_id.nil?
      raise "Missing the required parameter 'create_o_auth2_client_credential_details' when calling create_o_auth_client_credential." if create_o_auth2_client_credential_details.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)

      path = '/users/{userId}/oauth2ClientCredentials'.sub('{userId}', user_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_o_auth2_client_credential_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#create_o_auth_client_credential') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::OAuth2ClientCredential'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new Console one-time password for the specified user. For more information about user
    # credentials, see [User Credentials](https://docs.cloud.oracle.com/Content/Identity/usercred/usercredentials.htm).
    #
    # Use this operation after creating a new user, or if a user forgets their password. The new one-time
    # password is returned to you in the response, and you must securely deliver it to the user. They'll
    # be prompted to change this password the next time they sign in to the Console. If they don't change
    # it within 7 days, the password will expire and you'll need to create a new one-time password for the
    # user.
    #
    # (For tenancies that support identity domains) Resetting a user's password generates a reset password email
    # with a link that the user must follow to reset their password. If the user does not reset their password before the
    # link expires, you'll need to reset the user's password again.
    #
    # **Note:** The user's Console login is the unique name you specified when you created the user
    # (see {#create_user create_user}).
    #
    # @param [String] user_id The OCID of the user.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::UIPassword UIPassword}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/create_or_reset_ui_password.rb.html) to see an example of how to use create_or_reset_ui_password API.
    def create_or_reset_ui_password(user_id, opts = {})
      logger.debug 'Calling operation IdentityClient#create_or_reset_ui_password.' if logger

      raise "Missing the required parameter 'user_id' when calling create_or_reset_ui_password." if user_id.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)

      path = '/users/{userId}/uiPassword'.sub('{userId}', user_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#create_or_reset_ui_password') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::UIPassword'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new policy in the specified compartment (either the tenancy or another of your compartments).
    # If you're new to policies, see [Get Started with Policies](https://docs.cloud.oracle.com/Content/Identity/policiesgs/get-started-with-policies.htm).
    #
    # You must specify a *name* for the policy, which must be unique across all policies in your tenancy
    # and cannot be changed.
    #
    # You must also specify a *description* for the policy (although it can be an empty string). It does not
    # have to be unique, and you can change it anytime with {#update_policy update_policy}.
    #
    # You must specify one or more policy statements in the statements array. For information about writing
    # policies, see [How Policies Work](https://docs.cloud.oracle.com/Content/Identity/policieshow/how-policies-work.htm) and
    # [Common Policies](https://docs.cloud.oracle.com/Content/Identity/policiescommon/commonpolicies.htm).
    #
    # After you send your request, the new object's `lifecycleState` will temporarily be CREATING. Before using the
    # object, first make sure its `lifecycleState` has changed to ACTIVE.
    #
    # New policies take effect typically within 10 seconds.
    #
    # @param [OCI::Identity::Models::CreatePolicyDetails] create_policy_details Request object for creating a new policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::Policy Policy}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/create_policy.rb.html) to see an example of how to use create_policy API.
    def create_policy(create_policy_details, opts = {})
      logger.debug 'Calling operation IdentityClient#create_policy.' if logger

      raise "Missing the required parameter 'create_policy_details' when calling create_policy." if create_policy_details.nil?

      path = '/policies/'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_policy_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#create_policy') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::Policy'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a subscription to a region for a tenancy.
    #
    # @param [OCI::Identity::Models::CreateRegionSubscriptionDetails] create_region_subscription_details Request object for activate a new region.
    # @param [String] tenancy_id The OCID of the tenancy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::RegionSubscription RegionSubscription}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/create_region_subscription.rb.html) to see an example of how to use create_region_subscription API.
    def create_region_subscription(create_region_subscription_details, tenancy_id, opts = {})
      logger.debug 'Calling operation IdentityClient#create_region_subscription.' if logger

      raise "Missing the required parameter 'create_region_subscription_details' when calling create_region_subscription." if create_region_subscription_details.nil?
      raise "Missing the required parameter 'tenancy_id' when calling create_region_subscription." if tenancy_id.nil?
      raise "Parameter value for 'tenancy_id' must not be blank" if OCI::Internal::Util.blank_string?(tenancy_id)

      path = '/tenancies/{tenancyId}/regionSubscriptions'.sub('{tenancyId}', tenancy_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_region_subscription_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#create_region_subscription') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::RegionSubscription'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new SMTP credential for the specified user. An SMTP credential has an SMTP user name and an SMTP password.
    # You must specify a *description* for the SMTP credential (although it can be an empty string). It does not
    # have to be unique, and you can change it anytime with
    # {#update_smtp_credential update_smtp_credential}.
    #
    # @param [OCI::Identity::Models::CreateSmtpCredentialDetails] create_smtp_credential_details Request object for creating a new SMTP credential with the user.
    # @param [String] user_id The OCID of the user.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::SmtpCredential SmtpCredential}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/create_smtp_credential.rb.html) to see an example of how to use create_smtp_credential API.
    def create_smtp_credential(create_smtp_credential_details, user_id, opts = {})
      logger.debug 'Calling operation IdentityClient#create_smtp_credential.' if logger

      raise "Missing the required parameter 'create_smtp_credential_details' when calling create_smtp_credential." if create_smtp_credential_details.nil?
      raise "Missing the required parameter 'user_id' when calling create_smtp_credential." if user_id.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)

      path = '/users/{userId}/smtpCredentials/'.sub('{userId}', user_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_smtp_credential_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#create_smtp_credential') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::SmtpCredential'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # **Deprecated. Use {#create_auth_token create_auth_token} instead.**
    #
    # Creates a new Swift password for the specified user. For information about what Swift passwords are for, see
    # [Managing User Credentials](https://docs.cloud.oracle.com/Content/Identity/Tasks/managingcredentials.htm).
    #
    # You must specify a *description* for the Swift password (although it can be an empty string). It does not
    # have to be unique, and you can change it anytime with
    # {#update_swift_password update_swift_password}.
    #
    # Every user has permission to create a Swift password for *their own user ID*. An administrator in your organization
    # does not need to write a policy to give users this ability. To compare, administrators who have permission to the
    # tenancy can use this operation to create a Swift password for any user, including themselves.
    #
    # @param [OCI::Identity::Models::CreateSwiftPasswordDetails] create_swift_password_details Request object for creating a new swift password.
    # @param [String] user_id The OCID of the user.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::SwiftPassword SwiftPassword}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/create_swift_password.rb.html) to see an example of how to use create_swift_password API.
    def create_swift_password(create_swift_password_details, user_id, opts = {})
      logger.debug 'Calling operation IdentityClient#create_swift_password.' if logger

      raise "Missing the required parameter 'create_swift_password_details' when calling create_swift_password." if create_swift_password_details.nil?
      raise "Missing the required parameter 'user_id' when calling create_swift_password." if user_id.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)

      path = '/users/{userId}/swiftPasswords/'.sub('{userId}', user_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_swift_password_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#create_swift_password') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::SwiftPassword'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new tag in the specified tag namespace.
    #
    # The tag requires either the OCID or the name of the tag namespace that will contain this
    # tag definition.
    #
    # You must specify a *name* for the tag, which must be unique across all tags in the tag namespace
    # and cannot be changed. The name can contain any ASCII character except the space (_) or period (.) characters.
    # Names are case insensitive. That means, for example, \"myTag\" and \"mytag\" are not allowed in the same namespace.
    # If you specify a name that's already in use in the tag namespace, a 409 error is returned.
    #
    # The tag must have a *description*. It does not have to be unique, and you can change it with
    # {#update_tag update_tag}.
    #
    # The tag must have a value type, which is specified with a validator. Tags can use either a
    # static value or a list of possible values. Static values are entered by a user applying the tag
    # to a resource. Lists are created by you and the user must apply a value from the list. Lists
    # are validiated.
    #
    # * If no `validator` is set, the user applying the tag to a resource can type in a static
    # value or leave the tag value empty.
    # * If a `validator` is set, the user applying the tag to a resource must select from a list
    # of values that you supply with {#enum_tag_definition_validator enum_tag_definition_validator}.
    #
    # @param [String] tag_namespace_id The OCID of the tag namespace.
    #
    # @param [OCI::Identity::Models::CreateTagDetails] create_tag_details Request object for creating a new tag in the specified tag namespace.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [BOOLEAN] :is_lock_override Whether to override locks (if any exist). (default to false)
    # @return [Response] A Response object with data of type {OCI::Identity::Models::Tag Tag}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/create_tag.rb.html) to see an example of how to use create_tag API.
    def create_tag(tag_namespace_id, create_tag_details, opts = {})
      logger.debug 'Calling operation IdentityClient#create_tag.' if logger

      raise "Missing the required parameter 'tag_namespace_id' when calling create_tag." if tag_namespace_id.nil?
      raise "Missing the required parameter 'create_tag_details' when calling create_tag." if create_tag_details.nil?
      raise "Parameter value for 'tag_namespace_id' must not be blank" if OCI::Internal::Util.blank_string?(tag_namespace_id)

      path = '/tagNamespaces/{tagNamespaceId}/tags'.sub('{tagNamespaceId}', tag_namespace_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:isLockOverride] = opts[:is_lock_override] if !opts[:is_lock_override].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_tag_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#create_tag') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::Tag'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new tag default in the specified compartment for the specified tag definition.
    #
    # If you specify that a value is required, a value is set during resource creation (either by
    # the user creating the resource or another tag defualt). If no value is set, resource creation
    # is blocked.
    #
    # * If the `isRequired` flag is set to \"true\", the value is set during resource creation.
    # * If the `isRequired` flag is set to \"false\", the value you enter is set during resource creation.
    #
    # @param [OCI::Identity::Models::CreateTagDefaultDetails] create_tag_default_details Request object for creating a new tag default.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::TagDefault TagDefault}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/create_tag_default.rb.html) to see an example of how to use create_tag_default API.
    def create_tag_default(create_tag_default_details, opts = {})
      logger.debug 'Calling operation IdentityClient#create_tag_default.' if logger

      raise "Missing the required parameter 'create_tag_default_details' when calling create_tag_default." if create_tag_default_details.nil?

      path = '/tagDefaults'
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

      post_body = @api_client.object_to_http_body(create_tag_default_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#create_tag_default') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::TagDefault'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new tag namespace in the specified compartment.
    #
    # You must specify the compartment ID in the request object (remember that the tenancy is simply the root
    # compartment).
    #
    # You must also specify a *name* for the namespace, which must be unique across all namespaces in your tenancy
    # and cannot be changed. The name can contain any ASCII character except the space (_) or period (.).
    # Names are case insensitive. That means, for example, \"myNamespace\" and \"mynamespace\" are not allowed
    # in the same tenancy. Once you created a namespace, you cannot change the name.
    # If you specify a name that's already in use in the tenancy, a 409 error is returned.
    #
    # You must also specify a *description* for the namespace.
    # It does not have to be unique, and you can change it with
    # {#update_tag_namespace update_tag_namespace}.
    #
    # @param [OCI::Identity::Models::CreateTagNamespaceDetails] create_tag_namespace_details Request object for creating a new tag namespace.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::TagNamespace TagNamespace}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/create_tag_namespace.rb.html) to see an example of how to use create_tag_namespace API.
    def create_tag_namespace(create_tag_namespace_details, opts = {})
      logger.debug 'Calling operation IdentityClient#create_tag_namespace.' if logger

      raise "Missing the required parameter 'create_tag_namespace_details' when calling create_tag_namespace." if create_tag_namespace_details.nil?

      path = '/tagNamespaces'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_tag_namespace_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#create_tag_namespace') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::TagNamespace'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new user in your tenancy. For conceptual information about users, your tenancy, and other
    # IAM Service components, see [Overview of IAM](https://docs.cloud.oracle.com/Content/Identity/getstarted/identity-domains.htm).
    #
    # You must specify your tenancy's OCID as the compartment ID in the request object (remember that the
    # tenancy is simply the root compartment). Notice that IAM resources (users, groups, compartments, and
    # some policies) reside within the tenancy itself, unlike cloud resources such as compute instances,
    # which typically reside within compartments inside the tenancy. For information about OCIDs, see
    # [Resource Identifiers](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    #
    # You must also specify a *name* for the user, which must be unique across all users in your tenancy
    # and cannot be changed. Allowed characters: No spaces. Only letters, numerals, hyphens, periods,
    # underscores, +, and @. If you specify a name that's already in use, you'll get a 409 error.
    # This name will be the user's login to the Console. You might want to pick a
    # name that your company's own identity system (e.g., Active Directory, LDAP, etc.) already uses.
    # If you delete a user and then create a new user with the same name, they'll be considered different
    # users because they have different OCIDs.
    #
    # You must also specify a *description* for the user (although it can be an empty string).
    # It does not have to be unique, and you can change it anytime with
    # {#update_user update_user}. You can use the field to provide the user's
    # full name, a description, a nickname, or other information to generally identify the user.
    #
    # After you send your request, the new object's `lifecycleState` will temporarily be CREATING. Before
    # using the object, first make sure its `lifecycleState` has changed to ACTIVE.
    #
    # A new user has no permissions until you place the user in one or more groups (see
    # {#add_user_to_group add_user_to_group}). If the user needs to
    # access the Console, you need to provide the user a password (see
    # {#create_or_reset_ui_password create_or_reset_ui_password}).
    # If the user needs to access the Oracle Cloud Infrastructure REST API, you need to upload a
    # public API signing key for that user (see
    # [Required Keys and OCIDs](https://docs.cloud.oracle.com/Content/API/Concepts/apisigningkey.htm) and also
    # {#upload_api_key upload_api_key}).
    #
    # **Important:** Make sure to inform the new user which compartment(s) they have access to.
    #
    # @param [OCI::Identity::Models::CreateUserDetails] create_user_details Request object for creating a new user.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::User User}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/create_user.rb.html) to see an example of how to use create_user API.
    def create_user(create_user_details, opts = {})
      logger.debug 'Calling operation IdentityClient#create_user.' if logger

      raise "Missing the required parameter 'create_user_details' when calling create_user." if create_user_details.nil?

      path = '/users/'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_user_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#create_user') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::User'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # (For tenancies that support identity domains) Deactivates the specified identity domain. Identity domains must be in an ACTIVE
    # `lifecycleState` and have no active apps present in the domain or underlying Identity Cloud Service stripe. You cannot deactivate
    # the default identity domain.
    #
    # After you send your request, the `lifecycleDetails` of this identity domain is set to DEACTIVATING. When the operation completes,
    # then the `lifecycleDetails` is set to null and the `lifecycleState` is set to INACTIVE.
    #
    # To track the progress of the request, submitting an HTTP GET on the /iamWorkRequests/{iamWorkRequestsId} endpoint retrieves
    # the operation's status.
    #
    # @param [String] domain_id The OCID of the identity domain.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/deactivate_domain.rb.html) to see an example of how to use deactivate_domain API.
    def deactivate_domain(domain_id, opts = {})
      logger.debug 'Calling operation IdentityClient#deactivate_domain.' if logger

      raise "Missing the required parameter 'domain_id' when calling deactivate_domain." if domain_id.nil?
      raise "Parameter value for 'domain_id' must not be blank" if OCI::Internal::Util.blank_string?(domain_id)

      path = '/domains/{domainId}/actions/deactivate'.sub('{domainId}', domain_id.to_s)
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

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#deactivate_domain') do
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


    # Deletes the specified API signing key for the specified user.
    #
    # Every user has permission to use this operation to delete a key for *their own user ID*. An
    # administrator in your organization does not need to write a policy to give users this ability.
    # To compare, administrators who have permission to the tenancy can use this operation to delete
    # a key for any user, including themselves.
    #
    # @param [String] user_id The OCID of the user.
    # @param [String] fingerprint The key's fingerprint.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/delete_api_key.rb.html) to see an example of how to use delete_api_key API.
    def delete_api_key(user_id, fingerprint, opts = {})
      logger.debug 'Calling operation IdentityClient#delete_api_key.' if logger

      raise "Missing the required parameter 'user_id' when calling delete_api_key." if user_id.nil?
      raise "Missing the required parameter 'fingerprint' when calling delete_api_key." if fingerprint.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)
      raise "Parameter value for 'fingerprint' must not be blank" if OCI::Internal::Util.blank_string?(fingerprint)

      path = '/users/{userId}/apiKeys/{fingerprint}'.sub('{userId}', user_id.to_s).sub('{fingerprint}', fingerprint.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#delete_api_key') do
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


    # Deletes the specified auth token for the specified user.
    #
    # @param [String] user_id The OCID of the user.
    # @param [String] auth_token_id The OCID of the auth token.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/delete_auth_token.rb.html) to see an example of how to use delete_auth_token API.
    def delete_auth_token(user_id, auth_token_id, opts = {})
      logger.debug 'Calling operation IdentityClient#delete_auth_token.' if logger

      raise "Missing the required parameter 'user_id' when calling delete_auth_token." if user_id.nil?
      raise "Missing the required parameter 'auth_token_id' when calling delete_auth_token." if auth_token_id.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)
      raise "Parameter value for 'auth_token_id' must not be blank" if OCI::Internal::Util.blank_string?(auth_token_id)

      path = '/users/{userId}/authTokens/{authTokenId}'.sub('{userId}', user_id.to_s).sub('{authTokenId}', auth_token_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#delete_auth_token') do
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


    # Deletes the specified compartment. The compartment must be empty.
    #
    # @param [String] compartment_id The OCID of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/delete_compartment.rb.html) to see an example of how to use delete_compartment API.
    def delete_compartment(compartment_id, opts = {})
      logger.debug 'Calling operation IdentityClient#delete_compartment.' if logger

      raise "Missing the required parameter 'compartment_id' when calling delete_compartment." if compartment_id.nil?
      raise "Parameter value for 'compartment_id' must not be blank" if OCI::Internal::Util.blank_string?(compartment_id)

      path = '/compartments/{compartmentId}'.sub('{compartmentId}', compartment_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#delete_compartment') do
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


    # Deletes the specified secret key for the specified user.
    #
    # @param [String] user_id The OCID of the user.
    # @param [String] customer_secret_key_id The access token of the secret key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/delete_customer_secret_key.rb.html) to see an example of how to use delete_customer_secret_key API.
    def delete_customer_secret_key(user_id, customer_secret_key_id, opts = {})
      logger.debug 'Calling operation IdentityClient#delete_customer_secret_key.' if logger

      raise "Missing the required parameter 'user_id' when calling delete_customer_secret_key." if user_id.nil?
      raise "Missing the required parameter 'customer_secret_key_id' when calling delete_customer_secret_key." if customer_secret_key_id.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)
      raise "Parameter value for 'customer_secret_key_id' must not be blank" if OCI::Internal::Util.blank_string?(customer_secret_key_id)

      path = '/users/{userId}/customerSecretKeys/{customerSecretKeyId}'.sub('{userId}', user_id.to_s).sub('{customerSecretKeyId}', customer_secret_key_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#delete_customer_secret_key') do
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


    # Deletes the specified DB credential for the specified user.
    #
    # @param [String] user_id The OCID of the user.
    # @param [String] db_credential_id The OCID of the DB credential.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/delete_db_credential.rb.html) to see an example of how to use delete_db_credential API.
    def delete_db_credential(user_id, db_credential_id, opts = {})
      logger.debug 'Calling operation IdentityClient#delete_db_credential.' if logger

      raise "Missing the required parameter 'user_id' when calling delete_db_credential." if user_id.nil?
      raise "Missing the required parameter 'db_credential_id' when calling delete_db_credential." if db_credential_id.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)
      raise "Parameter value for 'db_credential_id' must not be blank" if OCI::Internal::Util.blank_string?(db_credential_id)

      path = '/users/{userId}/dbCredentials/{dbCredentialId}'.sub('{userId}', user_id.to_s).sub('{dbCredentialId}', db_credential_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#delete_db_credential') do
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


    # (For tenancies that support identity domains) Deletes an identity domain. The identity domain must have no active apps present in
    # the underlying IDCS stripe. You must also deactivate the identity domain, rendering the `lifecycleState` of the identity domain INACTIVE.
    # Furthermore, as the authenticated user performing the operation, you cannot be a member of the identity domain you are deleting.
    # Lastly, you cannot delete the default identity domain. A tenancy must always have at least the default identity domain.
    #
    # To track the progress of the request, submitting an HTTP GET on the /iamWorkRequests/{iamWorkRequestsId} endpoint retrieves
    # the operation's status.
    #
    # @param [String] domain_id The OCID of the identity domain.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/delete_domain.rb.html) to see an example of how to use delete_domain API.
    def delete_domain(domain_id, opts = {})
      logger.debug 'Calling operation IdentityClient#delete_domain.' if logger

      raise "Missing the required parameter 'domain_id' when calling delete_domain." if domain_id.nil?
      raise "Parameter value for 'domain_id' must not be blank" if OCI::Internal::Util.blank_string?(domain_id)

      path = '/domains/{domainId}'.sub('{domainId}', domain_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#delete_domain') do
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


    # Deletes the specified dynamic group.
    #
    # @param [String] dynamic_group_id The OCID of the dynamic group.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/delete_dynamic_group.rb.html) to see an example of how to use delete_dynamic_group API.
    def delete_dynamic_group(dynamic_group_id, opts = {})
      logger.debug 'Calling operation IdentityClient#delete_dynamic_group.' if logger

      raise "Missing the required parameter 'dynamic_group_id' when calling delete_dynamic_group." if dynamic_group_id.nil?
      raise "Parameter value for 'dynamic_group_id' must not be blank" if OCI::Internal::Util.blank_string?(dynamic_group_id)

      path = '/dynamicGroups/{dynamicGroupId}'.sub('{dynamicGroupId}', dynamic_group_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#delete_dynamic_group') do
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


    # Deletes the specified group. The group must be empty.
    #
    # @param [String] group_id The OCID of the group.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/delete_group.rb.html) to see an example of how to use delete_group API.
    def delete_group(group_id, opts = {})
      logger.debug 'Calling operation IdentityClient#delete_group.' if logger

      raise "Missing the required parameter 'group_id' when calling delete_group." if group_id.nil?
      raise "Parameter value for 'group_id' must not be blank" if OCI::Internal::Util.blank_string?(group_id)

      path = '/groups/{groupId}'.sub('{groupId}', group_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#delete_group') do
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


    # **Deprecated.** For more information, see [Deprecated IAM Service APIs](https://docs.cloud.oracle.com/Content/Identity/Reference/deprecatediamapis.htm).
    #
    # Deletes the specified identity provider. The identity provider must not have
    # any group mappings (see {IdpGroupMapping}).
    #
    # @param [String] identity_provider_id The OCID of the identity provider.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/delete_identity_provider.rb.html) to see an example of how to use delete_identity_provider API.
    def delete_identity_provider(identity_provider_id, opts = {})
      logger.debug 'Calling operation IdentityClient#delete_identity_provider.' if logger

      raise "Missing the required parameter 'identity_provider_id' when calling delete_identity_provider." if identity_provider_id.nil?
      raise "Parameter value for 'identity_provider_id' must not be blank" if OCI::Internal::Util.blank_string?(identity_provider_id)

      path = '/identityProviders/{identityProviderId}'.sub('{identityProviderId}', identity_provider_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#delete_identity_provider') do
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


    # **Deprecated.** For more information, see [Deprecated IAM Service APIs](https://docs.cloud.oracle.com/Content/Identity/Reference/deprecatediamapis.htm).
    #
    # Deletes the specified group mapping.
    #
    # @param [String] identity_provider_id The OCID of the identity provider.
    # @param [String] mapping_id The OCID of the group mapping.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/delete_idp_group_mapping.rb.html) to see an example of how to use delete_idp_group_mapping API.
    def delete_idp_group_mapping(identity_provider_id, mapping_id, opts = {})
      logger.debug 'Calling operation IdentityClient#delete_idp_group_mapping.' if logger

      raise "Missing the required parameter 'identity_provider_id' when calling delete_idp_group_mapping." if identity_provider_id.nil?
      raise "Missing the required parameter 'mapping_id' when calling delete_idp_group_mapping." if mapping_id.nil?
      raise "Parameter value for 'identity_provider_id' must not be blank" if OCI::Internal::Util.blank_string?(identity_provider_id)
      raise "Parameter value for 'mapping_id' must not be blank" if OCI::Internal::Util.blank_string?(mapping_id)

      path = '/identityProviders/{identityProviderId}/groupMappings/{mappingId}'.sub('{identityProviderId}', identity_provider_id.to_s).sub('{mappingId}', mapping_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#delete_idp_group_mapping') do
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


    # Deletes the specified MFA TOTP device for the specified user.
    #
    # @param [String] user_id The OCID of the user.
    # @param [String] mfa_totp_device_id The OCID of the MFA TOTP device.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/delete_mfa_totp_device.rb.html) to see an example of how to use delete_mfa_totp_device API.
    def delete_mfa_totp_device(user_id, mfa_totp_device_id, opts = {})
      logger.debug 'Calling operation IdentityClient#delete_mfa_totp_device.' if logger

      raise "Missing the required parameter 'user_id' when calling delete_mfa_totp_device." if user_id.nil?
      raise "Missing the required parameter 'mfa_totp_device_id' when calling delete_mfa_totp_device." if mfa_totp_device_id.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)
      raise "Parameter value for 'mfa_totp_device_id' must not be blank" if OCI::Internal::Util.blank_string?(mfa_totp_device_id)

      path = '/users/{userId}/mfaTotpDevices/{mfaTotpDeviceId}'.sub('{userId}', user_id.to_s).sub('{mfaTotpDeviceId}', mfa_totp_device_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#delete_mfa_totp_device') do
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


    # Deletes the specified network source.
    #
    # @param [String] network_source_id The OCID of the network source.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/delete_network_source.rb.html) to see an example of how to use delete_network_source API.
    def delete_network_source(network_source_id, opts = {})
      logger.debug 'Calling operation IdentityClient#delete_network_source.' if logger

      raise "Missing the required parameter 'network_source_id' when calling delete_network_source." if network_source_id.nil?
      raise "Parameter value for 'network_source_id' must not be blank" if OCI::Internal::Util.blank_string?(network_source_id)

      path = '/networkSources/{networkSourceId}'.sub('{networkSourceId}', network_source_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#delete_network_source') do
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


    # Delete Oauth token for the user
    #
    # @param [String] user_id The OCID of the user.
    # @param [String] oauth2_client_credential_id The ID of the Oauth credential.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/delete_o_auth_client_credential.rb.html) to see an example of how to use delete_o_auth_client_credential API.
    def delete_o_auth_client_credential(user_id, oauth2_client_credential_id, opts = {})
      logger.debug 'Calling operation IdentityClient#delete_o_auth_client_credential.' if logger

      raise "Missing the required parameter 'user_id' when calling delete_o_auth_client_credential." if user_id.nil?
      raise "Missing the required parameter 'oauth2_client_credential_id' when calling delete_o_auth_client_credential." if oauth2_client_credential_id.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)
      raise "Parameter value for 'oauth2_client_credential_id' must not be blank" if OCI::Internal::Util.blank_string?(oauth2_client_credential_id)

      path = '/users/{userId}/oauth2ClientCredentials/{oauth2ClientCredentialId}'.sub('{userId}', user_id.to_s).sub('{oauth2ClientCredentialId}', oauth2_client_credential_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#delete_o_auth_client_credential') do
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


    # Deletes the specified policy. The deletion takes effect typically within 10 seconds.
    # @param [String] policy_id The OCID of the policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/delete_policy.rb.html) to see an example of how to use delete_policy API.
    def delete_policy(policy_id, opts = {})
      logger.debug 'Calling operation IdentityClient#delete_policy.' if logger

      raise "Missing the required parameter 'policy_id' when calling delete_policy." if policy_id.nil?
      raise "Parameter value for 'policy_id' must not be blank" if OCI::Internal::Util.blank_string?(policy_id)

      path = '/policies/{policyId}'.sub('{policyId}', policy_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#delete_policy') do
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


    # Deletes the specified SMTP credential for the specified user.
    #
    # @param [String] user_id The OCID of the user.
    # @param [String] smtp_credential_id The OCID of the SMTP credential.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/delete_smtp_credential.rb.html) to see an example of how to use delete_smtp_credential API.
    def delete_smtp_credential(user_id, smtp_credential_id, opts = {})
      logger.debug 'Calling operation IdentityClient#delete_smtp_credential.' if logger

      raise "Missing the required parameter 'user_id' when calling delete_smtp_credential." if user_id.nil?
      raise "Missing the required parameter 'smtp_credential_id' when calling delete_smtp_credential." if smtp_credential_id.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)
      raise "Parameter value for 'smtp_credential_id' must not be blank" if OCI::Internal::Util.blank_string?(smtp_credential_id)

      path = '/users/{userId}/smtpCredentials/{smtpCredentialId}'.sub('{userId}', user_id.to_s).sub('{smtpCredentialId}', smtp_credential_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#delete_smtp_credential') do
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


    # **Deprecated. Use {#delete_auth_token delete_auth_token} instead.**
    #
    # Deletes the specified Swift password for the specified user.
    #
    # @param [String] user_id The OCID of the user.
    # @param [String] swift_password_id The OCID of the Swift password.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/delete_swift_password.rb.html) to see an example of how to use delete_swift_password API.
    def delete_swift_password(user_id, swift_password_id, opts = {})
      logger.debug 'Calling operation IdentityClient#delete_swift_password.' if logger

      raise "Missing the required parameter 'user_id' when calling delete_swift_password." if user_id.nil?
      raise "Missing the required parameter 'swift_password_id' when calling delete_swift_password." if swift_password_id.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)
      raise "Parameter value for 'swift_password_id' must not be blank" if OCI::Internal::Util.blank_string?(swift_password_id)

      path = '/users/{userId}/swiftPasswords/{swiftPasswordId}'.sub('{userId}', user_id.to_s).sub('{swiftPasswordId}', swift_password_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#delete_swift_password') do
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


    # Deletes the specified tag definition. This operation triggers a process that removes the
    # tag from all resources in your tenancy.
    #
    # These things happen immediately:
    #   * If the tag was a cost-tracking tag, it no longer counts against your 10 cost-tracking
    #   tags limit, whether you first disabled it or not.
    #   * If the tag was used with dynamic groups, none of the rules that contain the tag will
    #   be evaluated against the tag.
    #
    # When you start the delete operation, the state of the tag changes to DELETING and tag removal
    # from resources begins. This can take up to 48 hours depending on the number of resources that
    # were tagged as well as the regions in which those resources reside.
    #
    # When all tags have been removed, the state changes to DELETED. You cannot restore a deleted tag. Once the deleted tag
    # changes its state to DELETED, you can use the same tag name again.
    #
    # After you start this operation, you cannot start either the {#bulk_delete_tags bulk_delete_tags} or the {#cascade_delete_tag_namespace cascade_delete_tag_namespace} operation until this process completes.
    #
    # To delete a tag, you must first retire it. Use {#update_tag update_tag}
    # to retire a tag.
    #
    # @param [String] tag_namespace_id The OCID of the tag namespace.
    #
    # @param [String] tag_name The name of the tag.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [BOOLEAN] :is_lock_override Whether to override locks (if any exist). (default to false)
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/delete_tag.rb.html) to see an example of how to use delete_tag API.
    def delete_tag(tag_namespace_id, tag_name, opts = {})
      logger.debug 'Calling operation IdentityClient#delete_tag.' if logger

      raise "Missing the required parameter 'tag_namespace_id' when calling delete_tag." if tag_namespace_id.nil?
      raise "Missing the required parameter 'tag_name' when calling delete_tag." if tag_name.nil?
      raise "Parameter value for 'tag_namespace_id' must not be blank" if OCI::Internal::Util.blank_string?(tag_namespace_id)
      raise "Parameter value for 'tag_name' must not be blank" if OCI::Internal::Util.blank_string?(tag_name)

      path = '/tagNamespaces/{tagNamespaceId}/tags/{tagName}'.sub('{tagNamespaceId}', tag_namespace_id.to_s).sub('{tagName}', tag_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:isLockOverride] = opts[:is_lock_override] if !opts[:is_lock_override].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#delete_tag') do
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


    # Deletes the the specified tag default.
    #
    # @param [String] tag_default_id The OCID of the tag default.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [BOOLEAN] :is_lock_override Whether to override locks (if any exist). (default to false)
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/delete_tag_default.rb.html) to see an example of how to use delete_tag_default API.
    def delete_tag_default(tag_default_id, opts = {})
      logger.debug 'Calling operation IdentityClient#delete_tag_default.' if logger

      raise "Missing the required parameter 'tag_default_id' when calling delete_tag_default." if tag_default_id.nil?
      raise "Parameter value for 'tag_default_id' must not be blank" if OCI::Internal::Util.blank_string?(tag_default_id)

      path = '/tagDefaults/{tagDefaultId}'.sub('{tagDefaultId}', tag_default_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:isLockOverride] = opts[:is_lock_override] if !opts[:is_lock_override].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#delete_tag_default') do
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


    # Deletes the specified tag namespace. Only an empty tag namespace can be deleted with this operation. To use this operation
    # to delete a tag namespace that contains tag definitions, first delete all of its tag definitions.
    #
    # Use {#cascade_delete_tag_namespace cascade_delete_tag_namespace} to delete a tag namespace along with all of
    # the tag definitions contained within that namespace.
    #
    # Use {#delete_tag delete_tag} to delete a tag definition.
    #
    # @param [String] tag_namespace_id The OCID of the tag namespace.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [BOOLEAN] :is_lock_override Whether to override locks (if any exist). (default to false)
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/delete_tag_namespace.rb.html) to see an example of how to use delete_tag_namespace API.
    def delete_tag_namespace(tag_namespace_id, opts = {})
      logger.debug 'Calling operation IdentityClient#delete_tag_namespace.' if logger

      raise "Missing the required parameter 'tag_namespace_id' when calling delete_tag_namespace." if tag_namespace_id.nil?
      raise "Parameter value for 'tag_namespace_id' must not be blank" if OCI::Internal::Util.blank_string?(tag_namespace_id)

      path = '/tagNamespaces/{tagNamespaceId}'.sub('{tagNamespaceId}', tag_namespace_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:isLockOverride] = opts[:is_lock_override] if !opts[:is_lock_override].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#delete_tag_namespace') do
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


    # Deletes the specified user. The user must not be in any groups.
    # @param [String] user_id The OCID of the user.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/delete_user.rb.html) to see an example of how to use delete_user API.
    def delete_user(user_id, opts = {})
      logger.debug 'Calling operation IdentityClient#delete_user.' if logger

      raise "Missing the required parameter 'user_id' when calling delete_user." if user_id.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)

      path = '/users/{userId}'.sub('{userId}', user_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#delete_user') do
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


    # (For tenancies that support identity domains) Replicates the identity domain to a new region (provided that the region is the
    # tenancy home region or other region that the tenancy subscribes to). You can only replicate identity domains that are in an ACTIVE
    # `lifecycleState` and not currently updating or already replicating. You also can only trigger the replication of secondary identity domains.
    # The default identity domain is automatically replicated to all regions that the tenancy subscribes to.
    #
    # After you send the request, the `state` of the identity domain in the replica region is set to ENABLING_REPLICATION. When the operation
    # completes, the `state` is set to REPLICATION_ENABLED.
    #
    # To track the progress of the request, submitting an HTTP GET on the /iamWorkRequests/{iamWorkRequestsId} endpoint retrieves
    # the operation's status.
    #
    # @param [String] domain_id The OCID of the identity domain.
    # @param [OCI::Identity::Models::EnableReplicationToRegionDetails] enable_replication_to_region_details The request object for replicating the identity domain to another region.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/enable_replication_to_region.rb.html) to see an example of how to use enable_replication_to_region API.
    def enable_replication_to_region(domain_id, enable_replication_to_region_details, opts = {})
      logger.debug 'Calling operation IdentityClient#enable_replication_to_region.' if logger

      raise "Missing the required parameter 'domain_id' when calling enable_replication_to_region." if domain_id.nil?
      raise "Missing the required parameter 'enable_replication_to_region_details' when calling enable_replication_to_region." if enable_replication_to_region_details.nil?
      raise "Parameter value for 'domain_id' must not be blank" if OCI::Internal::Util.blank_string?(domain_id)

      path = '/domains/{domainId}/actions/enableReplicationToRegion'.sub('{domainId}', domain_id.to_s)
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

      post_body = @api_client.object_to_http_body(enable_replication_to_region_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#enable_replication_to_region') do
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


    # Generate seed for the MFA TOTP device.
    #
    # @param [String] user_id The OCID of the user.
    # @param [String] mfa_totp_device_id The OCID of the MFA TOTP device.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::MfaTotpDevice MfaTotpDevice}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/generate_totp_seed.rb.html) to see an example of how to use generate_totp_seed API.
    def generate_totp_seed(user_id, mfa_totp_device_id, opts = {})
      logger.debug 'Calling operation IdentityClient#generate_totp_seed.' if logger

      raise "Missing the required parameter 'user_id' when calling generate_totp_seed." if user_id.nil?
      raise "Missing the required parameter 'mfa_totp_device_id' when calling generate_totp_seed." if mfa_totp_device_id.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)
      raise "Parameter value for 'mfa_totp_device_id' must not be blank" if OCI::Internal::Util.blank_string?(mfa_totp_device_id)

      path = '/users/{userId}/mfaTotpDevices/{mfaTotpDeviceId}/actions/generateSeed'.sub('{userId}', user_id.to_s).sub('{mfaTotpDeviceId}', mfa_totp_device_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#generate_totp_seed') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::MfaTotpDevice'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Gets the authentication policy for the given tenancy. You must specify your tenant\u2019s OCID as the value for
    # the compartment ID (remember that the tenancy is simply the root compartment).
    #
    # @param [String] compartment_id The OCID of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Identity::Models::AuthenticationPolicy AuthenticationPolicy}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/get_authentication_policy.rb.html) to see an example of how to use get_authentication_policy API.
    def get_authentication_policy(compartment_id, opts = {})
      logger.debug 'Calling operation IdentityClient#get_authentication_policy.' if logger

      raise "Missing the required parameter 'compartment_id' when calling get_authentication_policy." if compartment_id.nil?
      raise "Parameter value for 'compartment_id' must not be blank" if OCI::Internal::Util.blank_string?(compartment_id)

      path = '/authenticationPolicies/{compartmentId}'.sub('{compartmentId}', compartment_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#get_authentication_policy') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::AuthenticationPolicy'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Gets the specified compartment's information.
    #
    # This operation does not return a list of all the resources inside the compartment. There is no single
    # API operation that does that. Compartments can contain multiple types of resources (instances, block
    # storage volumes, etc.). To find out what's in a compartment, you must call the \"List\" operation for
    # each resource type and specify the compartment's OCID as a query parameter in the request. For example,
    # call the {#list_instances list_instances} operation in the Cloud Compute
    # Service or the {#list_volumes list_volumes} operation in Cloud Block Storage.
    #
    # @param [String] compartment_id The OCID of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Identity::Models::Compartment Compartment}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/get_compartment.rb.html) to see an example of how to use get_compartment API.
    def get_compartment(compartment_id, opts = {})
      logger.debug 'Calling operation IdentityClient#get_compartment.' if logger

      raise "Missing the required parameter 'compartment_id' when calling get_compartment." if compartment_id.nil?
      raise "Parameter value for 'compartment_id' must not be blank" if OCI::Internal::Util.blank_string?(compartment_id)

      path = '/compartments/{compartmentId}'.sub('{compartmentId}', compartment_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#get_compartment') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::Compartment'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # (For tenancies that support identity domains) Gets the specified identity domain's information.
    #
    # @param [String] domain_id The OCID of the identity domain.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::Domain Domain}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/get_domain.rb.html) to see an example of how to use get_domain API.
    def get_domain(domain_id, opts = {})
      logger.debug 'Calling operation IdentityClient#get_domain.' if logger

      raise "Missing the required parameter 'domain_id' when calling get_domain." if domain_id.nil?
      raise "Parameter value for 'domain_id' must not be blank" if OCI::Internal::Util.blank_string?(domain_id)

      path = '/domains/{domainId}'.sub('{domainId}', domain_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#get_domain') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::Domain'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Gets the specified dynamic group's information.
    #
    # @param [String] dynamic_group_id The OCID of the dynamic group.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Identity::Models::DynamicGroup DynamicGroup}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/get_dynamic_group.rb.html) to see an example of how to use get_dynamic_group API.
    def get_dynamic_group(dynamic_group_id, opts = {})
      logger.debug 'Calling operation IdentityClient#get_dynamic_group.' if logger

      raise "Missing the required parameter 'dynamic_group_id' when calling get_dynamic_group." if dynamic_group_id.nil?
      raise "Parameter value for 'dynamic_group_id' must not be blank" if OCI::Internal::Util.blank_string?(dynamic_group_id)

      path = '/dynamicGroups/{dynamicGroupId}'.sub('{dynamicGroupId}', dynamic_group_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#get_dynamic_group') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::DynamicGroup'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Gets the specified group's information.
    #
    # This operation does not return a list of all the users in the group. To do that, use
    # {#list_user_group_memberships list_user_group_memberships} and
    # provide the group's OCID as a query parameter in the request.
    #
    # @param [String] group_id The OCID of the group.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Identity::Models::Group Group}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/get_group.rb.html) to see an example of how to use get_group API.
    def get_group(group_id, opts = {})
      logger.debug 'Calling operation IdentityClient#get_group.' if logger

      raise "Missing the required parameter 'group_id' when calling get_group." if group_id.nil?
      raise "Parameter value for 'group_id' must not be blank" if OCI::Internal::Util.blank_string?(group_id)

      path = '/groups/{groupId}'.sub('{groupId}', group_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#get_group') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::Group'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the details of a specified IAM work request. The workRequestID is returned in the opc-workrequest-id header for any asynchronous operation in the Identity and Access Management service.
    #
    # @param [String] iam_work_request_id The OCID of the IAM work request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::IamWorkRequest IamWorkRequest}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/get_iam_work_request.rb.html) to see an example of how to use get_iam_work_request API.
    def get_iam_work_request(iam_work_request_id, opts = {})
      logger.debug 'Calling operation IdentityClient#get_iam_work_request.' if logger

      raise "Missing the required parameter 'iam_work_request_id' when calling get_iam_work_request." if iam_work_request_id.nil?
      raise "Parameter value for 'iam_work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(iam_work_request_id)

      path = '/iamWorkRequests/{iamWorkRequestId}'.sub('{iamWorkRequestId}', iam_work_request_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#get_iam_work_request') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::IamWorkRequest'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # **Deprecated.** For more information, see [Deprecated IAM Service APIs](https://docs.cloud.oracle.com/Content/Identity/Reference/deprecatediamapis.htm).
    #
    # Gets the specified identity provider's information.
    #
    # @param [String] identity_provider_id The OCID of the identity provider.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Identity::Models::IdentityProvider IdentityProvider}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/get_identity_provider.rb.html) to see an example of how to use get_identity_provider API.
    def get_identity_provider(identity_provider_id, opts = {})
      logger.debug 'Calling operation IdentityClient#get_identity_provider.' if logger

      raise "Missing the required parameter 'identity_provider_id' when calling get_identity_provider." if identity_provider_id.nil?
      raise "Parameter value for 'identity_provider_id' must not be blank" if OCI::Internal::Util.blank_string?(identity_provider_id)

      path = '/identityProviders/{identityProviderId}'.sub('{identityProviderId}', identity_provider_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#get_identity_provider') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::IdentityProvider'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # **Deprecated.** For more information, see [Deprecated IAM Service APIs](https://docs.cloud.oracle.com/Content/Identity/Reference/deprecatediamapis.htm).
    #
    # Gets the specified group mapping.
    #
    # @param [String] identity_provider_id The OCID of the identity provider.
    # @param [String] mapping_id The OCID of the group mapping.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Identity::Models::IdpGroupMapping IdpGroupMapping}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/get_idp_group_mapping.rb.html) to see an example of how to use get_idp_group_mapping API.
    def get_idp_group_mapping(identity_provider_id, mapping_id, opts = {})
      logger.debug 'Calling operation IdentityClient#get_idp_group_mapping.' if logger

      raise "Missing the required parameter 'identity_provider_id' when calling get_idp_group_mapping." if identity_provider_id.nil?
      raise "Missing the required parameter 'mapping_id' when calling get_idp_group_mapping." if mapping_id.nil?
      raise "Parameter value for 'identity_provider_id' must not be blank" if OCI::Internal::Util.blank_string?(identity_provider_id)
      raise "Parameter value for 'mapping_id' must not be blank" if OCI::Internal::Util.blank_string?(mapping_id)

      path = '/identityProviders/{identityProviderId}/groupMappings/{mappingId}'.sub('{identityProviderId}', identity_provider_id.to_s).sub('{mappingId}', mapping_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#get_idp_group_mapping') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::IdpGroupMapping'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Get the specified MFA TOTP device for the specified user.
    #
    # @param [String] user_id The OCID of the user.
    # @param [String] mfa_totp_device_id The OCID of the MFA TOTP device.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Identity::Models::MfaTotpDeviceSummary MfaTotpDeviceSummary}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/get_mfa_totp_device.rb.html) to see an example of how to use get_mfa_totp_device API.
    def get_mfa_totp_device(user_id, mfa_totp_device_id, opts = {})
      logger.debug 'Calling operation IdentityClient#get_mfa_totp_device.' if logger

      raise "Missing the required parameter 'user_id' when calling get_mfa_totp_device." if user_id.nil?
      raise "Missing the required parameter 'mfa_totp_device_id' when calling get_mfa_totp_device." if mfa_totp_device_id.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)
      raise "Parameter value for 'mfa_totp_device_id' must not be blank" if OCI::Internal::Util.blank_string?(mfa_totp_device_id)

      path = '/users/{userId}/mfaTotpDevices/{mfaTotpDeviceId}'.sub('{userId}', user_id.to_s).sub('{mfaTotpDeviceId}', mfa_totp_device_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#get_mfa_totp_device') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::MfaTotpDeviceSummary'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Gets the specified network source's information.
    #
    # @param [String] network_source_id The OCID of the network source.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Identity::Models::NetworkSources NetworkSources}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/get_network_source.rb.html) to see an example of how to use get_network_source API.
    def get_network_source(network_source_id, opts = {})
      logger.debug 'Calling operation IdentityClient#get_network_source.' if logger

      raise "Missing the required parameter 'network_source_id' when calling get_network_source." if network_source_id.nil?
      raise "Parameter value for 'network_source_id' must not be blank" if OCI::Internal::Util.blank_string?(network_source_id)

      path = '/networkSources/{networkSourceId}'.sub('{networkSourceId}', network_source_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#get_network_source') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::NetworkSources'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Gets the specified policy's information.
    # @param [String] policy_id The OCID of the policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Identity::Models::Policy Policy}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/get_policy.rb.html) to see an example of how to use get_policy API.
    def get_policy(policy_id, opts = {})
      logger.debug 'Calling operation IdentityClient#get_policy.' if logger

      raise "Missing the required parameter 'policy_id' when calling get_policy." if policy_id.nil?
      raise "Parameter value for 'policy_id' must not be blank" if OCI::Internal::Util.blank_string?(policy_id)

      path = '/policies/{policyId}'.sub('{policyId}', policy_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#get_policy') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::Policy'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Retrieve the standard tag namespace template given the standard tag namespace name.
    #
    # @param [String] compartment_id The OCID of the compartment (remember that the tenancy is simply the root compartment).
    #
    # @param [String] standard_tag_namespace_name The name of the standard tag namespace tempate that is requested
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Identity::Models::StandardTagNamespaceTemplate StandardTagNamespaceTemplate}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/get_standard_tag_template.rb.html) to see an example of how to use get_standard_tag_template API.
    def get_standard_tag_template(compartment_id, standard_tag_namespace_name, opts = {})
      logger.debug 'Calling operation IdentityClient#get_standard_tag_template.' if logger

      raise "Missing the required parameter 'compartment_id' when calling get_standard_tag_template." if compartment_id.nil?
      raise "Missing the required parameter 'standard_tag_namespace_name' when calling get_standard_tag_template." if standard_tag_namespace_name.nil?
      raise "Parameter value for 'standard_tag_namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(standard_tag_namespace_name)

      path = '/tags/standardTagNamespaceTemplates/{standardTagNamespaceName}'.sub('{standardTagNamespaceName}', standard_tag_namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#get_standard_tag_template') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::StandardTagNamespaceTemplate'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Gets the specified tag's information.
    # @param [String] tag_namespace_id The OCID of the tag namespace.
    #
    # @param [String] tag_name The name of the tag.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Identity::Models::Tag Tag}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/get_tag.rb.html) to see an example of how to use get_tag API.
    def get_tag(tag_namespace_id, tag_name, opts = {})
      logger.debug 'Calling operation IdentityClient#get_tag.' if logger

      raise "Missing the required parameter 'tag_namespace_id' when calling get_tag." if tag_namespace_id.nil?
      raise "Missing the required parameter 'tag_name' when calling get_tag." if tag_name.nil?
      raise "Parameter value for 'tag_namespace_id' must not be blank" if OCI::Internal::Util.blank_string?(tag_namespace_id)
      raise "Parameter value for 'tag_name' must not be blank" if OCI::Internal::Util.blank_string?(tag_name)

      path = '/tagNamespaces/{tagNamespaceId}/tags/{tagName}'.sub('{tagNamespaceId}', tag_namespace_id.to_s).sub('{tagName}', tag_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#get_tag') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::Tag'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Retrieves the specified tag default.
    #
    # @param [String] tag_default_id The OCID of the tag default.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Identity::Models::TagDefault TagDefault}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/get_tag_default.rb.html) to see an example of how to use get_tag_default API.
    def get_tag_default(tag_default_id, opts = {})
      logger.debug 'Calling operation IdentityClient#get_tag_default.' if logger

      raise "Missing the required parameter 'tag_default_id' when calling get_tag_default." if tag_default_id.nil?
      raise "Parameter value for 'tag_default_id' must not be blank" if OCI::Internal::Util.blank_string?(tag_default_id)

      path = '/tagDefaults/{tagDefaultId}'.sub('{tagDefaultId}', tag_default_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#get_tag_default') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::TagDefault'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Gets the specified tag namespace's information.
    #
    # @param [String] tag_namespace_id The OCID of the tag namespace.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Identity::Models::TagNamespace TagNamespace}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/get_tag_namespace.rb.html) to see an example of how to use get_tag_namespace API.
    def get_tag_namespace(tag_namespace_id, opts = {})
      logger.debug 'Calling operation IdentityClient#get_tag_namespace.' if logger

      raise "Missing the required parameter 'tag_namespace_id' when calling get_tag_namespace." if tag_namespace_id.nil?
      raise "Parameter value for 'tag_namespace_id' must not be blank" if OCI::Internal::Util.blank_string?(tag_namespace_id)

      path = '/tagNamespaces/{tagNamespaceId}'.sub('{tagNamespaceId}', tag_namespace_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#get_tag_namespace') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::TagNamespace'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Gets details on a specified work request. The workRequestID is returned in the opc-workrequest-id header
    # for any asynchronous operation in tagging service.
    #
    # @param [String] work_request_id The OCID of the work request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Identity::Models::TaggingWorkRequest TaggingWorkRequest}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/get_tagging_work_request.rb.html) to see an example of how to use get_tagging_work_request API.
    def get_tagging_work_request(work_request_id, opts = {})
      logger.debug 'Calling operation IdentityClient#get_tagging_work_request.' if logger

      raise "Missing the required parameter 'work_request_id' when calling get_tagging_work_request." if work_request_id.nil?
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/taggingWorkRequests/{workRequestId}'.sub('{workRequestId}', work_request_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#get_tagging_work_request') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::TaggingWorkRequest'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Get the specified tenancy's information.
    # @param [String] tenancy_id The OCID of the tenancy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Identity::Models::Tenancy Tenancy}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/get_tenancy.rb.html) to see an example of how to use get_tenancy API.
    def get_tenancy(tenancy_id, opts = {})
      logger.debug 'Calling operation IdentityClient#get_tenancy.' if logger

      raise "Missing the required parameter 'tenancy_id' when calling get_tenancy." if tenancy_id.nil?
      raise "Parameter value for 'tenancy_id' must not be blank" if OCI::Internal::Util.blank_string?(tenancy_id)

      path = '/tenancies/{tenancyId}'.sub('{tenancyId}', tenancy_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#get_tenancy') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::Tenancy'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Gets the specified user's information.
    # @param [String] user_id The OCID of the user.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Identity::Models::User User}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/get_user.rb.html) to see an example of how to use get_user API.
    def get_user(user_id, opts = {})
      logger.debug 'Calling operation IdentityClient#get_user.' if logger

      raise "Missing the required parameter 'user_id' when calling get_user." if user_id.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)

      path = '/users/{userId}'.sub('{userId}', user_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#get_user') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::User'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Gets the specified UserGroupMembership's information.
    # @param [String] user_group_membership_id The OCID of the userGroupMembership.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Identity::Models::UserGroupMembership UserGroupMembership}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/get_user_group_membership.rb.html) to see an example of how to use get_user_group_membership API.
    def get_user_group_membership(user_group_membership_id, opts = {})
      logger.debug 'Calling operation IdentityClient#get_user_group_membership.' if logger

      raise "Missing the required parameter 'user_group_membership_id' when calling get_user_group_membership." if user_group_membership_id.nil?
      raise "Parameter value for 'user_group_membership_id' must not be blank" if OCI::Internal::Util.blank_string?(user_group_membership_id)

      path = '/userGroupMemberships/{userGroupMembershipId}'.sub('{userGroupMembershipId}', user_group_membership_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#get_user_group_membership') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::UserGroupMembership'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Gets the specified user's console password information. The returned object contains the user's OCID,
    # but not the password itself. The actual password is returned only when created or reset.
    #
    # @param [String] user_id The OCID of the user.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Identity::Models::UIPasswordInformation UIPasswordInformation}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/get_user_ui_password_information.rb.html) to see an example of how to use get_user_ui_password_information API.
    def get_user_ui_password_information(user_id, opts = {})
      logger.debug 'Calling operation IdentityClient#get_user_ui_password_information.' if logger

      raise "Missing the required parameter 'user_id' when calling get_user_ui_password_information." if user_id.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)

      path = '/users/{userId}/uiPassword'.sub('{userId}', user_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#get_user_ui_password_information') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::UIPasswordInformation'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Gets details on a specified work request. The workRequestID is returned in the opc-workrequest-id header
    # for any asynchronous operation in the compartment service.
    #
    # @param [String] work_request_id The OCID of the work request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Identity::Models::WorkRequest WorkRequest}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/get_work_request.rb.html) to see an example of how to use get_work_request API.
    def get_work_request(work_request_id, opts = {})
      logger.debug 'Calling operation IdentityClient#get_work_request.' if logger

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
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#get_work_request') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::WorkRequest'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # OCI will release Tag Namespaces that our customers can import.
    # These Tag Namespaces will provide Tags for our customers and Partners to provide consistency and enable data reporting.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [OCI::Identity::Models::ImportStandardTagsDetails] :import_standard_tags_details The request object for creating or updating standard tag namespace.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/import_standard_tags.rb.html) to see an example of how to use import_standard_tags API.
    def import_standard_tags(opts = {})
      logger.debug 'Calling operation IdentityClient#import_standard_tags.' if logger


      path = '/tags/actions/importStandardTags'
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

      post_body = @api_client.object_to_http_body(opts[:import_standard_tags_details])

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#import_standard_tags') do
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


    # (For tenancies that support identity domains) Lists the license types for identity domains supported by Oracle Cloud Infrastructure.
    # (License types are also referred to as domain types.)
    #
    # If `currentLicenseTypeName` is provided, then the request returns license types that the identity domain with the specified license
    # type name can change to. Otherwise, the request returns all valid license types currently supported.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :current_license_type_name The license type of the identity domain.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::AllowedDomainLicenseTypeSummary AllowedDomainLicenseTypeSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/list_allowed_domain_license_types.rb.html) to see an example of how to use list_allowed_domain_license_types API.
    def list_allowed_domain_license_types(opts = {})
      logger.debug 'Calling operation IdentityClient#list_allowed_domain_license_types.' if logger


      path = '/allowedDomainLicenseTypes'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:currentLicenseTypeName] = opts[:current_license_type_name] if opts[:current_license_type_name]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_allowed_domain_license_types') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::AllowedDomainLicenseTypeSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Lists the API signing keys for the specified user. A user can have a maximum of three keys.
    #
    # Every user has permission to use this API call for *their own user ID*.  An administrator in your
    # organization does not need to write a policy to give users this ability.
    #
    # @param [String] user_id The OCID of the user.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::ApiKey ApiKey}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/list_api_keys.rb.html) to see an example of how to use list_api_keys API.
    def list_api_keys(user_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_api_keys.' if logger

      raise "Missing the required parameter 'user_id' when calling list_api_keys." if user_id.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)

      path = '/users/{userId}/apiKeys/'.sub('{userId}', user_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_api_keys') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::ApiKey>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Lists the auth tokens for the specified user. The returned object contains the token's OCID, but not
    # the token itself. The actual token is returned only upon creation.
    #
    # @param [String] user_id The OCID of the user.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::AuthToken AuthToken}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/list_auth_tokens.rb.html) to see an example of how to use list_auth_tokens API.
    def list_auth_tokens(user_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_auth_tokens.' if logger

      raise "Missing the required parameter 'user_id' when calling list_auth_tokens." if user_id.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)

      path = '/users/{userId}/authTokens/'.sub('{userId}', user_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_auth_tokens') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::AuthToken>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Lists the availability domains in your tenancy. Specify the OCID of either the tenancy or another
    # of your compartments as the value for the compartment ID (remember that the tenancy is simply the root compartment).
    # See [Where to Get the Tenancy's OCID and User's OCID](https://docs.cloud.oracle.com/Content/API/Concepts/apisigningkey.htm#five).
    # Note that the order of the results returned can change if availability domains are added or removed; therefore, do not
    # create a dependency on the list order.
    #
    # @param [String] compartment_id The OCID of the compartment (remember that the tenancy is simply the root compartment).
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::AvailabilityDomain AvailabilityDomain}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/list_availability_domains.rb.html) to see an example of how to use list_availability_domains API.
    def list_availability_domains(compartment_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_availability_domains.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_availability_domains." if compartment_id.nil?

      path = '/availabilityDomains/'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_availability_domains') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::AvailabilityDomain>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the resource-types supported by compartment bulk actions. Use this API to help you provide the correct
    # resource-type information to the {#bulk_delete_resources bulk_delete_resources}
    # and {#bulk_move_resources bulk_move_resources} operations. The returned list of
    # resource-types provides the appropriate resource-type names to use with the bulk action operations along with
    # the type of identifying information you'll need to provide for each resource-type. Most resource-types just
    # require an [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) to identify a specific resource, but some resource-types,
    # such as buckets, require you to provide other identifying information.
    #
    # @param [String] bulk_action_type The type of bulk action.
    #
    #   Allowed values are: BULK_MOVE_RESOURCES, BULK_DELETE_RESOURCES
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::BulkActionResourceTypeCollection BulkActionResourceTypeCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/list_bulk_action_resource_types.rb.html) to see an example of how to use list_bulk_action_resource_types API.
    def list_bulk_action_resource_types(bulk_action_type, opts = {})
      logger.debug 'Calling operation IdentityClient#list_bulk_action_resource_types.' if logger

      raise "Missing the required parameter 'bulk_action_type' when calling list_bulk_action_resource_types." if bulk_action_type.nil?
      unless %w[BULK_MOVE_RESOURCES BULK_DELETE_RESOURCES].include?(bulk_action_type)
        raise "Invalid value for 'bulk_action_type', must be one of BULK_MOVE_RESOURCES, BULK_DELETE_RESOURCES."
      end

      path = '/compartments/bulkActionResourceTypes'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:bulkActionType] = bulk_action_type
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_bulk_action_resource_types') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::BulkActionResourceTypeCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the resource types that support bulk tag editing.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::BulkEditTagsResourceTypeCollection BulkEditTagsResourceTypeCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/list_bulk_edit_tags_resource_types.rb.html) to see an example of how to use list_bulk_edit_tags_resource_types API.
    def list_bulk_edit_tags_resource_types(opts = {})
      logger.debug 'Calling operation IdentityClient#list_bulk_edit_tags_resource_types.' if logger


      path = '/tags/bulkEditResourceTypes'
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
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_bulk_edit_tags_resource_types') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::BulkEditTagsResourceTypeCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the compartments in a specified compartment. The members of the list
    # returned depends on the values set for several parameters.
    #
    # With the exception of the tenancy (root compartment), the ListCompartments operation
    # returns only the first-level child compartments in the parent compartment specified in
    # `compartmentId`. The list does not include any subcompartments of the child
    # compartments (grandchildren).
    #
    # The parameter `accessLevel` specifies whether to return only those compartments for which the
    # requestor has INSPECT permissions on at least one resource directly
    # or indirectly (the resource can be in a subcompartment).
    #
    # The parameter `compartmentIdInSubtree` applies only when you perform ListCompartments on the
    # tenancy (root compartment). When set to true, the entire hierarchy of compartments can be returned.
    # To get a full list of all compartments and subcompartments in the tenancy (root compartment),
    # set the parameter `compartmentIdInSubtree` to true and `accessLevel` to ANY.
    #
    # See [Where to Get the Tenancy's OCID and User's OCID](https://docs.cloud.oracle.com/Content/API/Concepts/apisigningkey.htm#five).
    #
    # @param [String] compartment_id The OCID of the compartment (remember that the tenancy is simply the root compartment).
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @option opts [String] :access_level Valid values are `ANY` and `ACCESSIBLE`. Default is `ANY`.
    #   Setting this to `ACCESSIBLE` returns only those compartments for which the
    #   user has INSPECT permissions directly or indirectly (permissions can be on a
    #   resource in a subcompartment). For the compartments on which the user indirectly has
    #   INSPECT permissions, a restricted set of fields is returned.
    #
    #   When set to `ANY` permissions are not checked.
    #
    #   Allowed values are: ANY, ACCESSIBLE
    # @option opts [BOOLEAN] :compartment_id_in_subtree Default is false. Can only be set to true when performing
    #   ListCompartments on the tenancy (root compartment).
    #   When set to true, the hierarchy of compartments is traversed
    #   and all compartments and subcompartments in the tenancy are
    #   returned depending on the the setting of `accessLevel`.
    #
    # @option opts [String] :name A filter to only return resources that match the given name exactly.
    #
    # @option opts [String] :sort_by The field to sort by. You can provide one sort order (`sortOrder`). Default order for
    #   TIMECREATED is descending. Default order for NAME is ascending. The NAME
    #   sort order is case sensitive.
    #
    #   **Note:** In general, some \"List\" operations (for example, `ListInstances`) let you
    #   optionally filter by Availability Domain if the scope of the resource type is within a
    #   single Availability Domain. If you call one of these \"List\" operations without specifying
    #   an Availability Domain, the resources are grouped by Availability Domain, then sorted.
    #
    #   Allowed values are: TIMECREATED, NAME
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). The NAME sort order
    #   is case sensitive.
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :lifecycle_state A filter to only return resources that match the given lifecycle state.  The state value is case-insensitive.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::Compartment Compartment}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/list_compartments.rb.html) to see an example of how to use list_compartments API.
    def list_compartments(compartment_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_compartments.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_compartments." if compartment_id.nil?

      if opts[:access_level] && !%w[ANY ACCESSIBLE].include?(opts[:access_level])
        raise 'Invalid value for "access_level", must be one of ANY, ACCESSIBLE.'
      end

      if opts[:sort_by] && !%w[TIMECREATED NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, NAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Identity::Models::Compartment::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Identity::Models::Compartment::LIFECYCLE_STATE_ENUM.'
      end

      path = '/compartments/'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:accessLevel] = opts[:access_level] if opts[:access_level]
      query_params[:compartmentIdInSubtree] = opts[:compartment_id_in_subtree] if !opts[:compartment_id_in_subtree].nil?
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_compartments') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::Compartment>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists all the tags enabled for cost-tracking in the specified tenancy. For information about
    # cost-tracking tags, see [Using Cost-tracking Tags](https://docs.cloud.oracle.com/Content/Tagging/Tasks/usingcosttrackingtags.htm).
    #
    # @param [String] compartment_id The OCID of the compartment (remember that the tenancy is simply the root compartment).
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::Tag Tag}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/list_cost_tracking_tags.rb.html) to see an example of how to use list_cost_tracking_tags API.
    def list_cost_tracking_tags(compartment_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_cost_tracking_tags.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_cost_tracking_tags." if compartment_id.nil?

      path = '/tagNamespaces/actions/listCostTrackingTags'
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
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_cost_tracking_tags') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::Tag>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Lists the secret keys for the specified user. The returned object contains the secret key's OCID, but not
    # the secret key itself. The actual secret key is returned only upon creation.
    #
    # @param [String] user_id The OCID of the user.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::CustomerSecretKeySummary CustomerSecretKeySummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/list_customer_secret_keys.rb.html) to see an example of how to use list_customer_secret_keys API.
    def list_customer_secret_keys(user_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_customer_secret_keys.' if logger

      raise "Missing the required parameter 'user_id' when calling list_customer_secret_keys." if user_id.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)

      path = '/users/{userId}/customerSecretKeys/'.sub('{userId}', user_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_customer_secret_keys') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::CustomerSecretKeySummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the DB credentials for the specified user. The returned object contains the credential's OCID
    #
    # @param [String] user_id The OCID of the user.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @option opts [String] :name A filter to only return resources that match the given name exactly.
    #
    # @option opts [String] :sort_by The field to sort by. You can provide one sort order (`sortOrder`). Default order for
    #   TIMECREATED is descending. Default order for NAME is ascending. The NAME
    #   sort order is case sensitive.
    #
    #   **Note:** In general, some \"List\" operations (for example, `ListInstances`) let you
    #   optionally filter by Availability Domain if the scope of the resource type is within a
    #   single Availability Domain. If you call one of these \"List\" operations without specifying
    #   an Availability Domain, the resources are grouped by Availability Domain, then sorted.
    #
    #   Allowed values are: TIMECREATED, NAME
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). The NAME sort order
    #   is case sensitive.
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :lifecycle_state A filter to only return resources that match the given lifecycle state.  The state value is case-insensitive.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::DbCredentialSummary DbCredentialSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/list_db_credentials.rb.html) to see an example of how to use list_db_credentials API.
    def list_db_credentials(user_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_db_credentials.' if logger

      raise "Missing the required parameter 'user_id' when calling list_db_credentials." if user_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, NAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Identity::Models::DbCredential::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Identity::Models::DbCredential::LIFECYCLE_STATE_ENUM.'
      end
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)

      path = '/users/{userId}/dbCredentials/'.sub('{userId}', user_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_db_credentials') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::DbCredentialSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # (For tenancies that support identity domains) Lists all identity domains within a tenancy.
    #
    # @param [String] compartment_id The OCID of the compartment (remember that the tenancy is simply the root compartment).
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name The mutable display name of the identity domain.
    # @option opts [String] :url The region-agnostic identity domain URL.
    # @option opts [String] :home_region_url The region-specific identity domain URL.
    # @option opts [String] :type The identity domain type.
    # @option opts [String] :license_type The license type of the identity domain.
    # @option opts [BOOLEAN] :is_hidden_on_login Indicates whether or not the identity domain is visible at the sign-in screen.
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @option opts [String] :name A filter to only return resources that match the given name exactly.
    #
    # @option opts [String] :sort_by The field to sort by. You can provide one sort order (`sortOrder`). Default order for
    #   TIMECREATED is descending. Default order for NAME is ascending. The NAME
    #   sort order is case sensitive.
    #
    #   **Note:** In general, some \"List\" operations (for example, `ListInstances`) let you
    #   optionally filter by Availability Domain if the scope of the resource type is within a
    #   single Availability Domain. If you call one of these \"List\" operations without specifying
    #   an Availability Domain, the resources are grouped by Availability Domain, then sorted.
    #
    #   Allowed values are: TIMECREATED, NAME
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). The NAME sort order
    #   is case sensitive.
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :lifecycle_state A filter to only return resources that match the given lifecycle state. The state value is case-insensitive.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::DomainSummary DomainSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/list_domains.rb.html) to see an example of how to use list_domains API.
    def list_domains(compartment_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_domains.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_domains." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, NAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Identity::Models::Domain::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Identity::Models::Domain::LIFECYCLE_STATE_ENUM.'
      end

      path = '/domains/'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:url] = opts[:url] if opts[:url]
      query_params[:homeRegionUrl] = opts[:home_region_url] if opts[:home_region_url]
      query_params[:type] = opts[:type] if opts[:type]
      query_params[:licenseType] = opts[:license_type] if opts[:license_type]
      query_params[:isHiddenOnLogin] = opts[:is_hidden_on_login] if !opts[:is_hidden_on_login].nil?
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_domains') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::DomainSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the dynamic groups in your tenancy. You must specify your tenancy's OCID as the value for
    # the compartment ID (remember that the tenancy is simply the root compartment).
    # See [Where to Get the Tenancy's OCID and User's OCID](https://docs.cloud.oracle.com/Content/API/Concepts/apisigningkey.htm#five).
    #
    # @param [String] compartment_id The OCID of the compartment (remember that the tenancy is simply the root compartment).
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @option opts [String] :name A filter to only return resources that match the given name exactly.
    #
    # @option opts [String] :sort_by The field to sort by. You can provide one sort order (`sortOrder`). Default order for
    #   TIMECREATED is descending. Default order for NAME is ascending. The NAME
    #   sort order is case sensitive.
    #
    #   **Note:** In general, some \"List\" operations (for example, `ListInstances`) let you
    #   optionally filter by Availability Domain if the scope of the resource type is within a
    #   single Availability Domain. If you call one of these \"List\" operations without specifying
    #   an Availability Domain, the resources are grouped by Availability Domain, then sorted.
    #
    #   Allowed values are: TIMECREATED, NAME
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). The NAME sort order
    #   is case sensitive.
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :lifecycle_state A filter to only return resources that match the given lifecycle state.  The state value is case-insensitive.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::DynamicGroup DynamicGroup}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/list_dynamic_groups.rb.html) to see an example of how to use list_dynamic_groups API.
    def list_dynamic_groups(compartment_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_dynamic_groups.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_dynamic_groups." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, NAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Identity::Models::DynamicGroup::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Identity::Models::DynamicGroup::LIFECYCLE_STATE_ENUM.'
      end

      path = '/dynamicGroups/'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_dynamic_groups') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::DynamicGroup>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Lists the Fault Domains in your tenancy. Specify the OCID of either the tenancy or another
    # of your compartments as the value for the compartment ID (remember that the tenancy is simply the root compartment).
    # See [Where to Get the Tenancy's OCID and User's OCID](https://docs.cloud.oracle.com/Content/API/Concepts/apisigningkey.htm#five).
    #
    # @param [String] compartment_id The OCID of the compartment (remember that the tenancy is simply the root compartment).
    #
    # @param [String] availability_domain The name of the availabilityDomain.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::FaultDomain FaultDomain}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/list_fault_domains.rb.html) to see an example of how to use list_fault_domains API.
    def list_fault_domains(compartment_id, availability_domain, opts = {})
      logger.debug 'Calling operation IdentityClient#list_fault_domains.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_fault_domains." if compartment_id.nil?
      raise "Missing the required parameter 'availability_domain' when calling list_fault_domains." if availability_domain.nil?

      path = '/faultDomains/'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:availabilityDomain] = availability_domain

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_fault_domains') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::FaultDomain>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the groups in your tenancy. You must specify your tenancy's OCID as the value for
    # the compartment ID (remember that the tenancy is simply the root compartment).
    # See [Where to Get the Tenancy's OCID and User's OCID](https://docs.cloud.oracle.com/Content/API/Concepts/apisigningkey.htm#five).
    #
    # @param [String] compartment_id The OCID of the compartment (remember that the tenancy is simply the root compartment).
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @option opts [String] :name A filter to only return resources that match the given name exactly.
    #
    # @option opts [String] :sort_by The field to sort by. You can provide one sort order (`sortOrder`). Default order for
    #   TIMECREATED is descending. Default order for NAME is ascending. The NAME
    #   sort order is case sensitive.
    #
    #   **Note:** In general, some \"List\" operations (for example, `ListInstances`) let you
    #   optionally filter by Availability Domain if the scope of the resource type is within a
    #   single Availability Domain. If you call one of these \"List\" operations without specifying
    #   an Availability Domain, the resources are grouped by Availability Domain, then sorted.
    #
    #   Allowed values are: TIMECREATED, NAME
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). The NAME sort order
    #   is case sensitive.
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :lifecycle_state A filter to only return resources that match the given lifecycle state.  The state value is case-insensitive.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::Group Group}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/list_groups.rb.html) to see an example of how to use list_groups API.
    def list_groups(compartment_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_groups.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_groups." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, NAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Identity::Models::Group::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Identity::Models::Group::LIFECYCLE_STATE_ENUM.'
      end

      path = '/groups/'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_groups') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::Group>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets error details for a specified IAM work request. The workRequestID is returned in the opc-workrequest-id header for any asynchronous operation in the Identity and Access Management service.
    #
    # @param [String] iam_work_request_id The OCID of the IAM work request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). The NAME sort order
    #   is case sensitive.
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::IamWorkRequestErrorSummary IamWorkRequestErrorSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/list_iam_work_request_errors.rb.html) to see an example of how to use list_iam_work_request_errors API.
    def list_iam_work_request_errors(iam_work_request_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_iam_work_request_errors.' if logger

      raise "Missing the required parameter 'iam_work_request_id' when calling list_iam_work_request_errors." if iam_work_request_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'iam_work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(iam_work_request_id)

      path = '/iamWorkRequests/{iamWorkRequestId}/errors'.sub('{iamWorkRequestId}', iam_work_request_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_iam_work_request_errors') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::IamWorkRequestErrorSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets logs for a specified IAM work request. The workRequestID is returned in the opc-workrequest-id header for any asynchronous operation in the Identity and Access Management service.
    #
    # @param [String] iam_work_request_id The OCID of the IAM work request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). The NAME sort order
    #   is case sensitive.
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::IamWorkRequestLogSummary IamWorkRequestLogSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/list_iam_work_request_logs.rb.html) to see an example of how to use list_iam_work_request_logs API.
    def list_iam_work_request_logs(iam_work_request_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_iam_work_request_logs.' if logger

      raise "Missing the required parameter 'iam_work_request_id' when calling list_iam_work_request_logs." if iam_work_request_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'iam_work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(iam_work_request_id)

      path = '/iamWorkRequests/{iamWorkRequestId}/logs'.sub('{iamWorkRequestId}', iam_work_request_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_iam_work_request_logs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::IamWorkRequestLogSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the IAM work requests in compartment. The workRequestID is returned in the opc-workrequest-id header for any asynchronous operation in the Identity and Access Management service.
    #
    # @param [String] compartment_id The OCID of the compartment (remember that the tenancy is simply the root compartment).
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @option opts [String] :resource_identifier The identifier of the resource the work request affects.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::IamWorkRequestSummary IamWorkRequestSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/list_iam_work_requests.rb.html) to see an example of how to use list_iam_work_requests API.
    def list_iam_work_requests(compartment_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_iam_work_requests.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_iam_work_requests." if compartment_id.nil?

      path = '/iamWorkRequests'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:resourceIdentifier] = opts[:resource_identifier] if opts[:resource_identifier]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_iam_work_requests') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::IamWorkRequestSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # **Deprecated.** For more information, see [Deprecated IAM Service APIs](https://docs.cloud.oracle.com/Content/Identity/Reference/deprecatediamapis.htm).
    #
    # Lists the identity provider groups.
    #
    # @param [String] identity_provider_id The OCID of the identity provider.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @option opts [String] :name A filter to only return resources that match the given name exactly.
    #
    # @option opts [String] :lifecycle_state A filter to only return resources that match the given lifecycle state.  The state value is case-insensitive.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::IdentityProviderGroupSummary IdentityProviderGroupSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/list_identity_provider_groups.rb.html) to see an example of how to use list_identity_provider_groups API.
    def list_identity_provider_groups(identity_provider_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_identity_provider_groups.' if logger

      raise "Missing the required parameter 'identity_provider_id' when calling list_identity_provider_groups." if identity_provider_id.nil?

      if opts[:lifecycle_state] && !OCI::Identity::Models::IdentityProvider::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Identity::Models::IdentityProvider::LIFECYCLE_STATE_ENUM.'
      end
      raise "Parameter value for 'identity_provider_id' must not be blank" if OCI::Internal::Util.blank_string?(identity_provider_id)

      path = '/identityProviders/{identityProviderId}/groups/'.sub('{identityProviderId}', identity_provider_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_identity_provider_groups') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::IdentityProviderGroupSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # **Deprecated.** For more information, see [Deprecated IAM Service APIs](https://docs.cloud.oracle.com/Content/Identity/Reference/deprecatediamapis.htm).
    #
    # Lists all the identity providers in your tenancy. You must specify the identity provider type (e.g., `SAML2` for
    # identity providers using the SAML2.0 protocol). You must specify your tenancy's OCID as the value for the
    # compartment ID (remember that the tenancy is simply the root compartment).
    # See [Where to Get the Tenancy's OCID and User's OCID](https://docs.cloud.oracle.com/Content/API/Concepts/apisigningkey.htm#five).
    #
    # @param [String] protocol The protocol used for federation.
    #   Allowed values are: SAML2
    # @param [String] compartment_id The OCID of the compartment (remember that the tenancy is simply the root compartment).
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @option opts [String] :name A filter to only return resources that match the given name exactly.
    #
    # @option opts [String] :sort_by The field to sort by. You can provide one sort order (`sortOrder`). Default order for
    #   TIMECREATED is descending. Default order for NAME is ascending. The NAME
    #   sort order is case sensitive.
    #
    #   **Note:** In general, some \"List\" operations (for example, `ListInstances`) let you
    #   optionally filter by Availability Domain if the scope of the resource type is within a
    #   single Availability Domain. If you call one of these \"List\" operations without specifying
    #   an Availability Domain, the resources are grouped by Availability Domain, then sorted.
    #
    #   Allowed values are: TIMECREATED, NAME
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). The NAME sort order
    #   is case sensitive.
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :lifecycle_state A filter to only return resources that match the given lifecycle state.  The state value is case-insensitive.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::IdentityProvider IdentityProvider}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/list_identity_providers.rb.html) to see an example of how to use list_identity_providers API.
    def list_identity_providers(protocol, compartment_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_identity_providers.' if logger

      raise "Missing the required parameter 'protocol' when calling list_identity_providers." if protocol.nil?
      unless %w[SAML2].include?(protocol)
        raise "Invalid value for 'protocol', must be one of SAML2."
      end
      raise "Missing the required parameter 'compartment_id' when calling list_identity_providers." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, NAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Identity::Models::IdentityProvider::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Identity::Models::IdentityProvider::LIFECYCLE_STATE_ENUM.'
      end

      path = '/identityProviders/'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:protocol] = protocol
      query_params[:compartmentId] = compartment_id
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_identity_providers') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::IdentityProvider>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # **Deprecated.** For more information, see [Deprecated IAM Service APIs](https://docs.cloud.oracle.com/Content/Identity/Reference/deprecatediamapis.htm).
    #
    # Lists the group mappings for the specified identity provider.
    #
    # @param [String] identity_provider_id The OCID of the identity provider.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::IdpGroupMapping IdpGroupMapping}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/list_idp_group_mappings.rb.html) to see an example of how to use list_idp_group_mappings API.
    def list_idp_group_mappings(identity_provider_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_idp_group_mappings.' if logger

      raise "Missing the required parameter 'identity_provider_id' when calling list_idp_group_mappings." if identity_provider_id.nil?
      raise "Parameter value for 'identity_provider_id' must not be blank" if OCI::Internal::Util.blank_string?(identity_provider_id)

      path = '/identityProviders/{identityProviderId}/groupMappings/'.sub('{identityProviderId}', identity_provider_id.to_s)
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
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_idp_group_mappings') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::IdpGroupMapping>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the MFA TOTP devices for the specified user. The returned object contains the device's OCID, but not
    # the seed. The seed is returned only upon creation or when the IAM service regenerates the MFA seed for the device.
    #
    # @param [String] user_id The OCID of the user.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @option opts [String] :sort_by The field to sort by. You can provide one sort order (`sortOrder`). Default order for
    #   TIMECREATED is descending. Default order for NAME is ascending. The NAME
    #   sort order is case sensitive.
    #
    #   **Note:** In general, some \"List\" operations (for example, `ListInstances`) let you
    #   optionally filter by Availability Domain if the scope of the resource type is within a
    #   single Availability Domain. If you call one of these \"List\" operations without specifying
    #   an Availability Domain, the resources are grouped by Availability Domain, then sorted.
    #
    #   Allowed values are: TIMECREATED, NAME
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). The NAME sort order
    #   is case sensitive.
    #
    #   Allowed values are: ASC, DESC
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::MfaTotpDeviceSummary MfaTotpDeviceSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/list_mfa_totp_devices.rb.html) to see an example of how to use list_mfa_totp_devices API.
    def list_mfa_totp_devices(user_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_mfa_totp_devices.' if logger

      raise "Missing the required parameter 'user_id' when calling list_mfa_totp_devices." if user_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, NAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)

      path = '/users/{userId}/mfaTotpDevices'.sub('{userId}', user_id.to_s)
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
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_mfa_totp_devices') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::MfaTotpDeviceSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the network sources in your tenancy. You must specify your tenancy's OCID as the value for
    # the compartment ID (remember that the tenancy is simply the root compartment).
    # See [Where to Get the Tenancy's OCID and User's OCID](https://docs.cloud.oracle.com/Content/API/Concepts/apisigningkey.htm#five).
    #
    # @param [String] compartment_id The OCID of the compartment (remember that the tenancy is simply the root compartment).
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @option opts [String] :name A filter to only return resources that match the given name exactly.
    #
    # @option opts [String] :sort_by The field to sort by. You can provide one sort order (`sortOrder`). Default order for
    #   TIMECREATED is descending. Default order for NAME is ascending. The NAME
    #   sort order is case sensitive.
    #
    #   **Note:** In general, some \"List\" operations (for example, `ListInstances`) let you
    #   optionally filter by Availability Domain if the scope of the resource type is within a
    #   single Availability Domain. If you call one of these \"List\" operations without specifying
    #   an Availability Domain, the resources are grouped by Availability Domain, then sorted.
    #
    #   Allowed values are: TIMECREATED, NAME
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). The NAME sort order
    #   is case sensitive.
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :lifecycle_state A filter to only return resources that match the given lifecycle state.  The state value is case-insensitive.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::NetworkSourcesSummary NetworkSourcesSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/list_network_sources.rb.html) to see an example of how to use list_network_sources API.
    def list_network_sources(compartment_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_network_sources.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_network_sources." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, NAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Identity::Models::NetworkSources::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Identity::Models::NetworkSources::LIFECYCLE_STATE_ENUM.'
      end

      path = '/networkSources'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_network_sources') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::NetworkSourcesSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # List of Oauth tokens for the user
    #
    # @param [String] user_id The OCID of the user.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @option opts [String] :lifecycle_state A filter to only return resources that match the given lifecycle state.  The state value is case-insensitive.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::OAuth2ClientCredentialSummary OAuth2ClientCredentialSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/list_o_auth_client_credentials.rb.html) to see an example of how to use list_o_auth_client_credentials API.
    def list_o_auth_client_credentials(user_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_o_auth_client_credentials.' if logger

      raise "Missing the required parameter 'user_id' when calling list_o_auth_client_credentials." if user_id.nil?

      if opts[:lifecycle_state] && !OCI::Identity::Models::OAuth2ClientCredentialSummary::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Identity::Models::OAuth2ClientCredentialSummary::LIFECYCLE_STATE_ENUM.'
      end
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)

      path = '/users/{userId}/oauth2ClientCredentials'.sub('{userId}', user_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_o_auth_client_credentials') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::OAuth2ClientCredentialSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the policies in the specified compartment (either the tenancy or another of your compartments).
    # See [Where to Get the Tenancy's OCID and User's OCID](https://docs.cloud.oracle.com/Content/API/Concepts/apisigningkey.htm#five).
    #
    # To determine which policies apply to a particular group or compartment, you must view the individual
    # statements inside all your policies. There isn't a way to automatically obtain that information via the API.
    #
    # @param [String] compartment_id The OCID of the compartment (remember that the tenancy is simply the root compartment).
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @option opts [String] :name A filter to only return resources that match the given name exactly.
    #
    # @option opts [String] :sort_by The field to sort by. You can provide one sort order (`sortOrder`). Default order for
    #   TIMECREATED is descending. Default order for NAME is ascending. The NAME
    #   sort order is case sensitive.
    #
    #   **Note:** In general, some \"List\" operations (for example, `ListInstances`) let you
    #   optionally filter by Availability Domain if the scope of the resource type is within a
    #   single Availability Domain. If you call one of these \"List\" operations without specifying
    #   an Availability Domain, the resources are grouped by Availability Domain, then sorted.
    #
    #   Allowed values are: TIMECREATED, NAME
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). The NAME sort order
    #   is case sensitive.
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :lifecycle_state A filter to only return resources that match the given lifecycle state.  The state value is case-insensitive.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::Policy Policy}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/list_policies.rb.html) to see an example of how to use list_policies API.
    def list_policies(compartment_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_policies.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_policies." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, NAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Identity::Models::Policy::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Identity::Models::Policy::LIFECYCLE_STATE_ENUM.'
      end

      path = '/policies/'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_policies') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::Policy>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Lists the region subscriptions for the specified tenancy.
    # @param [String] tenancy_id The OCID of the tenancy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::RegionSubscription RegionSubscription}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/list_region_subscriptions.rb.html) to see an example of how to use list_region_subscriptions API.
    def list_region_subscriptions(tenancy_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_region_subscriptions.' if logger

      raise "Missing the required parameter 'tenancy_id' when calling list_region_subscriptions." if tenancy_id.nil?
      raise "Parameter value for 'tenancy_id' must not be blank" if OCI::Internal::Util.blank_string?(tenancy_id)

      path = '/tenancies/{tenancyId}/regionSubscriptions'.sub('{tenancyId}', tenancy_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_region_subscriptions') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::RegionSubscription>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Lists all the regions offered by Oracle Cloud Infrastructure.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::Region Region}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/list_regions.rb.html) to see an example of how to use list_regions API.
    def list_regions(opts = {})
      logger.debug 'Calling operation IdentityClient#list_regions.' if logger


      path = '/regions'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_regions') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::Region>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Lists the SMTP credentials for the specified user. The returned object contains the credential's OCID,
    # the SMTP user name but not the SMTP password. The SMTP password is returned only upon creation.
    #
    # @param [String] user_id The OCID of the user.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::SmtpCredentialSummary SmtpCredentialSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/list_smtp_credentials.rb.html) to see an example of how to use list_smtp_credentials API.
    def list_smtp_credentials(user_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_smtp_credentials.' if logger

      raise "Missing the required parameter 'user_id' when calling list_smtp_credentials." if user_id.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)

      path = '/users/{userId}/smtpCredentials/'.sub('{userId}', user_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_smtp_credentials') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::SmtpCredentialSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists available standard tag namespaces that users can create.
    #
    # @param [String] compartment_id The OCID of the compartment (remember that the tenancy is simply the root compartment).
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::StandardTagNamespaceTemplateSummary StandardTagNamespaceTemplateSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/list_standard_tag_namespaces.rb.html) to see an example of how to use list_standard_tag_namespaces API.
    def list_standard_tag_namespaces(compartment_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_standard_tag_namespaces.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_standard_tag_namespaces." if compartment_id.nil?

      path = '/tags/standardTagNamespaceTemplates'
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
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_standard_tag_namespaces') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::StandardTagNamespaceTemplateSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # **Deprecated. Use {#list_auth_tokens list_auth_tokens} instead.**
    #
    # Lists the Swift passwords for the specified user. The returned object contains the password's OCID, but not
    # the password itself. The actual password is returned only upon creation.
    #
    # @param [String] user_id The OCID of the user.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::SwiftPassword SwiftPassword}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/list_swift_passwords.rb.html) to see an example of how to use list_swift_passwords API.
    def list_swift_passwords(user_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_swift_passwords.' if logger

      raise "Missing the required parameter 'user_id' when calling list_swift_passwords." if user_id.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)

      path = '/users/{userId}/swiftPasswords/'.sub('{userId}', user_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_swift_passwords') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::SwiftPassword>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the tag defaults for tag definitions in the specified compartment.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @option opts [String] :id A filter to only return resources that match the specified OCID exactly.
    #
    # @option opts [String] :compartment_id The OCID of the compartment (remember that the tenancy is simply the root compartment).
    #
    # @option opts [String] :tag_definition_id The OCID of the tag definition.
    #
    # @option opts [String] :lifecycle_state A filter to only return resources that match the given lifecycle state.  The state value is case-insensitive.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::TagDefaultSummary TagDefaultSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/list_tag_defaults.rb.html) to see an example of how to use list_tag_defaults API.
    def list_tag_defaults(opts = {})
      logger.debug 'Calling operation IdentityClient#list_tag_defaults.' if logger


      if opts[:lifecycle_state] && !OCI::Identity::Models::TagDefaultSummary::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Identity::Models::TagDefaultSummary::LIFECYCLE_STATE_ENUM.'
      end

      path = '/tagDefaults'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:id] = opts[:id] if opts[:id]
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:tagDefinitionId] = opts[:tag_definition_id] if opts[:tag_definition_id]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_tag_defaults') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::TagDefaultSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the tag namespaces in the specified compartment.
    #
    # @param [String] compartment_id The OCID of the compartment (remember that the tenancy is simply the root compartment).
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @option opts [BOOLEAN] :include_subcompartments An optional boolean parameter indicating whether to retrieve all tag namespaces in subcompartments. If this
    #   parameter is not specified, only the tag namespaces defined in the specified compartment are retrieved.
    #
    # @option opts [String] :lifecycle_state A filter to only return resources that match the given lifecycle state.  The state value is case-insensitive.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::TagNamespaceSummary TagNamespaceSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/list_tag_namespaces.rb.html) to see an example of how to use list_tag_namespaces API.
    def list_tag_namespaces(compartment_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_tag_namespaces.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_tag_namespaces." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::Identity::Models::TagNamespace::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Identity::Models::TagNamespace::LIFECYCLE_STATE_ENUM.'
      end

      path = '/tagNamespaces'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:includeSubcompartments] = opts[:include_subcompartments] if !opts[:include_subcompartments].nil?
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_tag_namespaces') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::TagNamespaceSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the errors for a work request.
    #
    # @param [String] work_request_id The OCID of the work request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::TaggingWorkRequestErrorSummary TaggingWorkRequestErrorSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/list_tagging_work_request_errors.rb.html) to see an example of how to use list_tagging_work_request_errors API.
    def list_tagging_work_request_errors(work_request_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_tagging_work_request_errors.' if logger

      raise "Missing the required parameter 'work_request_id' when calling list_tagging_work_request_errors." if work_request_id.nil?
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/taggingWorkRequests/{workRequestId}/errors'.sub('{workRequestId}', work_request_id.to_s)
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
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_tagging_work_request_errors') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::TaggingWorkRequestErrorSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the logs for a work request.
    #
    # @param [String] work_request_id The OCID of the work request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::TaggingWorkRequestLogSummary TaggingWorkRequestLogSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/list_tagging_work_request_logs.rb.html) to see an example of how to use list_tagging_work_request_logs API.
    def list_tagging_work_request_logs(work_request_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_tagging_work_request_logs.' if logger

      raise "Missing the required parameter 'work_request_id' when calling list_tagging_work_request_logs." if work_request_id.nil?
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/taggingWorkRequests/{workRequestId}/logs'.sub('{workRequestId}', work_request_id.to_s)
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
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_tagging_work_request_logs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::TaggingWorkRequestLogSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the tagging work requests in compartment.
    #
    # @param [String] compartment_id The OCID of the compartment (remember that the tenancy is simply the root compartment).
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @option opts [String] :resource_identifier The identifier of the resource the work request affects.
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::TaggingWorkRequestSummary TaggingWorkRequestSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/list_tagging_work_requests.rb.html) to see an example of how to use list_tagging_work_requests API.
    def list_tagging_work_requests(compartment_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_tagging_work_requests.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_tagging_work_requests." if compartment_id.nil?

      path = '/taggingWorkRequests/'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:resourceIdentifier] = opts[:resource_identifier] if opts[:resource_identifier]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_tagging_work_requests') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::TaggingWorkRequestSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the tag definitions in the specified tag namespace.
    #
    # @param [String] tag_namespace_id The OCID of the tag namespace.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @option opts [String] :lifecycle_state A filter to only return resources that match the given lifecycle state.  The state value is case-insensitive.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::TagSummary TagSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/list_tags.rb.html) to see an example of how to use list_tags API.
    def list_tags(tag_namespace_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_tags.' if logger

      raise "Missing the required parameter 'tag_namespace_id' when calling list_tags." if tag_namespace_id.nil?

      if opts[:lifecycle_state] && !OCI::Identity::Models::Tag::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Identity::Models::Tag::LIFECYCLE_STATE_ENUM.'
      end
      raise "Parameter value for 'tag_namespace_id' must not be blank" if OCI::Internal::Util.blank_string?(tag_namespace_id)

      path = '/tagNamespaces/{tagNamespaceId}/tags'.sub('{tagNamespaceId}', tag_namespace_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_tags') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::TagSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the `UserGroupMembership` objects in your tenancy. You must specify your tenancy's OCID
    # as the value for the compartment ID
    # (see [Where to Get the Tenancy's OCID and User's OCID](https://docs.cloud.oracle.com/Content/API/Concepts/apisigningkey.htm#five)).
    # You must also then filter the list in one of these ways:
    #
    # - You can limit the results to just the memberships for a given user by specifying a `userId`.
    # - Similarly, you can limit the results to just the memberships for a given group by specifying a `groupId`.
    # - You can set both the `userId` and `groupId` to determine if the specified user is in the specified group.
    # If the answer is no, the response is an empty list.
    # - Although`userId` and `groupId` are not individually required, you must set one of them.
    #
    # @param [String] compartment_id The OCID of the compartment (remember that the tenancy is simply the root compartment).
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :user_id The OCID of the user.
    # @option opts [String] :group_id The OCID of the group.
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::UserGroupMembership UserGroupMembership}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/list_user_group_memberships.rb.html) to see an example of how to use list_user_group_memberships API.
    def list_user_group_memberships(compartment_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_user_group_memberships.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_user_group_memberships." if compartment_id.nil?

      path = '/userGroupMemberships/'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:userId] = opts[:user_id] if opts[:user_id]
      query_params[:groupId] = opts[:group_id] if opts[:group_id]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_user_group_memberships') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::UserGroupMembership>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the users in your tenancy. You must specify your tenancy's OCID as the value for the
    # compartment ID (remember that the tenancy is simply the root compartment).
    # See [Where to Get the Tenancy's OCID and User's OCID](https://docs.cloud.oracle.com/Content/API/Concepts/apisigningkey.htm#five).
    #
    # @param [String] compartment_id The OCID of the compartment (remember that the tenancy is simply the root compartment).
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @option opts [String] :identity_provider_id The id of the identity provider.
    #
    # @option opts [String] :external_identifier The id of a user in the identity provider.
    #
    # @option opts [String] :name A filter to only return resources that match the given name exactly.
    #
    # @option opts [String] :sort_by The field to sort by. You can provide one sort order (`sortOrder`). Default order for
    #   TIMECREATED is descending. Default order for NAME is ascending. The NAME
    #   sort order is case sensitive.
    #
    #   **Note:** In general, some \"List\" operations (for example, `ListInstances`) let you
    #   optionally filter by Availability Domain if the scope of the resource type is within a
    #   single Availability Domain. If you call one of these \"List\" operations without specifying
    #   an Availability Domain, the resources are grouped by Availability Domain, then sorted.
    #
    #   Allowed values are: TIMECREATED, NAME
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). The NAME sort order
    #   is case sensitive.
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :lifecycle_state A filter to only return resources that match the given lifecycle state.  The state value is case-insensitive.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::User User}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/list_users.rb.html) to see an example of how to use list_users API.
    def list_users(compartment_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_users.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_users." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, NAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Identity::Models::User::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Identity::Models::User::LIFECYCLE_STATE_ENUM.'
      end

      path = '/users/'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:identityProviderId] = opts[:identity_provider_id] if opts[:identity_provider_id]
      query_params[:externalIdentifier] = opts[:external_identifier] if opts[:external_identifier]
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_users') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::User>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the work requests in compartment.
    #
    # @param [String] compartment_id The OCID of the compartment (remember that the tenancy is simply the root compartment).
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @option opts [String] :resource_identifier The identifier of the resource the work request affects.
    # @return [Response] A Response object with data of type Array<{OCI::Identity::Models::WorkRequestSummary WorkRequestSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/list_work_requests.rb.html) to see an example of how to use list_work_requests API.
    def list_work_requests(compartment_id, opts = {})
      logger.debug 'Calling operation IdentityClient#list_work_requests.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_work_requests." if compartment_id.nil?

      path = '/workRequests/'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:resourceIdentifier] = opts[:resource_identifier] if opts[:resource_identifier]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#list_work_requests') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Identity::Models::WorkRequestSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Move the compartment to a different parent compartment in the same tenancy. When you move a
    # compartment, all its contents (subcompartments and resources) are moved with it. Note that
    # the `CompartmentId` that you specify in the path is the compartment that you want to move.
    #
    # **IMPORTANT**: After you move a compartment to a new parent compartment, the access policies of
    # the new parent take effect and the policies of the previous parent no longer apply. Ensure that you
    # are aware of the implications for the compartment contents before you move it. For more
    # information, see [Moving a Compartment](https://docs.cloud.oracle.com/Content/Identity/compartments/managingcompartments.htm#MoveCompartment).
    #
    # @param [String] compartment_id The OCID of the compartment.
    # @param [OCI::Identity::Models::MoveCompartmentDetails] move_compartment_details Request object for moving a compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/move_compartment.rb.html) to see an example of how to use move_compartment API.
    def move_compartment(compartment_id, move_compartment_details, opts = {})
      logger.debug 'Calling operation IdentityClient#move_compartment.' if logger

      raise "Missing the required parameter 'compartment_id' when calling move_compartment." if compartment_id.nil?
      raise "Missing the required parameter 'move_compartment_details' when calling move_compartment." if move_compartment_details.nil?
      raise "Parameter value for 'compartment_id' must not be blank" if OCI::Internal::Util.blank_string?(compartment_id)

      path = '/compartments/{compartmentId}/actions/moveCompartment'.sub('{compartmentId}', compartment_id.to_s)
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
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(move_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#move_compartment') do
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


    # Recover the compartment from DELETED state to ACTIVE state.
    #
    # @param [String] compartment_id The OCID of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::Compartment Compartment}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/recover_compartment.rb.html) to see an example of how to use recover_compartment API.
    def recover_compartment(compartment_id, opts = {})
      logger.debug 'Calling operation IdentityClient#recover_compartment.' if logger

      raise "Missing the required parameter 'compartment_id' when calling recover_compartment." if compartment_id.nil?
      raise "Parameter value for 'compartment_id' must not be blank" if OCI::Internal::Util.blank_string?(compartment_id)

      path = '/compartments/{compartmentId}/actions/recoverCompartment'.sub('{compartmentId}', compartment_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#recover_compartment') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::Compartment'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Remove a resource lock from a tag default.
    #
    # @param [String] tag_default_id The OCID of the tag default.
    # @param [OCI::Identity::Models::RemoveLockDetails] remove_lock_details Lock that is going to be removed from resource
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::TagDefault TagDefault}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/remove_tag_default_lock.rb.html) to see an example of how to use remove_tag_default_lock API.
    def remove_tag_default_lock(tag_default_id, remove_lock_details, opts = {})
      logger.debug 'Calling operation IdentityClient#remove_tag_default_lock.' if logger

      raise "Missing the required parameter 'tag_default_id' when calling remove_tag_default_lock." if tag_default_id.nil?
      raise "Missing the required parameter 'remove_lock_details' when calling remove_tag_default_lock." if remove_lock_details.nil?
      raise "Parameter value for 'tag_default_id' must not be blank" if OCI::Internal::Util.blank_string?(tag_default_id)

      path = '/tagDefaults/{tagDefaultId}/actions/removeLock'.sub('{tagDefaultId}', tag_default_id.to_s)
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
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(remove_lock_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#remove_tag_default_lock') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::TagDefault'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Remove a resource lock from a tag namespace.
    #
    # @param [String] tag_namespace_id The OCID of the tag namespace.
    #
    # @param [OCI::Identity::Models::RemoveLockDetails] remove_lock_details Lock that is going to be removed from resource
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::TagNamespace TagNamespace}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/remove_tag_namespace_lock.rb.html) to see an example of how to use remove_tag_namespace_lock API.
    def remove_tag_namespace_lock(tag_namespace_id, remove_lock_details, opts = {})
      logger.debug 'Calling operation IdentityClient#remove_tag_namespace_lock.' if logger

      raise "Missing the required parameter 'tag_namespace_id' when calling remove_tag_namespace_lock." if tag_namespace_id.nil?
      raise "Missing the required parameter 'remove_lock_details' when calling remove_tag_namespace_lock." if remove_lock_details.nil?
      raise "Parameter value for 'tag_namespace_id' must not be blank" if OCI::Internal::Util.blank_string?(tag_namespace_id)

      path = '/tagNamespaces/{tagNamespaceId}/actions/removeLock'.sub('{tagNamespaceId}', tag_namespace_id.to_s)
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
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(remove_lock_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#remove_tag_namespace_lock') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::TagNamespace'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Removes a user from a group by deleting the corresponding `UserGroupMembership`.
    # @param [String] user_group_membership_id The OCID of the userGroupMembership.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/remove_user_from_group.rb.html) to see an example of how to use remove_user_from_group API.
    def remove_user_from_group(user_group_membership_id, opts = {})
      logger.debug 'Calling operation IdentityClient#remove_user_from_group.' if logger

      raise "Missing the required parameter 'user_group_membership_id' when calling remove_user_from_group." if user_group_membership_id.nil?
      raise "Parameter value for 'user_group_membership_id' must not be blank" if OCI::Internal::Util.blank_string?(user_group_membership_id)

      path = '/userGroupMemberships/{userGroupMembershipId}'.sub('{userGroupMembershipId}', user_group_membership_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#remove_user_from_group') do
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
    # rubocop:disable Lint/UnusedMethodArgument


    # Resets the OAuth2 client credentials for the SCIM client associated with this identity provider.
    #
    # @param [String] identity_provider_id The OCID of the identity provider.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Identity::Models::ScimClientCredentials ScimClientCredentials}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/reset_idp_scim_client.rb.html) to see an example of how to use reset_idp_scim_client API.
    def reset_idp_scim_client(identity_provider_id, opts = {})
      logger.debug 'Calling operation IdentityClient#reset_idp_scim_client.' if logger

      raise "Missing the required parameter 'identity_provider_id' when calling reset_idp_scim_client." if identity_provider_id.nil?
      raise "Parameter value for 'identity_provider_id' must not be blank" if OCI::Internal::Util.blank_string?(identity_provider_id)

      path = '/identityProviders/{identityProviderId}/actions/resetScimClient/'.sub('{identityProviderId}', identity_provider_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#reset_idp_scim_client') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::ScimClientCredentials'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the specified auth token's description.
    #
    # @param [String] user_id The OCID of the user.
    # @param [String] auth_token_id The OCID of the auth token.
    # @param [OCI::Identity::Models::UpdateAuthTokenDetails] update_auth_token_details Request object for updating an auth token.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::AuthToken AuthToken}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/update_auth_token.rb.html) to see an example of how to use update_auth_token API.
    def update_auth_token(user_id, auth_token_id, update_auth_token_details, opts = {})
      logger.debug 'Calling operation IdentityClient#update_auth_token.' if logger

      raise "Missing the required parameter 'user_id' when calling update_auth_token." if user_id.nil?
      raise "Missing the required parameter 'auth_token_id' when calling update_auth_token." if auth_token_id.nil?
      raise "Missing the required parameter 'update_auth_token_details' when calling update_auth_token." if update_auth_token_details.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)
      raise "Parameter value for 'auth_token_id' must not be blank" if OCI::Internal::Util.blank_string?(auth_token_id)

      path = '/users/{userId}/authTokens/{authTokenId}'.sub('{userId}', user_id.to_s).sub('{authTokenId}', auth_token_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_auth_token_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#update_auth_token') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::AuthToken'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates authentication policy for the specified tenancy.
    #
    # @param [String] compartment_id The OCID of the compartment.
    # @param [OCI::Identity::Models::UpdateAuthenticationPolicyDetails] update_authentication_policy_details Request object for updating the authentication policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::AuthenticationPolicy AuthenticationPolicy}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/update_authentication_policy.rb.html) to see an example of how to use update_authentication_policy API.
    def update_authentication_policy(compartment_id, update_authentication_policy_details, opts = {})
      logger.debug 'Calling operation IdentityClient#update_authentication_policy.' if logger

      raise "Missing the required parameter 'compartment_id' when calling update_authentication_policy." if compartment_id.nil?
      raise "Missing the required parameter 'update_authentication_policy_details' when calling update_authentication_policy." if update_authentication_policy_details.nil?
      raise "Parameter value for 'compartment_id' must not be blank" if OCI::Internal::Util.blank_string?(compartment_id)

      path = '/authenticationPolicies/{compartmentId}'.sub('{compartmentId}', compartment_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_authentication_policy_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#update_authentication_policy') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::AuthenticationPolicy'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the specified compartment's description or name. You can't update the root compartment.
    # @param [String] compartment_id The OCID of the compartment.
    # @param [OCI::Identity::Models::UpdateCompartmentDetails] update_compartment_details Request object for updating a compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::Compartment Compartment}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/update_compartment.rb.html) to see an example of how to use update_compartment API.
    def update_compartment(compartment_id, update_compartment_details, opts = {})
      logger.debug 'Calling operation IdentityClient#update_compartment.' if logger

      raise "Missing the required parameter 'compartment_id' when calling update_compartment." if compartment_id.nil?
      raise "Missing the required parameter 'update_compartment_details' when calling update_compartment." if update_compartment_details.nil?
      raise "Parameter value for 'compartment_id' must not be blank" if OCI::Internal::Util.blank_string?(compartment_id)

      path = '/compartments/{compartmentId}'.sub('{compartmentId}', compartment_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#update_compartment') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::Compartment'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the specified secret key's description.
    #
    # @param [String] user_id The OCID of the user.
    # @param [String] customer_secret_key_id The access token of the secret key.
    # @param [OCI::Identity::Models::UpdateCustomerSecretKeyDetails] update_customer_secret_key_details Request object for updating a secret key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::CustomerSecretKeySummary CustomerSecretKeySummary}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/update_customer_secret_key.rb.html) to see an example of how to use update_customer_secret_key API.
    def update_customer_secret_key(user_id, customer_secret_key_id, update_customer_secret_key_details, opts = {})
      logger.debug 'Calling operation IdentityClient#update_customer_secret_key.' if logger

      raise "Missing the required parameter 'user_id' when calling update_customer_secret_key." if user_id.nil?
      raise "Missing the required parameter 'customer_secret_key_id' when calling update_customer_secret_key." if customer_secret_key_id.nil?
      raise "Missing the required parameter 'update_customer_secret_key_details' when calling update_customer_secret_key." if update_customer_secret_key_details.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)
      raise "Parameter value for 'customer_secret_key_id' must not be blank" if OCI::Internal::Util.blank_string?(customer_secret_key_id)

      path = '/users/{userId}/customerSecretKeys/{customerSecretKeyId}'.sub('{userId}', user_id.to_s).sub('{customerSecretKeyId}', customer_secret_key_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_customer_secret_key_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#update_customer_secret_key') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::CustomerSecretKeySummary'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # (For tenancies that support identity domains) Updates identity domain information and the associated Identity Cloud Service (IDCS) stripe.
    #
    # To track the progress of the request, submitting an HTTP GET on the /iamWorkRequests/{iamWorkRequestsId} endpoint retrieves
    # the operation's status.
    #
    # @param [String] domain_id The OCID of the identity domain.
    # @param [OCI::Identity::Models::UpdateDomainDetails] update_domain_details Request object for updating the identity domain.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/update_domain.rb.html) to see an example of how to use update_domain API.
    def update_domain(domain_id, update_domain_details, opts = {})
      logger.debug 'Calling operation IdentityClient#update_domain.' if logger

      raise "Missing the required parameter 'domain_id' when calling update_domain." if domain_id.nil?
      raise "Missing the required parameter 'update_domain_details' when calling update_domain." if update_domain_details.nil?
      raise "Parameter value for 'domain_id' must not be blank" if OCI::Internal::Util.blank_string?(domain_id)

      path = '/domains/{domainId}'.sub('{domainId}', domain_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_domain_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#update_domain') do
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


    # Updates the specified dynamic group.
    # @param [String] dynamic_group_id The OCID of the dynamic group.
    # @param [OCI::Identity::Models::UpdateDynamicGroupDetails] update_dynamic_group_details Request object for updating an dynamic group.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::DynamicGroup DynamicGroup}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/update_dynamic_group.rb.html) to see an example of how to use update_dynamic_group API.
    def update_dynamic_group(dynamic_group_id, update_dynamic_group_details, opts = {})
      logger.debug 'Calling operation IdentityClient#update_dynamic_group.' if logger

      raise "Missing the required parameter 'dynamic_group_id' when calling update_dynamic_group." if dynamic_group_id.nil?
      raise "Missing the required parameter 'update_dynamic_group_details' when calling update_dynamic_group." if update_dynamic_group_details.nil?
      raise "Parameter value for 'dynamic_group_id' must not be blank" if OCI::Internal::Util.blank_string?(dynamic_group_id)

      path = '/dynamicGroups/{dynamicGroupId}'.sub('{dynamicGroupId}', dynamic_group_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_dynamic_group_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#update_dynamic_group') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::DynamicGroup'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the specified group.
    # @param [String] group_id The OCID of the group.
    # @param [OCI::Identity::Models::UpdateGroupDetails] update_group_details Request object for updating a group.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::Group Group}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/update_group.rb.html) to see an example of how to use update_group API.
    def update_group(group_id, update_group_details, opts = {})
      logger.debug 'Calling operation IdentityClient#update_group.' if logger

      raise "Missing the required parameter 'group_id' when calling update_group." if group_id.nil?
      raise "Missing the required parameter 'update_group_details' when calling update_group." if update_group_details.nil?
      raise "Parameter value for 'group_id' must not be blank" if OCI::Internal::Util.blank_string?(group_id)

      path = '/groups/{groupId}'.sub('{groupId}', group_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_group_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#update_group') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::Group'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # **Deprecated.** For more information, see [Deprecated IAM Service APIs](https://docs.cloud.oracle.com/Content/Identity/Reference/deprecatediamapis.htm).
    #
    # Updates the specified identity provider.
    #
    # @param [String] identity_provider_id The OCID of the identity provider.
    # @param [OCI::Identity::Models::UpdateIdentityProviderDetails] update_identity_provider_details Request object for updating a identity provider.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::IdentityProvider IdentityProvider}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/update_identity_provider.rb.html) to see an example of how to use update_identity_provider API.
    def update_identity_provider(identity_provider_id, update_identity_provider_details, opts = {})
      logger.debug 'Calling operation IdentityClient#update_identity_provider.' if logger

      raise "Missing the required parameter 'identity_provider_id' when calling update_identity_provider." if identity_provider_id.nil?
      raise "Missing the required parameter 'update_identity_provider_details' when calling update_identity_provider." if update_identity_provider_details.nil?
      raise "Parameter value for 'identity_provider_id' must not be blank" if OCI::Internal::Util.blank_string?(identity_provider_id)

      path = '/identityProviders/{identityProviderId}'.sub('{identityProviderId}', identity_provider_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_identity_provider_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#update_identity_provider') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::IdentityProvider'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # **Deprecated.** For more information, see [Deprecated IAM Service APIs](https://docs.cloud.oracle.com/Content/Identity/Reference/deprecatediamapis.htm).
    #
    # Updates the specified group mapping.
    #
    # @param [String] identity_provider_id The OCID of the identity provider.
    # @param [String] mapping_id The OCID of the group mapping.
    # @param [OCI::Identity::Models::UpdateIdpGroupMappingDetails] update_idp_group_mapping_details Request object for updating an identity provider group mapping
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::IdpGroupMapping IdpGroupMapping}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/update_idp_group_mapping.rb.html) to see an example of how to use update_idp_group_mapping API.
    def update_idp_group_mapping(identity_provider_id, mapping_id, update_idp_group_mapping_details, opts = {})
      logger.debug 'Calling operation IdentityClient#update_idp_group_mapping.' if logger

      raise "Missing the required parameter 'identity_provider_id' when calling update_idp_group_mapping." if identity_provider_id.nil?
      raise "Missing the required parameter 'mapping_id' when calling update_idp_group_mapping." if mapping_id.nil?
      raise "Missing the required parameter 'update_idp_group_mapping_details' when calling update_idp_group_mapping." if update_idp_group_mapping_details.nil?
      raise "Parameter value for 'identity_provider_id' must not be blank" if OCI::Internal::Util.blank_string?(identity_provider_id)
      raise "Parameter value for 'mapping_id' must not be blank" if OCI::Internal::Util.blank_string?(mapping_id)

      path = '/identityProviders/{identityProviderId}/groupMappings/{mappingId}'.sub('{identityProviderId}', identity_provider_id.to_s).sub('{mappingId}', mapping_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_idp_group_mapping_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#update_idp_group_mapping') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::IdpGroupMapping'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the specified network source.
    #
    # @param [String] network_source_id The OCID of the network source.
    # @param [OCI::Identity::Models::UpdateNetworkSourceDetails] update_network_source_details Request object for updating a network source.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::NetworkSources NetworkSources}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/update_network_source.rb.html) to see an example of how to use update_network_source API.
    def update_network_source(network_source_id, update_network_source_details, opts = {})
      logger.debug 'Calling operation IdentityClient#update_network_source.' if logger

      raise "Missing the required parameter 'network_source_id' when calling update_network_source." if network_source_id.nil?
      raise "Missing the required parameter 'update_network_source_details' when calling update_network_source." if update_network_source_details.nil?
      raise "Parameter value for 'network_source_id' must not be blank" if OCI::Internal::Util.blank_string?(network_source_id)

      path = '/networkSources/{networkSourceId}'.sub('{networkSourceId}', network_source_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_network_source_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#update_network_source') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::NetworkSources'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates Oauth token for the user
    #
    # @param [String] user_id The OCID of the user.
    # @param [String] oauth2_client_credential_id The ID of the Oauth credential.
    # @param [OCI::Identity::Models::UpdateOAuth2ClientCredentialDetails] update_o_auth2_client_credential_details Request object containing the information required to generate an Oauth token.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::OAuth2ClientCredential OAuth2ClientCredential}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/update_o_auth_client_credential.rb.html) to see an example of how to use update_o_auth_client_credential API.
    def update_o_auth_client_credential(user_id, oauth2_client_credential_id, update_o_auth2_client_credential_details, opts = {})
      logger.debug 'Calling operation IdentityClient#update_o_auth_client_credential.' if logger

      raise "Missing the required parameter 'user_id' when calling update_o_auth_client_credential." if user_id.nil?
      raise "Missing the required parameter 'oauth2_client_credential_id' when calling update_o_auth_client_credential." if oauth2_client_credential_id.nil?
      raise "Missing the required parameter 'update_o_auth2_client_credential_details' when calling update_o_auth_client_credential." if update_o_auth2_client_credential_details.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)
      raise "Parameter value for 'oauth2_client_credential_id' must not be blank" if OCI::Internal::Util.blank_string?(oauth2_client_credential_id)

      path = '/users/{userId}/oauth2ClientCredentials/{oauth2ClientCredentialId}'.sub('{userId}', user_id.to_s).sub('{oauth2ClientCredentialId}', oauth2_client_credential_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_o_auth2_client_credential_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#update_o_auth_client_credential') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::OAuth2ClientCredential'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the specified policy. You can update the description or the policy statements themselves.
    #
    # Policy changes take effect typically within 10 seconds.
    #
    # @param [String] policy_id The OCID of the policy.
    # @param [OCI::Identity::Models::UpdatePolicyDetails] update_policy_details Request object for updating a policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::Policy Policy}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/update_policy.rb.html) to see an example of how to use update_policy API.
    def update_policy(policy_id, update_policy_details, opts = {})
      logger.debug 'Calling operation IdentityClient#update_policy.' if logger

      raise "Missing the required parameter 'policy_id' when calling update_policy." if policy_id.nil?
      raise "Missing the required parameter 'update_policy_details' when calling update_policy." if update_policy_details.nil?
      raise "Parameter value for 'policy_id' must not be blank" if OCI::Internal::Util.blank_string?(policy_id)

      path = '/policies/{policyId}'.sub('{policyId}', policy_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_policy_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#update_policy') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::Policy'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the specified SMTP credential's description.
    #
    # @param [String] user_id The OCID of the user.
    # @param [String] smtp_credential_id The OCID of the SMTP credential.
    # @param [OCI::Identity::Models::UpdateSmtpCredentialDetails] update_smtp_credential_details Request object for updating a SMTP credential.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::SmtpCredentialSummary SmtpCredentialSummary}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/update_smtp_credential.rb.html) to see an example of how to use update_smtp_credential API.
    def update_smtp_credential(user_id, smtp_credential_id, update_smtp_credential_details, opts = {})
      logger.debug 'Calling operation IdentityClient#update_smtp_credential.' if logger

      raise "Missing the required parameter 'user_id' when calling update_smtp_credential." if user_id.nil?
      raise "Missing the required parameter 'smtp_credential_id' when calling update_smtp_credential." if smtp_credential_id.nil?
      raise "Missing the required parameter 'update_smtp_credential_details' when calling update_smtp_credential." if update_smtp_credential_details.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)
      raise "Parameter value for 'smtp_credential_id' must not be blank" if OCI::Internal::Util.blank_string?(smtp_credential_id)

      path = '/users/{userId}/smtpCredentials/{smtpCredentialId}'.sub('{userId}', user_id.to_s).sub('{smtpCredentialId}', smtp_credential_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_smtp_credential_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#update_smtp_credential') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::SmtpCredentialSummary'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # **Deprecated. Use {#update_auth_token update_auth_token} instead.**
    #
    # Updates the specified Swift password's description.
    #
    # @param [String] user_id The OCID of the user.
    # @param [String] swift_password_id The OCID of the Swift password.
    # @param [OCI::Identity::Models::UpdateSwiftPasswordDetails] update_swift_password_details Request object for updating a Swift password.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::SwiftPassword SwiftPassword}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/update_swift_password.rb.html) to see an example of how to use update_swift_password API.
    def update_swift_password(user_id, swift_password_id, update_swift_password_details, opts = {})
      logger.debug 'Calling operation IdentityClient#update_swift_password.' if logger

      raise "Missing the required parameter 'user_id' when calling update_swift_password." if user_id.nil?
      raise "Missing the required parameter 'swift_password_id' when calling update_swift_password." if swift_password_id.nil?
      raise "Missing the required parameter 'update_swift_password_details' when calling update_swift_password." if update_swift_password_details.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)
      raise "Parameter value for 'swift_password_id' must not be blank" if OCI::Internal::Util.blank_string?(swift_password_id)

      path = '/users/{userId}/swiftPasswords/{swiftPasswordId}'.sub('{userId}', user_id.to_s).sub('{swiftPasswordId}', swift_password_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_swift_password_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#update_swift_password') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::SwiftPassword'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the specified tag definition.
    #
    # Setting `validator` determines the value type. Tags can use either a static value or a
    # list of possible values. Static values are entered by a user applying the tag to a resource.
    # Lists are created by you and the user must apply a value from the list. On update, any values
    # in a list that were previously set do not change, but new values must pass validation. Values
    # already applied to a resource do not change.
    #
    # You cannot remove list values that appear in a TagDefault. To remove a list value that
    # appears in a TagDefault, first update the TagDefault to use a different value.
    #
    # @param [String] tag_namespace_id The OCID of the tag namespace.
    #
    # @param [String] tag_name The name of the tag.
    #
    # @param [OCI::Identity::Models::UpdateTagDetails] update_tag_details Request object for updating a tag.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [BOOLEAN] :is_lock_override Whether to override locks (if any exist). (default to false)
    # @return [Response] A Response object with data of type {OCI::Identity::Models::Tag Tag}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/update_tag.rb.html) to see an example of how to use update_tag API.
    def update_tag(tag_namespace_id, tag_name, update_tag_details, opts = {})
      logger.debug 'Calling operation IdentityClient#update_tag.' if logger

      raise "Missing the required parameter 'tag_namespace_id' when calling update_tag." if tag_namespace_id.nil?
      raise "Missing the required parameter 'tag_name' when calling update_tag." if tag_name.nil?
      raise "Missing the required parameter 'update_tag_details' when calling update_tag." if update_tag_details.nil?
      raise "Parameter value for 'tag_namespace_id' must not be blank" if OCI::Internal::Util.blank_string?(tag_namespace_id)
      raise "Parameter value for 'tag_name' must not be blank" if OCI::Internal::Util.blank_string?(tag_name)

      path = '/tagNamespaces/{tagNamespaceId}/tags/{tagName}'.sub('{tagNamespaceId}', tag_namespace_id.to_s).sub('{tagName}', tag_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:isLockOverride] = opts[:is_lock_override] if !opts[:is_lock_override].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_tag_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#update_tag') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::Tag'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the specified tag default. If you specify that a value is required, a value is set
    # during resource creation (either by the user creating the resource or another tag defualt).
    # If no value is set, resource creation is blocked.
    #
    # * If the `isRequired` flag is set to \"true\", the value is set during resource creation.
    # * If the `isRequired` flag is set to \"false\", the value you enter is set during resource creation.
    #
    # @param [String] tag_default_id The OCID of the tag default.
    # @param [OCI::Identity::Models::UpdateTagDefaultDetails] update_tag_default_details Request object for updating a tag default.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [BOOLEAN] :is_lock_override Whether to override locks (if any exist). (default to false)
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::TagDefault TagDefault}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/update_tag_default.rb.html) to see an example of how to use update_tag_default API.
    def update_tag_default(tag_default_id, update_tag_default_details, opts = {})
      logger.debug 'Calling operation IdentityClient#update_tag_default.' if logger

      raise "Missing the required parameter 'tag_default_id' when calling update_tag_default." if tag_default_id.nil?
      raise "Missing the required parameter 'update_tag_default_details' when calling update_tag_default." if update_tag_default_details.nil?
      raise "Parameter value for 'tag_default_id' must not be blank" if OCI::Internal::Util.blank_string?(tag_default_id)

      path = '/tagDefaults/{tagDefaultId}'.sub('{tagDefaultId}', tag_default_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:isLockOverride] = opts[:is_lock_override] if !opts[:is_lock_override].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_tag_default_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#update_tag_default') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::TagDefault'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the the specified tag namespace. You can't update the namespace name.
    #
    # Updating `isRetired` to 'true' retires the namespace and all the tag definitions in the namespace. Reactivating a
    # namespace (changing `isRetired` from 'true' to 'false') does not reactivate tag definitions.
    # To reactivate the tag definitions, you must reactivate each one individually *after* you reactivate the namespace,
    # using {#update_tag update_tag}. For more information about retiring tag namespaces, see
    # [Retiring Key Definitions and Namespace Definitions](https://docs.cloud.oracle.com/Content/Tagging/Tasks/managingtagsandtagnamespaces.htm#retiringkeys).
    #
    # You can't add a namespace with the same name as a retired namespace in the same tenancy.
    #
    # @param [String] tag_namespace_id The OCID of the tag namespace.
    #
    # @param [OCI::Identity::Models::UpdateTagNamespaceDetails] update_tag_namespace_details Request object for updating a namespace.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [BOOLEAN] :is_lock_override Whether to override locks (if any exist). (default to false)
    # @return [Response] A Response object with data of type {OCI::Identity::Models::TagNamespace TagNamespace}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/update_tag_namespace.rb.html) to see an example of how to use update_tag_namespace API.
    def update_tag_namespace(tag_namespace_id, update_tag_namespace_details, opts = {})
      logger.debug 'Calling operation IdentityClient#update_tag_namespace.' if logger

      raise "Missing the required parameter 'tag_namespace_id' when calling update_tag_namespace." if tag_namespace_id.nil?
      raise "Missing the required parameter 'update_tag_namespace_details' when calling update_tag_namespace." if update_tag_namespace_details.nil?
      raise "Parameter value for 'tag_namespace_id' must not be blank" if OCI::Internal::Util.blank_string?(tag_namespace_id)

      path = '/tagNamespaces/{tagNamespaceId}'.sub('{tagNamespaceId}', tag_namespace_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:isLockOverride] = opts[:is_lock_override] if !opts[:is_lock_override].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_tag_namespace_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#update_tag_namespace') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::TagNamespace'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the description of the specified user.
    # @param [String] user_id The OCID of the user.
    # @param [OCI::Identity::Models::UpdateUserDetails] update_user_details Request object for updating a user.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::User User}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/update_user.rb.html) to see an example of how to use update_user API.
    def update_user(user_id, update_user_details, opts = {})
      logger.debug 'Calling operation IdentityClient#update_user.' if logger

      raise "Missing the required parameter 'user_id' when calling update_user." if user_id.nil?
      raise "Missing the required parameter 'update_user_details' when calling update_user." if update_user_details.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)

      path = '/users/{userId}'.sub('{userId}', user_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_user_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#update_user') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::User'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the capabilities of the specified user.
    #
    # @param [String] user_id The OCID of the user.
    # @param [OCI::Identity::Models::UpdateUserCapabilitiesDetails] update_user_capabilities_details Request object for updating user capabilities.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::User User}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/update_user_capabilities.rb.html) to see an example of how to use update_user_capabilities API.
    def update_user_capabilities(user_id, update_user_capabilities_details, opts = {})
      logger.debug 'Calling operation IdentityClient#update_user_capabilities.' if logger

      raise "Missing the required parameter 'user_id' when calling update_user_capabilities." if user_id.nil?
      raise "Missing the required parameter 'update_user_capabilities_details' when calling update_user_capabilities." if update_user_capabilities_details.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)

      path = '/users/{userId}/capabilities/'.sub('{userId}', user_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_user_capabilities_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#update_user_capabilities') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::User'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the state of the specified user.
    #
    # @param [String] user_id The OCID of the user.
    # @param [OCI::Identity::Models::UpdateStateDetails] update_state_details Request object for updating a user state.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::User User}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/update_user_state.rb.html) to see an example of how to use update_user_state API.
    def update_user_state(user_id, update_state_details, opts = {})
      logger.debug 'Calling operation IdentityClient#update_user_state.' if logger

      raise "Missing the required parameter 'user_id' when calling update_user_state." if user_id.nil?
      raise "Missing the required parameter 'update_state_details' when calling update_user_state." if update_state_details.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)

      path = '/users/{userId}/state/'.sub('{userId}', user_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_state_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#update_user_state') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::User'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Uploads an API signing key for the specified user.
    #
    # Every user has permission to use this operation to upload a key for *their own user ID*. An
    # administrator in your organization does not need to write a policy to give users this ability.
    # To compare, administrators who have permission to the tenancy can use this operation to upload a
    # key for any user, including themselves.
    #
    # **Important:** Even though you have permission to upload an API key, you might not yet
    # have permission to do much else. If you try calling an operation unrelated to your own credential
    # management (e.g., `ListUsers`, `LaunchInstance`) and receive an \"unauthorized\" error,
    # check with an administrator to confirm which IAM Service group(s) you're in and what access
    # you have. Also confirm you're working in the correct compartment.
    #
    # After you send your request, the new object's `lifecycleState` will temporarily be CREATING. Before using
    # the object, first make sure its `lifecycleState` has changed to ACTIVE.
    #
    # @param [String] user_id The OCID of the user.
    # @param [OCI::Identity::Models::CreateApiKeyDetails] create_api_key_details Request object for uploading an API key for a user.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Identity::Models::ApiKey ApiKey}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/identity/upload_api_key.rb.html) to see an example of how to use upload_api_key API.
    def upload_api_key(user_id, create_api_key_details, opts = {})
      logger.debug 'Calling operation IdentityClient#upload_api_key.' if logger

      raise "Missing the required parameter 'user_id' when calling upload_api_key." if user_id.nil?
      raise "Missing the required parameter 'create_api_key_details' when calling upload_api_key." if create_api_key_details.nil?
      raise "Parameter value for 'user_id' must not be blank" if OCI::Internal::Util.blank_string?(user_id)

      path = '/users/{userId}/apiKeys/'.sub('{userId}', user_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_api_key_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'IdentityClient#upload_api_key') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Identity::Models::ApiKey'
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
