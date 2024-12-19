# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Use the Data Catalog APIs to collect, organize, find, access, understand, enrich, and activate technical, business, and operational metadata.
  # For more information, see [Data Catalog](https://docs.oracle.com/iaas/data-catalog/home.htm).
  class DataCatalog::DataCatalogClient
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


    # Creates a new DataCatalogClient.
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
        @endpoint = endpoint + '/20190325'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "DataCatalogClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://datacatalog.{region}.oci.{secondLevelDomain}') + '/20190325'
      logger.info "DataCatalogClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Add data selector pattern to the data asset.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [OCI::DataCatalog::Models::DataSelectorPatternDetails] data_selector_pattern_details The information used to add the patterns for deriving logical entities.
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
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::DataAsset DataAsset}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/add_data_selector_patterns.rb.html) to see an example of how to use add_data_selector_patterns API.
    def add_data_selector_patterns(catalog_id, data_asset_key, data_selector_pattern_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#add_data_selector_patterns.' if logger

      raise "Missing the required parameter 'catalog_id' when calling add_data_selector_patterns." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling add_data_selector_patterns." if data_asset_key.nil?
      raise "Missing the required parameter 'data_selector_pattern_details' when calling add_data_selector_patterns." if data_selector_pattern_details.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/actions/addDataSelectorPatterns'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s)
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
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(data_selector_pattern_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#add_data_selector_patterns') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::DataAsset'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Associate the custom property for the given type
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] type_key Unique type key.
    # @param [OCI::DataCatalog::Models::TypeCustomPropertyDetails] associate_custom_property_details The information used to associate the custom property for the type.
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
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::Type Type}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/associate_custom_property.rb.html) to see an example of how to use associate_custom_property API.
    def associate_custom_property(catalog_id, type_key, associate_custom_property_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#associate_custom_property.' if logger

      raise "Missing the required parameter 'catalog_id' when calling associate_custom_property." if catalog_id.nil?
      raise "Missing the required parameter 'type_key' when calling associate_custom_property." if type_key.nil?
      raise "Missing the required parameter 'associate_custom_property_details' when calling associate_custom_property." if associate_custom_property_details.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'type_key' must not be blank" if OCI::Internal::Util.blank_string?(type_key)

      path = '/catalogs/{catalogId}/types/{typeKey}/actions/associateCustomProperties'.sub('{catalogId}', catalog_id.to_s).sub('{typeKey}', type_key.to_s)
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
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(associate_custom_property_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#associate_custom_property') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::Type'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Attaches a private reverse connection endpoint resource to a data catalog resource. When provided, 'If-Match' is checked against 'ETag' values of the resource.
    # @param [OCI::DataCatalog::Models::AttachCatalogPrivateEndpointDetails] attach_catalog_private_endpoint_details Details for private reverse connection endpoint to be used for attachment.
    # @param [String] catalog_id Unique catalog identifier.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/attach_catalog_private_endpoint.rb.html) to see an example of how to use attach_catalog_private_endpoint API.
    def attach_catalog_private_endpoint(attach_catalog_private_endpoint_details, catalog_id, opts = {})
      logger.debug 'Calling operation DataCatalogClient#attach_catalog_private_endpoint.' if logger

      raise "Missing the required parameter 'attach_catalog_private_endpoint_details' when calling attach_catalog_private_endpoint." if attach_catalog_private_endpoint_details.nil?
      raise "Missing the required parameter 'catalog_id' when calling attach_catalog_private_endpoint." if catalog_id.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)

      path = '/catalogs/{catalogId}/actions/attachCatalogPrivateEndpoint'.sub('{catalogId}', catalog_id.to_s)
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

      post_body = @api_client.object_to_http_body(attach_catalog_private_endpoint_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#attach_catalog_private_endpoint') do
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


    # Moves a resource into a different compartment. When provided, 'If-Match' is checked against 'ETag' values of the resource.
    # @param [OCI::DataCatalog::Models::ChangeCatalogCompartmentDetails] change_catalog_compartment_details Details for the target compartment.
    # @param [String] catalog_id Unique catalog identifier.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/change_catalog_compartment.rb.html) to see an example of how to use change_catalog_compartment API.
    def change_catalog_compartment(change_catalog_compartment_details, catalog_id, opts = {})
      logger.debug 'Calling operation DataCatalogClient#change_catalog_compartment.' if logger

      raise "Missing the required parameter 'change_catalog_compartment_details' when calling change_catalog_compartment." if change_catalog_compartment_details.nil?
      raise "Missing the required parameter 'catalog_id' when calling change_catalog_compartment." if catalog_id.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)

      path = '/catalogs/{catalogId}/actions/changeCompartment'.sub('{catalogId}', catalog_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_catalog_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#change_catalog_compartment') do
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


    # Moves a resource into a different compartment. When provided, 'If-Match' is checked against 'ETag' values of the resource.
    # @param [OCI::DataCatalog::Models::ChangeCatalogPrivateEndpointCompartmentDetails] change_catalog_private_endpoint_compartment_details Details for the target compartment.
    # @param [String] catalog_private_endpoint_id Unique private reverse connection identifier.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/change_catalog_private_endpoint_compartment.rb.html) to see an example of how to use change_catalog_private_endpoint_compartment API.
    def change_catalog_private_endpoint_compartment(change_catalog_private_endpoint_compartment_details, catalog_private_endpoint_id, opts = {})
      logger.debug 'Calling operation DataCatalogClient#change_catalog_private_endpoint_compartment.' if logger

      raise "Missing the required parameter 'change_catalog_private_endpoint_compartment_details' when calling change_catalog_private_endpoint_compartment." if change_catalog_private_endpoint_compartment_details.nil?
      raise "Missing the required parameter 'catalog_private_endpoint_id' when calling change_catalog_private_endpoint_compartment." if catalog_private_endpoint_id.nil?
      raise "Parameter value for 'catalog_private_endpoint_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_private_endpoint_id)

      path = '/catalogPrivateEndpoints/{catalogPrivateEndpointId}/actions/changeCompartment'.sub('{catalogPrivateEndpointId}', catalog_private_endpoint_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_catalog_private_endpoint_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#change_catalog_private_endpoint_compartment') do
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


    # Moves a resource into a different compartment. When provided, 'If-Match' is checked against 'ETag' values of the resource.
    # @param [OCI::DataCatalog::Models::ChangeMetastoreCompartmentDetails] change_metastore_compartment_details Information about a change in metastore compartment.
    # @param [String] metastore_id The metastore's OCID.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/change_metastore_compartment.rb.html) to see an example of how to use change_metastore_compartment API.
    def change_metastore_compartment(change_metastore_compartment_details, metastore_id, opts = {})
      logger.debug 'Calling operation DataCatalogClient#change_metastore_compartment.' if logger

      raise "Missing the required parameter 'change_metastore_compartment_details' when calling change_metastore_compartment." if change_metastore_compartment_details.nil?
      raise "Missing the required parameter 'metastore_id' when calling change_metastore_compartment." if metastore_id.nil?
      raise "Parameter value for 'metastore_id' must not be blank" if OCI::Internal::Util.blank_string?(metastore_id)

      path = '/metastores/{metastoreId}/actions/changeCompartment'.sub('{metastoreId}', metastore_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_metastore_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#change_metastore_compartment') do
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


    # Creates a new entity attribute.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [String] entity_key Unique entity key.
    # @param [OCI::DataCatalog::Models::CreateAttributeDetails] create_attribute_details The information used to create an entity attribute.
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
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::Attribute Attribute}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/create_attribute.rb.html) to see an example of how to use create_attribute API.
    def create_attribute(catalog_id, data_asset_key, entity_key, create_attribute_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#create_attribute.' if logger

      raise "Missing the required parameter 'catalog_id' when calling create_attribute." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling create_attribute." if data_asset_key.nil?
      raise "Missing the required parameter 'entity_key' when calling create_attribute." if entity_key.nil?
      raise "Missing the required parameter 'create_attribute_details' when calling create_attribute." if create_attribute_details.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)
      raise "Parameter value for 'entity_key' must not be blank" if OCI::Internal::Util.blank_string?(entity_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/entities/{entityKey}/attributes'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s).sub('{entityKey}', entity_key.to_s)
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

      post_body = @api_client.object_to_http_body(create_attribute_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#create_attribute') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::Attribute'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new entity attribute tag.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [String] entity_key Unique entity key.
    # @param [String] attribute_key Unique attribute key.
    # @param [OCI::DataCatalog::Models::CreateTagDetails] create_attribute_tag_details The information used to create an entity attribute tag.
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
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::AttributeTag AttributeTag}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/create_attribute_tag.rb.html) to see an example of how to use create_attribute_tag API.
    def create_attribute_tag(catalog_id, data_asset_key, entity_key, attribute_key, create_attribute_tag_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#create_attribute_tag.' if logger

      raise "Missing the required parameter 'catalog_id' when calling create_attribute_tag." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling create_attribute_tag." if data_asset_key.nil?
      raise "Missing the required parameter 'entity_key' when calling create_attribute_tag." if entity_key.nil?
      raise "Missing the required parameter 'attribute_key' when calling create_attribute_tag." if attribute_key.nil?
      raise "Missing the required parameter 'create_attribute_tag_details' when calling create_attribute_tag." if create_attribute_tag_details.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)
      raise "Parameter value for 'entity_key' must not be blank" if OCI::Internal::Util.blank_string?(entity_key)
      raise "Parameter value for 'attribute_key' must not be blank" if OCI::Internal::Util.blank_string?(attribute_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/entities/{entityKey}/attributes/{attributeKey}/tags'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s).sub('{entityKey}', entity_key.to_s).sub('{attributeKey}', attribute_key.to_s)
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

      post_body = @api_client.object_to_http_body(create_attribute_tag_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#create_attribute_tag') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::AttributeTag'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new data catalog instance that includes a console and an API URL for managing metadata operations.
    # For more information, please see the documentation.
    #
    # @param [OCI::DataCatalog::Models::CreateCatalogDetails] create_catalog_details Details for the new data catalog.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/create_catalog.rb.html) to see an example of how to use create_catalog API.
    def create_catalog(create_catalog_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#create_catalog.' if logger

      raise "Missing the required parameter 'create_catalog_details' when calling create_catalog." if create_catalog_details.nil?

      path = '/catalogs'
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

      post_body = @api_client.object_to_http_body(create_catalog_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#create_catalog') do
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


    # Create a new private reverse connection endpoint.
    # @param [OCI::DataCatalog::Models::CreateCatalogPrivateEndpointDetails] create_catalog_private_endpoint_details The information used to create the private reverse connection.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/create_catalog_private_endpoint.rb.html) to see an example of how to use create_catalog_private_endpoint API.
    def create_catalog_private_endpoint(create_catalog_private_endpoint_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#create_catalog_private_endpoint.' if logger

      raise "Missing the required parameter 'create_catalog_private_endpoint_details' when calling create_catalog_private_endpoint." if create_catalog_private_endpoint_details.nil?

      path = '/catalogPrivateEndpoints'
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

      post_body = @api_client.object_to_http_body(create_catalog_private_endpoint_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#create_catalog_private_endpoint') do
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


    # Creates a new connection.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [OCI::DataCatalog::Models::CreateConnectionDetails] create_connection_details The information used to create the connection.
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
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::Connection Connection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/create_connection.rb.html) to see an example of how to use create_connection API.
    def create_connection(catalog_id, data_asset_key, create_connection_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#create_connection.' if logger

      raise "Missing the required parameter 'catalog_id' when calling create_connection." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling create_connection." if data_asset_key.nil?
      raise "Missing the required parameter 'create_connection_details' when calling create_connection." if create_connection_details.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/connections'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s)
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

      post_body = @api_client.object_to_http_body(create_connection_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#create_connection') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::Connection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Create a new Custom Property
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] namespace_id Unique namespace identifier.
    # @param [OCI::DataCatalog::Models::CreateCustomPropertyDetails] create_custom_property_details The information used to create the Custom Property.
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
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::CustomProperty CustomProperty}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/create_custom_property.rb.html) to see an example of how to use create_custom_property API.
    def create_custom_property(catalog_id, namespace_id, create_custom_property_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#create_custom_property.' if logger

      raise "Missing the required parameter 'catalog_id' when calling create_custom_property." if catalog_id.nil?
      raise "Missing the required parameter 'namespace_id' when calling create_custom_property." if namespace_id.nil?
      raise "Missing the required parameter 'create_custom_property_details' when calling create_custom_property." if create_custom_property_details.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'namespace_id' must not be blank" if OCI::Internal::Util.blank_string?(namespace_id)

      path = '/catalogs/{catalogId}/namespaces/{namespaceId}/customProperties'.sub('{catalogId}', catalog_id.to_s).sub('{namespaceId}', namespace_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_custom_property_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#create_custom_property') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::CustomProperty'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Create a new data asset.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [OCI::DataCatalog::Models::CreateDataAssetDetails] create_data_asset_details The information used to create the data asset.
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
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::DataAsset DataAsset}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/create_data_asset.rb.html) to see an example of how to use create_data_asset API.
    def create_data_asset(catalog_id, create_data_asset_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#create_data_asset.' if logger

      raise "Missing the required parameter 'catalog_id' when calling create_data_asset." if catalog_id.nil?
      raise "Missing the required parameter 'create_data_asset_details' when calling create_data_asset." if create_data_asset_details.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)

      path = '/catalogs/{catalogId}/dataAssets'.sub('{catalogId}', catalog_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_data_asset_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#create_data_asset') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::DataAsset'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new data asset tag.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [OCI::DataCatalog::Models::CreateTagDetails] create_data_asset_tag_details The information used to create the data asset tag.
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
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::DataAssetTag DataAssetTag}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/create_data_asset_tag.rb.html) to see an example of how to use create_data_asset_tag API.
    def create_data_asset_tag(catalog_id, data_asset_key, create_data_asset_tag_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#create_data_asset_tag.' if logger

      raise "Missing the required parameter 'catalog_id' when calling create_data_asset_tag." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling create_data_asset_tag." if data_asset_key.nil?
      raise "Missing the required parameter 'create_data_asset_tag_details' when calling create_data_asset_tag." if create_data_asset_tag_details.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/tags'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s)
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

      post_body = @api_client.object_to_http_body(create_data_asset_tag_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#create_data_asset_tag') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::DataAssetTag'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new data entity.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [OCI::DataCatalog::Models::CreateEntityDetails] create_entity_details The information used to create the data entity.
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
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::Entity Entity}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/create_entity.rb.html) to see an example of how to use create_entity API.
    def create_entity(catalog_id, data_asset_key, create_entity_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#create_entity.' if logger

      raise "Missing the required parameter 'catalog_id' when calling create_entity." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling create_entity." if data_asset_key.nil?
      raise "Missing the required parameter 'create_entity_details' when calling create_entity." if create_entity_details.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/entities'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s)
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

      post_body = @api_client.object_to_http_body(create_entity_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#create_entity') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::Entity'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new entity tag.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [String] entity_key Unique entity key.
    # @param [OCI::DataCatalog::Models::CreateTagDetails] create_entity_tag_details The information used to create the entity tag.
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
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::EntityTag EntityTag}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/create_entity_tag.rb.html) to see an example of how to use create_entity_tag API.
    def create_entity_tag(catalog_id, data_asset_key, entity_key, create_entity_tag_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#create_entity_tag.' if logger

      raise "Missing the required parameter 'catalog_id' when calling create_entity_tag." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling create_entity_tag." if data_asset_key.nil?
      raise "Missing the required parameter 'entity_key' when calling create_entity_tag." if entity_key.nil?
      raise "Missing the required parameter 'create_entity_tag_details' when calling create_entity_tag." if create_entity_tag_details.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)
      raise "Parameter value for 'entity_key' must not be blank" if OCI::Internal::Util.blank_string?(entity_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/entities/{entityKey}/tags'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s).sub('{entityKey}', entity_key.to_s)
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

      post_body = @api_client.object_to_http_body(create_entity_tag_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#create_entity_tag') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::EntityTag'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new folder.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [OCI::DataCatalog::Models::CreateFolderDetails] create_folder_details The information used to create the folder.
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
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::Folder Folder}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/create_folder.rb.html) to see an example of how to use create_folder API.
    def create_folder(catalog_id, data_asset_key, create_folder_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#create_folder.' if logger

      raise "Missing the required parameter 'catalog_id' when calling create_folder." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling create_folder." if data_asset_key.nil?
      raise "Missing the required parameter 'create_folder_details' when calling create_folder." if create_folder_details.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/folders'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s)
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

      post_body = @api_client.object_to_http_body(create_folder_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#create_folder') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::Folder'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new folder tag.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [String] folder_key Unique folder key.
    # @param [OCI::DataCatalog::Models::CreateTagDetails] create_folder_tag_details The information used to create the folder tag.
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
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::FolderTag FolderTag}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/create_folder_tag.rb.html) to see an example of how to use create_folder_tag API.
    def create_folder_tag(catalog_id, data_asset_key, folder_key, create_folder_tag_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#create_folder_tag.' if logger

      raise "Missing the required parameter 'catalog_id' when calling create_folder_tag." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling create_folder_tag." if data_asset_key.nil?
      raise "Missing the required parameter 'folder_key' when calling create_folder_tag." if folder_key.nil?
      raise "Missing the required parameter 'create_folder_tag_details' when calling create_folder_tag." if create_folder_tag_details.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)
      raise "Parameter value for 'folder_key' must not be blank" if OCI::Internal::Util.blank_string?(folder_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/folders/{folderKey}/tags'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s).sub('{folderKey}', folder_key.to_s)
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

      post_body = @api_client.object_to_http_body(create_folder_tag_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#create_folder_tag') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::FolderTag'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new glossary.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [OCI::DataCatalog::Models::CreateGlossaryDetails] create_glossary_details The information used to create the glossary.
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
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::Glossary Glossary}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/create_glossary.rb.html) to see an example of how to use create_glossary API.
    def create_glossary(catalog_id, create_glossary_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#create_glossary.' if logger

      raise "Missing the required parameter 'catalog_id' when calling create_glossary." if catalog_id.nil?
      raise "Missing the required parameter 'create_glossary_details' when calling create_glossary." if create_glossary_details.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)

      path = '/catalogs/{catalogId}/glossaries'.sub('{catalogId}', catalog_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_glossary_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#create_glossary') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::Glossary'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new job.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [OCI::DataCatalog::Models::CreateJobDetails] create_job_details The information used to create the job.
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
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::Job Job}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/create_job.rb.html) to see an example of how to use create_job API.
    def create_job(catalog_id, create_job_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#create_job.' if logger

      raise "Missing the required parameter 'catalog_id' when calling create_job." if catalog_id.nil?
      raise "Missing the required parameter 'create_job_details' when calling create_job." if create_job_details.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)

      path = '/catalogs/{catalogId}/jobs'.sub('{catalogId}', catalog_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_job_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#create_job') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::Job'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new job definition.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [OCI::DataCatalog::Models::CreateJobDefinitionDetails] create_job_definition_details The information used to create the job definition.
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
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::JobDefinition JobDefinition}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/create_job_definition.rb.html) to see an example of how to use create_job_definition API.
    def create_job_definition(catalog_id, create_job_definition_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#create_job_definition.' if logger

      raise "Missing the required parameter 'catalog_id' when calling create_job_definition." if catalog_id.nil?
      raise "Missing the required parameter 'create_job_definition_details' when calling create_job_definition." if create_job_definition_details.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)

      path = '/catalogs/{catalogId}/jobDefinitions'.sub('{catalogId}', catalog_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_job_definition_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#create_job_definition') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::JobDefinition'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new job execution.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] job_key Unique job key.
    # @param [OCI::DataCatalog::Models::CreateJobExecutionDetails] create_job_execution_details The information used to create the job execution.
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
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::JobExecution JobExecution}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/create_job_execution.rb.html) to see an example of how to use create_job_execution API.
    def create_job_execution(catalog_id, job_key, create_job_execution_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#create_job_execution.' if logger

      raise "Missing the required parameter 'catalog_id' when calling create_job_execution." if catalog_id.nil?
      raise "Missing the required parameter 'job_key' when calling create_job_execution." if job_key.nil?
      raise "Missing the required parameter 'create_job_execution_details' when calling create_job_execution." if create_job_execution_details.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'job_key' must not be blank" if OCI::Internal::Util.blank_string?(job_key)

      path = '/catalogs/{catalogId}/jobs/{jobKey}/executions'.sub('{catalogId}', catalog_id.to_s).sub('{jobKey}', job_key.to_s)
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

      post_body = @api_client.object_to_http_body(create_job_execution_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#create_job_execution') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::JobExecution'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new metastore.
    #
    # @param [OCI::DataCatalog::Models::CreateMetastoreDetails] create_metastore_details Information about a new metastore to be created.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/create_metastore.rb.html) to see an example of how to use create_metastore API.
    def create_metastore(create_metastore_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#create_metastore.' if logger

      raise "Missing the required parameter 'create_metastore_details' when calling create_metastore." if create_metastore_details.nil?

      path = '/metastores'
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

      post_body = @api_client.object_to_http_body(create_metastore_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#create_metastore') do
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


    # Create a new Namespace to be used by a custom property
    # @param [String] catalog_id Unique catalog identifier.
    # @param [OCI::DataCatalog::Models::CreateNamespaceDetails] create_namespace_details The information used to create the Namespace.
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
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::Namespace Namespace}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/create_namespace.rb.html) to see an example of how to use create_namespace API.
    def create_namespace(catalog_id, create_namespace_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#create_namespace.' if logger

      raise "Missing the required parameter 'catalog_id' when calling create_namespace." if catalog_id.nil?
      raise "Missing the required parameter 'create_namespace_details' when calling create_namespace." if create_namespace_details.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)

      path = '/catalogs/{catalogId}/namespaces'.sub('{catalogId}', catalog_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_namespace_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#create_namespace') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::Namespace'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Create a new pattern.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [OCI::DataCatalog::Models::CreatePatternDetails] create_pattern_details The information used to create the pattern.
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
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::Pattern Pattern}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/create_pattern.rb.html) to see an example of how to use create_pattern API.
    def create_pattern(catalog_id, create_pattern_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#create_pattern.' if logger

      raise "Missing the required parameter 'catalog_id' when calling create_pattern." if catalog_id.nil?
      raise "Missing the required parameter 'create_pattern_details' when calling create_pattern." if create_pattern_details.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)

      path = '/catalogs/{catalogId}/patterns'.sub('{catalogId}', catalog_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_pattern_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#create_pattern') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::Pattern'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Create a new term within a glossary.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] glossary_key Unique glossary key.
    # @param [OCI::DataCatalog::Models::CreateTermDetails] create_term_details The information used to create the term.
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
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::Term Term}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/create_term.rb.html) to see an example of how to use create_term API.
    def create_term(catalog_id, glossary_key, create_term_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#create_term.' if logger

      raise "Missing the required parameter 'catalog_id' when calling create_term." if catalog_id.nil?
      raise "Missing the required parameter 'glossary_key' when calling create_term." if glossary_key.nil?
      raise "Missing the required parameter 'create_term_details' when calling create_term." if create_term_details.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'glossary_key' must not be blank" if OCI::Internal::Util.blank_string?(glossary_key)

      path = '/catalogs/{catalogId}/glossaries/{glossaryKey}/terms'.sub('{catalogId}', catalog_id.to_s).sub('{glossaryKey}', glossary_key.to_s)
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

      post_body = @api_client.object_to_http_body(create_term_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#create_term') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::Term'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new term relationship for this term within a glossary.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] glossary_key Unique glossary key.
    # @param [String] term_key Unique glossary term key.
    # @param [OCI::DataCatalog::Models::CreateTermRelationshipDetails] create_term_relationship_details The information used to create the term relationship.
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
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::TermRelationship TermRelationship}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/create_term_relationship.rb.html) to see an example of how to use create_term_relationship API.
    def create_term_relationship(catalog_id, glossary_key, term_key, create_term_relationship_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#create_term_relationship.' if logger

      raise "Missing the required parameter 'catalog_id' when calling create_term_relationship." if catalog_id.nil?
      raise "Missing the required parameter 'glossary_key' when calling create_term_relationship." if glossary_key.nil?
      raise "Missing the required parameter 'term_key' when calling create_term_relationship." if term_key.nil?
      raise "Missing the required parameter 'create_term_relationship_details' when calling create_term_relationship." if create_term_relationship_details.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'glossary_key' must not be blank" if OCI::Internal::Util.blank_string?(glossary_key)
      raise "Parameter value for 'term_key' must not be blank" if OCI::Internal::Util.blank_string?(term_key)

      path = '/catalogs/{catalogId}/glossaries/{glossaryKey}/terms/{termKey}/termRelationships'.sub('{catalogId}', catalog_id.to_s).sub('{glossaryKey}', glossary_key.to_s).sub('{termKey}', term_key.to_s)
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

      post_body = @api_client.object_to_http_body(create_term_relationship_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#create_term_relationship') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::TermRelationship'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Deletes a specific entity attribute.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [String] entity_key Unique entity key.
    # @param [String] attribute_key Unique attribute key.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/delete_attribute.rb.html) to see an example of how to use delete_attribute API.
    def delete_attribute(catalog_id, data_asset_key, entity_key, attribute_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#delete_attribute.' if logger

      raise "Missing the required parameter 'catalog_id' when calling delete_attribute." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling delete_attribute." if data_asset_key.nil?
      raise "Missing the required parameter 'entity_key' when calling delete_attribute." if entity_key.nil?
      raise "Missing the required parameter 'attribute_key' when calling delete_attribute." if attribute_key.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)
      raise "Parameter value for 'entity_key' must not be blank" if OCI::Internal::Util.blank_string?(entity_key)
      raise "Parameter value for 'attribute_key' must not be blank" if OCI::Internal::Util.blank_string?(attribute_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/entities/{entityKey}/attributes/{attributeKey}'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s).sub('{entityKey}', entity_key.to_s).sub('{attributeKey}', attribute_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#delete_attribute') do
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


    # Deletes a specific entity attribute tag.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [String] entity_key Unique entity key.
    # @param [String] attribute_key Unique attribute key.
    # @param [String] tag_key Unique tag key.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/delete_attribute_tag.rb.html) to see an example of how to use delete_attribute_tag API.
    def delete_attribute_tag(catalog_id, data_asset_key, entity_key, attribute_key, tag_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#delete_attribute_tag.' if logger

      raise "Missing the required parameter 'catalog_id' when calling delete_attribute_tag." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling delete_attribute_tag." if data_asset_key.nil?
      raise "Missing the required parameter 'entity_key' when calling delete_attribute_tag." if entity_key.nil?
      raise "Missing the required parameter 'attribute_key' when calling delete_attribute_tag." if attribute_key.nil?
      raise "Missing the required parameter 'tag_key' when calling delete_attribute_tag." if tag_key.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)
      raise "Parameter value for 'entity_key' must not be blank" if OCI::Internal::Util.blank_string?(entity_key)
      raise "Parameter value for 'attribute_key' must not be blank" if OCI::Internal::Util.blank_string?(attribute_key)
      raise "Parameter value for 'tag_key' must not be blank" if OCI::Internal::Util.blank_string?(tag_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/entities/{entityKey}/attributes/{attributeKey}/tags/{tagKey}'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s).sub('{entityKey}', entity_key.to_s).sub('{attributeKey}', attribute_key.to_s).sub('{tagKey}', tag_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#delete_attribute_tag') do
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


    # Deletes a data catalog resource by identifier.
    # @param [String] catalog_id Unique catalog identifier.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/delete_catalog.rb.html) to see an example of how to use delete_catalog API.
    def delete_catalog(catalog_id, opts = {})
      logger.debug 'Calling operation DataCatalogClient#delete_catalog.' if logger

      raise "Missing the required parameter 'catalog_id' when calling delete_catalog." if catalog_id.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)

      path = '/catalogs/{catalogId}'.sub('{catalogId}', catalog_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#delete_catalog') do
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


    # Deletes a private reverse connection endpoint by identifier.
    # @param [String] catalog_private_endpoint_id Unique private reverse connection identifier.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/delete_catalog_private_endpoint.rb.html) to see an example of how to use delete_catalog_private_endpoint API.
    def delete_catalog_private_endpoint(catalog_private_endpoint_id, opts = {})
      logger.debug 'Calling operation DataCatalogClient#delete_catalog_private_endpoint.' if logger

      raise "Missing the required parameter 'catalog_private_endpoint_id' when calling delete_catalog_private_endpoint." if catalog_private_endpoint_id.nil?
      raise "Parameter value for 'catalog_private_endpoint_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_private_endpoint_id)

      path = '/catalogPrivateEndpoints/{catalogPrivateEndpointId}'.sub('{catalogPrivateEndpointId}', catalog_private_endpoint_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#delete_catalog_private_endpoint') do
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


    # Deletes a specific connection of a data asset.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [String] connection_key Unique connection key.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/delete_connection.rb.html) to see an example of how to use delete_connection API.
    def delete_connection(catalog_id, data_asset_key, connection_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#delete_connection.' if logger

      raise "Missing the required parameter 'catalog_id' when calling delete_connection." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling delete_connection." if data_asset_key.nil?
      raise "Missing the required parameter 'connection_key' when calling delete_connection." if connection_key.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)
      raise "Parameter value for 'connection_key' must not be blank" if OCI::Internal::Util.blank_string?(connection_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/connections/{connectionKey}'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s).sub('{connectionKey}', connection_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#delete_connection') do
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


    # Deletes a specific custom property identified by it's key.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] namespace_id Unique namespace identifier.
    # @param [String] custom_property_key Unique Custom Property key
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/delete_custom_property.rb.html) to see an example of how to use delete_custom_property API.
    def delete_custom_property(catalog_id, namespace_id, custom_property_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#delete_custom_property.' if logger

      raise "Missing the required parameter 'catalog_id' when calling delete_custom_property." if catalog_id.nil?
      raise "Missing the required parameter 'namespace_id' when calling delete_custom_property." if namespace_id.nil?
      raise "Missing the required parameter 'custom_property_key' when calling delete_custom_property." if custom_property_key.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'namespace_id' must not be blank" if OCI::Internal::Util.blank_string?(namespace_id)
      raise "Parameter value for 'custom_property_key' must not be blank" if OCI::Internal::Util.blank_string?(custom_property_key)

      path = '/catalogs/{catalogId}/namespaces/{namespaceId}/customProperties/{customPropertyKey}'.sub('{catalogId}', catalog_id.to_s).sub('{namespaceId}', namespace_id.to_s).sub('{customPropertyKey}', custom_property_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#delete_custom_property') do
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


    # Deletes a specific data asset identified by it's key.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/delete_data_asset.rb.html) to see an example of how to use delete_data_asset API.
    def delete_data_asset(catalog_id, data_asset_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#delete_data_asset.' if logger

      raise "Missing the required parameter 'catalog_id' when calling delete_data_asset." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling delete_data_asset." if data_asset_key.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#delete_data_asset') do
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


    # Deletes a specific data asset tag.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [String] tag_key Unique tag key.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/delete_data_asset_tag.rb.html) to see an example of how to use delete_data_asset_tag API.
    def delete_data_asset_tag(catalog_id, data_asset_key, tag_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#delete_data_asset_tag.' if logger

      raise "Missing the required parameter 'catalog_id' when calling delete_data_asset_tag." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling delete_data_asset_tag." if data_asset_key.nil?
      raise "Missing the required parameter 'tag_key' when calling delete_data_asset_tag." if tag_key.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)
      raise "Parameter value for 'tag_key' must not be blank" if OCI::Internal::Util.blank_string?(tag_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/tags/{tagKey}'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s).sub('{tagKey}', tag_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#delete_data_asset_tag') do
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


    # Deletes a specific data entity.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [String] entity_key Unique entity key.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/delete_entity.rb.html) to see an example of how to use delete_entity API.
    def delete_entity(catalog_id, data_asset_key, entity_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#delete_entity.' if logger

      raise "Missing the required parameter 'catalog_id' when calling delete_entity." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling delete_entity." if data_asset_key.nil?
      raise "Missing the required parameter 'entity_key' when calling delete_entity." if entity_key.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)
      raise "Parameter value for 'entity_key' must not be blank" if OCI::Internal::Util.blank_string?(entity_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/entities/{entityKey}'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s).sub('{entityKey}', entity_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#delete_entity') do
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


    # Deletes a specific entity tag.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [String] entity_key Unique entity key.
    # @param [String] tag_key Unique tag key.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/delete_entity_tag.rb.html) to see an example of how to use delete_entity_tag API.
    def delete_entity_tag(catalog_id, data_asset_key, entity_key, tag_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#delete_entity_tag.' if logger

      raise "Missing the required parameter 'catalog_id' when calling delete_entity_tag." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling delete_entity_tag." if data_asset_key.nil?
      raise "Missing the required parameter 'entity_key' when calling delete_entity_tag." if entity_key.nil?
      raise "Missing the required parameter 'tag_key' when calling delete_entity_tag." if tag_key.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)
      raise "Parameter value for 'entity_key' must not be blank" if OCI::Internal::Util.blank_string?(entity_key)
      raise "Parameter value for 'tag_key' must not be blank" if OCI::Internal::Util.blank_string?(tag_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/entities/{entityKey}/tags/{tagKey}'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s).sub('{entityKey}', entity_key.to_s).sub('{tagKey}', tag_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#delete_entity_tag') do
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


    # Deletes a specific folder of a data asset identified by it's key.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [String] folder_key Unique folder key.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/delete_folder.rb.html) to see an example of how to use delete_folder API.
    def delete_folder(catalog_id, data_asset_key, folder_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#delete_folder.' if logger

      raise "Missing the required parameter 'catalog_id' when calling delete_folder." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling delete_folder." if data_asset_key.nil?
      raise "Missing the required parameter 'folder_key' when calling delete_folder." if folder_key.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)
      raise "Parameter value for 'folder_key' must not be blank" if OCI::Internal::Util.blank_string?(folder_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/folders/{folderKey}'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s).sub('{folderKey}', folder_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#delete_folder') do
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


    # Deletes a specific folder tag.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [String] folder_key Unique folder key.
    # @param [String] tag_key Unique tag key.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/delete_folder_tag.rb.html) to see an example of how to use delete_folder_tag API.
    def delete_folder_tag(catalog_id, data_asset_key, folder_key, tag_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#delete_folder_tag.' if logger

      raise "Missing the required parameter 'catalog_id' when calling delete_folder_tag." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling delete_folder_tag." if data_asset_key.nil?
      raise "Missing the required parameter 'folder_key' when calling delete_folder_tag." if folder_key.nil?
      raise "Missing the required parameter 'tag_key' when calling delete_folder_tag." if tag_key.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)
      raise "Parameter value for 'folder_key' must not be blank" if OCI::Internal::Util.blank_string?(folder_key)
      raise "Parameter value for 'tag_key' must not be blank" if OCI::Internal::Util.blank_string?(tag_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/folders/{folderKey}/tags/{tagKey}'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s).sub('{folderKey}', folder_key.to_s).sub('{tagKey}', tag_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#delete_folder_tag') do
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


    # Deletes a specific glossary identified by it's key.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] glossary_key Unique glossary key.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/delete_glossary.rb.html) to see an example of how to use delete_glossary API.
    def delete_glossary(catalog_id, glossary_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#delete_glossary.' if logger

      raise "Missing the required parameter 'catalog_id' when calling delete_glossary." if catalog_id.nil?
      raise "Missing the required parameter 'glossary_key' when calling delete_glossary." if glossary_key.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'glossary_key' must not be blank" if OCI::Internal::Util.blank_string?(glossary_key)

      path = '/catalogs/{catalogId}/glossaries/{glossaryKey}'.sub('{catalogId}', catalog_id.to_s).sub('{glossaryKey}', glossary_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#delete_glossary') do
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


    # Deletes a specific job identified by it's key.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] job_key Unique job key.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/delete_job.rb.html) to see an example of how to use delete_job API.
    def delete_job(catalog_id, job_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#delete_job.' if logger

      raise "Missing the required parameter 'catalog_id' when calling delete_job." if catalog_id.nil?
      raise "Missing the required parameter 'job_key' when calling delete_job." if job_key.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'job_key' must not be blank" if OCI::Internal::Util.blank_string?(job_key)

      path = '/catalogs/{catalogId}/jobs/{jobKey}'.sub('{catalogId}', catalog_id.to_s).sub('{jobKey}', job_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#delete_job') do
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


    # Deletes a specific job definition identified by it's key.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] job_definition_key Unique job definition key.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/delete_job_definition.rb.html) to see an example of how to use delete_job_definition API.
    def delete_job_definition(catalog_id, job_definition_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#delete_job_definition.' if logger

      raise "Missing the required parameter 'catalog_id' when calling delete_job_definition." if catalog_id.nil?
      raise "Missing the required parameter 'job_definition_key' when calling delete_job_definition." if job_definition_key.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'job_definition_key' must not be blank" if OCI::Internal::Util.blank_string?(job_definition_key)

      path = '/catalogs/{catalogId}/jobDefinitions/{jobDefinitionKey}'.sub('{catalogId}', catalog_id.to_s).sub('{jobDefinitionKey}', job_definition_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#delete_job_definition') do
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


    # Deletes a metastore resource by identifier.
    # @param [String] metastore_id The metastore's OCID.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/delete_metastore.rb.html) to see an example of how to use delete_metastore API.
    def delete_metastore(metastore_id, opts = {})
      logger.debug 'Calling operation DataCatalogClient#delete_metastore.' if logger

      raise "Missing the required parameter 'metastore_id' when calling delete_metastore." if metastore_id.nil?
      raise "Parameter value for 'metastore_id' must not be blank" if OCI::Internal::Util.blank_string?(metastore_id)

      path = '/metastores/{metastoreId}'.sub('{metastoreId}', metastore_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#delete_metastore') do
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


    # Deletes a specific Namespace identified by it's key.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] namespace_id Unique namespace identifier.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/delete_namespace.rb.html) to see an example of how to use delete_namespace API.
    def delete_namespace(catalog_id, namespace_id, opts = {})
      logger.debug 'Calling operation DataCatalogClient#delete_namespace.' if logger

      raise "Missing the required parameter 'catalog_id' when calling delete_namespace." if catalog_id.nil?
      raise "Missing the required parameter 'namespace_id' when calling delete_namespace." if namespace_id.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'namespace_id' must not be blank" if OCI::Internal::Util.blank_string?(namespace_id)

      path = '/catalogs/{catalogId}/namespaces/{namespaceId}'.sub('{catalogId}', catalog_id.to_s).sub('{namespaceId}', namespace_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#delete_namespace') do
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


    # Deletes a specific pattern identified by it's key.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] pattern_key Unique pattern key.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/delete_pattern.rb.html) to see an example of how to use delete_pattern API.
    def delete_pattern(catalog_id, pattern_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#delete_pattern.' if logger

      raise "Missing the required parameter 'catalog_id' when calling delete_pattern." if catalog_id.nil?
      raise "Missing the required parameter 'pattern_key' when calling delete_pattern." if pattern_key.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'pattern_key' must not be blank" if OCI::Internal::Util.blank_string?(pattern_key)

      path = '/catalogs/{catalogId}/patterns/{patternKey}'.sub('{catalogId}', catalog_id.to_s).sub('{patternKey}', pattern_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#delete_pattern') do
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


    # Deletes a specific glossary term.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] glossary_key Unique glossary key.
    # @param [String] term_key Unique glossary term key.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/delete_term.rb.html) to see an example of how to use delete_term API.
    def delete_term(catalog_id, glossary_key, term_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#delete_term.' if logger

      raise "Missing the required parameter 'catalog_id' when calling delete_term." if catalog_id.nil?
      raise "Missing the required parameter 'glossary_key' when calling delete_term." if glossary_key.nil?
      raise "Missing the required parameter 'term_key' when calling delete_term." if term_key.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'glossary_key' must not be blank" if OCI::Internal::Util.blank_string?(glossary_key)
      raise "Parameter value for 'term_key' must not be blank" if OCI::Internal::Util.blank_string?(term_key)

      path = '/catalogs/{catalogId}/glossaries/{glossaryKey}/terms/{termKey}'.sub('{catalogId}', catalog_id.to_s).sub('{glossaryKey}', glossary_key.to_s).sub('{termKey}', term_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#delete_term') do
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


    # Deletes a specific glossary term relationship.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] glossary_key Unique glossary key.
    # @param [String] term_key Unique glossary term key.
    # @param [String] term_relationship_key Unique glossary term relationship key.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/delete_term_relationship.rb.html) to see an example of how to use delete_term_relationship API.
    def delete_term_relationship(catalog_id, glossary_key, term_key, term_relationship_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#delete_term_relationship.' if logger

      raise "Missing the required parameter 'catalog_id' when calling delete_term_relationship." if catalog_id.nil?
      raise "Missing the required parameter 'glossary_key' when calling delete_term_relationship." if glossary_key.nil?
      raise "Missing the required parameter 'term_key' when calling delete_term_relationship." if term_key.nil?
      raise "Missing the required parameter 'term_relationship_key' when calling delete_term_relationship." if term_relationship_key.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'glossary_key' must not be blank" if OCI::Internal::Util.blank_string?(glossary_key)
      raise "Parameter value for 'term_key' must not be blank" if OCI::Internal::Util.blank_string?(term_key)
      raise "Parameter value for 'term_relationship_key' must not be blank" if OCI::Internal::Util.blank_string?(term_relationship_key)

      path = '/catalogs/{catalogId}/glossaries/{glossaryKey}/terms/{termKey}/termRelationships/{termRelationshipKey}'.sub('{catalogId}', catalog_id.to_s).sub('{glossaryKey}', glossary_key.to_s).sub('{termKey}', term_key.to_s).sub('{termRelationshipKey}', term_relationship_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#delete_term_relationship') do
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


    # Detaches a private reverse connection endpoint resource to a data catalog resource. When provided, 'If-Match' is checked against 'ETag' values of the resource.
    # @param [OCI::DataCatalog::Models::DetachCatalogPrivateEndpointDetails] detach_catalog_private_endpoint_details Details for private reverse connection endpoint to be used for attachment
    # @param [String] catalog_id Unique catalog identifier.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/detach_catalog_private_endpoint.rb.html) to see an example of how to use detach_catalog_private_endpoint API.
    def detach_catalog_private_endpoint(detach_catalog_private_endpoint_details, catalog_id, opts = {})
      logger.debug 'Calling operation DataCatalogClient#detach_catalog_private_endpoint.' if logger

      raise "Missing the required parameter 'detach_catalog_private_endpoint_details' when calling detach_catalog_private_endpoint." if detach_catalog_private_endpoint_details.nil?
      raise "Missing the required parameter 'catalog_id' when calling detach_catalog_private_endpoint." if catalog_id.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)

      path = '/catalogs/{catalogId}/actions/detachCatalogPrivateEndpoint'.sub('{catalogId}', catalog_id.to_s)
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

      post_body = @api_client.object_to_http_body(detach_catalog_private_endpoint_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#detach_catalog_private_endpoint') do
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


    # Remove the custom property for the given type
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] type_key Unique type key.
    # @param [OCI::DataCatalog::Models::TypeCustomPropertyDetails] disassociate_custom_property_details The information used to remove the custom properties.
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
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::Type Type}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/disassociate_custom_property.rb.html) to see an example of how to use disassociate_custom_property API.
    def disassociate_custom_property(catalog_id, type_key, disassociate_custom_property_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#disassociate_custom_property.' if logger

      raise "Missing the required parameter 'catalog_id' when calling disassociate_custom_property." if catalog_id.nil?
      raise "Missing the required parameter 'type_key' when calling disassociate_custom_property." if type_key.nil?
      raise "Missing the required parameter 'disassociate_custom_property_details' when calling disassociate_custom_property." if disassociate_custom_property_details.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'type_key' must not be blank" if OCI::Internal::Util.blank_string?(type_key)

      path = '/catalogs/{catalogId}/types/{typeKey}/actions/disassociateCustomProperties'.sub('{catalogId}', catalog_id.to_s).sub('{typeKey}', type_key.to_s)
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
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(disassociate_custom_property_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#disassociate_custom_property') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::Type'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns the fully expanded tree hierarchy of parent and child terms in this glossary.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] glossary_key Unique glossary key.
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
    # @return [Response] A Response object with data of type Array<{OCI::DataCatalog::Models::GlossaryTreeElement GlossaryTreeElement}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/expand_tree_for_glossary.rb.html) to see an example of how to use expand_tree_for_glossary API.
    def expand_tree_for_glossary(catalog_id, glossary_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#expand_tree_for_glossary.' if logger

      raise "Missing the required parameter 'catalog_id' when calling expand_tree_for_glossary." if catalog_id.nil?
      raise "Missing the required parameter 'glossary_key' when calling expand_tree_for_glossary." if glossary_key.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'glossary_key' must not be blank" if OCI::Internal::Util.blank_string?(glossary_key)

      path = '/catalogs/{catalogId}/glossaries/{glossaryKey}/actions/expandTree'.sub('{catalogId}', catalog_id.to_s).sub('{glossaryKey}', glossary_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#expand_tree_for_glossary') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::DataCatalog::Models::GlossaryTreeElement>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Export the glossary and the terms and return the exported glossary as csv or json.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] glossary_key Unique glossary key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [BOOLEAN] :is_relationship_exported Specify if the relationship metadata is exported for the glossary. (default to false)
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type String
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/export_glossary.rb.html) to see an example of how to use export_glossary API.
    def export_glossary(catalog_id, glossary_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#export_glossary.' if logger

      raise "Missing the required parameter 'catalog_id' when calling export_glossary." if catalog_id.nil?
      raise "Missing the required parameter 'glossary_key' when calling export_glossary." if glossary_key.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'glossary_key' must not be blank" if OCI::Internal::Util.blank_string?(glossary_key)

      path = '/catalogs/{catalogId}/glossaries/{glossaryKey}/actions/export'.sub('{catalogId}', catalog_id.to_s).sub('{glossaryKey}', glossary_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:isRelationshipExported] = opts[:is_relationship_exported] if !opts[:is_relationship_exported].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json, text/csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#export_glossary') do
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
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a specific entity attribute by key.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [String] entity_key Unique entity key.
    # @param [String] attribute_key Unique attribute key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [BOOLEAN] :is_include_object_relationships Indicates whether the list of objects and their relationships to this object will be provided in the response. (default to false)
    # @option opts [Array<String>] :fields Specifies the fields to return in an entity attribute response.
    #
    #   Allowed values are: key, displayName, description, entityKey, lifecycleState, timeCreated, timeUpdated, createdById, updatedById, externalDataType, externalKey, isIncrementalData, isNullable, length, position, precision, scale, timeExternal, uri, properties, path, minCollectionCount, maxCollectionCount, datatypeEntityKey, externalDatatypeEntityKey, parentAttributeKey, externalParentAttributeKey, typeKey
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::Attribute Attribute}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/get_attribute.rb.html) to see an example of how to use get_attribute API.
    def get_attribute(catalog_id, data_asset_key, entity_key, attribute_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#get_attribute.' if logger

      raise "Missing the required parameter 'catalog_id' when calling get_attribute." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling get_attribute." if data_asset_key.nil?
      raise "Missing the required parameter 'entity_key' when calling get_attribute." if entity_key.nil?
      raise "Missing the required parameter 'attribute_key' when calling get_attribute." if attribute_key.nil?


      fields_allowable_values = %w[key displayName description entityKey lifecycleState timeCreated timeUpdated createdById updatedById externalDataType externalKey isIncrementalData isNullable length position precision scale timeExternal uri properties path minCollectionCount maxCollectionCount datatypeEntityKey externalDatatypeEntityKey parentAttributeKey externalParentAttributeKey typeKey]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of key, displayName, description, entityKey, lifecycleState, timeCreated, timeUpdated, createdById, updatedById, externalDataType, externalKey, isIncrementalData, isNullable, length, position, precision, scale, timeExternal, uri, properties, path, minCollectionCount, maxCollectionCount, datatypeEntityKey, externalDatatypeEntityKey, parentAttributeKey, externalParentAttributeKey, typeKey.'
          end
        end
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)
      raise "Parameter value for 'entity_key' must not be blank" if OCI::Internal::Util.blank_string?(entity_key)
      raise "Parameter value for 'attribute_key' must not be blank" if OCI::Internal::Util.blank_string?(attribute_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/entities/{entityKey}/attributes/{attributeKey}'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s).sub('{entityKey}', entity_key.to_s).sub('{attributeKey}', attribute_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:isIncludeObjectRelationships] = opts[:is_include_object_relationships] if !opts[:is_include_object_relationships].nil?
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#get_attribute') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::Attribute'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a specific entity attribute tag by key.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [String] entity_key Unique entity key.
    # @param [String] attribute_key Unique attribute key.
    # @param [String] tag_key Unique tag key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Array<String>] :fields Specifies the fields to return in an entity attribute tag response.
    #
    #   Allowed values are: key, name, termKey, termPath, termDescription, lifecycleState, timeCreated, createdById, uri, attributeKey
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::AttributeTag AttributeTag}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/get_attribute_tag.rb.html) to see an example of how to use get_attribute_tag API.
    def get_attribute_tag(catalog_id, data_asset_key, entity_key, attribute_key, tag_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#get_attribute_tag.' if logger

      raise "Missing the required parameter 'catalog_id' when calling get_attribute_tag." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling get_attribute_tag." if data_asset_key.nil?
      raise "Missing the required parameter 'entity_key' when calling get_attribute_tag." if entity_key.nil?
      raise "Missing the required parameter 'attribute_key' when calling get_attribute_tag." if attribute_key.nil?
      raise "Missing the required parameter 'tag_key' when calling get_attribute_tag." if tag_key.nil?


      fields_allowable_values = %w[key name termKey termPath termDescription lifecycleState timeCreated createdById uri attributeKey]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of key, name, termKey, termPath, termDescription, lifecycleState, timeCreated, createdById, uri, attributeKey.'
          end
        end
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)
      raise "Parameter value for 'entity_key' must not be blank" if OCI::Internal::Util.blank_string?(entity_key)
      raise "Parameter value for 'attribute_key' must not be blank" if OCI::Internal::Util.blank_string?(attribute_key)
      raise "Parameter value for 'tag_key' must not be blank" if OCI::Internal::Util.blank_string?(tag_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/entities/{entityKey}/attributes/{attributeKey}/tags/{tagKey}'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s).sub('{entityKey}', entity_key.to_s).sub('{attributeKey}', attribute_key.to_s).sub('{tagKey}', tag_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#get_attribute_tag') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::AttributeTag'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a data catalog by identifier.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::Catalog Catalog}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/get_catalog.rb.html) to see an example of how to use get_catalog API.
    def get_catalog(catalog_id, opts = {})
      logger.debug 'Calling operation DataCatalogClient#get_catalog.' if logger

      raise "Missing the required parameter 'catalog_id' when calling get_catalog." if catalog_id.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)

      path = '/catalogs/{catalogId}'.sub('{catalogId}', catalog_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#get_catalog') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::Catalog'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a specific private reverse connection by identifier.
    # @param [String] catalog_private_endpoint_id Unique private reverse connection identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::CatalogPrivateEndpoint CatalogPrivateEndpoint}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/get_catalog_private_endpoint.rb.html) to see an example of how to use get_catalog_private_endpoint API.
    def get_catalog_private_endpoint(catalog_private_endpoint_id, opts = {})
      logger.debug 'Calling operation DataCatalogClient#get_catalog_private_endpoint.' if logger

      raise "Missing the required parameter 'catalog_private_endpoint_id' when calling get_catalog_private_endpoint." if catalog_private_endpoint_id.nil?
      raise "Parameter value for 'catalog_private_endpoint_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_private_endpoint_id)

      path = '/catalogPrivateEndpoints/{catalogPrivateEndpointId}'.sub('{catalogPrivateEndpointId}', catalog_private_endpoint_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#get_catalog_private_endpoint') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::CatalogPrivateEndpoint'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a specific data asset connection by key.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [String] connection_key Unique connection key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Array<String>] :fields Specifies the fields to return in a connection response.
    #
    #   Allowed values are: key, displayName, description, dataAssetKey, typeKey, timeCreated, timeUpdated, createdById, updatedById, properties, externalKey, timeStatusUpdated, lifecycleState, isDefault, uri
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::Connection Connection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/get_connection.rb.html) to see an example of how to use get_connection API.
    def get_connection(catalog_id, data_asset_key, connection_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#get_connection.' if logger

      raise "Missing the required parameter 'catalog_id' when calling get_connection." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling get_connection." if data_asset_key.nil?
      raise "Missing the required parameter 'connection_key' when calling get_connection." if connection_key.nil?


      fields_allowable_values = %w[key displayName description dataAssetKey typeKey timeCreated timeUpdated createdById updatedById properties externalKey timeStatusUpdated lifecycleState isDefault uri]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of key, displayName, description, dataAssetKey, typeKey, timeCreated, timeUpdated, createdById, updatedById, properties, externalKey, timeStatusUpdated, lifecycleState, isDefault, uri.'
          end
        end
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)
      raise "Parameter value for 'connection_key' must not be blank" if OCI::Internal::Util.blank_string?(connection_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/connections/{connectionKey}'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s).sub('{connectionKey}', connection_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#get_connection') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::Connection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a specific custom property for the given key within a data catalog.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] namespace_id Unique namespace identifier.
    # @param [String] custom_property_key Unique Custom Property key
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Array<String>] :fields Specifies the fields to return in a custom property response.
    #
    #   Allowed values are: key, displayName, description, dataType, namespaceName, lifecycleState, timeCreated, timeUpdated, createdById, updatedById, properties
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::CustomProperty CustomProperty}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/get_custom_property.rb.html) to see an example of how to use get_custom_property API.
    def get_custom_property(catalog_id, namespace_id, custom_property_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#get_custom_property.' if logger

      raise "Missing the required parameter 'catalog_id' when calling get_custom_property." if catalog_id.nil?
      raise "Missing the required parameter 'namespace_id' when calling get_custom_property." if namespace_id.nil?
      raise "Missing the required parameter 'custom_property_key' when calling get_custom_property." if custom_property_key.nil?


      fields_allowable_values = %w[key displayName description dataType namespaceName lifecycleState timeCreated timeUpdated createdById updatedById properties]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of key, displayName, description, dataType, namespaceName, lifecycleState, timeCreated, timeUpdated, createdById, updatedById, properties.'
          end
        end
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'namespace_id' must not be blank" if OCI::Internal::Util.blank_string?(namespace_id)
      raise "Parameter value for 'custom_property_key' must not be blank" if OCI::Internal::Util.blank_string?(custom_property_key)

      path = '/catalogs/{catalogId}/namespaces/{namespaceId}/customProperties/{customPropertyKey}'.sub('{catalogId}', catalog_id.to_s).sub('{namespaceId}', namespace_id.to_s).sub('{customPropertyKey}', custom_property_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#get_custom_property') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::CustomProperty'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a specific data asset for the given key within a data catalog.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Array<String>] :fields Specifies the fields to return in a data asset response.
    #
    #   Allowed values are: key, displayName, description, catalogId, externalKey, typeKey, lifecycleState, timeCreated, timeUpdated, createdById, updatedById, uri, properties
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::DataAsset DataAsset}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/get_data_asset.rb.html) to see an example of how to use get_data_asset API.
    def get_data_asset(catalog_id, data_asset_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#get_data_asset.' if logger

      raise "Missing the required parameter 'catalog_id' when calling get_data_asset." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling get_data_asset." if data_asset_key.nil?


      fields_allowable_values = %w[key displayName description catalogId externalKey typeKey lifecycleState timeCreated timeUpdated createdById updatedById uri properties]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of key, displayName, description, catalogId, externalKey, typeKey, lifecycleState, timeCreated, timeUpdated, createdById, updatedById, uri, properties.'
          end
        end
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#get_data_asset') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::DataAsset'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a specific data asset tag by key.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [String] tag_key Unique tag key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Array<String>] :fields Specifies the fields to return in a data asset tag response.
    #
    #   Allowed values are: key, name, termKey, termPath, termDescription, lifecycleState, timeCreated, createdById, uri, dataAssetKey
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::DataAssetTag DataAssetTag}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/get_data_asset_tag.rb.html) to see an example of how to use get_data_asset_tag API.
    def get_data_asset_tag(catalog_id, data_asset_key, tag_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#get_data_asset_tag.' if logger

      raise "Missing the required parameter 'catalog_id' when calling get_data_asset_tag." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling get_data_asset_tag." if data_asset_key.nil?
      raise "Missing the required parameter 'tag_key' when calling get_data_asset_tag." if tag_key.nil?


      fields_allowable_values = %w[key name termKey termPath termDescription lifecycleState timeCreated createdById uri dataAssetKey]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of key, name, termKey, termPath, termDescription, lifecycleState, timeCreated, createdById, uri, dataAssetKey.'
          end
        end
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)
      raise "Parameter value for 'tag_key' must not be blank" if OCI::Internal::Util.blank_string?(tag_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/tags/{tagKey}'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s).sub('{tagKey}', tag_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#get_data_asset_tag') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::DataAssetTag'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a specific data entity by key for a data asset.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [String] entity_key Unique entity key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [BOOLEAN] :is_include_object_relationships Indicates whether the list of objects and their relationships to this object will be provided in the response. (default to false)
    # @option opts [Array<String>] :fields Specifies the fields to return in an entity response.
    #
    #   Allowed values are: key, displayName, description, dataAssetKey, timeCreated, timeUpdated, createdById, updatedById, lifecycleState, externalKey, timeExternal, timeStatusUpdated, isLogical, isPartition, folderKey, folderName, typeKey, path, harvestStatus, lastJobKey, uri, properties
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::Entity Entity}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/get_entity.rb.html) to see an example of how to use get_entity API.
    def get_entity(catalog_id, data_asset_key, entity_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#get_entity.' if logger

      raise "Missing the required parameter 'catalog_id' when calling get_entity." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling get_entity." if data_asset_key.nil?
      raise "Missing the required parameter 'entity_key' when calling get_entity." if entity_key.nil?


      fields_allowable_values = %w[key displayName description dataAssetKey timeCreated timeUpdated createdById updatedById lifecycleState externalKey timeExternal timeStatusUpdated isLogical isPartition folderKey folderName typeKey path harvestStatus lastJobKey uri properties]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of key, displayName, description, dataAssetKey, timeCreated, timeUpdated, createdById, updatedById, lifecycleState, externalKey, timeExternal, timeStatusUpdated, isLogical, isPartition, folderKey, folderName, typeKey, path, harvestStatus, lastJobKey, uri, properties.'
          end
        end
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)
      raise "Parameter value for 'entity_key' must not be blank" if OCI::Internal::Util.blank_string?(entity_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/entities/{entityKey}'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s).sub('{entityKey}', entity_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:isIncludeObjectRelationships] = opts[:is_include_object_relationships] if !opts[:is_include_object_relationships].nil?
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#get_entity') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::Entity'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a specific entity tag by key.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [String] entity_key Unique entity key.
    # @param [String] tag_key Unique tag key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Array<String>] :fields Specifies the fields to return in an entity tag response.
    #
    #   Allowed values are: key, name, termKey, termPath, termDescription, lifecycleState, timeCreated, createdById, uri, entityKey
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::EntityTag EntityTag}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/get_entity_tag.rb.html) to see an example of how to use get_entity_tag API.
    def get_entity_tag(catalog_id, data_asset_key, entity_key, tag_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#get_entity_tag.' if logger

      raise "Missing the required parameter 'catalog_id' when calling get_entity_tag." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling get_entity_tag." if data_asset_key.nil?
      raise "Missing the required parameter 'entity_key' when calling get_entity_tag." if entity_key.nil?
      raise "Missing the required parameter 'tag_key' when calling get_entity_tag." if tag_key.nil?


      fields_allowable_values = %w[key name termKey termPath termDescription lifecycleState timeCreated createdById uri entityKey]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of key, name, termKey, termPath, termDescription, lifecycleState, timeCreated, createdById, uri, entityKey.'
          end
        end
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)
      raise "Parameter value for 'entity_key' must not be blank" if OCI::Internal::Util.blank_string?(entity_key)
      raise "Parameter value for 'tag_key' must not be blank" if OCI::Internal::Util.blank_string?(tag_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/entities/{entityKey}/tags/{tagKey}'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s).sub('{entityKey}', entity_key.to_s).sub('{tagKey}', tag_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#get_entity_tag') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::EntityTag'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a specific data asset folder by key.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [String] folder_key Unique folder key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [BOOLEAN] :is_include_object_relationships Indicates whether the list of objects and their relationships to this object will be provided in the response. (default to false)
    # @option opts [Array<String>] :fields Specifies the fields to return in a folder response.
    #
    #   Allowed values are: key, displayName, description, parentFolderKey, path, dataAssetKey, properties, externalKey, timeCreated, timeUpdated, createdById, updatedById, timeExternal, lifecycleState, harvestStatus, lastJobKey, uri
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::Folder Folder}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/get_folder.rb.html) to see an example of how to use get_folder API.
    def get_folder(catalog_id, data_asset_key, folder_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#get_folder.' if logger

      raise "Missing the required parameter 'catalog_id' when calling get_folder." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling get_folder." if data_asset_key.nil?
      raise "Missing the required parameter 'folder_key' when calling get_folder." if folder_key.nil?


      fields_allowable_values = %w[key displayName description parentFolderKey path dataAssetKey properties externalKey timeCreated timeUpdated createdById updatedById timeExternal lifecycleState harvestStatus lastJobKey uri]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of key, displayName, description, parentFolderKey, path, dataAssetKey, properties, externalKey, timeCreated, timeUpdated, createdById, updatedById, timeExternal, lifecycleState, harvestStatus, lastJobKey, uri.'
          end
        end
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)
      raise "Parameter value for 'folder_key' must not be blank" if OCI::Internal::Util.blank_string?(folder_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/folders/{folderKey}'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s).sub('{folderKey}', folder_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:isIncludeObjectRelationships] = opts[:is_include_object_relationships] if !opts[:is_include_object_relationships].nil?
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#get_folder') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::Folder'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a specific folder tag by key.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [String] folder_key Unique folder key.
    # @param [String] tag_key Unique tag key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Array<String>] :fields Specifies the fields to return in a folder tag response.
    #
    #   Allowed values are: key, name, termKey, termPath, termDescription, lifecycleState, timeCreated, createdById, uri, folderKey
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::FolderTag FolderTag}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/get_folder_tag.rb.html) to see an example of how to use get_folder_tag API.
    def get_folder_tag(catalog_id, data_asset_key, folder_key, tag_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#get_folder_tag.' if logger

      raise "Missing the required parameter 'catalog_id' when calling get_folder_tag." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling get_folder_tag." if data_asset_key.nil?
      raise "Missing the required parameter 'folder_key' when calling get_folder_tag." if folder_key.nil?
      raise "Missing the required parameter 'tag_key' when calling get_folder_tag." if tag_key.nil?


      fields_allowable_values = %w[key name termKey termPath termDescription lifecycleState timeCreated createdById uri folderKey]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of key, name, termKey, termPath, termDescription, lifecycleState, timeCreated, createdById, uri, folderKey.'
          end
        end
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)
      raise "Parameter value for 'folder_key' must not be blank" if OCI::Internal::Util.blank_string?(folder_key)
      raise "Parameter value for 'tag_key' must not be blank" if OCI::Internal::Util.blank_string?(tag_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/folders/{folderKey}/tags/{tagKey}'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s).sub('{folderKey}', folder_key.to_s).sub('{tagKey}', tag_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#get_folder_tag') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::FolderTag'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a specific glossary by key within a data catalog.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] glossary_key Unique glossary key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Array<String>] :fields Specifies the fields to return in a glossary response.
    #
    #   Allowed values are: key, displayName, description, catalogId, lifecycleState, timeCreated, timeUpdated, createdById, updatedById, owner, workflowStatus, uri
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::Glossary Glossary}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/get_glossary.rb.html) to see an example of how to use get_glossary API.
    def get_glossary(catalog_id, glossary_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#get_glossary.' if logger

      raise "Missing the required parameter 'catalog_id' when calling get_glossary." if catalog_id.nil?
      raise "Missing the required parameter 'glossary_key' when calling get_glossary." if glossary_key.nil?


      fields_allowable_values = %w[key displayName description catalogId lifecycleState timeCreated timeUpdated createdById updatedById owner workflowStatus uri]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of key, displayName, description, catalogId, lifecycleState, timeCreated, timeUpdated, createdById, updatedById, owner, workflowStatus, uri.'
          end
        end
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'glossary_key' must not be blank" if OCI::Internal::Util.blank_string?(glossary_key)

      path = '/catalogs/{catalogId}/glossaries/{glossaryKey}'.sub('{catalogId}', catalog_id.to_s).sub('{glossaryKey}', glossary_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#get_glossary') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::Glossary'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a specific job by key within a data catalog.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] job_key Unique job key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Array<String>] :fields Specifies the fields to return in a job response.
    #
    #   Allowed values are: key, displayName, description, catalogId, lifecycleState, timeCreated, timeUpdated, jobType, scheduleCronExpression, timeScheduleBegin, timeScheduleEnd, scheduleType, connectionKey, jobDefinitionKey, internalVersion, executionCount, timeOfLatestExecution, executions, createdById, updatedById, uri, jobDefinitionName, errorCode, errorMessage
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::Job Job}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/get_job.rb.html) to see an example of how to use get_job API.
    def get_job(catalog_id, job_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#get_job.' if logger

      raise "Missing the required parameter 'catalog_id' when calling get_job." if catalog_id.nil?
      raise "Missing the required parameter 'job_key' when calling get_job." if job_key.nil?


      fields_allowable_values = %w[key displayName description catalogId lifecycleState timeCreated timeUpdated jobType scheduleCronExpression timeScheduleBegin timeScheduleEnd scheduleType connectionKey jobDefinitionKey internalVersion executionCount timeOfLatestExecution executions createdById updatedById uri jobDefinitionName errorCode errorMessage]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of key, displayName, description, catalogId, lifecycleState, timeCreated, timeUpdated, jobType, scheduleCronExpression, timeScheduleBegin, timeScheduleEnd, scheduleType, connectionKey, jobDefinitionKey, internalVersion, executionCount, timeOfLatestExecution, executions, createdById, updatedById, uri, jobDefinitionName, errorCode, errorMessage.'
          end
        end
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'job_key' must not be blank" if OCI::Internal::Util.blank_string?(job_key)

      path = '/catalogs/{catalogId}/jobs/{jobKey}'.sub('{catalogId}', catalog_id.to_s).sub('{jobKey}', job_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#get_job') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::Job'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a specific job definition by key within a data catalog.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] job_definition_key Unique job definition key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Array<String>] :fields Specifies the fields to return in a job definition response.
    #
    #   Allowed values are: key, displayName, description, catalogId, jobType, isIncremental, dataAssetKey, connectionKey, internalVersion, lifecycleState, timeCreated, timeUpdated, createdById, updatedById, uri, isSampleDataExtracted, sampleDataSizeInMBs, timeLatestExecutionStarted, timeLatestExecutionEnded, jobExecutionState, scheduleType, properties
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::JobDefinition JobDefinition}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/get_job_definition.rb.html) to see an example of how to use get_job_definition API.
    def get_job_definition(catalog_id, job_definition_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#get_job_definition.' if logger

      raise "Missing the required parameter 'catalog_id' when calling get_job_definition." if catalog_id.nil?
      raise "Missing the required parameter 'job_definition_key' when calling get_job_definition." if job_definition_key.nil?


      fields_allowable_values = %w[key displayName description catalogId jobType isIncremental dataAssetKey connectionKey internalVersion lifecycleState timeCreated timeUpdated createdById updatedById uri isSampleDataExtracted sampleDataSizeInMBs timeLatestExecutionStarted timeLatestExecutionEnded jobExecutionState scheduleType properties]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of key, displayName, description, catalogId, jobType, isIncremental, dataAssetKey, connectionKey, internalVersion, lifecycleState, timeCreated, timeUpdated, createdById, updatedById, uri, isSampleDataExtracted, sampleDataSizeInMBs, timeLatestExecutionStarted, timeLatestExecutionEnded, jobExecutionState, scheduleType, properties.'
          end
        end
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'job_definition_key' must not be blank" if OCI::Internal::Util.blank_string?(job_definition_key)

      path = '/catalogs/{catalogId}/jobDefinitions/{jobDefinitionKey}'.sub('{catalogId}', catalog_id.to_s).sub('{jobDefinitionKey}', job_definition_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#get_job_definition') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::JobDefinition'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a specific job execution by key.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] job_key Unique job key.
    # @param [String] job_execution_key The key of the job execution.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Array<String>] :fields Specifies the fields to return in a job execution response.
    #
    #   Allowed values are: key, jobKey, jobType, subType, parentKey, scheduleInstanceKey, lifecycleState, timeCreated, timeStarted, timeEnded, errorCode, errorMessage, processKey, externalUrl, eventKey, dataEntityKey, createdById, updatedById, properties, uri
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::JobExecution JobExecution}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/get_job_execution.rb.html) to see an example of how to use get_job_execution API.
    def get_job_execution(catalog_id, job_key, job_execution_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#get_job_execution.' if logger

      raise "Missing the required parameter 'catalog_id' when calling get_job_execution." if catalog_id.nil?
      raise "Missing the required parameter 'job_key' when calling get_job_execution." if job_key.nil?
      raise "Missing the required parameter 'job_execution_key' when calling get_job_execution." if job_execution_key.nil?


      fields_allowable_values = %w[key jobKey jobType subType parentKey scheduleInstanceKey lifecycleState timeCreated timeStarted timeEnded errorCode errorMessage processKey externalUrl eventKey dataEntityKey createdById updatedById properties uri]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of key, jobKey, jobType, subType, parentKey, scheduleInstanceKey, lifecycleState, timeCreated, timeStarted, timeEnded, errorCode, errorMessage, processKey, externalUrl, eventKey, dataEntityKey, createdById, updatedById, properties, uri.'
          end
        end
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'job_key' must not be blank" if OCI::Internal::Util.blank_string?(job_key)
      raise "Parameter value for 'job_execution_key' must not be blank" if OCI::Internal::Util.blank_string?(job_execution_key)

      path = '/catalogs/{catalogId}/jobs/{jobKey}/executions/{jobExecutionKey}'.sub('{catalogId}', catalog_id.to_s).sub('{jobKey}', job_key.to_s).sub('{jobExecutionKey}', job_execution_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#get_job_execution') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::JobExecution'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a specific job log by key.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] job_key Unique job key.
    # @param [String] job_execution_key The key of the job execution.
    # @param [String] job_log_key Unique job log key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Array<String>] :fields Specifies the fields to return in a job log response.
    #
    #   Allowed values are: key, jobExecutionKey, createdById, updatedById, timeUpdated, timeCreated, severity, logMessage, uri
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::JobLog JobLog}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/get_job_log.rb.html) to see an example of how to use get_job_log API.
    def get_job_log(catalog_id, job_key, job_execution_key, job_log_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#get_job_log.' if logger

      raise "Missing the required parameter 'catalog_id' when calling get_job_log." if catalog_id.nil?
      raise "Missing the required parameter 'job_key' when calling get_job_log." if job_key.nil?
      raise "Missing the required parameter 'job_execution_key' when calling get_job_log." if job_execution_key.nil?
      raise "Missing the required parameter 'job_log_key' when calling get_job_log." if job_log_key.nil?


      fields_allowable_values = %w[key jobExecutionKey createdById updatedById timeUpdated timeCreated severity logMessage uri]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of key, jobExecutionKey, createdById, updatedById, timeUpdated, timeCreated, severity, logMessage, uri.'
          end
        end
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'job_key' must not be blank" if OCI::Internal::Util.blank_string?(job_key)
      raise "Parameter value for 'job_execution_key' must not be blank" if OCI::Internal::Util.blank_string?(job_execution_key)
      raise "Parameter value for 'job_log_key' must not be blank" if OCI::Internal::Util.blank_string?(job_log_key)

      path = '/catalogs/{catalogId}/jobs/{jobKey}/executions/{jobExecutionKey}/logs/{jobLogKey}'.sub('{catalogId}', catalog_id.to_s).sub('{jobKey}', job_key.to_s).sub('{jobExecutionKey}', job_execution_key.to_s).sub('{jobLogKey}', job_log_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#get_job_log') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::JobLog'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a specific job metric by key.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] job_key Unique job key.
    # @param [String] job_execution_key The key of the job execution.
    # @param [String] job_metrics_key Unique job metrics key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Array<String>] :fields Specifies the fields to return in a job metric response.
    #
    #   Allowed values are: key, description, displayName, timeInserted, category, subCategory, unit, value, batchKey, jobExecutionKey, createdById, updatedById, timeUpdated, timeCreated, uri
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::JobMetric JobMetric}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/get_job_metrics.rb.html) to see an example of how to use get_job_metrics API.
    def get_job_metrics(catalog_id, job_key, job_execution_key, job_metrics_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#get_job_metrics.' if logger

      raise "Missing the required parameter 'catalog_id' when calling get_job_metrics." if catalog_id.nil?
      raise "Missing the required parameter 'job_key' when calling get_job_metrics." if job_key.nil?
      raise "Missing the required parameter 'job_execution_key' when calling get_job_metrics." if job_execution_key.nil?
      raise "Missing the required parameter 'job_metrics_key' when calling get_job_metrics." if job_metrics_key.nil?


      fields_allowable_values = %w[key description displayName timeInserted category subCategory unit value batchKey jobExecutionKey createdById updatedById timeUpdated timeCreated uri]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of key, description, displayName, timeInserted, category, subCategory, unit, value, batchKey, jobExecutionKey, createdById, updatedById, timeUpdated, timeCreated, uri.'
          end
        end
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'job_key' must not be blank" if OCI::Internal::Util.blank_string?(job_key)
      raise "Parameter value for 'job_execution_key' must not be blank" if OCI::Internal::Util.blank_string?(job_execution_key)
      raise "Parameter value for 'job_metrics_key' must not be blank" if OCI::Internal::Util.blank_string?(job_metrics_key)

      path = '/catalogs/{catalogId}/jobs/{jobKey}/executions/{jobExecutionKey}/metrics/{jobMetricsKey}'.sub('{catalogId}', catalog_id.to_s).sub('{jobKey}', job_key.to_s).sub('{jobExecutionKey}', job_execution_key.to_s).sub('{jobMetricsKey}', job_metrics_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#get_job_metrics') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::JobMetric'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a metastore by identifier.
    # @param [String] metastore_id The metastore's OCID.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::Metastore Metastore}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/get_metastore.rb.html) to see an example of how to use get_metastore API.
    def get_metastore(metastore_id, opts = {})
      logger.debug 'Calling operation DataCatalogClient#get_metastore.' if logger

      raise "Missing the required parameter 'metastore_id' when calling get_metastore." if metastore_id.nil?
      raise "Parameter value for 'metastore_id' must not be blank" if OCI::Internal::Util.blank_string?(metastore_id)

      path = '/metastores/{metastoreId}'.sub('{metastoreId}', metastore_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#get_metastore') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::Metastore'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a specific namespace for the given key within a data catalog.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] namespace_id Unique namespace identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Array<String>] :fields Specifies the fields to return in a namespace response.
    #
    #   Allowed values are: key, displayName, description, lifecycleState, timeCreated, timeUpdated, createdById, updatedById, properties
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::Namespace Namespace}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/get_namespace.rb.html) to see an example of how to use get_namespace API.
    def get_namespace(catalog_id, namespace_id, opts = {})
      logger.debug 'Calling operation DataCatalogClient#get_namespace.' if logger

      raise "Missing the required parameter 'catalog_id' when calling get_namespace." if catalog_id.nil?
      raise "Missing the required parameter 'namespace_id' when calling get_namespace." if namespace_id.nil?


      fields_allowable_values = %w[key displayName description lifecycleState timeCreated timeUpdated createdById updatedById properties]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of key, displayName, description, lifecycleState, timeCreated, timeUpdated, createdById, updatedById, properties.'
          end
        end
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'namespace_id' must not be blank" if OCI::Internal::Util.blank_string?(namespace_id)

      path = '/catalogs/{catalogId}/namespaces/{namespaceId}'.sub('{catalogId}', catalog_id.to_s).sub('{namespaceId}', namespace_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#get_namespace') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::Namespace'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a specific pattern for the given key within a data catalog.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] pattern_key Unique pattern key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Array<String>] :fields Specifies the fields to return in a pattern response.
    #
    #   Allowed values are: key, displayName, description, catalogId, expression, lifecycleState, timeCreated, timeUpdated, createdById, updatedById, properties
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::Pattern Pattern}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/get_pattern.rb.html) to see an example of how to use get_pattern API.
    def get_pattern(catalog_id, pattern_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#get_pattern.' if logger

      raise "Missing the required parameter 'catalog_id' when calling get_pattern." if catalog_id.nil?
      raise "Missing the required parameter 'pattern_key' when calling get_pattern." if pattern_key.nil?


      fields_allowable_values = %w[key displayName description catalogId expression lifecycleState timeCreated timeUpdated createdById updatedById properties]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of key, displayName, description, catalogId, expression, lifecycleState, timeCreated, timeUpdated, createdById, updatedById, properties.'
          end
        end
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'pattern_key' must not be blank" if OCI::Internal::Util.blank_string?(pattern_key)

      path = '/catalogs/{catalogId}/patterns/{patternKey}'.sub('{catalogId}', catalog_id.to_s).sub('{patternKey}', pattern_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#get_pattern') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::Pattern'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a specific glossary term by key.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] glossary_key Unique glossary key.
    # @param [String] term_key Unique glossary term key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Array<String>] :fields Specifies the fields to return in a term response.
    #
    #   Allowed values are: key, displayName, description, glossaryKey, parentTermKey, isAllowedToHaveChildTerms, path, lifecycleState, timeCreated, timeUpdated, createdById, updatedById, owner, workflowStatus, uri, relatedTerms, associatedObjectCount, associatedObjects
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::Term Term}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/get_term.rb.html) to see an example of how to use get_term API.
    def get_term(catalog_id, glossary_key, term_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#get_term.' if logger

      raise "Missing the required parameter 'catalog_id' when calling get_term." if catalog_id.nil?
      raise "Missing the required parameter 'glossary_key' when calling get_term." if glossary_key.nil?
      raise "Missing the required parameter 'term_key' when calling get_term." if term_key.nil?


      fields_allowable_values = %w[key displayName description glossaryKey parentTermKey isAllowedToHaveChildTerms path lifecycleState timeCreated timeUpdated createdById updatedById owner workflowStatus uri relatedTerms associatedObjectCount associatedObjects]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of key, displayName, description, glossaryKey, parentTermKey, isAllowedToHaveChildTerms, path, lifecycleState, timeCreated, timeUpdated, createdById, updatedById, owner, workflowStatus, uri, relatedTerms, associatedObjectCount, associatedObjects.'
          end
        end
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'glossary_key' must not be blank" if OCI::Internal::Util.blank_string?(glossary_key)
      raise "Parameter value for 'term_key' must not be blank" if OCI::Internal::Util.blank_string?(term_key)

      path = '/catalogs/{catalogId}/glossaries/{glossaryKey}/terms/{termKey}'.sub('{catalogId}', catalog_id.to_s).sub('{glossaryKey}', glossary_key.to_s).sub('{termKey}', term_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#get_term') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::Term'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a specific glossary term relationship by key.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] glossary_key Unique glossary key.
    # @param [String] term_key Unique glossary term key.
    # @param [String] term_relationship_key Unique glossary term relationship key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Array<String>] :fields Specifies the fields to return in a term relationship response.
    #
    #   Allowed values are: key, displayName, description, relatedTermKey, relatedTermDisplayName, parentTermKey, parentTermDisplayName, lifecycleState, timeCreated, uri
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::TermRelationship TermRelationship}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/get_term_relationship.rb.html) to see an example of how to use get_term_relationship API.
    def get_term_relationship(catalog_id, glossary_key, term_key, term_relationship_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#get_term_relationship.' if logger

      raise "Missing the required parameter 'catalog_id' when calling get_term_relationship." if catalog_id.nil?
      raise "Missing the required parameter 'glossary_key' when calling get_term_relationship." if glossary_key.nil?
      raise "Missing the required parameter 'term_key' when calling get_term_relationship." if term_key.nil?
      raise "Missing the required parameter 'term_relationship_key' when calling get_term_relationship." if term_relationship_key.nil?


      fields_allowable_values = %w[key displayName description relatedTermKey relatedTermDisplayName parentTermKey parentTermDisplayName lifecycleState timeCreated uri]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of key, displayName, description, relatedTermKey, relatedTermDisplayName, parentTermKey, parentTermDisplayName, lifecycleState, timeCreated, uri.'
          end
        end
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'glossary_key' must not be blank" if OCI::Internal::Util.blank_string?(glossary_key)
      raise "Parameter value for 'term_key' must not be blank" if OCI::Internal::Util.blank_string?(term_key)
      raise "Parameter value for 'term_relationship_key' must not be blank" if OCI::Internal::Util.blank_string?(term_relationship_key)

      path = '/catalogs/{catalogId}/glossaries/{glossaryKey}/terms/{termKey}/termRelationships/{termRelationshipKey}'.sub('{catalogId}', catalog_id.to_s).sub('{glossaryKey}', glossary_key.to_s).sub('{termKey}', term_key.to_s).sub('{termRelationshipKey}', term_relationship_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#get_term_relationship') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::TermRelationship'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a specific type by key within a data catalog.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] type_key Unique type key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Array<String>] :fields Specifies the fields to return in a type response.
    #
    #   Allowed values are: key, description, name, catalogId, properties, isInternal, isTag, isApproved, typeCategory, externalTypeName, lifecycleState, uri
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::Type Type}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/get_type.rb.html) to see an example of how to use get_type API.
    def get_type(catalog_id, type_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#get_type.' if logger

      raise "Missing the required parameter 'catalog_id' when calling get_type." if catalog_id.nil?
      raise "Missing the required parameter 'type_key' when calling get_type." if type_key.nil?


      fields_allowable_values = %w[key description name catalogId properties isInternal isTag isApproved typeCategory externalTypeName lifecycleState uri]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of key, description, name, catalogId, properties, isInternal, isTag, isApproved, typeCategory, externalTypeName, lifecycleState, uri.'
          end
        end
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'type_key' must not be blank" if OCI::Internal::Util.blank_string?(type_key)

      path = '/catalogs/{catalogId}/types/{typeKey}'.sub('{catalogId}', catalog_id.to_s).sub('{typeKey}', type_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#get_type') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::Type'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the status of the work request with the given OCID.
    # @param [String] work_request_id The OCID of the asynchronous request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::WorkRequest WorkRequest}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/get_work_request.rb.html) to see an example of how to use get_work_request API.
    def get_work_request(work_request_id, opts = {})
      logger.debug 'Calling operation DataCatalogClient#get_work_request.' if logger

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#get_work_request') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::WorkRequest'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Import new connection for this data asset.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [OCI::DataCatalog::Models::ImportConnectionDetails] import_connection_details The information used to create the connections through import.
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
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::Connection Connection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/import_connection.rb.html) to see an example of how to use import_connection API.
    def import_connection(catalog_id, data_asset_key, import_connection_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#import_connection.' if logger

      raise "Missing the required parameter 'catalog_id' when calling import_connection." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling import_connection." if data_asset_key.nil?
      raise "Missing the required parameter 'import_connection_details' when calling import_connection." if import_connection_details.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/actions/importConnection'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s)
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
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(import_connection_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#import_connection') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::Connection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Import technical objects to a Data Asset
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [OCI::DataCatalog::Models::ImportDataAssetDetails] import_data_asset_details The file contents to be imported.
    # @param [Array<String>] import_type Type of import.
    #   Allowed values are: CUSTOM_PROPERTY_VALUES, ALL
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [BOOLEAN] :is_missing_value_ignored Specify whether to ignore the missing values in the import file. (default to true)
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::ImportDataAssetJobResult ImportDataAssetJobResult}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/import_data_asset.rb.html) to see an example of how to use import_data_asset API.
    def import_data_asset(catalog_id, data_asset_key, import_data_asset_details, import_type, opts = {})
      logger.debug 'Calling operation DataCatalogClient#import_data_asset.' if logger

      raise "Missing the required parameter 'catalog_id' when calling import_data_asset." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling import_data_asset." if data_asset_key.nil?
      raise "Missing the required parameter 'import_data_asset_details' when calling import_data_asset." if import_data_asset_details.nil?
      raise "Missing the required parameter 'import_type' when calling import_data_asset." if import_type.nil?

      import_type_allowable_values = %w[CUSTOM_PROPERTY_VALUES ALL]
      import_type.each do |val_to_check|
        unless import_type_allowable_values.include?(val_to_check)
          raise "Invalid value for 'import_type', must be one of CUSTOM_PROPERTY_VALUES, ALL."
        end
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/actions/import'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:importType] = OCI::ApiClient.build_collection_params(import_type, :multi)
      query_params[:isMissingValueIgnored] = opts[:is_missing_value_ignored] if !opts[:is_missing_value_ignored].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(import_data_asset_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#import_data_asset') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::ImportDataAssetJobResult'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Import the glossary and the terms from csv or json files and return the imported glossary resource.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] glossary_key Unique glossary key.
    # @param [OCI::DataCatalog::Models::ImportGlossaryDetails] import_glossary_details The file contents to import the glossary.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [BOOLEAN] :is_relationship_imported Specify if the relationship metadata is imported for the glossary. (default to false)
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/import_glossary.rb.html) to see an example of how to use import_glossary API.
    def import_glossary(catalog_id, glossary_key, import_glossary_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#import_glossary.' if logger

      raise "Missing the required parameter 'catalog_id' when calling import_glossary." if catalog_id.nil?
      raise "Missing the required parameter 'glossary_key' when calling import_glossary." if glossary_key.nil?
      raise "Missing the required parameter 'import_glossary_details' when calling import_glossary." if import_glossary_details.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'glossary_key' must not be blank" if OCI::Internal::Util.blank_string?(glossary_key)

      path = '/catalogs/{catalogId}/glossaries/{glossaryKey}/actions/import'.sub('{catalogId}', catalog_id.to_s).sub('{glossaryKey}', glossary_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:isRelationshipImported] = opts[:is_relationship_imported] if !opts[:is_relationship_imported].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(import_glossary_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#import_glossary') do
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


    # List the physical entities aggregated by this logical entity.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [String] entity_key Unique entity key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Array<String>] :fields Specifies the fields to return in an entity response.
    #
    #   Allowed values are: key, displayName, description, dataAssetKey, timeCreated, timeUpdated, createdById, updatedById, lifecycleState, externalKey, timeExternal, timeStatusUpdated, isLogical, isPartition, folderKey, folderName, typeKey, path, harvestStatus, lastJobKey, uri, properties
    # @option opts [String] :display_name_contains A filter to return only resources that match display name pattern given. The match is not case sensitive.
    #   For Example : /folders?displayNameContains=Cu.*
    #   The above would match all folders with display name that starts with \"Cu\" or has the pattern \"Cu\" anywhere in between.
    #
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'.
    #   Allowed values are: ASC, DESC
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [BOOLEAN] :is_include_properties Indicates whether the properties map will be provided in the response. (default to false)
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::EntityCollection EntityCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/list_aggregated_physical_entities.rb.html) to see an example of how to use list_aggregated_physical_entities API.
    def list_aggregated_physical_entities(catalog_id, data_asset_key, entity_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#list_aggregated_physical_entities.' if logger

      raise "Missing the required parameter 'catalog_id' when calling list_aggregated_physical_entities." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling list_aggregated_physical_entities." if data_asset_key.nil?
      raise "Missing the required parameter 'entity_key' when calling list_aggregated_physical_entities." if entity_key.nil?


      fields_allowable_values = %w[key displayName description dataAssetKey timeCreated timeUpdated createdById updatedById lifecycleState externalKey timeExternal timeStatusUpdated isLogical isPartition folderKey folderName typeKey path harvestStatus lastJobKey uri properties]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of key, displayName, description, dataAssetKey, timeCreated, timeUpdated, createdById, updatedById, lifecycleState, externalKey, timeExternal, timeStatusUpdated, isLogical, isPartition, folderKey, folderName, typeKey, path, harvestStatus, lastJobKey, uri, properties.'
          end
        end
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)
      raise "Parameter value for 'entity_key' must not be blank" if OCI::Internal::Util.blank_string?(entity_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/entities/{entityKey}/actions/listAggregatedPhysicalEntities'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s).sub('{entityKey}', entity_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?
      query_params[:displayNameContains] = opts[:display_name_contains] if opts[:display_name_contains]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:isIncludeProperties] = opts[:is_include_properties] if !opts[:is_include_properties].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#list_aggregated_physical_entities') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::EntityCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of all tags for an entity attribute.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [String] entity_key Unique entity key.
    # @param [String] attribute_key Unique attribute key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :name Immutable resource name.
    # @option opts [String] :lifecycle_state A filter to return only resources that match the specified lifecycle state. The value is case insensitive.
    # @option opts [String] :term_key Unique key of the related term.
    # @option opts [String] :term_path Path of the related term.
    # @option opts [DateTime] :time_created Time that the resource was created. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    # @option opts [String] :created_by_id OCID of the user who created the resource.
    # @option opts [Array<String>] :fields Specifies the fields to return in an entity attribute tag summary response.
    #
    #   Allowed values are: key, name, termKey, termPath, termDescription, lifecycleState, timeCreated, uri, glossaryKey, attributeKey
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'.
    #   Allowed values are: ASC, DESC
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::AttributeTagCollection AttributeTagCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/list_attribute_tags.rb.html) to see an example of how to use list_attribute_tags API.
    def list_attribute_tags(catalog_id, data_asset_key, entity_key, attribute_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#list_attribute_tags.' if logger

      raise "Missing the required parameter 'catalog_id' when calling list_attribute_tags." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling list_attribute_tags." if data_asset_key.nil?
      raise "Missing the required parameter 'entity_key' when calling list_attribute_tags." if entity_key.nil?
      raise "Missing the required parameter 'attribute_key' when calling list_attribute_tags." if attribute_key.nil?

      if opts[:lifecycle_state] && !OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.'
      end


      fields_allowable_values = %w[key name termKey termPath termDescription lifecycleState timeCreated uri glossaryKey attributeKey]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of key, name, termKey, termPath, termDescription, lifecycleState, timeCreated, uri, glossaryKey, attributeKey.'
          end
        end
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)
      raise "Parameter value for 'entity_key' must not be blank" if OCI::Internal::Util.blank_string?(entity_key)
      raise "Parameter value for 'attribute_key' must not be blank" if OCI::Internal::Util.blank_string?(attribute_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/entities/{entityKey}/attributes/{attributeKey}/tags'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s).sub('{entityKey}', entity_key.to_s).sub('{attributeKey}', attribute_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:termKey] = opts[:term_key] if opts[:term_key]
      query_params[:termPath] = opts[:term_path] if opts[:term_path]
      query_params[:timeCreated] = opts[:time_created] if opts[:time_created]
      query_params[:createdById] = opts[:created_by_id] if opts[:created_by_id]
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#list_attribute_tags') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::AttributeTagCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of all attributes of an data entity.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [String] entity_key Unique entity key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given. The match is not case sensitive.
    # @option opts [String] :business_name A filter to return only resources that match the entire business name given. The match is not case sensitive.
    # @option opts [String] :display_or_business_name_contains A filter to return only resources that match display name or business name pattern given. The match is not case sensitive.
    #   For Example : /folders?displayOrBusinessNameContains=Cu.*
    #   The above would match all folders with display name or business name that starts with \"Cu\" or has the pattern \"Cu\" anywhere in between.
    #
    # @option opts [String] :display_name_contains A filter to return only resources that match display name pattern given. The match is not case sensitive.
    #   For Example : /folders?displayNameContains=Cu.*
    #   The above would match all folders with display name that starts with \"Cu\" or has the pattern \"Cu\" anywhere in between.
    #
    # @option opts [String] :lifecycle_state A filter to return only resources that match the specified lifecycle state. The value is case insensitive.
    # @option opts [DateTime] :time_created Time that the resource was created. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    # @option opts [DateTime] :time_updated Time that the resource was updated. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    # @option opts [String] :created_by_id OCID of the user who created the resource.
    # @option opts [String] :updated_by_id OCID of the user who updated the resource.
    # @option opts [String] :external_key Unique external identifier of this resource in the external source system.
    # @option opts [DateTime] :time_external Last modified timestamp of this object in the external system.
    # @option opts [String] :external_type_name Data type as defined in an external system.
    # @option opts [BOOLEAN] :is_incremental_data Identifies whether this attribute can be used as a watermark to extract incremental data.
    # @option opts [BOOLEAN] :is_nullable Identifies whether this attribute can be assigned null value.
    # @option opts [Integer] :length Max allowed length of the attribute value.
    # @option opts [Integer] :position Position of the attribute in the record definition.
    # @option opts [Integer] :precision Precision of the attribute value usually applies to float data type.
    # @option opts [Integer] :scale Scale of the attribute value usually applies to float data type.
    # @option opts [Array<String>] :fields Specifies the fields to return in an entity attribute summary response.
    #
    #   Allowed values are: key, displayName, description, entityKey, lifecycleState, timeCreated, externalDataType, externalKey, length, precision, scale, isNullable, uri, path, minCollectionCount, maxCollectionCount, datatypeEntityKey, externalDatatypeEntityKey, parentAttributeKey, externalParentAttributeKey, position, typeKey
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. Default order for POSITION is ascending. If no value is specified POSITION is default.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME, POSITION
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'.
    #   Allowed values are: ASC, DESC
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::AttributeCollection AttributeCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/list_attributes.rb.html) to see an example of how to use list_attributes API.
    def list_attributes(catalog_id, data_asset_key, entity_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#list_attributes.' if logger

      raise "Missing the required parameter 'catalog_id' when calling list_attributes." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling list_attributes." if data_asset_key.nil?
      raise "Missing the required parameter 'entity_key' when calling list_attributes." if entity_key.nil?

      if opts[:lifecycle_state] && !OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.'
      end


      fields_allowable_values = %w[key displayName description entityKey lifecycleState timeCreated externalDataType externalKey length precision scale isNullable uri path minCollectionCount maxCollectionCount datatypeEntityKey externalDatatypeEntityKey parentAttributeKey externalParentAttributeKey position typeKey]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of key, displayName, description, entityKey, lifecycleState, timeCreated, externalDataType, externalKey, length, precision, scale, isNullable, uri, path, minCollectionCount, maxCollectionCount, datatypeEntityKey, externalDatatypeEntityKey, parentAttributeKey, externalParentAttributeKey, position, typeKey.'
          end
        end
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME POSITION].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME, POSITION.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)
      raise "Parameter value for 'entity_key' must not be blank" if OCI::Internal::Util.blank_string?(entity_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/entities/{entityKey}/attributes'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s).sub('{entityKey}', entity_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:businessName] = opts[:business_name] if opts[:business_name]
      query_params[:displayOrBusinessNameContains] = opts[:display_or_business_name_contains] if opts[:display_or_business_name_contains]
      query_params[:displayNameContains] = opts[:display_name_contains] if opts[:display_name_contains]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:timeCreated] = opts[:time_created] if opts[:time_created]
      query_params[:timeUpdated] = opts[:time_updated] if opts[:time_updated]
      query_params[:createdById] = opts[:created_by_id] if opts[:created_by_id]
      query_params[:updatedById] = opts[:updated_by_id] if opts[:updated_by_id]
      query_params[:externalKey] = opts[:external_key] if opts[:external_key]
      query_params[:timeExternal] = opts[:time_external] if opts[:time_external]
      query_params[:externalTypeName] = opts[:external_type_name] if opts[:external_type_name]
      query_params[:isIncrementalData] = opts[:is_incremental_data] if !opts[:is_incremental_data].nil?
      query_params[:isNullable] = opts[:is_nullable] if !opts[:is_nullable].nil?
      query_params[:length] = opts[:length] if opts[:length]
      query_params[:position] = opts[:position] if opts[:position]
      query_params[:precision] = opts[:precision] if opts[:precision]
      query_params[:scale] = opts[:scale] if opts[:scale]
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#list_attributes') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::AttributeCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of all the catalog private endpoints in the specified compartment.
    #
    # @param [String] compartment_id The OCID of the compartment where you want to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given. The match is not case sensitive.
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :lifecycle_state A filter to return only resources that match the specified lifecycle state. The value is case insensitive.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'.
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type Array<{OCI::DataCatalog::Models::CatalogPrivateEndpointSummary CatalogPrivateEndpointSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/list_catalog_private_endpoints.rb.html) to see an example of how to use list_catalog_private_endpoints API.
    def list_catalog_private_endpoints(compartment_id, opts = {})
      logger.debug 'Calling operation DataCatalogClient#list_catalog_private_endpoints.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_catalog_private_endpoints." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      path = '/catalogPrivateEndpoints'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#list_catalog_private_endpoints') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::DataCatalog::Models::CatalogPrivateEndpointSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of all the data catalogs in the specified compartment.
    #
    # @param [String] compartment_id The OCID of the compartment where you want to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given. The match is not case sensitive.
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :lifecycle_state A filter to return only resources that match the specified lifecycle state. The value is case insensitive.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'.
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type Array<{OCI::DataCatalog::Models::CatalogSummary CatalogSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/list_catalogs.rb.html) to see an example of how to use list_catalogs API.
    def list_catalogs(compartment_id, opts = {})
      logger.debug 'Calling operation DataCatalogClient#list_catalogs.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_catalogs." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      path = '/catalogs'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#list_catalogs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::DataCatalog::Models::CatalogSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of all Connections for a data asset.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given. The match is not case sensitive.
    # @option opts [String] :display_name_contains A filter to return only resources that match display name pattern given. The match is not case sensitive.
    #   For Example : /folders?displayNameContains=Cu.*
    #   The above would match all folders with display name that starts with \"Cu\" or has the pattern \"Cu\" anywhere in between.
    #
    # @option opts [String] :lifecycle_state A filter to return only resources that match the specified lifecycle state. The value is case insensitive.
    # @option opts [DateTime] :time_created Time that the resource was created. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    # @option opts [DateTime] :time_updated Time that the resource was updated. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    # @option opts [String] :created_by_id OCID of the user who created the resource.
    # @option opts [String] :updated_by_id OCID of the user who updated the resource.
    # @option opts [String] :external_key Unique external identifier of this resource in the external source system.
    # @option opts [DateTime] :time_status_updated Time that the resource's status was last updated. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    # @option opts [BOOLEAN] :is_default Indicates whether this connection is the default connection.
    # @option opts [Array<String>] :fields Specifies the fields to return in a connection summary response.
    #
    #   Allowed values are: key, displayName, description, dataAssetKey, typeKey, timeCreated, externalKey, lifecycleState, isDefault, uri
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'.
    #   Allowed values are: ASC, DESC
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::ConnectionCollection ConnectionCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/list_connections.rb.html) to see an example of how to use list_connections API.
    def list_connections(catalog_id, data_asset_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#list_connections.' if logger

      raise "Missing the required parameter 'catalog_id' when calling list_connections." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling list_connections." if data_asset_key.nil?

      if opts[:lifecycle_state] && !OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.'
      end


      fields_allowable_values = %w[key displayName description dataAssetKey typeKey timeCreated externalKey lifecycleState isDefault uri]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of key, displayName, description, dataAssetKey, typeKey, timeCreated, externalKey, lifecycleState, isDefault, uri.'
          end
        end
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/connections'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:displayNameContains] = opts[:display_name_contains] if opts[:display_name_contains]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:timeCreated] = opts[:time_created] if opts[:time_created]
      query_params[:timeUpdated] = opts[:time_updated] if opts[:time_updated]
      query_params[:createdById] = opts[:created_by_id] if opts[:created_by_id]
      query_params[:updatedById] = opts[:updated_by_id] if opts[:updated_by_id]
      query_params[:externalKey] = opts[:external_key] if opts[:external_key]
      query_params[:timeStatusUpdated] = opts[:time_status_updated] if opts[:time_status_updated]
      query_params[:isDefault] = opts[:is_default] if !opts[:is_default].nil?
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#list_connections') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::ConnectionCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of custom properties within a data catalog.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] namespace_id Unique namespace identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given. The match is not case sensitive.
    # @option opts [String] :display_name_contains A filter to return only resources that match display name pattern given. The match is not case sensitive.
    #   For Example : /folders?displayNameContains=Cu.*
    #   The above would match all folders with display name that starts with \"Cu\" or has the pattern \"Cu\" anywhere in between.
    #
    # @option opts [Array<String>] :data_types Return the custom properties which has specified data types
    #
    #   Allowed values are: TEXT, RICH_TEXT, BOOLEAN, NUMBER, DATE
    # @option opts [Array<String>] :type_name A filter to return only resources that match the entire type name given. The match is not case sensitive
    #   Allowed values are: DATA_ASSET, AUTONOMOUS_DATA_WAREHOUSE, HIVE, KAFKA, MYSQL, ORACLE_OBJECT_STORAGE, AUTONOMOUS_TRANSACTION_PROCESSING, ORACLE, POSTGRESQL, MICROSOFT_AZURE_SQL_DATABASE, MICROSOFT_SQL_SERVER, IBM_DB2, DATA_ENTITY, LOGICAL_ENTITY, TABLE, VIEW, ATTRIBUTE, FOLDER, ORACLE_ANALYTICS_SUBJECT_AREA_COLUMN, ORACLE_ANALYTICS_LOGICAL_COLUMN, ORACLE_ANALYTICS_PHYSICAL_COLUMN, ORACLE_ANALYTICS_ANALYSIS_COLUMN, ORACLE_ANALYTICS_SERVER, ORACLE_ANALYTICS_CLOUD, ORACLE_ANALYTICS_SUBJECT_AREA, ORACLE_ANALYTICS_DASHBOARD, ORACLE_ANALYTICS_BUSINESS_MODEL, ORACLE_ANALYTICS_PHYSICAL_DATABASE, ORACLE_ANALYTICS_PHYSICAL_SCHEMA, ORACLE_ANALYTICS_PRESENTATION_TABLE, ORACLE_ANALYTICS_LOGICAL_TABLE, ORACLE_ANALYTICS_PHYSICAL_TABLE, ORACLE_ANALYTICS_ANALYSIS, DATABASE_SCHEMA, TOPIC, CONNECTION, GLOSSARY, TERM, CATEGORY, FILE, BUCKET, MESSAGE, UNRECOGNIZED_FILE
    # @option opts [String] :lifecycle_state A filter to return only resources that match the specified lifecycle state. The value is case insensitive.
    # @option opts [DateTime] :time_created Time that the resource was created. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    # @option opts [DateTime] :time_updated Time that the resource was updated. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    # @option opts [String] :created_by_id OCID of the user who created the resource.
    # @option opts [String] :updated_by_id OCID of the user who updated the resource.
    # @option opts [Array<String>] :fields Specifies the fields to return in a custom property summary response.
    #
    #   Allowed values are: key, displayName, description, dataType, namespaceName, lifecycleState, timeCreated
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'.
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for USAGECOUNT and DISPLAYNAME is Ascending
    #
    #   Allowed values are: DISPLAYNAME, USAGECOUNT
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::CustomPropertyCollection CustomPropertyCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/list_custom_properties.rb.html) to see an example of how to use list_custom_properties API.
    def list_custom_properties(catalog_id, namespace_id, opts = {})
      logger.debug 'Calling operation DataCatalogClient#list_custom_properties.' if logger

      raise "Missing the required parameter 'catalog_id' when calling list_custom_properties." if catalog_id.nil?
      raise "Missing the required parameter 'namespace_id' when calling list_custom_properties." if namespace_id.nil?


      data_types_allowable_values = %w[TEXT RICH_TEXT BOOLEAN NUMBER DATE]
      if opts[:data_types] && !opts[:data_types].empty?
        opts[:data_types].each do |val_to_check|
          unless data_types_allowable_values.include?(val_to_check)
            raise 'Invalid value for "data_types", must be one of TEXT, RICH_TEXT, BOOLEAN, NUMBER, DATE.'
          end
        end
      end


      type_name_allowable_values = %w[DATA_ASSET AUTONOMOUS_DATA_WAREHOUSE HIVE KAFKA MYSQL ORACLE_OBJECT_STORAGE AUTONOMOUS_TRANSACTION_PROCESSING ORACLE POSTGRESQL MICROSOFT_AZURE_SQL_DATABASE MICROSOFT_SQL_SERVER IBM_DB2 DATA_ENTITY LOGICAL_ENTITY TABLE VIEW ATTRIBUTE FOLDER ORACLE_ANALYTICS_SUBJECT_AREA_COLUMN ORACLE_ANALYTICS_LOGICAL_COLUMN ORACLE_ANALYTICS_PHYSICAL_COLUMN ORACLE_ANALYTICS_ANALYSIS_COLUMN ORACLE_ANALYTICS_SERVER ORACLE_ANALYTICS_CLOUD ORACLE_ANALYTICS_SUBJECT_AREA ORACLE_ANALYTICS_DASHBOARD ORACLE_ANALYTICS_BUSINESS_MODEL ORACLE_ANALYTICS_PHYSICAL_DATABASE ORACLE_ANALYTICS_PHYSICAL_SCHEMA ORACLE_ANALYTICS_PRESENTATION_TABLE ORACLE_ANALYTICS_LOGICAL_TABLE ORACLE_ANALYTICS_PHYSICAL_TABLE ORACLE_ANALYTICS_ANALYSIS DATABASE_SCHEMA TOPIC CONNECTION GLOSSARY TERM CATEGORY FILE BUCKET MESSAGE UNRECOGNIZED_FILE]
      if opts[:type_name] && !opts[:type_name].empty?
        opts[:type_name].each do |val_to_check|
          unless type_name_allowable_values.include?(val_to_check)
            raise 'Invalid value for "type_name", must be one of DATA_ASSET, AUTONOMOUS_DATA_WAREHOUSE, HIVE, KAFKA, MYSQL, ORACLE_OBJECT_STORAGE, AUTONOMOUS_TRANSACTION_PROCESSING, ORACLE, POSTGRESQL, MICROSOFT_AZURE_SQL_DATABASE, MICROSOFT_SQL_SERVER, IBM_DB2, DATA_ENTITY, LOGICAL_ENTITY, TABLE, VIEW, ATTRIBUTE, FOLDER, ORACLE_ANALYTICS_SUBJECT_AREA_COLUMN, ORACLE_ANALYTICS_LOGICAL_COLUMN, ORACLE_ANALYTICS_PHYSICAL_COLUMN, ORACLE_ANALYTICS_ANALYSIS_COLUMN, ORACLE_ANALYTICS_SERVER, ORACLE_ANALYTICS_CLOUD, ORACLE_ANALYTICS_SUBJECT_AREA, ORACLE_ANALYTICS_DASHBOARD, ORACLE_ANALYTICS_BUSINESS_MODEL, ORACLE_ANALYTICS_PHYSICAL_DATABASE, ORACLE_ANALYTICS_PHYSICAL_SCHEMA, ORACLE_ANALYTICS_PRESENTATION_TABLE, ORACLE_ANALYTICS_LOGICAL_TABLE, ORACLE_ANALYTICS_PHYSICAL_TABLE, ORACLE_ANALYTICS_ANALYSIS, DATABASE_SCHEMA, TOPIC, CONNECTION, GLOSSARY, TERM, CATEGORY, FILE, BUCKET, MESSAGE, UNRECOGNIZED_FILE.'
          end
        end
      end

      if opts[:lifecycle_state] && !OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.'
      end


      fields_allowable_values = %w[key displayName description dataType namespaceName lifecycleState timeCreated]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of key, displayName, description, dataType, namespaceName, lifecycleState, timeCreated.'
          end
        end
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[DISPLAYNAME USAGECOUNT].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of DISPLAYNAME, USAGECOUNT.'
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'namespace_id' must not be blank" if OCI::Internal::Util.blank_string?(namespace_id)

      path = '/catalogs/{catalogId}/namespaces/{namespaceId}/customProperties'.sub('{catalogId}', catalog_id.to_s).sub('{namespaceId}', namespace_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:displayNameContains] = opts[:display_name_contains] if opts[:display_name_contains]
      query_params[:dataTypes] = OCI::ApiClient.build_collection_params(opts[:data_types], :multi) if opts[:data_types] && !opts[:data_types].empty?
      query_params[:typeName] = OCI::ApiClient.build_collection_params(opts[:type_name], :multi) if opts[:type_name] && !opts[:type_name].empty?
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:timeCreated] = opts[:time_created] if opts[:time_created]
      query_params[:timeUpdated] = opts[:time_updated] if opts[:time_updated]
      query_params[:createdById] = opts[:created_by_id] if opts[:created_by_id]
      query_params[:updatedById] = opts[:updated_by_id] if opts[:updated_by_id]
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#list_custom_properties') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::CustomPropertyCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of all tags for a data asset.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :name Immutable resource name.
    # @option opts [String] :lifecycle_state A filter to return only resources that match the specified lifecycle state. The value is case insensitive.
    # @option opts [String] :term_key Unique key of the related term.
    # @option opts [String] :term_path Path of the related term.
    # @option opts [DateTime] :time_created Time that the resource was created. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    # @option opts [String] :created_by_id OCID of the user who created the resource.
    # @option opts [Array<String>] :fields Specifies the fields to return in a data asset tag summary response.
    #
    #   Allowed values are: key, name, termKey, termPath, termDescription, lifecycleState, timeCreated, uri, glossaryKey, dataAssetKey
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'.
    #   Allowed values are: ASC, DESC
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::DataAssetTagCollection DataAssetTagCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/list_data_asset_tags.rb.html) to see an example of how to use list_data_asset_tags API.
    def list_data_asset_tags(catalog_id, data_asset_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#list_data_asset_tags.' if logger

      raise "Missing the required parameter 'catalog_id' when calling list_data_asset_tags." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling list_data_asset_tags." if data_asset_key.nil?

      if opts[:lifecycle_state] && !OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.'
      end


      fields_allowable_values = %w[key name termKey termPath termDescription lifecycleState timeCreated uri glossaryKey dataAssetKey]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of key, name, termKey, termPath, termDescription, lifecycleState, timeCreated, uri, glossaryKey, dataAssetKey.'
          end
        end
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/tags'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:termKey] = opts[:term_key] if opts[:term_key]
      query_params[:termPath] = opts[:term_path] if opts[:term_path]
      query_params[:timeCreated] = opts[:time_created] if opts[:time_created]
      query_params[:createdById] = opts[:created_by_id] if opts[:created_by_id]
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#list_data_asset_tags') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::DataAssetTagCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of data assets within a data catalog.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given. The match is not case sensitive.
    # @option opts [String] :display_name_contains A filter to return only resources that match display name pattern given. The match is not case sensitive.
    #   For Example : /folders?displayNameContains=Cu.*
    #   The above would match all folders with display name that starts with \"Cu\" or has the pattern \"Cu\" anywhere in between.
    #
    # @option opts [String] :lifecycle_state A filter to return only resources that match the specified lifecycle state. The value is case insensitive.
    # @option opts [DateTime] :time_created Time that the resource was created. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    # @option opts [DateTime] :time_updated Time that the resource was updated. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    # @option opts [String] :created_by_id OCID of the user who created the resource.
    # @option opts [String] :updated_by_id OCID of the user who updated the resource.
    # @option opts [String] :external_key Unique external identifier of this resource in the external source system.
    # @option opts [String] :type_key The key of the object type.
    # @option opts [Array<String>] :fields Specifies the fields to return in a data asset summary response.
    #
    #   Allowed values are: key, displayName, description, catalogId, externalKey, typeKey, lifecycleState, timeCreated, uri
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'.
    #   Allowed values are: ASC, DESC
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::DataAssetCollection DataAssetCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/list_data_assets.rb.html) to see an example of how to use list_data_assets API.
    def list_data_assets(catalog_id, opts = {})
      logger.debug 'Calling operation DataCatalogClient#list_data_assets.' if logger

      raise "Missing the required parameter 'catalog_id' when calling list_data_assets." if catalog_id.nil?

      if opts[:lifecycle_state] && !OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.'
      end


      fields_allowable_values = %w[key displayName description catalogId externalKey typeKey lifecycleState timeCreated uri]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of key, displayName, description, catalogId, externalKey, typeKey, lifecycleState, timeCreated, uri.'
          end
        end
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)

      path = '/catalogs/{catalogId}/dataAssets'.sub('{catalogId}', catalog_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:displayNameContains] = opts[:display_name_contains] if opts[:display_name_contains]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:timeCreated] = opts[:time_created] if opts[:time_created]
      query_params[:timeUpdated] = opts[:time_updated] if opts[:time_updated]
      query_params[:createdById] = opts[:created_by_id] if opts[:created_by_id]
      query_params[:updatedById] = opts[:updated_by_id] if opts[:updated_by_id]
      query_params[:externalKey] = opts[:external_key] if opts[:external_key]
      query_params[:typeKey] = opts[:type_key] if opts[:type_key]
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#list_data_assets') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::DataAssetCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # List logical entities derived from this pattern.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] pattern_key Unique pattern key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name_contains A filter to return only resources that match display name pattern given. The match is not case sensitive.
    #   For Example : /folders?displayNameContains=Cu.*
    #   The above would match all folders with display name that starts with \"Cu\" or has the pattern \"Cu\" anywhere in between.
    #
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'.
    #   Allowed values are: ASC, DESC
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::EntityCollection EntityCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/list_derived_logical_entities.rb.html) to see an example of how to use list_derived_logical_entities API.
    def list_derived_logical_entities(catalog_id, pattern_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#list_derived_logical_entities.' if logger

      raise "Missing the required parameter 'catalog_id' when calling list_derived_logical_entities." if catalog_id.nil?
      raise "Missing the required parameter 'pattern_key' when calling list_derived_logical_entities." if pattern_key.nil?

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'pattern_key' must not be blank" if OCI::Internal::Util.blank_string?(pattern_key)

      path = '/catalogs/{catalogId}/patterns/{patternKey}/actions/listDerivedLogicalEntities'.sub('{catalogId}', catalog_id.to_s).sub('{patternKey}', pattern_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:displayNameContains] = opts[:display_name_contains] if opts[:display_name_contains]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#list_derived_logical_entities') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::EntityCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of all entities of a data asset.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given. The match is not case sensitive.
    # @option opts [String] :business_name A filter to return only resources that match the entire business name given. The match is not case sensitive.
    # @option opts [String] :display_or_business_name_contains A filter to return only resources that match display name or business name pattern given. The match is not case sensitive.
    #   For Example : /folders?displayOrBusinessNameContains=Cu.*
    #   The above would match all folders with display name or business name that starts with \"Cu\" or has the pattern \"Cu\" anywhere in between.
    #
    # @option opts [String] :type_key The key of the object type.
    # @option opts [String] :display_name_contains A filter to return only resources that match display name pattern given. The match is not case sensitive.
    #   For Example : /folders?displayNameContains=Cu.*
    #   The above would match all folders with display name that starts with \"Cu\" or has the pattern \"Cu\" anywhere in between.
    #
    # @option opts [String] :lifecycle_state A filter to return only resources that match the specified lifecycle state. The value is case insensitive.
    # @option opts [DateTime] :time_created Time that the resource was created. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    # @option opts [DateTime] :time_updated Time that the resource was updated. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    # @option opts [String] :created_by_id OCID of the user who created the resource.
    # @option opts [String] :updated_by_id OCID of the user who updated the resource.
    # @option opts [String] :external_key Unique external identifier of this resource in the external source system.
    # @option opts [String] :pattern_key Unique pattern key.
    # @option opts [DateTime] :time_external Last modified timestamp of this object in the external system.
    # @option opts [DateTime] :time_status_updated Time that the resource's status was last updated. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    # @option opts [BOOLEAN] :is_logical Identifies if the object is a physical object (materialized) or virtual/logical object defined on other objects.
    #
    # @option opts [BOOLEAN] :is_partition Identifies if an object is a sub object (partition) of a physical or materialized parent object.
    # @option opts [String] :folder_key Key of the associated folder.
    # @option opts [String] :path Full path of the resource for resources that support paths.
    # @option opts [String] :harvest_status Harvest status of the harvestable resource as updated by the harvest process.
    # @option opts [String] :last_job_key Key of the last harvest process to update this resource.
    # @option opts [Array<String>] :fields Specifies the fields to return in an entity summary response.
    #
    #   Allowed values are: key, displayName, description, dataAssetKey, timeCreated, timeUpdated, updatedById, lifecycleState, folderKey, folderName, externalKey, path, uri
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'.
    #   Allowed values are: ASC, DESC
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::EntityCollection EntityCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/list_entities.rb.html) to see an example of how to use list_entities API.
    def list_entities(catalog_id, data_asset_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#list_entities.' if logger

      raise "Missing the required parameter 'catalog_id' when calling list_entities." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling list_entities." if data_asset_key.nil?

      if opts[:lifecycle_state] && !OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:harvest_status] && !OCI::DataCatalog::Models::HARVEST_STATUS_ENUM.include?(opts[:harvest_status])
        raise 'Invalid value for "harvest_status", must be one of the values in OCI::DataCatalog::Models::HARVEST_STATUS_ENUM.'
      end


      fields_allowable_values = %w[key displayName description dataAssetKey timeCreated timeUpdated updatedById lifecycleState folderKey folderName externalKey path uri]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of key, displayName, description, dataAssetKey, timeCreated, timeUpdated, updatedById, lifecycleState, folderKey, folderName, externalKey, path, uri.'
          end
        end
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/entities'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:businessName] = opts[:business_name] if opts[:business_name]
      query_params[:displayOrBusinessNameContains] = opts[:display_or_business_name_contains] if opts[:display_or_business_name_contains]
      query_params[:typeKey] = opts[:type_key] if opts[:type_key]
      query_params[:displayNameContains] = opts[:display_name_contains] if opts[:display_name_contains]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:timeCreated] = opts[:time_created] if opts[:time_created]
      query_params[:timeUpdated] = opts[:time_updated] if opts[:time_updated]
      query_params[:createdById] = opts[:created_by_id] if opts[:created_by_id]
      query_params[:updatedById] = opts[:updated_by_id] if opts[:updated_by_id]
      query_params[:externalKey] = opts[:external_key] if opts[:external_key]
      query_params[:patternKey] = opts[:pattern_key] if opts[:pattern_key]
      query_params[:timeExternal] = opts[:time_external] if opts[:time_external]
      query_params[:timeStatusUpdated] = opts[:time_status_updated] if opts[:time_status_updated]
      query_params[:isLogical] = opts[:is_logical] if !opts[:is_logical].nil?
      query_params[:isPartition] = opts[:is_partition] if !opts[:is_partition].nil?
      query_params[:folderKey] = opts[:folder_key] if opts[:folder_key]
      query_params[:path] = opts[:path] if opts[:path]
      query_params[:harvestStatus] = opts[:harvest_status] if opts[:harvest_status]
      query_params[:lastJobKey] = opts[:last_job_key] if opts[:last_job_key]
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#list_entities') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::EntityCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of all tags for a data entity.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [String] entity_key Unique entity key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :name Immutable resource name.
    # @option opts [String] :lifecycle_state A filter to return only resources that match the specified lifecycle state. The value is case insensitive.
    # @option opts [String] :term_key Unique key of the related term.
    # @option opts [String] :term_path Path of the related term.
    # @option opts [DateTime] :time_created Time that the resource was created. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    # @option opts [String] :created_by_id OCID of the user who created the resource.
    # @option opts [Array<String>] :fields Specifies the fields to return in an entity tag summary response.
    #
    #   Allowed values are: key, name, termKey, termPath, termDescription, lifecycleState, timeCreated, uri, glossaryKey, entityKey
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'.
    #   Allowed values are: ASC, DESC
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::EntityTagCollection EntityTagCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/list_entity_tags.rb.html) to see an example of how to use list_entity_tags API.
    def list_entity_tags(catalog_id, data_asset_key, entity_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#list_entity_tags.' if logger

      raise "Missing the required parameter 'catalog_id' when calling list_entity_tags." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling list_entity_tags." if data_asset_key.nil?
      raise "Missing the required parameter 'entity_key' when calling list_entity_tags." if entity_key.nil?

      if opts[:lifecycle_state] && !OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.'
      end


      fields_allowable_values = %w[key name termKey termPath termDescription lifecycleState timeCreated uri glossaryKey entityKey]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of key, name, termKey, termPath, termDescription, lifecycleState, timeCreated, uri, glossaryKey, entityKey.'
          end
        end
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)
      raise "Parameter value for 'entity_key' must not be blank" if OCI::Internal::Util.blank_string?(entity_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/entities/{entityKey}/tags'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s).sub('{entityKey}', entity_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:termKey] = opts[:term_key] if opts[:term_key]
      query_params[:termPath] = opts[:term_path] if opts[:term_path]
      query_params[:timeCreated] = opts[:time_created] if opts[:time_created]
      query_params[:createdById] = opts[:created_by_id] if opts[:created_by_id]
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#list_entity_tags') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::EntityTagCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of all tags for a folder.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [String] folder_key Unique folder key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :name Immutable resource name.
    # @option opts [String] :lifecycle_state A filter to return only resources that match the specified lifecycle state. The value is case insensitive.
    # @option opts [String] :term_key Unique key of the related term.
    # @option opts [String] :term_path Path of the related term.
    # @option opts [DateTime] :time_created Time that the resource was created. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    # @option opts [String] :created_by_id OCID of the user who created the resource.
    # @option opts [Array<String>] :fields Specifies the fields to return in a folder tag summary response.
    #
    #   Allowed values are: key, name, termKey, termPath, termDescription, lifecycleState, timeCreated, uri, glossaryKey, folderKey
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'.
    #   Allowed values are: ASC, DESC
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::FolderTagCollection FolderTagCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/list_folder_tags.rb.html) to see an example of how to use list_folder_tags API.
    def list_folder_tags(catalog_id, data_asset_key, folder_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#list_folder_tags.' if logger

      raise "Missing the required parameter 'catalog_id' when calling list_folder_tags." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling list_folder_tags." if data_asset_key.nil?
      raise "Missing the required parameter 'folder_key' when calling list_folder_tags." if folder_key.nil?

      if opts[:lifecycle_state] && !OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.'
      end


      fields_allowable_values = %w[key name termKey termPath termDescription lifecycleState timeCreated uri glossaryKey folderKey]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of key, name, termKey, termPath, termDescription, lifecycleState, timeCreated, uri, glossaryKey, folderKey.'
          end
        end
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)
      raise "Parameter value for 'folder_key' must not be blank" if OCI::Internal::Util.blank_string?(folder_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/folders/{folderKey}/tags'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s).sub('{folderKey}', folder_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:termKey] = opts[:term_key] if opts[:term_key]
      query_params[:termPath] = opts[:term_path] if opts[:term_path]
      query_params[:timeCreated] = opts[:time_created] if opts[:time_created]
      query_params[:createdById] = opts[:created_by_id] if opts[:created_by_id]
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#list_folder_tags') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::FolderTagCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of all folders.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given. The match is not case sensitive.
    # @option opts [String] :business_name A filter to return only resources that match the entire business name given. The match is not case sensitive.
    # @option opts [String] :display_or_business_name_contains A filter to return only resources that match display name or business name pattern given. The match is not case sensitive.
    #   For Example : /folders?displayOrBusinessNameContains=Cu.*
    #   The above would match all folders with display name or business name that starts with \"Cu\" or has the pattern \"Cu\" anywhere in between.
    #
    # @option opts [String] :display_name_contains A filter to return only resources that match display name pattern given. The match is not case sensitive.
    #   For Example : /folders?displayNameContains=Cu.*
    #   The above would match all folders with display name that starts with \"Cu\" or has the pattern \"Cu\" anywhere in between.
    #
    # @option opts [String] :lifecycle_state A filter to return only resources that match the specified lifecycle state. The value is case insensitive.
    # @option opts [String] :parent_folder_key Unique folder key.
    # @option opts [String] :path Full path of the resource for resources that support paths.
    # @option opts [String] :external_key Unique external identifier of this resource in the external source system.
    # @option opts [DateTime] :time_created Time that the resource was created. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    # @option opts [DateTime] :time_updated Time that the resource was updated. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    # @option opts [String] :created_by_id OCID of the user who created the resource.
    # @option opts [String] :updated_by_id OCID of the user who updated the resource.
    # @option opts [String] :harvest_status Harvest status of the harvestable resource as updated by the harvest process.
    # @option opts [String] :last_job_key Key of the last harvest process to update this resource.
    # @option opts [Array<String>] :fields Specifies the fields to return in a folder summary response.
    #
    #   Allowed values are: key, displayName, description, parentFolderKey, path, dataAssetKey, externalKey, timeExternal, timeCreated, lifecycleState, uri
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'.
    #   Allowed values are: ASC, DESC
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::FolderCollection FolderCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/list_folders.rb.html) to see an example of how to use list_folders API.
    def list_folders(catalog_id, data_asset_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#list_folders.' if logger

      raise "Missing the required parameter 'catalog_id' when calling list_folders." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling list_folders." if data_asset_key.nil?

      if opts[:lifecycle_state] && !OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:harvest_status] && !OCI::DataCatalog::Models::HARVEST_STATUS_ENUM.include?(opts[:harvest_status])
        raise 'Invalid value for "harvest_status", must be one of the values in OCI::DataCatalog::Models::HARVEST_STATUS_ENUM.'
      end


      fields_allowable_values = %w[key displayName description parentFolderKey path dataAssetKey externalKey timeExternal timeCreated lifecycleState uri]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of key, displayName, description, parentFolderKey, path, dataAssetKey, externalKey, timeExternal, timeCreated, lifecycleState, uri.'
          end
        end
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/folders'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:businessName] = opts[:business_name] if opts[:business_name]
      query_params[:displayOrBusinessNameContains] = opts[:display_or_business_name_contains] if opts[:display_or_business_name_contains]
      query_params[:displayNameContains] = opts[:display_name_contains] if opts[:display_name_contains]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:parentFolderKey] = opts[:parent_folder_key] if opts[:parent_folder_key]
      query_params[:path] = opts[:path] if opts[:path]
      query_params[:externalKey] = opts[:external_key] if opts[:external_key]
      query_params[:timeCreated] = opts[:time_created] if opts[:time_created]
      query_params[:timeUpdated] = opts[:time_updated] if opts[:time_updated]
      query_params[:createdById] = opts[:created_by_id] if opts[:created_by_id]
      query_params[:updatedById] = opts[:updated_by_id] if opts[:updated_by_id]
      query_params[:harvestStatus] = opts[:harvest_status] if opts[:harvest_status]
      query_params[:lastJobKey] = opts[:last_job_key] if opts[:last_job_key]
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#list_folders') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::FolderCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of all glossaries within a data catalog.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given. The match is not case sensitive.
    # @option opts [String] :display_name_contains A filter to return only resources that match display name pattern given. The match is not case sensitive.
    #   For Example : /folders?displayNameContains=Cu.*
    #   The above would match all folders with display name that starts with \"Cu\" or has the pattern \"Cu\" anywhere in between.
    #
    # @option opts [String] :lifecycle_state A filter to return only resources that match the specified lifecycle state. The value is case insensitive.
    # @option opts [DateTime] :time_created Time that the resource was created. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    # @option opts [DateTime] :time_updated Time that the resource was updated. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    # @option opts [String] :created_by_id OCID of the user who created the resource.
    # @option opts [String] :updated_by_id OCID of the user who updated the resource.
    # @option opts [Array<String>] :fields Specifies the fields to return in a glossary summary response.
    #
    #   Allowed values are: key, displayName, description, catalogId, lifecycleState, timeCreated, uri, workflowStatus
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'.
    #   Allowed values are: ASC, DESC
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::GlossaryCollection GlossaryCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/list_glossaries.rb.html) to see an example of how to use list_glossaries API.
    def list_glossaries(catalog_id, opts = {})
      logger.debug 'Calling operation DataCatalogClient#list_glossaries.' if logger

      raise "Missing the required parameter 'catalog_id' when calling list_glossaries." if catalog_id.nil?

      if opts[:lifecycle_state] && !OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.'
      end


      fields_allowable_values = %w[key displayName description catalogId lifecycleState timeCreated uri workflowStatus]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of key, displayName, description, catalogId, lifecycleState, timeCreated, uri, workflowStatus.'
          end
        end
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)

      path = '/catalogs/{catalogId}/glossaries'.sub('{catalogId}', catalog_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:displayNameContains] = opts[:display_name_contains] if opts[:display_name_contains]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:timeCreated] = opts[:time_created] if opts[:time_created]
      query_params[:timeUpdated] = opts[:time_updated] if opts[:time_updated]
      query_params[:createdById] = opts[:created_by_id] if opts[:created_by_id]
      query_params[:updatedById] = opts[:updated_by_id] if opts[:updated_by_id]
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#list_glossaries') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::GlossaryCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of job definitions within a data catalog.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given. The match is not case sensitive.
    # @option opts [String] :display_name_contains A filter to return only resources that match display name pattern given. The match is not case sensitive.
    #   For Example : /folders?displayNameContains=Cu.*
    #   The above would match all folders with display name that starts with \"Cu\" or has the pattern \"Cu\" anywhere in between.
    #
    # @option opts [String] :job_execution_state Job execution state.
    # @option opts [String] :lifecycle_state A filter to return only resources that match the specified lifecycle state. The value is case insensitive.
    # @option opts [String] :job_type Job type.
    # @option opts [BOOLEAN] :is_incremental Whether job definition is an incremental harvest (true) or a full harvest (false).
    # @option opts [String] :data_asset_key Unique data asset key.
    # @option opts [String] :connection_key Unique connection key.
    # @option opts [DateTime] :time_created Time that the resource was created. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    # @option opts [DateTime] :time_updated Time that the resource was updated. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    # @option opts [String] :created_by_id OCID of the user who created the resource.
    # @option opts [String] :updated_by_id OCID of the user who updated the resource.
    # @option opts [String] :sample_data_size_in_mbs The sample data size in MB, specified as number of rows, for a metadata harvest.
    # @option opts [Array<String>] :fields Specifies the fields to return in a job definition summary response.
    #
    #   Allowed values are: key, displayName, description, catalogId, jobType, connectionKey, lifecycleState, timeCreated, isSampleDataExtracted, uri, timeLatestExecutionStarted, timeLatestExecutionEnded, jobExecutionState, scheduleType
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. Default order for TIMELATESTEXECUTIONSTARTED is descending. If no value is specified TIMECREATED is default.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME, TIMELATESTEXECUTIONSTARTED
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'.
    #   Allowed values are: ASC, DESC
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::JobDefinitionCollection JobDefinitionCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/list_job_definitions.rb.html) to see an example of how to use list_job_definitions API.
    def list_job_definitions(catalog_id, opts = {})
      logger.debug 'Calling operation DataCatalogClient#list_job_definitions.' if logger

      raise "Missing the required parameter 'catalog_id' when calling list_job_definitions." if catalog_id.nil?

      if opts[:job_execution_state] && !OCI::DataCatalog::Models::JOB_EXECUTION_STATE_ENUM.include?(opts[:job_execution_state])
        raise 'Invalid value for "job_execution_state", must be one of the values in OCI::DataCatalog::Models::JOB_EXECUTION_STATE_ENUM.'
      end

      if opts[:lifecycle_state] && !OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:job_type] && !OCI::DataCatalog::Models::JOB_TYPE_ENUM.include?(opts[:job_type])
        raise 'Invalid value for "job_type", must be one of the values in OCI::DataCatalog::Models::JOB_TYPE_ENUM.'
      end


      fields_allowable_values = %w[key displayName description catalogId jobType connectionKey lifecycleState timeCreated isSampleDataExtracted uri timeLatestExecutionStarted timeLatestExecutionEnded jobExecutionState scheduleType]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of key, displayName, description, catalogId, jobType, connectionKey, lifecycleState, timeCreated, isSampleDataExtracted, uri, timeLatestExecutionStarted, timeLatestExecutionEnded, jobExecutionState, scheduleType.'
          end
        end
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME TIMELATESTEXECUTIONSTARTED].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME, TIMELATESTEXECUTIONSTARTED.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)

      path = '/catalogs/{catalogId}/jobDefinitions'.sub('{catalogId}', catalog_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:displayNameContains] = opts[:display_name_contains] if opts[:display_name_contains]
      query_params[:jobExecutionState] = opts[:job_execution_state] if opts[:job_execution_state]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:jobType] = opts[:job_type] if opts[:job_type]
      query_params[:isIncremental] = opts[:is_incremental] if !opts[:is_incremental].nil?
      query_params[:dataAssetKey] = opts[:data_asset_key] if opts[:data_asset_key]
      query_params[:connectionKey] = opts[:connection_key] if opts[:connection_key]
      query_params[:timeCreated] = opts[:time_created] if opts[:time_created]
      query_params[:timeUpdated] = opts[:time_updated] if opts[:time_updated]
      query_params[:createdById] = opts[:created_by_id] if opts[:created_by_id]
      query_params[:updatedById] = opts[:updated_by_id] if opts[:updated_by_id]
      query_params[:sampleDataSizeInMBs] = opts[:sample_data_size_in_mbs] if opts[:sample_data_size_in_mbs]
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#list_job_definitions') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::JobDefinitionCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of job executions for a job.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] job_key Unique job key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :lifecycle_state Job execution lifecycle state.
    # @option opts [DateTime] :time_created Time that the resource was created. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    # @option opts [DateTime] :time_updated Time that the resource was updated. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    # @option opts [String] :created_by_id OCID of the user who created the resource.
    # @option opts [String] :updated_by_id OCID of the user who updated the resource.
    # @option opts [String] :job_type Job type.
    # @option opts [String] :sub_type Sub-type of this job execution.
    # @option opts [String] :parent_key The unique key of the parent execution or null if this job execution has no parent.
    # @option opts [DateTime] :time_start Time that the job execution was started or in the case of a future time, the time when the job will start.
    #   An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    #
    # @option opts [DateTime] :time_end Time that the job execution ended or null if the job is still running or hasn't run yet.
    #   An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    #
    # @option opts [String] :error_code Error code returned from the job execution or null if job is still running or didn't return an error.
    #
    # @option opts [String] :error_message Error message returned from the job execution or null if job is still running or didn't return an error.
    #
    # @option opts [String] :process_key Process identifier related to the job execution.
    # @option opts [String] :external_url The a URL of the job for accessing this resource and its status.
    # @option opts [String] :event_key Event that triggered the execution of this job or null.
    # @option opts [String] :data_entity_key Unique entity key.
    # @option opts [Array<String>] :fields Specifies the fields to return in a job execution summary response.
    #
    #   Allowed values are: key, jobKey, jobType, parentKey, scheduleInstanceKey, lifecycleState, timeCreated, timeStarted, timeEnded, uri
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided; the default is descending. Use sortOrder query param to specify order.
    #
    #   Allowed values are: TIMECREATED
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'.
    #   Allowed values are: ASC, DESC
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::JobExecutionCollection JobExecutionCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/list_job_executions.rb.html) to see an example of how to use list_job_executions API.
    def list_job_executions(catalog_id, job_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#list_job_executions.' if logger

      raise "Missing the required parameter 'catalog_id' when calling list_job_executions." if catalog_id.nil?
      raise "Missing the required parameter 'job_key' when calling list_job_executions." if job_key.nil?

      if opts[:lifecycle_state] && !OCI::DataCatalog::Models::JOB_EXECUTION_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataCatalog::Models::JOB_EXECUTION_STATE_ENUM.'
      end

      if opts[:job_type] && !OCI::DataCatalog::Models::JOB_TYPE_ENUM.include?(opts[:job_type])
        raise 'Invalid value for "job_type", must be one of the values in OCI::DataCatalog::Models::JOB_TYPE_ENUM.'
      end


      fields_allowable_values = %w[key jobKey jobType parentKey scheduleInstanceKey lifecycleState timeCreated timeStarted timeEnded uri]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of key, jobKey, jobType, parentKey, scheduleInstanceKey, lifecycleState, timeCreated, timeStarted, timeEnded, uri.'
          end
        end
      end

      if opts[:sort_by] && !%w[TIMECREATED].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'job_key' must not be blank" if OCI::Internal::Util.blank_string?(job_key)

      path = '/catalogs/{catalogId}/jobs/{jobKey}/executions'.sub('{catalogId}', catalog_id.to_s).sub('{jobKey}', job_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:timeCreated] = opts[:time_created] if opts[:time_created]
      query_params[:timeUpdated] = opts[:time_updated] if opts[:time_updated]
      query_params[:createdById] = opts[:created_by_id] if opts[:created_by_id]
      query_params[:updatedById] = opts[:updated_by_id] if opts[:updated_by_id]
      query_params[:jobType] = opts[:job_type] if opts[:job_type]
      query_params[:subType] = opts[:sub_type] if opts[:sub_type]
      query_params[:parentKey] = opts[:parent_key] if opts[:parent_key]
      query_params[:timeStart] = opts[:time_start] if opts[:time_start]
      query_params[:timeEnd] = opts[:time_end] if opts[:time_end]
      query_params[:errorCode] = opts[:error_code] if opts[:error_code]
      query_params[:errorMessage] = opts[:error_message] if opts[:error_message]
      query_params[:processKey] = opts[:process_key] if opts[:process_key]
      query_params[:externalUrl] = opts[:external_url] if opts[:external_url]
      query_params[:eventKey] = opts[:event_key] if opts[:event_key]
      query_params[:dataEntityKey] = opts[:data_entity_key] if opts[:data_entity_key]
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#list_job_executions') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::JobExecutionCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of job logs.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] job_key Unique job key.
    # @param [String] job_execution_key The key of the job execution.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :lifecycle_state A filter to return only resources that match the specified lifecycle state. The value is case insensitive.
    # @option opts [String] :severity Severity level for this Log.
    # @option opts [DateTime] :time_created Time that the resource was created. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    # @option opts [DateTime] :time_updated Time that the resource was updated. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    # @option opts [String] :created_by_id OCID of the user who created the resource.
    # @option opts [String] :updated_by_id OCID of the user who updated the resource.
    # @option opts [Array<String>] :fields Specifies the fields to return in a job log summary response.
    #
    #   Allowed values are: key, jobExecutionKey, severity, timeCreated, logMessage, uri
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'.
    #   Allowed values are: ASC, DESC
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::JobLogCollection JobLogCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/list_job_logs.rb.html) to see an example of how to use list_job_logs API.
    def list_job_logs(catalog_id, job_key, job_execution_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#list_job_logs.' if logger

      raise "Missing the required parameter 'catalog_id' when calling list_job_logs." if catalog_id.nil?
      raise "Missing the required parameter 'job_key' when calling list_job_logs." if job_key.nil?
      raise "Missing the required parameter 'job_execution_key' when calling list_job_logs." if job_execution_key.nil?

      if opts[:lifecycle_state] && !OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.'
      end


      fields_allowable_values = %w[key jobExecutionKey severity timeCreated logMessage uri]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of key, jobExecutionKey, severity, timeCreated, logMessage, uri.'
          end
        end
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'job_key' must not be blank" if OCI::Internal::Util.blank_string?(job_key)
      raise "Parameter value for 'job_execution_key' must not be blank" if OCI::Internal::Util.blank_string?(job_execution_key)

      path = '/catalogs/{catalogId}/jobs/{jobKey}/executions/{jobExecutionKey}/logs'.sub('{catalogId}', catalog_id.to_s).sub('{jobKey}', job_key.to_s).sub('{jobExecutionKey}', job_execution_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:severity] = opts[:severity] if opts[:severity]
      query_params[:timeCreated] = opts[:time_created] if opts[:time_created]
      query_params[:timeUpdated] = opts[:time_updated] if opts[:time_updated]
      query_params[:createdById] = opts[:created_by_id] if opts[:created_by_id]
      query_params[:updatedById] = opts[:updated_by_id] if opts[:updated_by_id]
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#list_job_logs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::JobLogCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of job metrics.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] job_key Unique job key.
    # @param [String] job_execution_key The key of the job execution.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given. The match is not case sensitive.
    # @option opts [String] :display_name_contains A filter to return only resources that match display name pattern given. The match is not case sensitive.
    #   For Example : /folders?displayNameContains=Cu.*
    #   The above would match all folders with display name that starts with \"Cu\" or has the pattern \"Cu\" anywhere in between.
    #
    # @option opts [String] :category Category of this metric.
    # @option opts [String] :sub_category Sub category of this metric under the category. Used for aggregating values. May be null.
    # @option opts [String] :unit Unit of this metric.
    # @option opts [String] :value Value of this metric.
    # @option opts [String] :batch_key Batch key for grouping, may be null.
    # @option opts [DateTime] :time_created Time that the resource was created. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    # @option opts [DateTime] :time_updated Time that the resource was updated. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    # @option opts [DateTime] :time_inserted The time the metric was logged or captured in the system where the job executed.
    #   An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    #
    # @option opts [String] :created_by_id OCID of the user who created the resource.
    # @option opts [String] :updated_by_id OCID of the user who updated the resource.
    # @option opts [Array<String>] :fields Specifies the fields to return in a job metric summary response.
    #
    #   Allowed values are: key, description, displayName, timeInserted, category, subCategory, unit, value, batchKey, jobExecutionKey, timeCreated, uri
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'.
    #   Allowed values are: ASC, DESC
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::JobMetricCollection JobMetricCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/list_job_metrics.rb.html) to see an example of how to use list_job_metrics API.
    def list_job_metrics(catalog_id, job_key, job_execution_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#list_job_metrics.' if logger

      raise "Missing the required parameter 'catalog_id' when calling list_job_metrics." if catalog_id.nil?
      raise "Missing the required parameter 'job_key' when calling list_job_metrics." if job_key.nil?
      raise "Missing the required parameter 'job_execution_key' when calling list_job_metrics." if job_execution_key.nil?


      fields_allowable_values = %w[key description displayName timeInserted category subCategory unit value batchKey jobExecutionKey timeCreated uri]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of key, description, displayName, timeInserted, category, subCategory, unit, value, batchKey, jobExecutionKey, timeCreated, uri.'
          end
        end
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'job_key' must not be blank" if OCI::Internal::Util.blank_string?(job_key)
      raise "Parameter value for 'job_execution_key' must not be blank" if OCI::Internal::Util.blank_string?(job_execution_key)

      path = '/catalogs/{catalogId}/jobs/{jobKey}/executions/{jobExecutionKey}/metrics'.sub('{catalogId}', catalog_id.to_s).sub('{jobKey}', job_key.to_s).sub('{jobExecutionKey}', job_execution_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:displayNameContains] = opts[:display_name_contains] if opts[:display_name_contains]
      query_params[:category] = opts[:category] if opts[:category]
      query_params[:subCategory] = opts[:sub_category] if opts[:sub_category]
      query_params[:unit] = opts[:unit] if opts[:unit]
      query_params[:value] = opts[:value] if opts[:value]
      query_params[:batchKey] = opts[:batch_key] if opts[:batch_key]
      query_params[:timeCreated] = opts[:time_created] if opts[:time_created]
      query_params[:timeUpdated] = opts[:time_updated] if opts[:time_updated]
      query_params[:timeInserted] = opts[:time_inserted] if opts[:time_inserted]
      query_params[:createdById] = opts[:created_by_id] if opts[:created_by_id]
      query_params[:updatedById] = opts[:updated_by_id] if opts[:updated_by_id]
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#list_job_metrics') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::JobMetricCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of jobs within a data catalog.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given. The match is not case sensitive.
    # @option opts [String] :display_name_contains A filter to return only resources that match display name pattern given. The match is not case sensitive.
    #   For Example : /folders?displayNameContains=Cu.*
    #   The above would match all folders with display name that starts with \"Cu\" or has the pattern \"Cu\" anywhere in between.
    #
    # @option opts [String] :lifecycle_state Job lifecycle state.
    # @option opts [DateTime] :time_created Time that the resource was created. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    # @option opts [DateTime] :time_updated Time that the resource was updated. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    # @option opts [String] :created_by_id OCID of the user who created the resource.
    # @option opts [String] :updated_by_id OCID of the user who updated the resource.
    # @option opts [String] :job_type Job type.
    # @option opts [String] :job_definition_key Unique job definition key.
    # @option opts [String] :data_asset_key Unique data asset key.
    # @option opts [String] :schedule_cron_expression Interval on which the job will be run. Value is specified as a cron-supported time specification \"nickname\".
    #   The following subset of those is supported: @monthly, @weekly, @daily, @hourly.
    #
    # @option opts [DateTime] :time_schedule_begin Date that the schedule should be operational. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    # @option opts [DateTime] :time_schedule_end Date that the schedule should end from being operational. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    # @option opts [String] :schedule_type Type of the job schedule.
    # @option opts [String] :connection_key Unique connection key.
    # @option opts [Array<String>] :fields Specifies the fields to return in a job summary response.
    #
    #   Allowed values are: key, displayName, description, catalogId, jobDefinitionKey, lifecycleState, timeCreated, timeUpdated, createdById, updatedById, jobType, scheduleCronExpression, timeScheduleBegin, scheduleType, executionCount, timeOfLatestExecution, executions, uri, jobDefinitionName, errorCode, errorMessage
    # @option opts [Integer] :execution_count The total number of executions for this job schedule.
    #
    # @option opts [DateTime] :time_of_latest_execution The date and time the most recent execution for this job ,in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    #   Example: `2019-03-25T21:10:29.600Z`
    #
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'.
    #   Allowed values are: ASC, DESC
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::JobCollection JobCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/list_jobs.rb.html) to see an example of how to use list_jobs API.
    def list_jobs(catalog_id, opts = {})
      logger.debug 'Calling operation DataCatalogClient#list_jobs.' if logger

      raise "Missing the required parameter 'catalog_id' when calling list_jobs." if catalog_id.nil?

      if opts[:lifecycle_state] && !OCI::DataCatalog::Models::JOB_LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataCatalog::Models::JOB_LIFECYCLE_STATE_ENUM.'
      end

      if opts[:job_type] && !OCI::DataCatalog::Models::JOB_TYPE_ENUM.include?(opts[:job_type])
        raise 'Invalid value for "job_type", must be one of the values in OCI::DataCatalog::Models::JOB_TYPE_ENUM.'
      end

      if opts[:schedule_type] && !OCI::DataCatalog::Models::JOB_SCHEDULE_TYPE_ENUM.include?(opts[:schedule_type])
        raise 'Invalid value for "schedule_type", must be one of the values in OCI::DataCatalog::Models::JOB_SCHEDULE_TYPE_ENUM.'
      end


      fields_allowable_values = %w[key displayName description catalogId jobDefinitionKey lifecycleState timeCreated timeUpdated createdById updatedById jobType scheduleCronExpression timeScheduleBegin scheduleType executionCount timeOfLatestExecution executions uri jobDefinitionName errorCode errorMessage]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of key, displayName, description, catalogId, jobDefinitionKey, lifecycleState, timeCreated, timeUpdated, createdById, updatedById, jobType, scheduleCronExpression, timeScheduleBegin, scheduleType, executionCount, timeOfLatestExecution, executions, uri, jobDefinitionName, errorCode, errorMessage.'
          end
        end
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)

      path = '/catalogs/{catalogId}/jobs'.sub('{catalogId}', catalog_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:displayNameContains] = opts[:display_name_contains] if opts[:display_name_contains]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:timeCreated] = opts[:time_created] if opts[:time_created]
      query_params[:timeUpdated] = opts[:time_updated] if opts[:time_updated]
      query_params[:createdById] = opts[:created_by_id] if opts[:created_by_id]
      query_params[:updatedById] = opts[:updated_by_id] if opts[:updated_by_id]
      query_params[:jobType] = opts[:job_type] if opts[:job_type]
      query_params[:jobDefinitionKey] = opts[:job_definition_key] if opts[:job_definition_key]
      query_params[:dataAssetKey] = opts[:data_asset_key] if opts[:data_asset_key]
      query_params[:scheduleCronExpression] = opts[:schedule_cron_expression] if opts[:schedule_cron_expression]
      query_params[:timeScheduleBegin] = opts[:time_schedule_begin] if opts[:time_schedule_begin]
      query_params[:timeScheduleEnd] = opts[:time_schedule_end] if opts[:time_schedule_end]
      query_params[:scheduleType] = opts[:schedule_type] if opts[:schedule_type]
      query_params[:connectionKey] = opts[:connection_key] if opts[:connection_key]
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?
      query_params[:executionCount] = opts[:execution_count] if opts[:execution_count]
      query_params[:timeOfLatestExecution] = opts[:time_of_latest_execution] if opts[:time_of_latest_execution]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#list_jobs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::JobCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of all metastores in the specified compartment.
    #
    # @param [String] compartment_id The OCID of the compartment where you want to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given. The match is not case sensitive.
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :lifecycle_state A filter to return only resources that match the specified lifecycle state. The value is case insensitive.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'.
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type Array<{OCI::DataCatalog::Models::MetastoreSummary MetastoreSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/list_metastores.rb.html) to see an example of how to use list_metastores API.
    def list_metastores(compartment_id, opts = {})
      logger.debug 'Calling operation DataCatalogClient#list_metastores.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_metastores." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      path = '/metastores'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#list_metastores') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::DataCatalog::Models::MetastoreSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of namespaces within a data catalog.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given. The match is not case sensitive.
    # @option opts [String] :display_name_contains A filter to return only resources that match display name pattern given. The match is not case sensitive.
    #   For Example : /folders?displayNameContains=Cu.*
    #   The above would match all folders with display name that starts with \"Cu\" or has the pattern \"Cu\" anywhere in between.
    #
    # @option opts [String] :lifecycle_state A filter to return only resources that match the specified lifecycle state. The value is case insensitive.
    # @option opts [DateTime] :time_created Time that the resource was created. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    # @option opts [DateTime] :time_updated Time that the resource was updated. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    # @option opts [String] :created_by_id OCID of the user who created the resource.
    # @option opts [String] :updated_by_id OCID of the user who updated the resource.
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'.
    #   Allowed values are: ASC, DESC
    # @option opts [Array<String>] :fields Specifies the fields to return in a namespace summary response.
    #
    #   Allowed values are: key, displayName, description, lifecycleState, timeCreated
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::NamespaceCollection NamespaceCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/list_namespaces.rb.html) to see an example of how to use list_namespaces API.
    def list_namespaces(catalog_id, opts = {})
      logger.debug 'Calling operation DataCatalogClient#list_namespaces.' if logger

      raise "Missing the required parameter 'catalog_id' when calling list_namespaces." if catalog_id.nil?

      if opts[:lifecycle_state] && !OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end


      fields_allowable_values = %w[key displayName description lifecycleState timeCreated]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of key, displayName, description, lifecycleState, timeCreated.'
          end
        end
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)

      path = '/catalogs/{catalogId}/namespaces'.sub('{catalogId}', catalog_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:displayNameContains] = opts[:display_name_contains] if opts[:display_name_contains]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:timeCreated] = opts[:time_created] if opts[:time_created]
      query_params[:timeUpdated] = opts[:time_updated] if opts[:time_updated]
      query_params[:createdById] = opts[:created_by_id] if opts[:created_by_id]
      query_params[:updatedById] = opts[:updated_by_id] if opts[:updated_by_id]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#list_namespaces') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::NamespaceCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of patterns within a data catalog.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given. The match is not case sensitive.
    # @option opts [String] :display_name_contains A filter to return only resources that match display name pattern given. The match is not case sensitive.
    #   For Example : /folders?displayNameContains=Cu.*
    #   The above would match all folders with display name that starts with \"Cu\" or has the pattern \"Cu\" anywhere in between.
    #
    # @option opts [String] :lifecycle_state A filter to return only resources that match the specified lifecycle state. The value is case insensitive.
    # @option opts [DateTime] :time_created Time that the resource was created. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    # @option opts [DateTime] :time_updated Time that the resource was updated. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    # @option opts [String] :created_by_id OCID of the user who created the resource.
    # @option opts [String] :updated_by_id OCID of the user who updated the resource.
    # @option opts [Array<String>] :fields Specifies the fields to return in a pattern summary response.
    #
    #   Allowed values are: key, displayName, description, catalogId, expression, lifecycleState, timeCreated
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'.
    #   Allowed values are: ASC, DESC
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::PatternCollection PatternCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/list_patterns.rb.html) to see an example of how to use list_patterns API.
    def list_patterns(catalog_id, opts = {})
      logger.debug 'Calling operation DataCatalogClient#list_patterns.' if logger

      raise "Missing the required parameter 'catalog_id' when calling list_patterns." if catalog_id.nil?

      if opts[:lifecycle_state] && !OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.'
      end


      fields_allowable_values = %w[key displayName description catalogId expression lifecycleState timeCreated]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of key, displayName, description, catalogId, expression, lifecycleState, timeCreated.'
          end
        end
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)

      path = '/catalogs/{catalogId}/patterns'.sub('{catalogId}', catalog_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:displayNameContains] = opts[:display_name_contains] if opts[:display_name_contains]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:timeCreated] = opts[:time_created] if opts[:time_created]
      query_params[:timeUpdated] = opts[:time_updated] if opts[:time_updated]
      query_params[:createdById] = opts[:created_by_id] if opts[:created_by_id]
      query_params[:updatedById] = opts[:updated_by_id] if opts[:updated_by_id]
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#list_patterns') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::PatternCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of all rules of a data entity.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [String] entity_key Unique entity key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given. The match is not case sensitive.
    # @option opts [String] :display_name_contains A filter to return only resources that match display name pattern given. The match is not case sensitive.
    #   For Example : /folders?displayNameContains=Cu.*
    #   The above would match all folders with display name that starts with \"Cu\" or has the pattern \"Cu\" anywhere in between.
    #
    # @option opts [String] :rule_type Rule type used to filter the response to a list rules call.
    # @option opts [String] :lifecycle_state A filter to return only resources that match the specified lifecycle state. The value is case insensitive.
    # @option opts [String] :origin_type Rule origin type used to filter the response to a list rules call.
    # @option opts [String] :external_key Unique external identifier of this resource in the external source system.
    # @option opts [DateTime] :time_created Time that the resource was created. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    # @option opts [DateTime] :time_updated Time that the resource was updated. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    # @option opts [String] :created_by_id OCID of the user who created the resource.
    # @option opts [String] :updated_by_id OCID of the user who updated the resource.
    # @option opts [Array<String>] :fields Specifies the fields to return in a rule summary response.
    #
    #   Allowed values are: key, displayName, ruleType, externalKey, referencedFolderKey, referencedFolderName, referencedEntityKey, referencedEntityName, referencedRuleKey, referencedRuleName, originType, lifecycleState, timeCreated, uri
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'.
    #   Allowed values are: ASC, DESC
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::RuleCollection RuleCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/list_rules.rb.html) to see an example of how to use list_rules API.
    def list_rules(catalog_id, data_asset_key, entity_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#list_rules.' if logger

      raise "Missing the required parameter 'catalog_id' when calling list_rules." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling list_rules." if data_asset_key.nil?
      raise "Missing the required parameter 'entity_key' when calling list_rules." if entity_key.nil?

      if opts[:rule_type] && !OCI::DataCatalog::Models::RULE_TYPE_ENUM.include?(opts[:rule_type])
        raise 'Invalid value for "rule_type", must be one of the values in OCI::DataCatalog::Models::RULE_TYPE_ENUM.'
      end

      if opts[:lifecycle_state] && !OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:origin_type] && !OCI::DataCatalog::Models::RULE_ORIGIN_TYPE_ENUM.include?(opts[:origin_type])
        raise 'Invalid value for "origin_type", must be one of the values in OCI::DataCatalog::Models::RULE_ORIGIN_TYPE_ENUM.'
      end


      fields_allowable_values = %w[key displayName ruleType externalKey referencedFolderKey referencedFolderName referencedEntityKey referencedEntityName referencedRuleKey referencedRuleName originType lifecycleState timeCreated uri]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of key, displayName, ruleType, externalKey, referencedFolderKey, referencedFolderName, referencedEntityKey, referencedEntityName, referencedRuleKey, referencedRuleName, originType, lifecycleState, timeCreated, uri.'
          end
        end
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)
      raise "Parameter value for 'entity_key' must not be blank" if OCI::Internal::Util.blank_string?(entity_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/entities/{entityKey}/rules'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s).sub('{entityKey}', entity_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:displayNameContains] = opts[:display_name_contains] if opts[:display_name_contains]
      query_params[:ruleType] = opts[:rule_type] if opts[:rule_type]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:originType] = opts[:origin_type] if opts[:origin_type]
      query_params[:externalKey] = opts[:external_key] if opts[:external_key]
      query_params[:timeCreated] = opts[:time_created] if opts[:time_created]
      query_params[:timeUpdated] = opts[:time_updated] if opts[:time_updated]
      query_params[:createdById] = opts[:created_by_id] if opts[:created_by_id]
      query_params[:updatedById] = opts[:updated_by_id] if opts[:updated_by_id]
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#list_rules') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::RuleCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of all user created tags in the system.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given. The match is not case sensitive.
    # @option opts [String] :display_name_contains A filter to return only resources that match display name pattern given. The match is not case sensitive.
    #   For Example : /folders?displayNameContains=Cu.*
    #   The above would match all folders with display name that starts with \"Cu\" or has the pattern \"Cu\" anywhere in between.
    #
    # @option opts [String] :lifecycle_state A filter to return only resources that match the specified lifecycle state. The value is case insensitive.
    # @option opts [Array<String>] :fields Specifies the fields to return in a term summary response.
    #
    #   Allowed values are: key, displayName, description, glossaryKey, parentTermKey, isAllowedToHaveChildTerms, path, lifecycleState, timeCreated, workflowStatus, associatedObjectCount, uri
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'.
    #   Allowed values are: ASC, DESC
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::TermCollection TermCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/list_tags.rb.html) to see an example of how to use list_tags API.
    def list_tags(catalog_id, opts = {})
      logger.debug 'Calling operation DataCatalogClient#list_tags.' if logger

      raise "Missing the required parameter 'catalog_id' when calling list_tags." if catalog_id.nil?

      if opts[:lifecycle_state] && !OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.'
      end


      fields_allowable_values = %w[key displayName description glossaryKey parentTermKey isAllowedToHaveChildTerms path lifecycleState timeCreated workflowStatus associatedObjectCount uri]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of key, displayName, description, glossaryKey, parentTermKey, isAllowedToHaveChildTerms, path, lifecycleState, timeCreated, workflowStatus, associatedObjectCount, uri.'
          end
        end
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)

      path = '/catalogs/{catalogId}/tags'.sub('{catalogId}', catalog_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:displayNameContains] = opts[:display_name_contains] if opts[:display_name_contains]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#list_tags') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::TermCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of all term relationships within a glossary.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] glossary_key Unique glossary key.
    # @param [String] term_key Unique glossary term key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given. The match is not case sensitive.
    # @option opts [String] :display_name_contains A filter to return only resources that match display name pattern given. The match is not case sensitive.
    #   For Example : /folders?displayNameContains=Cu.*
    #   The above would match all folders with display name that starts with \"Cu\" or has the pattern \"Cu\" anywhere in between.
    #
    # @option opts [String] :lifecycle_state A filter to return only resources that match the specified lifecycle state. The value is case insensitive.
    # @option opts [Array<String>] :fields Specifies the fields to return in a term relationship summary response.
    #
    #   Allowed values are: key, displayName, description, relatedTermKey, relatedTermDisplayName, parentTermKey, parentTermDisplayName, lifecycleState, timeCreated, uri
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'.
    #   Allowed values are: ASC, DESC
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::TermRelationshipCollection TermRelationshipCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/list_term_relationships.rb.html) to see an example of how to use list_term_relationships API.
    def list_term_relationships(catalog_id, glossary_key, term_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#list_term_relationships.' if logger

      raise "Missing the required parameter 'catalog_id' when calling list_term_relationships." if catalog_id.nil?
      raise "Missing the required parameter 'glossary_key' when calling list_term_relationships." if glossary_key.nil?
      raise "Missing the required parameter 'term_key' when calling list_term_relationships." if term_key.nil?

      if opts[:lifecycle_state] && !OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.'
      end


      fields_allowable_values = %w[key displayName description relatedTermKey relatedTermDisplayName parentTermKey parentTermDisplayName lifecycleState timeCreated uri]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of key, displayName, description, relatedTermKey, relatedTermDisplayName, parentTermKey, parentTermDisplayName, lifecycleState, timeCreated, uri.'
          end
        end
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'glossary_key' must not be blank" if OCI::Internal::Util.blank_string?(glossary_key)
      raise "Parameter value for 'term_key' must not be blank" if OCI::Internal::Util.blank_string?(term_key)

      path = '/catalogs/{catalogId}/glossaries/{glossaryKey}/terms/{termKey}/termRelationships'.sub('{catalogId}', catalog_id.to_s).sub('{glossaryKey}', glossary_key.to_s).sub('{termKey}', term_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:displayNameContains] = opts[:display_name_contains] if opts[:display_name_contains]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#list_term_relationships') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::TermRelationshipCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of all terms within a glossary.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] glossary_key Unique glossary key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given. The match is not case sensitive.
    # @option opts [String] :display_name_contains A filter to return only resources that match display name pattern given. The match is not case sensitive.
    #   For Example : /folders?displayNameContains=Cu.*
    #   The above would match all folders with display name that starts with \"Cu\" or has the pattern \"Cu\" anywhere in between.
    #
    # @option opts [String] :lifecycle_state A filter to return only resources that match the specified lifecycle state. The value is case insensitive.
    # @option opts [String] :parent_term_key Unique key of the parent term.
    # @option opts [BOOLEAN] :is_allowed_to_have_child_terms Indicates whether a term may contain child terms.
    # @option opts [String] :workflow_status Status of the approval workflow for this business term in the glossary.
    # @option opts [String] :path Full path of the resource for resources that support paths.
    # @option opts [Array<String>] :fields Specifies the fields to return in a term summary response.
    #
    #   Allowed values are: key, displayName, description, glossaryKey, parentTermKey, isAllowedToHaveChildTerms, path, lifecycleState, timeCreated, workflowStatus, associatedObjectCount, uri
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'.
    #   Allowed values are: ASC, DESC
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::TermCollection TermCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/list_terms.rb.html) to see an example of how to use list_terms API.
    def list_terms(catalog_id, glossary_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#list_terms.' if logger

      raise "Missing the required parameter 'catalog_id' when calling list_terms." if catalog_id.nil?
      raise "Missing the required parameter 'glossary_key' when calling list_terms." if glossary_key.nil?

      if opts[:lifecycle_state] && !OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:workflow_status] && !OCI::DataCatalog::Models::TERM_WORKFLOW_STATUS_ENUM.include?(opts[:workflow_status])
        raise 'Invalid value for "workflow_status", must be one of the values in OCI::DataCatalog::Models::TERM_WORKFLOW_STATUS_ENUM.'
      end


      fields_allowable_values = %w[key displayName description glossaryKey parentTermKey isAllowedToHaveChildTerms path lifecycleState timeCreated workflowStatus associatedObjectCount uri]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of key, displayName, description, glossaryKey, parentTermKey, isAllowedToHaveChildTerms, path, lifecycleState, timeCreated, workflowStatus, associatedObjectCount, uri.'
          end
        end
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'glossary_key' must not be blank" if OCI::Internal::Util.blank_string?(glossary_key)

      path = '/catalogs/{catalogId}/glossaries/{glossaryKey}/terms'.sub('{catalogId}', catalog_id.to_s).sub('{glossaryKey}', glossary_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:displayNameContains] = opts[:display_name_contains] if opts[:display_name_contains]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:parentTermKey] = opts[:parent_term_key] if opts[:parent_term_key]
      query_params[:isAllowedToHaveChildTerms] = opts[:is_allowed_to_have_child_terms] if !opts[:is_allowed_to_have_child_terms].nil?
      query_params[:workflowStatus] = opts[:workflow_status] if opts[:workflow_status]
      query_params[:path] = opts[:path] if opts[:path]
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#list_terms') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::TermCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of all types within a data catalog.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :name Immutable resource name.
    # @option opts [String] :lifecycle_state A filter to return only resources that match the specified lifecycle state. The value is case insensitive.
    # @option opts [String] :is_internal Indicates whether the type is internal, making it unavailable for use by metadata elements.
    # @option opts [String] :is_tag Indicates whether the type can be used for tagging metadata elements.
    # @option opts [String] :is_approved Indicates whether the type is approved for use as a classifying object.
    # @option opts [String] :external_type_name Data type as defined in an external system.
    # @option opts [String] :type_category Indicates the category of this type . For example, data assets or connections.
    # @option opts [Array<String>] :fields Specifies the fields to return in a type summary response.
    #
    #   Allowed values are: key, description, name, catalogId, lifecycleState, typeCategory, uri
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'.
    #   Allowed values are: ASC, DESC
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::TypeCollection TypeCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/list_types.rb.html) to see an example of how to use list_types API.
    def list_types(catalog_id, opts = {})
      logger.debug 'Calling operation DataCatalogClient#list_types.' if logger

      raise "Missing the required parameter 'catalog_id' when calling list_types." if catalog_id.nil?

      if opts[:lifecycle_state] && !OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.'
      end


      fields_allowable_values = %w[key description name catalogId lifecycleState typeCategory uri]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of key, description, name, catalogId, lifecycleState, typeCategory, uri.'
          end
        end
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)

      path = '/catalogs/{catalogId}/types'.sub('{catalogId}', catalog_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:isInternal] = opts[:is_internal] if opts[:is_internal]
      query_params[:isTag] = opts[:is_tag] if opts[:is_tag]
      query_params[:isApproved] = opts[:is_approved] if opts[:is_approved]
      query_params[:externalTypeName] = opts[:external_type_name] if opts[:external_type_name]
      query_params[:typeCategory] = opts[:type_category] if opts[:type_category]
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#list_types') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::TypeCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a (paginated) list of errors for a given work request.
    #
    # @param [String] work_request_id The OCID of the asynchronous request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMESTAMP is descending. Default order for CODE and MESSAGE is ascending. If no value is specified TIMESTAMP is default.
    #
    #   Allowed values are: CODE, TIMESTAMP
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'.
    #   Allowed values are: ASC, DESC
    # @return [Response] A Response object with data of type Array<{OCI::DataCatalog::Models::WorkRequestError WorkRequestError}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/list_work_request_errors.rb.html) to see an example of how to use list_work_request_errors API.
    def list_work_request_errors(work_request_id, opts = {})
      logger.debug 'Calling operation DataCatalogClient#list_work_request_errors.' if logger

      raise "Missing the required parameter 'work_request_id' when calling list_work_request_errors." if work_request_id.nil?

      if opts[:sort_by] && !%w[CODE TIMESTAMP].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of CODE, TIMESTAMP.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/workRequests/{workRequestId}/errors'.sub('{workRequestId}', work_request_id.to_s)
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
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#list_work_request_errors') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::DataCatalog::Models::WorkRequestError>'
        )
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
    # @param [String] work_request_id The OCID of the asynchronous request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMESTAMP is descending. Default order for MESSAGE is ascending. If no value is specified TIMESTAMP is default.
    #
    #   Allowed values are: MESSAGE, TIMESTAMP
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'.
    #   Allowed values are: ASC, DESC
    # @return [Response] A Response object with data of type Array<{OCI::DataCatalog::Models::WorkRequestLog WorkRequestLog}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/list_work_request_logs.rb.html) to see an example of how to use list_work_request_logs API.
    def list_work_request_logs(work_request_id, opts = {})
      logger.debug 'Calling operation DataCatalogClient#list_work_request_logs.' if logger

      raise "Missing the required parameter 'work_request_id' when calling list_work_request_logs." if work_request_id.nil?

      if opts[:sort_by] && !%w[MESSAGE TIMESTAMP].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of MESSAGE, TIMESTAMP.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/workRequests/{workRequestId}/logs'.sub('{workRequestId}', work_request_id.to_s)
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
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#list_work_request_logs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::DataCatalog::Models::WorkRequestLog>'
        )
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
    # @param [String] compartment_id The OCID of the compartment where you want to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [Integer] :limit The maximum number of items to return.
    # @return [Response] A Response object with data of type Array<{OCI::DataCatalog::Models::WorkRequest WorkRequest}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/list_work_requests.rb.html) to see an example of how to use list_work_requests API.
    def list_work_requests(compartment_id, opts = {})
      logger.debug 'Calling operation DataCatalogClient#list_work_requests.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_work_requests." if compartment_id.nil?

      path = '/workRequests'
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#list_work_requests') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::DataCatalog::Models::WorkRequest>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns stats on objects by type in the repository.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'.
    #   Allowed values are: ASC, DESC
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type String
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/object_stats.rb.html) to see an example of how to use object_stats API.
    def object_stats(catalog_id, opts = {})
      logger.debug 'Calling operation DataCatalogClient#object_stats.' if logger

      raise "Missing the required parameter 'catalog_id' when calling object_stats." if catalog_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)

      path = '/catalogs/{catalogId}/actions/objectStats'.sub('{catalogId}', catalog_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#object_stats') do
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
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Parse data asset references through connections from this data asset.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [OCI::DataCatalog::Models::ParseConnectionDetails] parse_connection_details The information used to parse the connections from payload or connection detail.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :connection_key Unique connection key.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type Array<{OCI::DataCatalog::Models::ConnectionAliasSummary ConnectionAliasSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/parse_connection.rb.html) to see an example of how to use parse_connection API.
    def parse_connection(catalog_id, data_asset_key, parse_connection_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#parse_connection.' if logger

      raise "Missing the required parameter 'catalog_id' when calling parse_connection." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling parse_connection." if data_asset_key.nil?
      raise "Missing the required parameter 'parse_connection_details' when calling parse_connection." if parse_connection_details.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/actions/parseConnection'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:connectionKey] = opts[:connection_key] if opts[:connection_key]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(parse_connection_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#parse_connection') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::DataCatalog::Models::ConnectionAliasSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Act on a recommendation. A recommendation can be accepted or rejected. For example, if a recommendation of type LINK_GLOSSARY_TERM
    # is accepted, the system will link the source object (e.g. an attribute) to a target glossary term.
    #
    # @param [String] catalog_id Unique catalog identifier.
    # @param [OCI::DataCatalog::Models::ProcessRecommendationDetails] process_recommendation_details Recommendation to be processed.
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
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::ProcessRecommendationDetails ProcessRecommendationDetails}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/process_recommendation.rb.html) to see an example of how to use process_recommendation API.
    def process_recommendation(catalog_id, process_recommendation_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#process_recommendation.' if logger

      raise "Missing the required parameter 'catalog_id' when calling process_recommendation." if catalog_id.nil?
      raise "Missing the required parameter 'process_recommendation_details' when calling process_recommendation." if process_recommendation_details.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)

      path = '/catalogs/{catalogId}/actions/processRecommendation'.sub('{catalogId}', catalog_id.to_s)
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

      post_body = @api_client.object_to_http_body(process_recommendation_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#process_recommendation') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::ProcessRecommendationDetails'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of recommendations for the given object and recommendation type.
    # By default, it will return inferred recommendations for review. The optional query param 'RecommendationStatus' can be set,
    # to return only recommendations having that status.
    #
    # @param [String] catalog_id Unique catalog identifier.
    # @param [Array<String>] recommendation_type A filter used to return only recommendations of the specified type.
    #   Allowed values are: LINK_GLOSSARY_TERM
    # @param [String] source_object_key A filter used to provide the unique identifier of the source object, for which a list of recommendations will be returned for review.
    # @param [String] source_object_type A filter used to provide the type of the source object, for which a list of recommendations will be returned for review.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :recommendation_status A filter used to return only recommendations having the requested status.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::RecommendationCollection RecommendationCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/recommendations.rb.html) to see an example of how to use recommendations API.
    def recommendations(catalog_id, recommendation_type, source_object_key, source_object_type, opts = {})
      logger.debug 'Calling operation DataCatalogClient#recommendations.' if logger

      raise "Missing the required parameter 'catalog_id' when calling recommendations." if catalog_id.nil?
      raise "Missing the required parameter 'recommendation_type' when calling recommendations." if recommendation_type.nil?

      recommendation_type_allowable_values = %w[LINK_GLOSSARY_TERM]
      recommendation_type.each do |val_to_check|
        unless recommendation_type_allowable_values.include?(val_to_check)
          raise "Invalid value for 'recommendation_type', must be one of LINK_GLOSSARY_TERM."
        end
      end
      raise "Missing the required parameter 'source_object_key' when calling recommendations." if source_object_key.nil?
      raise "Missing the required parameter 'source_object_type' when calling recommendations." if source_object_type.nil?
      unless OCI::DataCatalog::Models::RECOMMENDATION_RESOURCE_TYPE_ENUM.include?(source_object_type)
        raise 'Invalid value for "source_object_type", must be one of the values in OCI::DataCatalog::Models::RECOMMENDATION_RESOURCE_TYPE_ENUM.'
      end


      if opts[:recommendation_status] && !OCI::DataCatalog::Models::RECOMMENDATION_STATUS_ENUM.include?(opts[:recommendation_status])
        raise 'Invalid value for "recommendation_status", must be one of the values in OCI::DataCatalog::Models::RECOMMENDATION_STATUS_ENUM.'
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)

      path = '/catalogs/{catalogId}/actions/getRecommendations'.sub('{catalogId}', catalog_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:recommendationType] = OCI::ApiClient.build_collection_params(recommendation_type, :multi)
      query_params[:sourceObjectKey] = source_object_key
      query_params[:sourceObjectType] = source_object_type
      query_params[:recommendationStatus] = opts[:recommendation_status] if opts[:recommendation_status]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#recommendations') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::RecommendationCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Remove data selector pattern from the data asset.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [OCI::DataCatalog::Models::DataSelectorPatternDetails] data_selector_pattern_details The information used to remove the data selector patterns.
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
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::DataAsset DataAsset}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/remove_data_selector_patterns.rb.html) to see an example of how to use remove_data_selector_patterns API.
    def remove_data_selector_patterns(catalog_id, data_asset_key, data_selector_pattern_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#remove_data_selector_patterns.' if logger

      raise "Missing the required parameter 'catalog_id' when calling remove_data_selector_patterns." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling remove_data_selector_patterns." if data_asset_key.nil?
      raise "Missing the required parameter 'data_selector_pattern_details' when calling remove_data_selector_patterns." if data_selector_pattern_details.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/actions/removeDataSelectorPatterns'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s)
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
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(data_selector_pattern_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#remove_data_selector_patterns') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::DataAsset'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of search results within a data catalog.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [OCI::DataCatalog::Models::SearchCriteria] :search_criteria_details The information used to create an extended search results.
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given. The match is not case sensitive.
    # @option opts [String] :name Immutable resource name.
    # @option opts [String] :lifecycle_state A filter to return only resources that match the specified lifecycle state. The value is case insensitive.
    # @option opts [String] :timeout A search timeout string (for example, timeout=4000ms), bounding the search request to be executed within the
    #   specified time value and bail with the hits accumulated up to that point when expired.
    #   Defaults to no timeout.
    #
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'.
    #   Allowed values are: ASC, DESC
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::SearchResultCollection SearchResultCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/search_criteria.rb.html) to see an example of how to use search_criteria API.
    def search_criteria(catalog_id, opts = {})
      logger.debug 'Calling operation DataCatalogClient#search_criteria.' if logger

      raise "Missing the required parameter 'catalog_id' when calling search_criteria." if catalog_id.nil?

      if opts[:lifecycle_state] && !OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataCatalog::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)

      path = '/catalogs/{catalogId}/search'.sub('{catalogId}', catalog_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:timeout] = opts[:timeout] if opts[:timeout]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(opts[:search_criteria_details])

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#search_criteria') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::SearchResultCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of potential string matches for a given input string.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] input_text Text input string used for computing potential matching suggestions.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :timeout A search timeout string (for example, timeout=4000ms), bounding the search request to be executed within the
    #   specified time value and bail with the hits accumulated up to that point when expired.
    #   Defaults to no timeout.
    #
    # @option opts [Integer] :limit Limit for the list of potential matches returned from the Suggest API. If not specified, will default to 10.
    #    (default to 10)
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::SuggestResults SuggestResults}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/suggest_matches.rb.html) to see an example of how to use suggest_matches API.
    def suggest_matches(catalog_id, input_text, opts = {})
      logger.debug 'Calling operation DataCatalogClient#suggest_matches.' if logger

      raise "Missing the required parameter 'catalog_id' when calling suggest_matches." if catalog_id.nil?
      raise "Missing the required parameter 'input_text' when calling suggest_matches." if input_text.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)

      path = '/catalogs/{catalogId}/actions/suggest'.sub('{catalogId}', catalog_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:inputText] = input_text
      query_params[:timeout] = opts[:timeout] if opts[:timeout]
      query_params[:limit] = opts[:limit] if opts[:limit]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#suggest_matches') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::SuggestResults'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Export technical objects from a Data Asset
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [OCI::DataCatalog::Models::ExportDataAssetDetails] synchronous_export_data_asset_details The details of what needs to be exported.
    # @param [Array<String>] export_type Type of export.
    #   Allowed values are: CUSTOM_PROPERTY_VALUES, ALL
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
    # @option opts [String, IO] :response_target Streaming http body into a file (specified by file name or File object) or IO object if the block is not given
    # @option [Block] &block Streaming http body to the block
    # @return [Response] A Response object with data of type String if response_target and block are not given, otherwise with nil data
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/synchronous_export_data_asset.rb.html) to see an example of how to use synchronous_export_data_asset API.
    def synchronous_export_data_asset(catalog_id, data_asset_key, synchronous_export_data_asset_details, export_type, opts = {}, &block)
      logger.debug 'Calling operation DataCatalogClient#synchronous_export_data_asset.' if logger

      raise "Missing the required parameter 'catalog_id' when calling synchronous_export_data_asset." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling synchronous_export_data_asset." if data_asset_key.nil?
      raise "Missing the required parameter 'synchronous_export_data_asset_details' when calling synchronous_export_data_asset." if synchronous_export_data_asset_details.nil?
      raise "Missing the required parameter 'export_type' when calling synchronous_export_data_asset." if export_type.nil?

      export_type_allowable_values = %w[CUSTOM_PROPERTY_VALUES ALL]
      export_type.each do |val_to_check|
        unless export_type_allowable_values.include?(val_to_check)
          raise "Invalid value for 'export_type', must be one of CUSTOM_PROPERTY_VALUES, ALL."
        end
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/actions/synchronousExport'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:exportType] = OCI::ApiClient.build_collection_params(export_type, :multi)

      # Header Params
      header_params = {}
      header_params[:accept] = opts[:accept] if opts[:accept]
      header_params[:accept] ||= 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
      header_params[:'accept-encoding'] = opts[:accept_encoding] if opts[:accept_encoding]
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(synchronous_export_data_asset_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#synchronous_export_data_asset') do
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


    # Test the connection by connecting to the data asset using credentials in the metadata.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [String] connection_key Unique connection key.
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
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::ValidateConnectionResult ValidateConnectionResult}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/test_connection.rb.html) to see an example of how to use test_connection API.
    def test_connection(catalog_id, data_asset_key, connection_key, opts = {})
      logger.debug 'Calling operation DataCatalogClient#test_connection.' if logger

      raise "Missing the required parameter 'catalog_id' when calling test_connection." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling test_connection." if data_asset_key.nil?
      raise "Missing the required parameter 'connection_key' when calling test_connection." if connection_key.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)
      raise "Parameter value for 'connection_key' must not be blank" if OCI::Internal::Util.blank_string?(connection_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/connections/{connectionKey}/actions/test'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s).sub('{connectionKey}', connection_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#test_connection') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::ValidateConnectionResult'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates a specific data asset attribute.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [String] entity_key Unique entity key.
    # @param [String] attribute_key Unique attribute key.
    # @param [OCI::DataCatalog::Models::UpdateAttributeDetails] update_attribute_details The information to be updated in the attribute.
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
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::Attribute Attribute}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/update_attribute.rb.html) to see an example of how to use update_attribute API.
    def update_attribute(catalog_id, data_asset_key, entity_key, attribute_key, update_attribute_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#update_attribute.' if logger

      raise "Missing the required parameter 'catalog_id' when calling update_attribute." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling update_attribute." if data_asset_key.nil?
      raise "Missing the required parameter 'entity_key' when calling update_attribute." if entity_key.nil?
      raise "Missing the required parameter 'attribute_key' when calling update_attribute." if attribute_key.nil?
      raise "Missing the required parameter 'update_attribute_details' when calling update_attribute." if update_attribute_details.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)
      raise "Parameter value for 'entity_key' must not be blank" if OCI::Internal::Util.blank_string?(entity_key)
      raise "Parameter value for 'attribute_key' must not be blank" if OCI::Internal::Util.blank_string?(attribute_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/entities/{entityKey}/attributes/{attributeKey}'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s).sub('{entityKey}', entity_key.to_s).sub('{attributeKey}', attribute_key.to_s)
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

      post_body = @api_client.object_to_http_body(update_attribute_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#update_attribute') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::Attribute'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the data catalog.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [OCI::DataCatalog::Models::UpdateCatalogDetails] update_catalog_details The data catalog information to be updated.
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
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::Catalog Catalog}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/update_catalog.rb.html) to see an example of how to use update_catalog API.
    def update_catalog(catalog_id, update_catalog_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#update_catalog.' if logger

      raise "Missing the required parameter 'catalog_id' when calling update_catalog." if catalog_id.nil?
      raise "Missing the required parameter 'update_catalog_details' when calling update_catalog." if update_catalog_details.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)

      path = '/catalogs/{catalogId}'.sub('{catalogId}', catalog_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_catalog_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#update_catalog') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::Catalog'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the private reverse connection endpoint.
    # @param [String] catalog_private_endpoint_id Unique private reverse connection identifier.
    # @param [OCI::DataCatalog::Models::UpdateCatalogPrivateEndpointDetails] update_catalog_private_endpoint_details The information to be updated in private reverse connection
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/update_catalog_private_endpoint.rb.html) to see an example of how to use update_catalog_private_endpoint API.
    def update_catalog_private_endpoint(catalog_private_endpoint_id, update_catalog_private_endpoint_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#update_catalog_private_endpoint.' if logger

      raise "Missing the required parameter 'catalog_private_endpoint_id' when calling update_catalog_private_endpoint." if catalog_private_endpoint_id.nil?
      raise "Missing the required parameter 'update_catalog_private_endpoint_details' when calling update_catalog_private_endpoint." if update_catalog_private_endpoint_details.nil?
      raise "Parameter value for 'catalog_private_endpoint_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_private_endpoint_id)

      path = '/catalogPrivateEndpoints/{catalogPrivateEndpointId}'.sub('{catalogPrivateEndpointId}', catalog_private_endpoint_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_catalog_private_endpoint_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#update_catalog_private_endpoint') do
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


    # Updates a specific connection of a data asset.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [String] connection_key Unique connection key.
    # @param [OCI::DataCatalog::Models::UpdateConnectionDetails] update_connection_details The information to be updated in the connection.
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
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::Connection Connection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/update_connection.rb.html) to see an example of how to use update_connection API.
    def update_connection(catalog_id, data_asset_key, connection_key, update_connection_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#update_connection.' if logger

      raise "Missing the required parameter 'catalog_id' when calling update_connection." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling update_connection." if data_asset_key.nil?
      raise "Missing the required parameter 'connection_key' when calling update_connection." if connection_key.nil?
      raise "Missing the required parameter 'update_connection_details' when calling update_connection." if update_connection_details.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)
      raise "Parameter value for 'connection_key' must not be blank" if OCI::Internal::Util.blank_string?(connection_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/connections/{connectionKey}'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s).sub('{connectionKey}', connection_key.to_s)
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

      post_body = @api_client.object_to_http_body(update_connection_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#update_connection') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::Connection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates a specific custom property identified by the given key.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] namespace_id Unique namespace identifier.
    # @param [String] custom_property_key Unique Custom Property key
    # @param [OCI::DataCatalog::Models::UpdateCustomPropertyDetails] update_custom_property_details The information to be updated in the custom property.
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
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::CustomProperty CustomProperty}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/update_custom_property.rb.html) to see an example of how to use update_custom_property API.
    def update_custom_property(catalog_id, namespace_id, custom_property_key, update_custom_property_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#update_custom_property.' if logger

      raise "Missing the required parameter 'catalog_id' when calling update_custom_property." if catalog_id.nil?
      raise "Missing the required parameter 'namespace_id' when calling update_custom_property." if namespace_id.nil?
      raise "Missing the required parameter 'custom_property_key' when calling update_custom_property." if custom_property_key.nil?
      raise "Missing the required parameter 'update_custom_property_details' when calling update_custom_property." if update_custom_property_details.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'namespace_id' must not be blank" if OCI::Internal::Util.blank_string?(namespace_id)
      raise "Parameter value for 'custom_property_key' must not be blank" if OCI::Internal::Util.blank_string?(custom_property_key)

      path = '/catalogs/{catalogId}/namespaces/{namespaceId}/customProperties/{customPropertyKey}'.sub('{catalogId}', catalog_id.to_s).sub('{namespaceId}', namespace_id.to_s).sub('{customPropertyKey}', custom_property_key.to_s)
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

      post_body = @api_client.object_to_http_body(update_custom_property_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#update_custom_property') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::CustomProperty'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates a specific data asset identified by the given key.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [OCI::DataCatalog::Models::UpdateDataAssetDetails] update_data_asset_details The information to be updated in the data asset.
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
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::DataAsset DataAsset}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/update_data_asset.rb.html) to see an example of how to use update_data_asset API.
    def update_data_asset(catalog_id, data_asset_key, update_data_asset_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#update_data_asset.' if logger

      raise "Missing the required parameter 'catalog_id' when calling update_data_asset." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling update_data_asset." if data_asset_key.nil?
      raise "Missing the required parameter 'update_data_asset_details' when calling update_data_asset." if update_data_asset_details.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s)
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

      post_body = @api_client.object_to_http_body(update_data_asset_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#update_data_asset') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::DataAsset'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates a specific data entity.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [String] entity_key Unique entity key.
    # @param [OCI::DataCatalog::Models::UpdateEntityDetails] update_entity_details The information to be updated in the data entity.
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
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::Entity Entity}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/update_entity.rb.html) to see an example of how to use update_entity API.
    def update_entity(catalog_id, data_asset_key, entity_key, update_entity_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#update_entity.' if logger

      raise "Missing the required parameter 'catalog_id' when calling update_entity." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling update_entity." if data_asset_key.nil?
      raise "Missing the required parameter 'entity_key' when calling update_entity." if entity_key.nil?
      raise "Missing the required parameter 'update_entity_details' when calling update_entity." if update_entity_details.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)
      raise "Parameter value for 'entity_key' must not be blank" if OCI::Internal::Util.blank_string?(entity_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/entities/{entityKey}'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s).sub('{entityKey}', entity_key.to_s)
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

      post_body = @api_client.object_to_http_body(update_entity_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#update_entity') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::Entity'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates a specific folder of a data asset.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [String] folder_key Unique folder key.
    # @param [OCI::DataCatalog::Models::UpdateFolderDetails] update_folder_details The information to be updated in the folder.
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
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::Folder Folder}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/update_folder.rb.html) to see an example of how to use update_folder API.
    def update_folder(catalog_id, data_asset_key, folder_key, update_folder_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#update_folder.' if logger

      raise "Missing the required parameter 'catalog_id' when calling update_folder." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling update_folder." if data_asset_key.nil?
      raise "Missing the required parameter 'folder_key' when calling update_folder." if folder_key.nil?
      raise "Missing the required parameter 'update_folder_details' when calling update_folder." if update_folder_details.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)
      raise "Parameter value for 'folder_key' must not be blank" if OCI::Internal::Util.blank_string?(folder_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/folders/{folderKey}'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s).sub('{folderKey}', folder_key.to_s)
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

      post_body = @api_client.object_to_http_body(update_folder_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#update_folder') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::Folder'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates a specific glossary identified by the given key.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] glossary_key Unique glossary key.
    # @param [OCI::DataCatalog::Models::UpdateGlossaryDetails] update_glossary_details The information to be updated in the glossary.
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
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::Glossary Glossary}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/update_glossary.rb.html) to see an example of how to use update_glossary API.
    def update_glossary(catalog_id, glossary_key, update_glossary_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#update_glossary.' if logger

      raise "Missing the required parameter 'catalog_id' when calling update_glossary." if catalog_id.nil?
      raise "Missing the required parameter 'glossary_key' when calling update_glossary." if glossary_key.nil?
      raise "Missing the required parameter 'update_glossary_details' when calling update_glossary." if update_glossary_details.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'glossary_key' must not be blank" if OCI::Internal::Util.blank_string?(glossary_key)

      path = '/catalogs/{catalogId}/glossaries/{glossaryKey}'.sub('{catalogId}', catalog_id.to_s).sub('{glossaryKey}', glossary_key.to_s)
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

      post_body = @api_client.object_to_http_body(update_glossary_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#update_glossary') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::Glossary'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates a specific job identified by the given key.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] job_key Unique job key.
    # @param [OCI::DataCatalog::Models::UpdateJobDetails] update_job_details The information to be updated in the job.
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
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::Job Job}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/update_job.rb.html) to see an example of how to use update_job API.
    def update_job(catalog_id, job_key, update_job_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#update_job.' if logger

      raise "Missing the required parameter 'catalog_id' when calling update_job." if catalog_id.nil?
      raise "Missing the required parameter 'job_key' when calling update_job." if job_key.nil?
      raise "Missing the required parameter 'update_job_details' when calling update_job." if update_job_details.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'job_key' must not be blank" if OCI::Internal::Util.blank_string?(job_key)

      path = '/catalogs/{catalogId}/jobs/{jobKey}'.sub('{catalogId}', catalog_id.to_s).sub('{jobKey}', job_key.to_s)
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

      post_body = @api_client.object_to_http_body(update_job_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#update_job') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::Job'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Update a specific job definition identified by the given key.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] job_definition_key Unique job definition key.
    # @param [OCI::DataCatalog::Models::UpdateJobDefinitionDetails] update_job_definition_details The information to be updated in the job definition.
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
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::JobDefinition JobDefinition}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/update_job_definition.rb.html) to see an example of how to use update_job_definition API.
    def update_job_definition(catalog_id, job_definition_key, update_job_definition_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#update_job_definition.' if logger

      raise "Missing the required parameter 'catalog_id' when calling update_job_definition." if catalog_id.nil?
      raise "Missing the required parameter 'job_definition_key' when calling update_job_definition." if job_definition_key.nil?
      raise "Missing the required parameter 'update_job_definition_details' when calling update_job_definition." if update_job_definition_details.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'job_definition_key' must not be blank" if OCI::Internal::Util.blank_string?(job_definition_key)

      path = '/catalogs/{catalogId}/jobDefinitions/{jobDefinitionKey}'.sub('{catalogId}', catalog_id.to_s).sub('{jobDefinitionKey}', job_definition_key.to_s)
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

      post_body = @api_client.object_to_http_body(update_job_definition_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#update_job_definition') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::JobDefinition'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates a metastore resource by identifier.
    # @param [String] metastore_id The metastore's OCID.
    # @param [OCI::DataCatalog::Models::UpdateMetastoreDetails] update_metastore_details The metastore information to be updated.
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
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::Metastore Metastore}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/update_metastore.rb.html) to see an example of how to use update_metastore API.
    def update_metastore(metastore_id, update_metastore_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#update_metastore.' if logger

      raise "Missing the required parameter 'metastore_id' when calling update_metastore." if metastore_id.nil?
      raise "Missing the required parameter 'update_metastore_details' when calling update_metastore." if update_metastore_details.nil?
      raise "Parameter value for 'metastore_id' must not be blank" if OCI::Internal::Util.blank_string?(metastore_id)

      path = '/metastores/{metastoreId}'.sub('{metastoreId}', metastore_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_metastore_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#update_metastore') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::Metastore'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates a specific namespace identified by the given key.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] namespace_id Unique namespace identifier.
    # @param [OCI::DataCatalog::Models::UpdateNamespaceDetails] update_namespace_details The information to be updated in the namespace.
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
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::Namespace Namespace}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/update_namespace.rb.html) to see an example of how to use update_namespace API.
    def update_namespace(catalog_id, namespace_id, update_namespace_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#update_namespace.' if logger

      raise "Missing the required parameter 'catalog_id' when calling update_namespace." if catalog_id.nil?
      raise "Missing the required parameter 'namespace_id' when calling update_namespace." if namespace_id.nil?
      raise "Missing the required parameter 'update_namespace_details' when calling update_namespace." if update_namespace_details.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'namespace_id' must not be blank" if OCI::Internal::Util.blank_string?(namespace_id)

      path = '/catalogs/{catalogId}/namespaces/{namespaceId}'.sub('{catalogId}', catalog_id.to_s).sub('{namespaceId}', namespace_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_namespace_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#update_namespace') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::Namespace'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates a specific pattern identified by the given key.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] pattern_key Unique pattern key.
    # @param [OCI::DataCatalog::Models::UpdatePatternDetails] update_pattern_details The information to be updated in the pattern.
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
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::Pattern Pattern}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/update_pattern.rb.html) to see an example of how to use update_pattern API.
    def update_pattern(catalog_id, pattern_key, update_pattern_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#update_pattern.' if logger

      raise "Missing the required parameter 'catalog_id' when calling update_pattern." if catalog_id.nil?
      raise "Missing the required parameter 'pattern_key' when calling update_pattern." if pattern_key.nil?
      raise "Missing the required parameter 'update_pattern_details' when calling update_pattern." if update_pattern_details.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'pattern_key' must not be blank" if OCI::Internal::Util.blank_string?(pattern_key)

      path = '/catalogs/{catalogId}/patterns/{patternKey}'.sub('{catalogId}', catalog_id.to_s).sub('{patternKey}', pattern_key.to_s)
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

      post_body = @api_client.object_to_http_body(update_pattern_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#update_pattern') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::Pattern'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates a specific glossary term.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] glossary_key Unique glossary key.
    # @param [String] term_key Unique glossary term key.
    # @param [OCI::DataCatalog::Models::UpdateTermDetails] update_term_details The information to be updated in the term.
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
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::Term Term}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/update_term.rb.html) to see an example of how to use update_term API.
    def update_term(catalog_id, glossary_key, term_key, update_term_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#update_term.' if logger

      raise "Missing the required parameter 'catalog_id' when calling update_term." if catalog_id.nil?
      raise "Missing the required parameter 'glossary_key' when calling update_term." if glossary_key.nil?
      raise "Missing the required parameter 'term_key' when calling update_term." if term_key.nil?
      raise "Missing the required parameter 'update_term_details' when calling update_term." if update_term_details.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'glossary_key' must not be blank" if OCI::Internal::Util.blank_string?(glossary_key)
      raise "Parameter value for 'term_key' must not be blank" if OCI::Internal::Util.blank_string?(term_key)

      path = '/catalogs/{catalogId}/glossaries/{glossaryKey}/terms/{termKey}'.sub('{catalogId}', catalog_id.to_s).sub('{glossaryKey}', glossary_key.to_s).sub('{termKey}', term_key.to_s)
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

      post_body = @api_client.object_to_http_body(update_term_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#update_term') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::Term'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates a specific glossary term relationship.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] glossary_key Unique glossary key.
    # @param [String] term_key Unique glossary term key.
    # @param [String] term_relationship_key Unique glossary term relationship key.
    # @param [OCI::DataCatalog::Models::UpdateTermRelationshipDetails] update_term_relationship_details The information to be updated in the term relationship.
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
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::TermRelationship TermRelationship}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/update_term_relationship.rb.html) to see an example of how to use update_term_relationship API.
    def update_term_relationship(catalog_id, glossary_key, term_key, term_relationship_key, update_term_relationship_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#update_term_relationship.' if logger

      raise "Missing the required parameter 'catalog_id' when calling update_term_relationship." if catalog_id.nil?
      raise "Missing the required parameter 'glossary_key' when calling update_term_relationship." if glossary_key.nil?
      raise "Missing the required parameter 'term_key' when calling update_term_relationship." if term_key.nil?
      raise "Missing the required parameter 'term_relationship_key' when calling update_term_relationship." if term_relationship_key.nil?
      raise "Missing the required parameter 'update_term_relationship_details' when calling update_term_relationship." if update_term_relationship_details.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'glossary_key' must not be blank" if OCI::Internal::Util.blank_string?(glossary_key)
      raise "Parameter value for 'term_key' must not be blank" if OCI::Internal::Util.blank_string?(term_key)
      raise "Parameter value for 'term_relationship_key' must not be blank" if OCI::Internal::Util.blank_string?(term_relationship_key)

      path = '/catalogs/{catalogId}/glossaries/{glossaryKey}/terms/{termKey}/termRelationships/{termRelationshipKey}'.sub('{catalogId}', catalog_id.to_s).sub('{glossaryKey}', glossary_key.to_s).sub('{termKey}', term_key.to_s).sub('{termRelationshipKey}', term_relationship_key.to_s)
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

      post_body = @api_client.object_to_http_body(update_term_relationship_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#update_term_relationship') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::TermRelationship'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Upload connection credentails and metadata for this connection.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [String] connection_key Unique connection key.
    # @param [OCI::DataCatalog::Models::UploadCredentialsDetails] upload_credentials_details The information used to upload the credentials file and metadata for updating this connection.
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
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::Connection Connection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/upload_credentials.rb.html) to see an example of how to use upload_credentials API.
    def upload_credentials(catalog_id, data_asset_key, connection_key, upload_credentials_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#upload_credentials.' if logger

      raise "Missing the required parameter 'catalog_id' when calling upload_credentials." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling upload_credentials." if data_asset_key.nil?
      raise "Missing the required parameter 'connection_key' when calling upload_credentials." if connection_key.nil?
      raise "Missing the required parameter 'upload_credentials_details' when calling upload_credentials." if upload_credentials_details.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)
      raise "Parameter value for 'connection_key' must not be blank" if OCI::Internal::Util.blank_string?(connection_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/connections/{connectionKey}/actions/uploadCredentials'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s).sub('{connectionKey}', connection_key.to_s)
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
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(upload_credentials_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#upload_credentials') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::Connection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns active users in the system.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'.
    #   Allowed values are: ASC, DESC
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type String
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/users.rb.html) to see an example of how to use users API.
    def users(catalog_id, opts = {})
      logger.debug 'Calling operation DataCatalogClient#users.' if logger

      raise "Missing the required parameter 'catalog_id' when calling users." if catalog_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)

      path = '/catalogs/{catalogId}/actions/users'.sub('{catalogId}', catalog_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#users') do
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
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Validate connection by connecting to the data asset using credentials in metadata.
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] data_asset_key Unique data asset key.
    # @param [OCI::DataCatalog::Models::ValidateConnectionDetails] validate_connection_details The information used to validate the connections.
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
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::ValidateConnectionResult ValidateConnectionResult}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/validate_connection.rb.html) to see an example of how to use validate_connection API.
    def validate_connection(catalog_id, data_asset_key, validate_connection_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#validate_connection.' if logger

      raise "Missing the required parameter 'catalog_id' when calling validate_connection." if catalog_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling validate_connection." if data_asset_key.nil?
      raise "Missing the required parameter 'validate_connection_details' when calling validate_connection." if validate_connection_details.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)

      path = '/catalogs/{catalogId}/dataAssets/{dataAssetKey}/actions/validateConnection'.sub('{catalogId}', catalog_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s)
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

      post_body = @api_client.object_to_http_body(validate_connection_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#validate_connection') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::ValidateConnectionResult'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Validate pattern by deriving file groups representing logical entities using the expression
    # @param [String] catalog_id Unique catalog identifier.
    # @param [String] pattern_key Unique pattern key.
    # @param [OCI::DataCatalog::Models::ValidatePatternDetails] validate_pattern_details The information used to validate the pattern.
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
    # @return [Response] A Response object with data of type {OCI::DataCatalog::Models::ValidatePatternResult ValidatePatternResult}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datacatalog/validate_pattern.rb.html) to see an example of how to use validate_pattern API.
    def validate_pattern(catalog_id, pattern_key, validate_pattern_details, opts = {})
      logger.debug 'Calling operation DataCatalogClient#validate_pattern.' if logger

      raise "Missing the required parameter 'catalog_id' when calling validate_pattern." if catalog_id.nil?
      raise "Missing the required parameter 'pattern_key' when calling validate_pattern." if pattern_key.nil?
      raise "Missing the required parameter 'validate_pattern_details' when calling validate_pattern." if validate_pattern_details.nil?
      raise "Parameter value for 'catalog_id' must not be blank" if OCI::Internal::Util.blank_string?(catalog_id)
      raise "Parameter value for 'pattern_key' must not be blank" if OCI::Internal::Util.blank_string?(pattern_key)

      path = '/catalogs/{catalogId}/patterns/{patternKey}/actions/validate'.sub('{catalogId}', catalog_id.to_s).sub('{patternKey}', pattern_key.to_s)
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

      post_body = @api_client.object_to_http_body(validate_pattern_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataCatalogClient#validate_pattern') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataCatalog::Models::ValidatePatternResult'
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