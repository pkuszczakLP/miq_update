# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Use the Oracle Cloud VMware API to create SDDCs and manage ESXi hosts and software.
  # For more information, see [Oracle Cloud VMware Solution](/iaas/Content/VMware/Concepts/ocvsoverview.htm).
  class Ocvp::SddcClient
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


    # Creates a new SddcClient.
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
      logger.info "SddcClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://ocvps.{region}.oci.{secondLevelDomain}') + '/20200501'
      logger.info "SddcClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Cancel the pending SDDC downgrade from HCX Enterprise to HCX Advanced.
    #
    # @param [String] sddc_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the SDDC.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request. If you need to contact Oracle about a particular
    #   request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/ocvp/cancel_downgrade_hcx.rb.html) to see an example of how to use cancel_downgrade_hcx API.
    def cancel_downgrade_hcx(sddc_id, opts = {})
      logger.debug 'Calling operation SddcClient#cancel_downgrade_hcx.' if logger

      raise "Missing the required parameter 'sddc_id' when calling cancel_downgrade_hcx." if sddc_id.nil?
      raise "Parameter value for 'sddc_id' must not be blank" if OCI::Internal::Util.blank_string?(sddc_id)

      path = '/sddcs/{sddcId}/actions/cancelDowngradeHcx'.sub('{sddcId}', sddc_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'SddcClient#cancel_downgrade_hcx') do
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


    # Moves an SDDC into a different compartment within the same tenancy. For information
    # about moving resources between compartments, see
    # [Moving Resources to a Different Compartment](https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/managingcompartments.htm#moveRes).
    #
    # @param [String] sddc_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the SDDC.
    #
    # @param [OCI::Ocvp::Models::ChangeSddcCompartmentDetails] change_sddc_compartment_details Request to change the compartment of the specified SDDC
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request. If you need to contact Oracle about a particular
    #   request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/ocvp/change_sddc_compartment.rb.html) to see an example of how to use change_sddc_compartment API.
    def change_sddc_compartment(sddc_id, change_sddc_compartment_details, opts = {})
      logger.debug 'Calling operation SddcClient#change_sddc_compartment.' if logger

      raise "Missing the required parameter 'sddc_id' when calling change_sddc_compartment." if sddc_id.nil?
      raise "Missing the required parameter 'change_sddc_compartment_details' when calling change_sddc_compartment." if change_sddc_compartment_details.nil?
      raise "Parameter value for 'sddc_id' must not be blank" if OCI::Internal::Util.blank_string?(sddc_id)

      path = '/sddcs/{sddcId}/actions/changeCompartment'.sub('{sddcId}', sddc_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_sddc_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'SddcClient#change_sddc_compartment') do
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


    # Creates an Oracle Cloud VMware Solution software-defined data center (SDDC).
    #
    # Use the {WorkRequest} operations to track the
    # creation of the SDDC.
    #
    # **Important:** You must configure the SDDC's networking resources with the security rules detailed in [Security Rules for Oracle Cloud VMware Solution SDDCs](https://docs.cloud.oracle.com/iaas/Content/VMware/Reference/ocvssecurityrules.htm). Otherwise, provisioning the SDDC will fail. The rules are based on the requirements set by VMware.
    #
    # @param [OCI::Ocvp::Models::CreateSddcDetails] create_sddc_details Details for the SDDC.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :opc_request_id Unique identifier for the request. If you need to contact Oracle about a particular
    #   request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/ocvp/create_sddc.rb.html) to see an example of how to use create_sddc API.
    def create_sddc(create_sddc_details, opts = {})
      logger.debug 'Calling operation SddcClient#create_sddc.' if logger

      raise "Missing the required parameter 'create_sddc_details' when calling create_sddc." if create_sddc_details.nil?

      path = '/sddcs'
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

      post_body = @api_client.object_to_http_body(create_sddc_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'SddcClient#create_sddc') do
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


    # Deletes the specified SDDC, along with the other resources that were
    # created with the SDDC. For example: the Compute instances, DNS records,
    # and so on.
    #
    # Use the {WorkRequest} operations to track the
    # deletion of the SDDC.
    #
    # @param [String] sddc_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the SDDC.
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
    # @option opts [String] :opc_request_id Unique identifier for the request. If you need to contact Oracle about a particular
    #   request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/ocvp/delete_sddc.rb.html) to see an example of how to use delete_sddc API.
    def delete_sddc(sddc_id, opts = {})
      logger.debug 'Calling operation SddcClient#delete_sddc.' if logger

      raise "Missing the required parameter 'sddc_id' when calling delete_sddc." if sddc_id.nil?
      raise "Parameter value for 'sddc_id' must not be blank" if OCI::Internal::Util.blank_string?(sddc_id)

      path = '/sddcs/{sddcId}'.sub('{sddcId}', sddc_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'SddcClient#delete_sddc') do
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


    # Downgrade the specified SDDC from HCX Enterprise to HCX Advanced.
    # Downgrading from HCX Enterprise to HCX Advanced reduces the number of provided license keys from 10 to 3.
    # Downgrade remains in a `PENDING` state until the end of the current billing cycle. You can use {#cancel_downgrade_hcx cancel_downgrade_hcx}
    # to cancel the downgrade while it's still in a `PENDING` state.
    #
    # @param [OCI::Ocvp::Models::DowngradeHcxDetails] downgrade_hcx_details The HCX on-premise license keys to be reserved when downgrading from HCX Enterprise to HCX Advanced.
    # @param [String] sddc_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the SDDC.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request. If you need to contact Oracle about a particular
    #   request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/ocvp/downgrade_hcx.rb.html) to see an example of how to use downgrade_hcx API.
    def downgrade_hcx(downgrade_hcx_details, sddc_id, opts = {})
      logger.debug 'Calling operation SddcClient#downgrade_hcx.' if logger

      raise "Missing the required parameter 'downgrade_hcx_details' when calling downgrade_hcx." if downgrade_hcx_details.nil?
      raise "Missing the required parameter 'sddc_id' when calling downgrade_hcx." if sddc_id.nil?
      raise "Parameter value for 'sddc_id' must not be blank" if OCI::Internal::Util.blank_string?(sddc_id)

      path = '/sddcs/{sddcId}/actions/downgradeHcx'.sub('{sddcId}', sddc_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(downgrade_hcx_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'SddcClient#downgrade_hcx') do
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


    # Gets the specified SDDC's information.
    # @param [String] sddc_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the SDDC.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request. If you need to contact Oracle about a particular
    #   request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Ocvp::Models::Sddc Sddc}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/ocvp/get_sddc.rb.html) to see an example of how to use get_sddc API.
    def get_sddc(sddc_id, opts = {})
      logger.debug 'Calling operation SddcClient#get_sddc.' if logger

      raise "Missing the required parameter 'sddc_id' when calling get_sddc." if sddc_id.nil?
      raise "Parameter value for 'sddc_id' must not be blank" if OCI::Internal::Util.blank_string?(sddc_id)

      path = '/sddcs/{sddcId}'.sub('{sddcId}', sddc_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'SddcClient#get_sddc') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Ocvp::Models::Sddc'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the SDDCs in the specified compartment. The list can be
    # filtered by display name or availability domain.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :compute_availability_domain The name of the availability domain that the Compute instances are running in.
    #
    #   Example: `Uocm:PHX-AD-1`
    #
    # @option opts [String] :display_name A filter to return only resources that match the given display name exactly.
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to return in a paginated
    #   \"List\" call. For important details about how pagination works, see
    #   [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #    (default to 10)
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from the previous \"List\"
    #   call. For important details about how pagination works, see
    #   [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). The DISPLAYNAME sort order
    #   is case sensitive.
    #    (default to ASC)
    # @option opts [String] :sort_by The field to sort by. You can provide one sort order (`sortOrder`). Default order for
    #   TIMECREATED is descending. Default order for DISPLAYNAME is ascending. The DISPLAYNAME
    #   sort order is case sensitive.
    #
    #   **Note:** In general, some \"List\" operations (for example, `ListInstances`) let you
    #   optionally filter by availability domain if the scope of the resource type is within a
    #   single availability domain. If you call one of these \"List\" operations without specifying
    #   an availability domain, the resources are grouped by availability domain, then sorted.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, displayName
    # @option opts [String] :opc_request_id Unique identifier for the request. If you need to contact Oracle about a particular
    #   request, please provide the request ID.
    #
    # @option opts [String] :lifecycle_state The lifecycle state of the resource.
    # @return [Response] A Response object with data of type {OCI::Ocvp::Models::SddcCollection SddcCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/ocvp/list_sddcs.rb.html) to see an example of how to use list_sddcs API.
    def list_sddcs(compartment_id, opts = {})
      logger.debug 'Calling operation SddcClient#list_sddcs.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_sddcs." if compartment_id.nil?

      if opts[:sort_order] && !OCI::Ocvp::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Ocvp::Models::SORT_ORDERS_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end

      if opts[:lifecycle_state] && !OCI::Ocvp::Models::LIFECYCLE_STATES_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Ocvp::Models::LIFECYCLE_STATES_ENUM.'
      end

      path = '/sddcs'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:computeAvailabilityDomain] = opts[:compute_availability_domain] if opts[:compute_availability_domain]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'SddcClient#list_sddcs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Ocvp::Models::SddcCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists supported compute shapes for ESXi hosts.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to return in a paginated
    #   \"List\" call. For important details about how pagination works, see
    #   [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #    (default to 10)
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from the previous \"List\"
    #   call. For important details about how pagination works, see
    #   [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :opc_request_id Unique identifier for the request. If you need to contact Oracle about a particular
    #   request, please provide the request ID.
    #
    # @option opts [String] :name A filter to return only resources that match the given name exactly.
    # @option opts [String] :sddc_type A filter to return only resources that match the given SDDC type exactly.
    # @return [Response] A Response object with data of type {OCI::Ocvp::Models::SupportedHostShapeCollection SupportedHostShapeCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/ocvp/list_supported_host_shapes.rb.html) to see an example of how to use list_supported_host_shapes API.
    def list_supported_host_shapes(compartment_id, opts = {})
      logger.debug 'Calling operation SddcClient#list_supported_host_shapes.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_supported_host_shapes." if compartment_id.nil?

      if opts[:sddc_type] && !OCI::Ocvp::Models::SDDC_TYPES_ENUM.include?(opts[:sddc_type])
        raise 'Invalid value for "sddc_type", must be one of the values in OCI::Ocvp::Models::SDDC_TYPES_ENUM.'
      end

      path = '/supportedHostShapes'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:sddcType] = opts[:sddc_type] if opts[:sddc_type]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'SddcClient#list_supported_host_shapes') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Ocvp::Models::SupportedHostShapeCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists supported SKUs.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to return in a paginated
    #   \"List\" call. For important details about how pagination works, see
    #   [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #    (default to 10)
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from the previous \"List\"
    #   call. For important details about how pagination works, see
    #   [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :opc_request_id Unique identifier for the request. If you need to contact Oracle about a particular
    #   request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Ocvp::Models::SupportedSkuSummaryCollection SupportedSkuSummaryCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/ocvp/list_supported_skus.rb.html) to see an example of how to use list_supported_skus API.
    def list_supported_skus(compartment_id, opts = {})
      logger.debug 'Calling operation SddcClient#list_supported_skus.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_supported_skus." if compartment_id.nil?

      path = '/supportedSkus'
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'SddcClient#list_supported_skus') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Ocvp::Models::SupportedSkuSummaryCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the versions of bundled VMware software supported by the Oracle Cloud
    # VMware Solution.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to return in a paginated
    #   \"List\" call. For important details about how pagination works, see
    #   [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #    (default to 10)
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from the previous \"List\"
    #   call. For important details about how pagination works, see
    #   [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :opc_request_id Unique identifier for the request. If you need to contact Oracle about a particular
    #   request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Ocvp::Models::SupportedVmwareSoftwareVersionCollection SupportedVmwareSoftwareVersionCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/ocvp/list_supported_vmware_software_versions.rb.html) to see an example of how to use list_supported_vmware_software_versions API.
    def list_supported_vmware_software_versions(compartment_id, opts = {})
      logger.debug 'Calling operation SddcClient#list_supported_vmware_software_versions.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_supported_vmware_software_versions." if compartment_id.nil?

      path = '/supportedVmwareSoftwareVersions'
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'SddcClient#list_supported_vmware_software_versions') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Ocvp::Models::SupportedVmwareSoftwareVersionCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Refresh HCX on-premise licenses status of the specified SDDC.
    # @param [String] sddc_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the SDDC.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request. If you need to contact Oracle about a particular
    #   request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/ocvp/refresh_hcx_license_status.rb.html) to see an example of how to use refresh_hcx_license_status API.
    def refresh_hcx_license_status(sddc_id, opts = {})
      logger.debug 'Calling operation SddcClient#refresh_hcx_license_status.' if logger

      raise "Missing the required parameter 'sddc_id' when calling refresh_hcx_license_status." if sddc_id.nil?
      raise "Parameter value for 'sddc_id' must not be blank" if OCI::Internal::Util.blank_string?(sddc_id)

      path = '/sddcs/{sddcId}/actions/refreshHcxLicenses'.sub('{sddcId}', sddc_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'SddcClient#refresh_hcx_license_status') do
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


    # Updates the specified SDDC.
    #
    # **Important:** Updating an SDDC affects only certain attributes in the `Sddc`
    # object and does not affect the VMware environment currently running in
    # the SDDC. For more information, see
    # {#update_sddc_details update_sddc_details}.
    #
    # @param [String] sddc_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the SDDC.
    #
    # @param [OCI::Ocvp::Models::UpdateSddcDetails] update_sddc_details The information to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request. If you need to contact Oracle about a particular
    #   request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Ocvp::Models::Sddc Sddc}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/ocvp/update_sddc.rb.html) to see an example of how to use update_sddc API.
    def update_sddc(sddc_id, update_sddc_details, opts = {})
      logger.debug 'Calling operation SddcClient#update_sddc.' if logger

      raise "Missing the required parameter 'sddc_id' when calling update_sddc." if sddc_id.nil?
      raise "Missing the required parameter 'update_sddc_details' when calling update_sddc." if update_sddc_details.nil?
      raise "Parameter value for 'sddc_id' must not be blank" if OCI::Internal::Util.blank_string?(sddc_id)

      path = '/sddcs/{sddcId}'.sub('{sddcId}', sddc_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_sddc_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'SddcClient#update_sddc') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Ocvp::Models::Sddc'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Upgrade the specified SDDC from HCX Advanced to HCX Enterprise.
    #
    # @param [String] sddc_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the SDDC.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request. If you need to contact Oracle about a particular
    #   request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/ocvp/upgrade_hcx.rb.html) to see an example of how to use upgrade_hcx API.
    def upgrade_hcx(sddc_id, opts = {})
      logger.debug 'Calling operation SddcClient#upgrade_hcx.' if logger

      raise "Missing the required parameter 'sddc_id' when calling upgrade_hcx." if sddc_id.nil?
      raise "Parameter value for 'sddc_id' must not be blank" if OCI::Internal::Util.blank_string?(sddc_id)

      path = '/sddcs/{sddcId}/actions/upgradeHcx'.sub('{sddcId}', sddc_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'SddcClient#upgrade_hcx') do
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

    private

    def applicable_retry_config(opts = {})
      return @retry_config unless opts.key?(:retry_config)

      opts[:retry_config]
    end
  end
end
# rubocop:enable Lint/UnneededCopDisableDirective, Metrics/LineLength
