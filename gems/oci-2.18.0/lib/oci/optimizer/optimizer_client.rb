# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Use the Cloud Advisor API to find potential inefficiencies in your tenancy and address them.
  # Cloud Advisor can help you save money, improve performance, strengthen system resilience, and improve security.
  # For more information, see [Cloud Advisor](/Content/CloudAdvisor/Concepts/cloudadvisoroverview.htm).
  class Optimizer::OptimizerClient
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


    # Creates a new OptimizerClient.
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
        @endpoint = endpoint + '/20200606'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "OptimizerClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://optimizer.{region}.oci.{secondLevelDomain}') + '/20200606'
      logger.info "OptimizerClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Applies the specified recommendations to the resources.
    #
    # @param [String] recommendation_id The unique OCID associated with the recommendation.
    # @param [OCI::Optimizer::Models::BulkApplyRecommendationsDetails] bulk_apply_recommendations_details Details about bulk recommendation actions.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/optimizer/bulk_apply_recommendations.rb.html) to see an example of how to use bulk_apply_recommendations API.
    def bulk_apply_recommendations(recommendation_id, bulk_apply_recommendations_details, opts = {})
      logger.debug 'Calling operation OptimizerClient#bulk_apply_recommendations.' if logger

      raise "Missing the required parameter 'recommendation_id' when calling bulk_apply_recommendations." if recommendation_id.nil?
      raise "Missing the required parameter 'bulk_apply_recommendations_details' when calling bulk_apply_recommendations." if bulk_apply_recommendations_details.nil?
      raise "Parameter value for 'recommendation_id' must not be blank" if OCI::Internal::Util.blank_string?(recommendation_id)

      path = '/recommendations/{recommendationId}/actions/bulkApplyRecommendations'.sub('{recommendationId}', recommendation_id.to_s)
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

      post_body = @api_client.object_to_http_body(bulk_apply_recommendations_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OptimizerClient#bulk_apply_recommendations') do
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


    # Creates a new profile.
    #
    # @param [OCI::Optimizer::Models::CreateProfileDetails] create_profile_details Details for creating the profile.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Optimizer::Models::Profile Profile}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/optimizer/create_profile.rb.html) to see an example of how to use create_profile API.
    def create_profile(create_profile_details, opts = {})
      logger.debug 'Calling operation OptimizerClient#create_profile.' if logger

      raise "Missing the required parameter 'create_profile_details' when calling create_profile." if create_profile_details.nil?

      path = '/profiles'
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

      post_body = @api_client.object_to_http_body(create_profile_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OptimizerClient#create_profile') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Optimizer::Models::Profile'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Deletes the specified profile. Uses the profile's OCID to determine which profile to delete.
    #
    # @param [String] profile_id The unique OCID of the profile.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/optimizer/delete_profile.rb.html) to see an example of how to use delete_profile API.
    def delete_profile(profile_id, opts = {})
      logger.debug 'Calling operation OptimizerClient#delete_profile.' if logger

      raise "Missing the required parameter 'profile_id' when calling delete_profile." if profile_id.nil?
      raise "Parameter value for 'profile_id' must not be blank" if OCI::Internal::Util.blank_string?(profile_id)

      path = '/profiles/{profileId}'.sub('{profileId}', profile_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OptimizerClient#delete_profile') do
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


    # Queries the Cloud Advisor resource actions that are supported by the specified recommendation.
    #
    # @param [String] compartment_id The OCID of the compartment.
    # @param [BOOLEAN] compartment_id_in_subtree When set to true, the hierarchy of compartments is traversed and all compartments and subcompartments in the tenancy are returned depending on the the setting of `accessLevel`.
    #
    #   Can only be set to true when performing ListCompartments on the tenancy (root compartment).
    #
    # @param [String] recommendation_id The unique OCID associated with the recommendation.
    # @param [OCI::Optimizer::Models::QueryDetails] query_details The request parameters that describe the query criteria.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call. (default to 10)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Optimizer::Models::ResourceActionCollection ResourceActionCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/optimizer/filter_resource_actions.rb.html) to see an example of how to use filter_resource_actions API.
    def filter_resource_actions(compartment_id, compartment_id_in_subtree, recommendation_id, query_details, opts = {})
      logger.debug 'Calling operation OptimizerClient#filter_resource_actions.' if logger

      raise "Missing the required parameter 'compartment_id' when calling filter_resource_actions." if compartment_id.nil?
      raise "Missing the required parameter 'compartment_id_in_subtree' when calling filter_resource_actions." if compartment_id_in_subtree.nil?
      raise "Missing the required parameter 'recommendation_id' when calling filter_resource_actions." if recommendation_id.nil?
      raise "Missing the required parameter 'query_details' when calling filter_resource_actions." if query_details.nil?

      path = '/actions/filterResourceActions'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:compartmentIdInSubtree] = compartment_id_in_subtree
      query_params[:recommendationId] = recommendation_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(query_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OptimizerClient#filter_resource_actions') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Optimizer::Models::ResourceActionCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the category that corresponds to the specified OCID.
    #
    # @param [String] category_id The unique OCID associated with the category.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Optimizer::Models::Category Category}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/optimizer/get_category.rb.html) to see an example of how to use get_category API.
    def get_category(category_id, opts = {})
      logger.debug 'Calling operation OptimizerClient#get_category.' if logger

      raise "Missing the required parameter 'category_id' when calling get_category." if category_id.nil?
      raise "Parameter value for 'category_id' must not be blank" if OCI::Internal::Util.blank_string?(category_id)

      path = '/categories/{categoryId}'.sub('{categoryId}', category_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OptimizerClient#get_category') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Optimizer::Models::Category'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the Cloud Advisor enrollment status.
    #
    # @param [String] enrollment_status_id The unique OCID associated with the enrollment status.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Optimizer::Models::EnrollmentStatus EnrollmentStatus}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/optimizer/get_enrollment_status.rb.html) to see an example of how to use get_enrollment_status API.
    def get_enrollment_status(enrollment_status_id, opts = {})
      logger.debug 'Calling operation OptimizerClient#get_enrollment_status.' if logger

      raise "Missing the required parameter 'enrollment_status_id' when calling get_enrollment_status." if enrollment_status_id.nil?
      raise "Parameter value for 'enrollment_status_id' must not be blank" if OCI::Internal::Util.blank_string?(enrollment_status_id)

      path = '/enrollmentStatus/{enrollmentStatusId}'.sub('{enrollmentStatusId}', enrollment_status_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OptimizerClient#get_enrollment_status') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Optimizer::Models::EnrollmentStatus'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the specified profile's information. Uses the profile's OCID to determine which profile to retrieve.
    #
    # @param [String] profile_id The unique OCID of the profile.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Optimizer::Models::Profile Profile}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/optimizer/get_profile.rb.html) to see an example of how to use get_profile API.
    def get_profile(profile_id, opts = {})
      logger.debug 'Calling operation OptimizerClient#get_profile.' if logger

      raise "Missing the required parameter 'profile_id' when calling get_profile." if profile_id.nil?
      raise "Parameter value for 'profile_id' must not be blank" if OCI::Internal::Util.blank_string?(profile_id)

      path = '/profiles/{profileId}'.sub('{profileId}', profile_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OptimizerClient#get_profile') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Optimizer::Models::Profile'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the recommendation for the specified OCID.
    #
    # @param [String] recommendation_id The unique OCID associated with the recommendation.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Optimizer::Models::Recommendation Recommendation}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/optimizer/get_recommendation.rb.html) to see an example of how to use get_recommendation API.
    def get_recommendation(recommendation_id, opts = {})
      logger.debug 'Calling operation OptimizerClient#get_recommendation.' if logger

      raise "Missing the required parameter 'recommendation_id' when calling get_recommendation." if recommendation_id.nil?
      raise "Parameter value for 'recommendation_id' must not be blank" if OCI::Internal::Util.blank_string?(recommendation_id)

      path = '/recommendations/{recommendationId}'.sub('{recommendationId}', recommendation_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OptimizerClient#get_recommendation') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Optimizer::Models::Recommendation'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the resource action that corresponds to the specified OCID.
    #
    # @param [String] resource_action_id The unique OCID associated with the resource action.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Optimizer::Models::ResourceAction ResourceAction}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/optimizer/get_resource_action.rb.html) to see an example of how to use get_resource_action API.
    def get_resource_action(resource_action_id, opts = {})
      logger.debug 'Calling operation OptimizerClient#get_resource_action.' if logger

      raise "Missing the required parameter 'resource_action_id' when calling get_resource_action." if resource_action_id.nil?
      raise "Parameter value for 'resource_action_id' must not be blank" if OCI::Internal::Util.blank_string?(resource_action_id)

      path = '/resourceActions/{resourceActionId}'.sub('{resourceActionId}', resource_action_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OptimizerClient#get_resource_action') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Optimizer::Models::ResourceAction'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the status of the work request associated with the specified ID.
    # @param [String] work_request_id The OCID of the work request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Optimizer::Models::WorkRequest WorkRequest}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/optimizer/get_work_request.rb.html) to see an example of how to use get_work_request API.
    def get_work_request(work_request_id, opts = {})
      logger.debug 'Calling operation OptimizerClient#get_work_request.' if logger

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OptimizerClient#get_work_request') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Optimizer::Models::WorkRequest'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the supported Cloud Advisor categories.
    #
    # @param [String] compartment_id The OCID of the compartment.
    # @param [BOOLEAN] compartment_id_in_subtree When set to true, the hierarchy of compartments is traversed and all compartments and subcompartments in the tenancy are returned depending on the the setting of `accessLevel`.
    #
    #   Can only be set to true when performing ListCompartments on the tenancy (root compartment).
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :name Optional. A filter that returns results that match the name specified.
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call. (default to 10)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    # @option opts [String] :sort_by The field to sort by. You can provide one sort order (`sortOrder`). Default order for TIMECREATED is descending. Default order for NAME is ascending. The NAME sort order is case sensitive.
    #
    #   Allowed values are: NAME, TIMECREATED
    # @option opts [String] :lifecycle_state A filter that returns results that match the lifecycle state specified.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Optimizer::Models::CategoryCollection CategoryCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/optimizer/list_categories.rb.html) to see an example of how to use list_categories API.
    def list_categories(compartment_id, compartment_id_in_subtree, opts = {})
      logger.debug 'Calling operation OptimizerClient#list_categories.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_categories." if compartment_id.nil?
      raise "Missing the required parameter 'compartment_id_in_subtree' when calling list_categories." if compartment_id_in_subtree.nil?

      if opts[:sort_order] && !OCI::Optimizer::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Optimizer::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[NAME TIMECREATED].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of NAME, TIMECREATED.'
      end

      if opts[:lifecycle_state] && !OCI::Optimizer::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Optimizer::Models::LIFECYCLE_STATE_ENUM.'
      end

      path = '/categories'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:compartmentIdInSubtree] = compartment_id_in_subtree
      query_params[:name] = opts[:name] if opts[:name]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OptimizerClient#list_categories') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Optimizer::Models::CategoryCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the Cloud Advisor enrollment statuses.
    #
    # @param [String] compartment_id The OCID of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call. (default to 10)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    # @option opts [String] :sort_by The field to sort by. You can provide one sort order (`sortOrder`). Default order for TIMECREATED is descending. Default order for NAME is ascending. The NAME sort order is case sensitive.
    #
    #   Allowed values are: NAME, TIMECREATED
    # @option opts [String] :lifecycle_state A filter that returns results that match the lifecycle state specified.
    #
    # @option opts [String] :status A filter that returns results that match the Cloud Advisor enrollment status specified.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Optimizer::Models::EnrollmentStatusCollection EnrollmentStatusCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/optimizer/list_enrollment_statuses.rb.html) to see an example of how to use list_enrollment_statuses API.
    def list_enrollment_statuses(compartment_id, opts = {})
      logger.debug 'Calling operation OptimizerClient#list_enrollment_statuses.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_enrollment_statuses." if compartment_id.nil?

      if opts[:sort_order] && !OCI::Optimizer::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Optimizer::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[NAME TIMECREATED].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of NAME, TIMECREATED.'
      end

      if opts[:lifecycle_state] && !OCI::Optimizer::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Optimizer::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:status] && !OCI::Optimizer::Models::OPTIMIZER_ENROLLMENT_STATUS_ENUM.include?(opts[:status])
        raise 'Invalid value for "status", must be one of the values in OCI::Optimizer::Models::OPTIMIZER_ENROLLMENT_STATUS_ENUM.'
      end

      path = '/enrollmentStatus'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:status] = opts[:status] if opts[:status]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OptimizerClient#list_enrollment_statuses') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Optimizer::Models::EnrollmentStatusCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists changes to the recommendations based on user activity.
    # For example, lists when recommendations have been implemented, dismissed, postponed, or reactivated.
    #
    # @param [String] compartment_id The OCID of the compartment.
    # @param [BOOLEAN] compartment_id_in_subtree When set to true, the hierarchy of compartments is traversed and all compartments and subcompartments in the tenancy are returned depending on the the setting of `accessLevel`.
    #
    #   Can only be set to true when performing ListCompartments on the tenancy (root compartment).
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :name Optional. A filter that returns results that match the name specified.
    # @option opts [String] :recommendation_name Optional. A filter that returns results that match the recommendation name specified.
    # @option opts [String] :recommendation_id The unique OCID associated with the recommendation.
    # @option opts [String] :resource_type Optional. A filter that returns results that match the resource type specified.
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call. (default to 10)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    # @option opts [String] :sort_by The field to sort by. You can provide one sort order (`sortOrder`). Default order for TIMECREATED is descending. Default order for NAME is ascending. The NAME sort order is case sensitive.
    #
    #   Allowed values are: NAME, TIMECREATED
    # @option opts [String] :lifecycle_state A filter that returns results that match the lifecycle state specified.
    #
    # @option opts [String] :status A filter that returns recommendations that match the status specified.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Optimizer::Models::HistoryCollection HistoryCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/optimizer/list_histories.rb.html) to see an example of how to use list_histories API.
    def list_histories(compartment_id, compartment_id_in_subtree, opts = {})
      logger.debug 'Calling operation OptimizerClient#list_histories.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_histories." if compartment_id.nil?
      raise "Missing the required parameter 'compartment_id_in_subtree' when calling list_histories." if compartment_id_in_subtree.nil?

      if opts[:sort_order] && !OCI::Optimizer::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Optimizer::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[NAME TIMECREATED].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of NAME, TIMECREATED.'
      end

      if opts[:lifecycle_state] && !OCI::Optimizer::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Optimizer::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:status] && !OCI::Optimizer::Models::STATUS_ENUM.include?(opts[:status])
        raise 'Invalid value for "status", must be one of the values in OCI::Optimizer::Models::STATUS_ENUM.'
      end

      path = '/histories'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:compartmentIdInSubtree] = compartment_id_in_subtree
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:recommendationName] = opts[:recommendation_name] if opts[:recommendation_name]
      query_params[:recommendationId] = opts[:recommendation_id] if opts[:recommendation_id]
      query_params[:resourceType] = opts[:resource_type] if opts[:resource_type]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:status] = opts[:status] if opts[:status]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OptimizerClient#list_histories') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Optimizer::Models::HistoryCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the existing profile levels.
    #
    # @param [String] compartment_id The OCID of the compartment.
    # @param [BOOLEAN] compartment_id_in_subtree When set to true, the hierarchy of compartments is traversed and all compartments and subcompartments in the tenancy are returned depending on the the setting of `accessLevel`.
    #
    #   Can only be set to true when performing ListCompartments on the tenancy (root compartment).
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :name Optional. A filter that returns results that match the name specified.
    # @option opts [String] :recommendation_name Optional. A filter that returns results that match the recommendation name specified.
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call. (default to 10)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    # @option opts [String] :sort_by The field to sort by. You can provide one sort order (`sortOrder`). Default order for TIMECREATED is descending. Default order for NAME is ascending. The NAME sort order is case sensitive.
    #
    #   Allowed values are: NAME, TIMECREATED
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Optimizer::Models::ProfileLevelCollection ProfileLevelCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/optimizer/list_profile_levels.rb.html) to see an example of how to use list_profile_levels API.
    def list_profile_levels(compartment_id, compartment_id_in_subtree, opts = {})
      logger.debug 'Calling operation OptimizerClient#list_profile_levels.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_profile_levels." if compartment_id.nil?
      raise "Missing the required parameter 'compartment_id_in_subtree' when calling list_profile_levels." if compartment_id_in_subtree.nil?

      if opts[:sort_order] && !OCI::Optimizer::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Optimizer::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[NAME TIMECREATED].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of NAME, TIMECREATED.'
      end

      path = '/profileLevels'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:compartmentIdInSubtree] = compartment_id_in_subtree
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:recommendationName] = opts[:recommendation_name] if opts[:recommendation_name]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OptimizerClient#list_profile_levels') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Optimizer::Models::ProfileLevelCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the existing profiles.
    #
    # @param [String] compartment_id The OCID of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :name Optional. A filter that returns results that match the name specified.
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call. (default to 10)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    # @option opts [String] :sort_by The field to sort by. You can provide one sort order (`sortOrder`). Default order for TIMECREATED is descending. Default order for NAME is ascending. The NAME sort order is case sensitive.
    #
    #   Allowed values are: NAME, TIMECREATED
    # @option opts [String] :lifecycle_state A filter that returns results that match the lifecycle state specified.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Optimizer::Models::ProfileCollection ProfileCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/optimizer/list_profiles.rb.html) to see an example of how to use list_profiles API.
    def list_profiles(compartment_id, opts = {})
      logger.debug 'Calling operation OptimizerClient#list_profiles.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_profiles." if compartment_id.nil?

      if opts[:sort_order] && !OCI::Optimizer::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Optimizer::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[NAME TIMECREATED].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of NAME, TIMECREATED.'
      end

      if opts[:lifecycle_state] && !OCI::Optimizer::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Optimizer::Models::LIFECYCLE_STATE_ENUM.'
      end

      path = '/profiles'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:name] = opts[:name] if opts[:name]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OptimizerClient#list_profiles') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Optimizer::Models::ProfileCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the existing strategies.
    #
    # @param [String] compartment_id The OCID of the compartment.
    # @param [BOOLEAN] compartment_id_in_subtree When set to true, the hierarchy of compartments is traversed and all compartments and subcompartments in the tenancy are returned depending on the the setting of `accessLevel`.
    #
    #   Can only be set to true when performing ListCompartments on the tenancy (root compartment).
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :name Optional. A filter that returns results that match the name specified.
    # @option opts [String] :recommendation_name Optional. A filter that returns results that match the recommendation name specified.
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call. (default to 10)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    # @option opts [String] :sort_by The field to sort by. You can provide one sort order (`sortOrder`). Default order for TIMECREATED is descending. Default order for NAME is ascending. The NAME sort order is case sensitive.
    #
    #   Allowed values are: NAME, TIMECREATED
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Optimizer::Models::RecommendationStrategyCollection RecommendationStrategyCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/optimizer/list_recommendation_strategies.rb.html) to see an example of how to use list_recommendation_strategies API.
    def list_recommendation_strategies(compartment_id, compartment_id_in_subtree, opts = {})
      logger.debug 'Calling operation OptimizerClient#list_recommendation_strategies.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_recommendation_strategies." if compartment_id.nil?
      raise "Missing the required parameter 'compartment_id_in_subtree' when calling list_recommendation_strategies." if compartment_id_in_subtree.nil?

      if opts[:sort_order] && !OCI::Optimizer::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Optimizer::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[NAME TIMECREATED].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of NAME, TIMECREATED.'
      end

      path = '/recommendationStrategies'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:compartmentIdInSubtree] = compartment_id_in_subtree
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:recommendationName] = opts[:recommendation_name] if opts[:recommendation_name]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OptimizerClient#list_recommendation_strategies') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Optimizer::Models::RecommendationStrategyCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the Cloud Advisor recommendations that are currently supported in the specified category.
    #
    # @param [String] compartment_id The OCID of the compartment.
    # @param [BOOLEAN] compartment_id_in_subtree When set to true, the hierarchy of compartments is traversed and all compartments and subcompartments in the tenancy are returned depending on the the setting of `accessLevel`.
    #
    #   Can only be set to true when performing ListCompartments on the tenancy (root compartment).
    #
    # @param [String] category_id The unique OCID associated with the category.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :name Optional. A filter that returns results that match the name specified.
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call. (default to 10)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    # @option opts [String] :sort_by The field to sort by. You can provide one sort order (`sortOrder`). Default order for TIMECREATED is descending. Default order for NAME is ascending. The NAME sort order is case sensitive.
    #
    #   Allowed values are: NAME, TIMECREATED
    # @option opts [String] :lifecycle_state A filter that returns results that match the lifecycle state specified.
    #
    # @option opts [String] :status A filter that returns recommendations that match the status specified.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Optimizer::Models::RecommendationCollection RecommendationCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/optimizer/list_recommendations.rb.html) to see an example of how to use list_recommendations API.
    def list_recommendations(compartment_id, compartment_id_in_subtree, category_id, opts = {})
      logger.debug 'Calling operation OptimizerClient#list_recommendations.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_recommendations." if compartment_id.nil?
      raise "Missing the required parameter 'compartment_id_in_subtree' when calling list_recommendations." if compartment_id_in_subtree.nil?
      raise "Missing the required parameter 'category_id' when calling list_recommendations." if category_id.nil?

      if opts[:sort_order] && !OCI::Optimizer::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Optimizer::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[NAME TIMECREATED].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of NAME, TIMECREATED.'
      end

      if opts[:lifecycle_state] && !OCI::Optimizer::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Optimizer::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:status] && !OCI::Optimizer::Models::STATUS_ENUM.include?(opts[:status])
        raise 'Invalid value for "status", must be one of the values in OCI::Optimizer::Models::STATUS_ENUM.'
      end

      path = '/recommendations'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:compartmentIdInSubtree] = compartment_id_in_subtree
      query_params[:categoryId] = category_id
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:status] = opts[:status] if opts[:status]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OptimizerClient#list_recommendations') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Optimizer::Models::RecommendationCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the fields that are indexed for querying and their associated value types.
    #
    # @param [String] compartment_id The OCID of the compartment.
    # @param [BOOLEAN] compartment_id_in_subtree When set to true, the hierarchy of compartments is traversed and all compartments and subcompartments in the tenancy are returned depending on the the setting of `accessLevel`.
    #
    #   Can only be set to true when performing ListCompartments on the tenancy (root compartment).
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call. (default to 10)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Optimizer::Models::QueryableFieldCollection QueryableFieldCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/optimizer/list_resource_action_queryable_fields.rb.html) to see an example of how to use list_resource_action_queryable_fields API.
    def list_resource_action_queryable_fields(compartment_id, compartment_id_in_subtree, opts = {})
      logger.debug 'Calling operation OptimizerClient#list_resource_action_queryable_fields.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_resource_action_queryable_fields." if compartment_id.nil?
      raise "Missing the required parameter 'compartment_id_in_subtree' when calling list_resource_action_queryable_fields." if compartment_id_in_subtree.nil?

      path = '/resourceActions/actions/getQueryableFields'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:compartmentIdInSubtree] = compartment_id_in_subtree
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OptimizerClient#list_resource_action_queryable_fields') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Optimizer::Models::QueryableFieldCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the Cloud Advisor resource actions that are supported by the specified recommendation.
    #
    # @param [String] compartment_id The OCID of the compartment.
    # @param [BOOLEAN] compartment_id_in_subtree When set to true, the hierarchy of compartments is traversed and all compartments and subcompartments in the tenancy are returned depending on the the setting of `accessLevel`.
    #
    #   Can only be set to true when performing ListCompartments on the tenancy (root compartment).
    #
    # @param [String] recommendation_id The unique OCID associated with the recommendation.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :name Optional. A filter that returns results that match the name specified.
    # @option opts [String] :resource_type Optional. A filter that returns results that match the resource type specified.
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call. (default to 10)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    # @option opts [String] :sort_by The field to sort by. You can provide one sort order (`sortOrder`). Default order for TIMECREATED is descending. Default order for NAME is ascending. The NAME sort order is case sensitive.
    #
    #   Allowed values are: NAME, TIMECREATED
    # @option opts [String] :lifecycle_state A filter that returns results that match the lifecycle state specified.
    #
    # @option opts [String] :status A filter that returns recommendations that match the status specified.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Optimizer::Models::ResourceActionCollection ResourceActionCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/optimizer/list_resource_actions.rb.html) to see an example of how to use list_resource_actions API.
    def list_resource_actions(compartment_id, compartment_id_in_subtree, recommendation_id, opts = {})
      logger.debug 'Calling operation OptimizerClient#list_resource_actions.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_resource_actions." if compartment_id.nil?
      raise "Missing the required parameter 'compartment_id_in_subtree' when calling list_resource_actions." if compartment_id_in_subtree.nil?
      raise "Missing the required parameter 'recommendation_id' when calling list_resource_actions." if recommendation_id.nil?

      if opts[:sort_order] && !OCI::Optimizer::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Optimizer::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[NAME TIMECREATED].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of NAME, TIMECREATED.'
      end

      if opts[:lifecycle_state] && !OCI::Optimizer::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Optimizer::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:status] && !OCI::Optimizer::Models::STATUS_ENUM.include?(opts[:status])
        raise 'Invalid value for "status", must be one of the values in OCI::Optimizer::Models::STATUS_ENUM.'
      end

      path = '/resourceActions'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:compartmentIdInSubtree] = compartment_id_in_subtree
      query_params[:recommendationId] = recommendation_id
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:resourceType] = opts[:resource_type] if opts[:resource_type]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:status] = opts[:status] if opts[:status]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OptimizerClient#list_resource_actions') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Optimizer::Models::ResourceActionCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists errors associated with the specified work request.
    #
    # @param [String] work_request_id The OCID of the work request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call. (default to 10)
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Optimizer::Models::WorkRequestErrorCollection WorkRequestErrorCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/optimizer/list_work_request_errors.rb.html) to see an example of how to use list_work_request_errors API.
    def list_work_request_errors(work_request_id, opts = {})
      logger.debug 'Calling operation OptimizerClient#list_work_request_errors.' if logger

      raise "Missing the required parameter 'work_request_id' when calling list_work_request_errors." if work_request_id.nil?
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/workRequests/{workRequestId}/errors'.sub('{workRequestId}', work_request_id.to_s)
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
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OptimizerClient#list_work_request_errors') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Optimizer::Models::WorkRequestErrorCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the logs associated with the specified work request.
    #
    # @param [String] work_request_id The OCID of the work request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call. (default to 10)
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Optimizer::Models::WorkRequestLogEntryCollection WorkRequestLogEntryCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/optimizer/list_work_request_logs.rb.html) to see an example of how to use list_work_request_logs API.
    def list_work_request_logs(work_request_id, opts = {})
      logger.debug 'Calling operation OptimizerClient#list_work_request_logs.' if logger

      raise "Missing the required parameter 'work_request_id' when calling list_work_request_logs." if work_request_id.nil?
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/workRequests/{workRequestId}/logs'.sub('{workRequestId}', work_request_id.to_s)
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
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OptimizerClient#list_work_request_logs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Optimizer::Models::WorkRequestLogEntryCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the work requests in the tenancy. The tenancy is the root compartment.
    #
    # @param [String] compartment_id The OCID of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call. (default to 10)
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Optimizer::Models::WorkRequestCollection WorkRequestCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/optimizer/list_work_requests.rb.html) to see an example of how to use list_work_requests API.
    def list_work_requests(compartment_id, opts = {})
      logger.debug 'Calling operation OptimizerClient#list_work_requests.' if logger

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OptimizerClient#list_work_requests') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Optimizer::Models::WorkRequestCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the enrollment status of the tenancy.
    #
    # @param [String] enrollment_status_id The unique OCID associated with the enrollment status.
    # @param [OCI::Optimizer::Models::UpdateEnrollmentStatusDetails] update_enrollment_status_details The request object for updating the enrollment status.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Optimizer::Models::EnrollmentStatus EnrollmentStatus}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/optimizer/update_enrollment_status.rb.html) to see an example of how to use update_enrollment_status API.
    def update_enrollment_status(enrollment_status_id, update_enrollment_status_details, opts = {})
      logger.debug 'Calling operation OptimizerClient#update_enrollment_status.' if logger

      raise "Missing the required parameter 'enrollment_status_id' when calling update_enrollment_status." if enrollment_status_id.nil?
      raise "Missing the required parameter 'update_enrollment_status_details' when calling update_enrollment_status." if update_enrollment_status_details.nil?
      raise "Parameter value for 'enrollment_status_id' must not be blank" if OCI::Internal::Util.blank_string?(enrollment_status_id)

      path = '/enrollmentStatus/{enrollmentStatusId}'.sub('{enrollmentStatusId}', enrollment_status_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_enrollment_status_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OptimizerClient#update_enrollment_status') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Optimizer::Models::EnrollmentStatus'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the specified profile. Uses the profile's OCID to determine which profile to update.
    #
    # @param [String] profile_id The unique OCID of the profile.
    # @param [OCI::Optimizer::Models::UpdateProfileDetails] update_profile_details The profile information to use for the update.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Optimizer::Models::Profile Profile}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/optimizer/update_profile.rb.html) to see an example of how to use update_profile API.
    def update_profile(profile_id, update_profile_details, opts = {})
      logger.debug 'Calling operation OptimizerClient#update_profile.' if logger

      raise "Missing the required parameter 'profile_id' when calling update_profile." if profile_id.nil?
      raise "Missing the required parameter 'update_profile_details' when calling update_profile." if update_profile_details.nil?
      raise "Parameter value for 'profile_id' must not be blank" if OCI::Internal::Util.blank_string?(profile_id)

      path = '/profiles/{profileId}'.sub('{profileId}', profile_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_profile_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OptimizerClient#update_profile') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Optimizer::Models::Profile'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the recommendation that corresponds to the specified OCID.
    # Use this operation to implement the following actions:
    #
    #   * Postpone recommendation
    #   * Dismiss recommendation
    #   * Reactivate recommendation
    #
    # @param [String] recommendation_id The unique OCID associated with the recommendation.
    # @param [OCI::Optimizer::Models::UpdateRecommendationDetails] update_recommendation_details The request object for udpating the recommendation details.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Optimizer::Models::Recommendation Recommendation}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/optimizer/update_recommendation.rb.html) to see an example of how to use update_recommendation API.
    def update_recommendation(recommendation_id, update_recommendation_details, opts = {})
      logger.debug 'Calling operation OptimizerClient#update_recommendation.' if logger

      raise "Missing the required parameter 'recommendation_id' when calling update_recommendation." if recommendation_id.nil?
      raise "Missing the required parameter 'update_recommendation_details' when calling update_recommendation." if update_recommendation_details.nil?
      raise "Parameter value for 'recommendation_id' must not be blank" if OCI::Internal::Util.blank_string?(recommendation_id)

      path = '/recommendations/{recommendationId}'.sub('{recommendationId}', recommendation_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_recommendation_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OptimizerClient#update_recommendation') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Optimizer::Models::Recommendation'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the resource action that corresponds to the specified OCID.
    # Use this operation to implement the following actions:
    #
    #   * Postpone resource action
    #   * Ignore resource action
    #   * Reactivate resource action
    #
    # @param [String] resource_action_id The unique OCID associated with the resource action.
    # @param [OCI::Optimizer::Models::UpdateResourceActionDetails] update_resource_action_details The resource action information to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Optimizer::Models::ResourceAction ResourceAction}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/optimizer/update_resource_action.rb.html) to see an example of how to use update_resource_action API.
    def update_resource_action(resource_action_id, update_resource_action_details, opts = {})
      logger.debug 'Calling operation OptimizerClient#update_resource_action.' if logger

      raise "Missing the required parameter 'resource_action_id' when calling update_resource_action." if resource_action_id.nil?
      raise "Missing the required parameter 'update_resource_action_details' when calling update_resource_action." if update_resource_action_details.nil?
      raise "Parameter value for 'resource_action_id' must not be blank" if OCI::Internal::Util.blank_string?(resource_action_id)

      path = '/resourceActions/{resourceActionId}'.sub('{resourceActionId}', resource_action_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_resource_action_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OptimizerClient#update_resource_action') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Optimizer::Models::ResourceAction'
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
