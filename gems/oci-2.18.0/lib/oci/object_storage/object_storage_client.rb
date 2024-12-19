# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Common set of Object Storage and Archive Storage APIs for managing buckets, objects, and related resources.
  # For more information, see [Overview of Object Storage](/Content/Object/Concepts/objectstorageoverview.htm) and
  # [Overview of Archive Storage](/Content/Archive/Concepts/archivestorageoverview.htm).
  class ObjectStorage::ObjectStorageClient
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


    # Creates a new ObjectStorageClient.
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
        @endpoint = endpoint + '/'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "ObjectStorageClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://objectstorage.{region}.{secondLevelDomain}') + '/'
      logger.info "ObjectStorageClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Aborts an in-progress multipart upload and deletes all parts that have been uploaded.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [String] object_name The name of the object. Avoid entering confidential information.
    #   Example: `test/object1.log`
    #
    # @param [String] upload_id The upload ID for a multipart upload.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/abort_multipart_upload.rb.html) to see an example of how to use abort_multipart_upload API.
    def abort_multipart_upload(namespace_name, bucket_name, object_name, upload_id, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#abort_multipart_upload.' if logger

      raise "Missing the required parameter 'namespace_name' when calling abort_multipart_upload." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling abort_multipart_upload." if bucket_name.nil?
      raise "Missing the required parameter 'object_name' when calling abort_multipart_upload." if object_name.nil?
      raise "Missing the required parameter 'upload_id' when calling abort_multipart_upload." if upload_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)
      raise "Parameter value for 'object_name' must not be blank" if OCI::Internal::Util.blank_string?(object_name)

      path = '/n/{namespaceName}/b/{bucketName}/u/{objectName}'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s).sub('{objectName}', object_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:uploadId] = upload_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#abort_multipart_upload') do
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


    # Cancels a work request.
    #
    # @param [String] work_request_id The ID of the asynchronous request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/cancel_work_request.rb.html) to see an example of how to use cancel_work_request API.
    def cancel_work_request(work_request_id, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#cancel_work_request.' if logger

      raise "Missing the required parameter 'work_request_id' when calling cancel_work_request." if work_request_id.nil?
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
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#cancel_work_request') do
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


    # Commits a multipart upload, which involves checking part numbers and entity tags (ETags) of the parts, to create an aggregate object.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [String] object_name The name of the object. Avoid entering confidential information.
    #   Example: `test/object1.log`
    #
    # @param [String] upload_id The upload ID for a multipart upload.
    # @param [OCI::ObjectStorage::Models::CommitMultipartUploadDetails] commit_multipart_upload_details The part numbers and entity tags (ETags) for the parts you want to commit.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The entity tag (ETag) to match with the ETag of an existing resource. If the specified ETag matches the ETag of
    #   the existing resource, GET and HEAD requests will return the resource and PUT and POST requests will upload
    #   the resource.
    #
    # @option opts [String] :if_none_match The entity tag (ETag) to avoid matching. The only valid value is '*', which indicates that the request should
    #   fail if the resource already exists.
    #
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/commit_multipart_upload.rb.html) to see an example of how to use commit_multipart_upload API.
    def commit_multipart_upload(namespace_name, bucket_name, object_name, upload_id, commit_multipart_upload_details, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#commit_multipart_upload.' if logger

      raise "Missing the required parameter 'namespace_name' when calling commit_multipart_upload." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling commit_multipart_upload." if bucket_name.nil?
      raise "Missing the required parameter 'object_name' when calling commit_multipart_upload." if object_name.nil?
      raise "Missing the required parameter 'upload_id' when calling commit_multipart_upload." if upload_id.nil?
      raise "Missing the required parameter 'commit_multipart_upload_details' when calling commit_multipart_upload." if commit_multipart_upload_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)
      raise "Parameter value for 'object_name' must not be blank" if OCI::Internal::Util.blank_string?(object_name)

      path = '/n/{namespaceName}/b/{bucketName}/u/{objectName}'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s).sub('{objectName}', object_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:uploadId] = upload_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(commit_multipart_upload_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#commit_multipart_upload') do
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


    # Creates a request to copy an object within a region or to another region.
    #
    # See [Object Names](https://docs.cloud.oracle.com/Content/Object/Tasks/managingobjects.htm#namerequirements)
    # for object naming requirements.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [OCI::ObjectStorage::Models::CopyObjectDetails] copy_object_details The source and destination of the object to be copied.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @option opts [String] :opc_sse_customer_algorithm The optional header that specifies \"AES256\" as the encryption algorithm. For more information, see
    #   [Using Your Own Keys for Server-Side Encryption](https://docs.cloud.oracle.com/Content/Object/Tasks/usingyourencryptionkeys.htm).
    #
    # @option opts [String] :opc_sse_customer_key The optional header that specifies the base64-encoded 256-bit encryption key to use to encrypt or
    #   decrypt the data. For more information, see
    #   [Using Your Own Keys for Server-Side Encryption](https://docs.cloud.oracle.com/Content/Object/Tasks/usingyourencryptionkeys.htm).
    #
    # @option opts [String] :opc_sse_customer_key_sha256 The optional header that specifies the base64-encoded SHA256 hash of the encryption key. This
    #   value is used to check the integrity of the encryption key. For more information, see
    #   [Using Your Own Keys for Server-Side Encryption](https://docs.cloud.oracle.com/Content/Object/Tasks/usingyourencryptionkeys.htm).
    #
    # @option opts [String] :opc_source_sse_customer_algorithm The optional header that specifies \"AES256\" as the encryption algorithm to use to decrypt the source
    #   object. For more information, see
    #   [Using Your Own Keys for Server-Side Encryption](https://docs.cloud.oracle.com/Content/Object/Tasks/usingyourencryptionkeys.htm).
    #
    # @option opts [String] :opc_source_sse_customer_key The optional header that specifies the base64-encoded 256-bit encryption key to use to decrypt
    #   the source object. For more information, see
    #   [Using Your Own Keys for Server-Side Encryption](https://docs.cloud.oracle.com/Content/Object/Tasks/usingyourencryptionkeys.htm).
    #
    # @option opts [String] :opc_source_sse_customer_key_sha256 The optional header that specifies the base64-encoded SHA256 hash of the encryption key used to
    #   decrypt the source object. This value is used to check the integrity of the encryption key. For
    #   more information, see
    #   [Using Your Own Keys for Server-Side Encryption](https://docs.cloud.oracle.com/Content/Object/Tasks/usingyourencryptionkeys.htm).
    #
    # @option opts [String] :opc_sse_kms_key_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of a master encryption key used to call the Key
    #   Management service to generate a data encryption key or to encrypt or decrypt a data encryption key.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/copy_object.rb.html) to see an example of how to use copy_object API.
    def copy_object(namespace_name, bucket_name, copy_object_details, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#copy_object.' if logger

      raise "Missing the required parameter 'namespace_name' when calling copy_object." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling copy_object." if bucket_name.nil?
      raise "Missing the required parameter 'copy_object_details' when calling copy_object." if copy_object_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)

      path = '/n/{namespaceName}/b/{bucketName}/actions/copyObject'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      header_params[:'opc-sse-customer-algorithm'] = opts[:opc_sse_customer_algorithm] if opts[:opc_sse_customer_algorithm]
      header_params[:'opc-sse-customer-key'] = opts[:opc_sse_customer_key] if opts[:opc_sse_customer_key]
      header_params[:'opc-sse-customer-key-sha256'] = opts[:opc_sse_customer_key_sha256] if opts[:opc_sse_customer_key_sha256]
      header_params[:'opc-source-sse-customer-algorithm'] = opts[:opc_source_sse_customer_algorithm] if opts[:opc_source_sse_customer_algorithm]
      header_params[:'opc-source-sse-customer-key'] = opts[:opc_source_sse_customer_key] if opts[:opc_source_sse_customer_key]
      header_params[:'opc-source-sse-customer-key-sha256'] = opts[:opc_source_sse_customer_key_sha256] if opts[:opc_source_sse_customer_key_sha256]
      header_params[:'opc-sse-kms-key-id'] = opts[:opc_sse_kms_key_id] if opts[:opc_sse_kms_key_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(copy_object_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#copy_object') do
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


    # Creates a bucket in the given namespace with a bucket name and optional user-defined metadata. Avoid entering
    # confidential information in bucket names.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [OCI::ObjectStorage::Models::CreateBucketDetails] create_bucket_details Request object for creating a bucket.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::ObjectStorage::Models::Bucket Bucket}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/create_bucket.rb.html) to see an example of how to use create_bucket API.
    def create_bucket(namespace_name, create_bucket_details, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#create_bucket.' if logger

      raise "Missing the required parameter 'namespace_name' when calling create_bucket." if namespace_name.nil?
      raise "Missing the required parameter 'create_bucket_details' when calling create_bucket." if create_bucket_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/n/{namespaceName}/b/'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(create_bucket_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#create_bucket') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ObjectStorage::Models::Bucket'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Starts a new multipart upload to a specific object in the given bucket in the given namespace.
    #
    # See [Object Names](https://docs.cloud.oracle.com/Content/Object/Tasks/managingobjects.htm#namerequirements)
    # for object naming requirements.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [OCI::ObjectStorage::Models::CreateMultipartUploadDetails] create_multipart_upload_details Request object for creating a multipart upload.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The entity tag (ETag) to match with the ETag of an existing resource. If the specified ETag matches the ETag of
    #   the existing resource, GET and HEAD requests will return the resource and PUT and POST requests will upload
    #   the resource.
    #
    # @option opts [String] :if_none_match The entity tag (ETag) to avoid matching. The only valid value is '*', which indicates that the request should
    #   fail if the resource already exists.
    #
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @option opts [String] :opc_sse_customer_algorithm The optional header that specifies \"AES256\" as the encryption algorithm. For more information, see
    #   [Using Your Own Keys for Server-Side Encryption](https://docs.cloud.oracle.com/Content/Object/Tasks/usingyourencryptionkeys.htm).
    #
    # @option opts [String] :opc_sse_customer_key The optional header that specifies the base64-encoded 256-bit encryption key to use to encrypt or
    #   decrypt the data. For more information, see
    #   [Using Your Own Keys for Server-Side Encryption](https://docs.cloud.oracle.com/Content/Object/Tasks/usingyourencryptionkeys.htm).
    #
    # @option opts [String] :opc_sse_customer_key_sha256 The optional header that specifies the base64-encoded SHA256 hash of the encryption key. This
    #   value is used to check the integrity of the encryption key. For more information, see
    #   [Using Your Own Keys for Server-Side Encryption](https://docs.cloud.oracle.com/Content/Object/Tasks/usingyourencryptionkeys.htm).
    #
    # @option opts [String] :opc_sse_kms_key_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of a master encryption key used to call the Key
    #   Management service to generate a data encryption key or to encrypt or decrypt a data encryption key.
    #
    # @return [Response] A Response object with data of type {OCI::ObjectStorage::Models::MultipartUpload MultipartUpload}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/create_multipart_upload.rb.html) to see an example of how to use create_multipart_upload API.
    def create_multipart_upload(namespace_name, bucket_name, create_multipart_upload_details, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#create_multipart_upload.' if logger

      raise "Missing the required parameter 'namespace_name' when calling create_multipart_upload." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling create_multipart_upload." if bucket_name.nil?
      raise "Missing the required parameter 'create_multipart_upload_details' when calling create_multipart_upload." if create_multipart_upload_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)

      path = '/n/{namespaceName}/b/{bucketName}/u'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      header_params[:'opc-sse-customer-algorithm'] = opts[:opc_sse_customer_algorithm] if opts[:opc_sse_customer_algorithm]
      header_params[:'opc-sse-customer-key'] = opts[:opc_sse_customer_key] if opts[:opc_sse_customer_key]
      header_params[:'opc-sse-customer-key-sha256'] = opts[:opc_sse_customer_key_sha256] if opts[:opc_sse_customer_key_sha256]
      header_params[:'opc-sse-kms-key-id'] = opts[:opc_sse_kms_key_id] if opts[:opc_sse_kms_key_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(create_multipart_upload_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#create_multipart_upload') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ObjectStorage::Models::MultipartUpload'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a pre-authenticated request specific to the bucket.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [OCI::ObjectStorage::Models::CreatePreauthenticatedRequestDetails] create_preauthenticated_request_details Information needed to create the pre-authenticated request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::ObjectStorage::Models::PreauthenticatedRequest PreauthenticatedRequest}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/create_preauthenticated_request.rb.html) to see an example of how to use create_preauthenticated_request API.
    def create_preauthenticated_request(namespace_name, bucket_name, create_preauthenticated_request_details, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#create_preauthenticated_request.' if logger

      raise "Missing the required parameter 'namespace_name' when calling create_preauthenticated_request." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling create_preauthenticated_request." if bucket_name.nil?
      raise "Missing the required parameter 'create_preauthenticated_request_details' when calling create_preauthenticated_request." if create_preauthenticated_request_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)

      path = '/n/{namespaceName}/b/{bucketName}/p/'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(create_preauthenticated_request_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#create_preauthenticated_request') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ObjectStorage::Models::PreauthenticatedRequest'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a replication policy for the specified bucket.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [OCI::ObjectStorage::Models::CreateReplicationPolicyDetails] create_replication_policy_details The replication policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::ObjectStorage::Models::ReplicationPolicy ReplicationPolicy}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/create_replication_policy.rb.html) to see an example of how to use create_replication_policy API.
    def create_replication_policy(namespace_name, bucket_name, create_replication_policy_details, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#create_replication_policy.' if logger

      raise "Missing the required parameter 'namespace_name' when calling create_replication_policy." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling create_replication_policy." if bucket_name.nil?
      raise "Missing the required parameter 'create_replication_policy_details' when calling create_replication_policy." if create_replication_policy_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)

      path = '/n/{namespaceName}/b/{bucketName}/replicationPolicies'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(create_replication_policy_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#create_replication_policy') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ObjectStorage::Models::ReplicationPolicy'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new retention rule in the specified bucket. The new rule will take effect typically within 30 seconds.
    # Note that a maximum of 100 rules are supported on a bucket.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [OCI::ObjectStorage::Models::CreateRetentionRuleDetails] create_retention_rule_details The retention rule to create for the bucket.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::ObjectStorage::Models::RetentionRule RetentionRule}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/create_retention_rule.rb.html) to see an example of how to use create_retention_rule API.
    def create_retention_rule(namespace_name, bucket_name, create_retention_rule_details, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#create_retention_rule.' if logger

      raise "Missing the required parameter 'namespace_name' when calling create_retention_rule." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling create_retention_rule." if bucket_name.nil?
      raise "Missing the required parameter 'create_retention_rule_details' when calling create_retention_rule." if create_retention_rule_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)

      path = '/n/{namespaceName}/b/{bucketName}/retentionRules'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(create_retention_rule_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#create_retention_rule') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ObjectStorage::Models::RetentionRule'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Deletes a bucket if the bucket is already empty. If the bucket is not empty, use
    # {#delete_object delete_object} first. In addition,
    # you cannot delete a bucket that has a multipart upload in progress or a pre-authenticated
    # request associated with that bucket.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The entity tag (ETag) to match with the ETag of an existing resource. If the specified ETag matches the ETag of
    #   the existing resource, GET and HEAD requests will return the resource and PUT and POST requests will upload
    #   the resource.
    #
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/delete_bucket.rb.html) to see an example of how to use delete_bucket API.
    def delete_bucket(namespace_name, bucket_name, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#delete_bucket.' if logger

      raise "Missing the required parameter 'namespace_name' when calling delete_bucket." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling delete_bucket." if bucket_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)

      path = '/n/{namespaceName}/b/{bucketName}/'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#delete_bucket') do
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


    # Deletes an object.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [String] object_name The name of the object. Avoid entering confidential information.
    #   Example: `test/object1.log`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The entity tag (ETag) to match with the ETag of an existing resource. If the specified ETag matches the ETag of
    #   the existing resource, GET and HEAD requests will return the resource and PUT and POST requests will upload
    #   the resource.
    #
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @option opts [String] :version_id VersionId used to identify a particular version of the object
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/delete_object.rb.html) to see an example of how to use delete_object API.
    def delete_object(namespace_name, bucket_name, object_name, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#delete_object.' if logger

      raise "Missing the required parameter 'namespace_name' when calling delete_object." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling delete_object." if bucket_name.nil?
      raise "Missing the required parameter 'object_name' when calling delete_object." if object_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)
      raise "Parameter value for 'object_name' must not be blank" if OCI::Internal::Util.blank_string?(object_name)

      path = '/n/{namespaceName}/b/{bucketName}/o/{objectName}'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s).sub('{objectName}', object_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:versionId] = opts[:version_id] if opts[:version_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#delete_object') do
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


    # Deletes the object lifecycle policy for the bucket.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @option opts [String] :if_match The entity tag (ETag) to match with the ETag of an existing resource. If the specified ETag matches the ETag of
    #   the existing resource, GET and HEAD requests will return the resource and PUT and POST requests will upload
    #   the resource.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/delete_object_lifecycle_policy.rb.html) to see an example of how to use delete_object_lifecycle_policy API.
    def delete_object_lifecycle_policy(namespace_name, bucket_name, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#delete_object_lifecycle_policy.' if logger

      raise "Missing the required parameter 'namespace_name' when calling delete_object_lifecycle_policy." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling delete_object_lifecycle_policy." if bucket_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)

      path = '/n/{namespaceName}/b/{bucketName}/l'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#delete_object_lifecycle_policy') do
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


    # Deletes the pre-authenticated request for the bucket.
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [String] par_id The unique identifier for the pre-authenticated request. This can be used to manage operations against
    #   the pre-authenticated request, such as GET or DELETE.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/delete_preauthenticated_request.rb.html) to see an example of how to use delete_preauthenticated_request API.
    def delete_preauthenticated_request(namespace_name, bucket_name, par_id, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#delete_preauthenticated_request.' if logger

      raise "Missing the required parameter 'namespace_name' when calling delete_preauthenticated_request." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling delete_preauthenticated_request." if bucket_name.nil?
      raise "Missing the required parameter 'par_id' when calling delete_preauthenticated_request." if par_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)
      raise "Parameter value for 'par_id' must not be blank" if OCI::Internal::Util.blank_string?(par_id)

      path = '/n/{namespaceName}/b/{bucketName}/p/{parId}'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s).sub('{parId}', par_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#delete_preauthenticated_request') do
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


    # Deletes the replication policy associated with the source bucket.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [String] replication_id The ID of the replication policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/delete_replication_policy.rb.html) to see an example of how to use delete_replication_policy API.
    def delete_replication_policy(namespace_name, bucket_name, replication_id, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#delete_replication_policy.' if logger

      raise "Missing the required parameter 'namespace_name' when calling delete_replication_policy." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling delete_replication_policy." if bucket_name.nil?
      raise "Missing the required parameter 'replication_id' when calling delete_replication_policy." if replication_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)
      raise "Parameter value for 'replication_id' must not be blank" if OCI::Internal::Util.blank_string?(replication_id)

      path = '/n/{namespaceName}/b/{bucketName}/replicationPolicies/{replicationId}'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s).sub('{replicationId}', replication_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#delete_replication_policy') do
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


    # Deletes the specified rule. The deletion takes effect typically within 30 seconds.
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [String] retention_rule_id The ID of the retention rule.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The entity tag (ETag) to match with the ETag of an existing resource. If the specified ETag matches the ETag of
    #   the existing resource, GET and HEAD requests will return the resource and PUT and POST requests will upload
    #   the resource.
    #
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/delete_retention_rule.rb.html) to see an example of how to use delete_retention_rule API.
    def delete_retention_rule(namespace_name, bucket_name, retention_rule_id, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#delete_retention_rule.' if logger

      raise "Missing the required parameter 'namespace_name' when calling delete_retention_rule." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling delete_retention_rule." if bucket_name.nil?
      raise "Missing the required parameter 'retention_rule_id' when calling delete_retention_rule." if retention_rule_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)
      raise "Parameter value for 'retention_rule_id' must not be blank" if OCI::Internal::Util.blank_string?(retention_rule_id)

      path = '/n/{namespaceName}/b/{bucketName}/retentionRules/{retentionRuleId}'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s).sub('{retentionRuleId}', retention_rule_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#delete_retention_rule') do
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


    # Gets the current representation of the given bucket in the given Object Storage namespace.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The entity tag (ETag) to match with the ETag of an existing resource. If the specified ETag matches the ETag of
    #   the existing resource, GET and HEAD requests will return the resource and PUT and POST requests will upload
    #   the resource.
    #
    # @option opts [String] :if_none_match The entity tag (ETag) to avoid matching. Wildcards ('*') are not allowed. If the specified ETag does not
    #   match the ETag of the existing resource, the request returns the expected response. If the ETag matches
    #   the ETag of the existing resource, the request returns an HTTP 304 status without a response body.
    #
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @option opts [Array<String>] :fields Bucket summary includes the 'namespace', 'name', 'compartmentId', 'createdBy', 'timeCreated',
    #   and 'etag' fields. This parameter can also include 'approximateCount' (approximate number of objects), 'approximateSize'
    #   (total approximate size in bytes of all objects) and 'autoTiering' (state of auto tiering on the bucket).
    #   For example 'approximateCount,approximateSize,autoTiering'.
    #
    #   Allowed values are: approximateCount, approximateSize, autoTiering
    # @return [Response] A Response object with data of type {OCI::ObjectStorage::Models::Bucket Bucket}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/get_bucket.rb.html) to see an example of how to use get_bucket API.
    def get_bucket(namespace_name, bucket_name, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#get_bucket.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_bucket." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling get_bucket." if bucket_name.nil?


      fields_allowable_values = %w[approximateCount approximateSize autoTiering]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of approximateCount, approximateSize, autoTiering.'
          end
        end
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)

      path = '/n/{namespaceName}/b/{bucketName}/'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :csv) if opts[:fields] && !opts[:fields].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#get_bucket') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ObjectStorage::Models::Bucket'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Each Oracle Cloud Infrastructure tenant is assigned one unique and uneditable Object Storage namespace. The namespace
    # is a system-generated string assigned during account creation. For some older tenancies, the namespace string may be
    # the tenancy name in all lower-case letters. You cannot edit a namespace.
    #
    # GetNamespace returns the name of the Object Storage namespace for the user making the request.
    # If an optional compartmentId query parameter is provided, GetNamespace returns the namespace name of the corresponding
    # tenancy, provided the user has access to it.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @option opts [String] :compartment_id This is an optional field representing either the tenancy [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) or the compartment
    #   [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) within the tenancy whose Object Storage namespace is to be retrieved.
    #
    # @return [Response] A Response object with data of type String
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/get_namespace.rb.html) to see an example of how to use get_namespace API.
    def get_namespace(opts = {})
      logger.debug 'Calling operation ObjectStorageClient#get_namespace.' if logger


      path = '/n/'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#get_namespace') do
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
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the metadata for the Object Storage namespace, which contains defaultS3CompartmentId and
    # defaultSwiftCompartmentId.
    #
    # Any user with the OBJECTSTORAGE_NAMESPACE_READ permission will be able to see the current metadata. If you are
    # not authorized, talk to an administrator. If you are an administrator who needs to write policies
    # to give users access, see
    # [Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::ObjectStorage::Models::NamespaceMetadata NamespaceMetadata}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/get_namespace_metadata.rb.html) to see an example of how to use get_namespace_metadata API.
    def get_namespace_metadata(namespace_name, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#get_namespace_metadata.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_namespace_metadata." if namespace_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/n/{namespaceName}'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#get_namespace_metadata') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ObjectStorage::Models::NamespaceMetadata'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the metadata and body of an object.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [String] object_name The name of the object. Avoid entering confidential information.
    #   Example: `test/object1.log`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :version_id VersionId used to identify a particular version of the object
    # @option opts [String] :if_match The entity tag (ETag) to match with the ETag of an existing resource. If the specified ETag matches the ETag of
    #   the existing resource, GET and HEAD requests will return the resource and PUT and POST requests will upload
    #   the resource.
    #
    # @option opts [String] :if_none_match The entity tag (ETag) to avoid matching. Wildcards ('*') are not allowed. If the specified ETag does not
    #   match the ETag of the existing resource, the request returns the expected response. If the ETag matches
    #   the ETag of the existing resource, the request returns an HTTP 304 status without a response body.
    #
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @option opts [String] :range Optional byte range to fetch, as described in [RFC 7233](https://tools.ietf.org/html/rfc7233#section-2.1).
    #   Note that only a single range of bytes is supported.
    #
    # @option opts [String] :opc_sse_customer_algorithm The optional header that specifies \"AES256\" as the encryption algorithm. For more information, see
    #   [Using Your Own Keys for Server-Side Encryption](https://docs.cloud.oracle.com/Content/Object/Tasks/usingyourencryptionkeys.htm).
    #
    # @option opts [String] :opc_sse_customer_key The optional header that specifies the base64-encoded 256-bit encryption key to use to encrypt or
    #   decrypt the data. For more information, see
    #   [Using Your Own Keys for Server-Side Encryption](https://docs.cloud.oracle.com/Content/Object/Tasks/usingyourencryptionkeys.htm).
    #
    # @option opts [String] :opc_sse_customer_key_sha256 The optional header that specifies the base64-encoded SHA256 hash of the encryption key. This
    #   value is used to check the integrity of the encryption key. For more information, see
    #   [Using Your Own Keys for Server-Side Encryption](https://docs.cloud.oracle.com/Content/Object/Tasks/usingyourencryptionkeys.htm).
    #
    # @option opts [String] :http_response_content_disposition Specify this query parameter to override the value of the Content-Disposition response header in the GetObject response.
    # @option opts [String] :http_response_cache_control Specify this query parameter to override the Cache-Control response header in the GetObject response.
    # @option opts [String] :http_response_content_type Specify this query parameter to override the Content-Type response header in the GetObject response.
    # @option opts [String] :http_response_content_language Specify this query parameter to override the Content-Language response header in the GetObject response.
    # @option opts [String] :http_response_content_encoding Specify this query parameter to override the Content-Encoding response header in the GetObject response.
    # @option opts [String] :http_response_expires Specify this query parameter to override the Expires response header in the GetObject response.
    # @option opts [String, IO] :response_target Streaming http body into a file (specified by file name or File object) or IO object if the block is not given
    # @option [Block] &block Streaming http body to the block
    # @return [Response] A Response object with data of type String if response_target and block are not given, otherwise with nil data
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/get_object.rb.html) to see an example of how to use get_object API.
    def get_object(namespace_name, bucket_name, object_name, opts = {}, &block)
      logger.debug 'Calling operation ObjectStorageClient#get_object.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_object." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling get_object." if bucket_name.nil?
      raise "Missing the required parameter 'object_name' when calling get_object." if object_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)
      raise "Parameter value for 'object_name' must not be blank" if OCI::Internal::Util.blank_string?(object_name)

      path = '/n/{namespaceName}/b/{bucketName}/o/{objectName}'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s).sub('{objectName}', object_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:versionId] = opts[:version_id] if opts[:version_id]
      query_params[:httpResponseContentDisposition] = opts[:http_response_content_disposition] if opts[:http_response_content_disposition]
      query_params[:httpResponseCacheControl] = opts[:http_response_cache_control] if opts[:http_response_cache_control]
      query_params[:httpResponseContentType] = opts[:http_response_content_type] if opts[:http_response_content_type]
      query_params[:httpResponseContentLanguage] = opts[:http_response_content_language] if opts[:http_response_content_language]
      query_params[:httpResponseContentEncoding] = opts[:http_response_content_encoding] if opts[:http_response_content_encoding]
      query_params[:httpResponseExpires] = opts[:http_response_expires] if opts[:http_response_expires]

      # Header Params
      header_params = {}
      header_params[:accept] = opts[:accept] if opts[:accept]
      header_params[:accept] ||= 'application/json'
      header_params[:'accept-encoding'] = opts[:accept_encoding] if opts[:accept_encoding]
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      header_params[:range] = opts[:range] if opts[:range]
      header_params[:'opc-sse-customer-algorithm'] = opts[:opc_sse_customer_algorithm] if opts[:opc_sse_customer_algorithm]
      header_params[:'opc-sse-customer-key'] = opts[:opc_sse_customer_key] if opts[:opc_sse_customer_key]
      header_params[:'opc-sse-customer-key-sha256'] = opts[:opc_sse_customer_key_sha256] if opts[:opc_sse_customer_key_sha256]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#get_object') do
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


    # Gets the object lifecycle policy for the bucket.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::ObjectStorage::Models::ObjectLifecyclePolicy ObjectLifecyclePolicy}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/get_object_lifecycle_policy.rb.html) to see an example of how to use get_object_lifecycle_policy API.
    def get_object_lifecycle_policy(namespace_name, bucket_name, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#get_object_lifecycle_policy.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_object_lifecycle_policy." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling get_object_lifecycle_policy." if bucket_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)

      path = '/n/{namespaceName}/b/{bucketName}/l'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#get_object_lifecycle_policy') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ObjectStorage::Models::ObjectLifecyclePolicy'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the pre-authenticated request for the bucket.
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [String] par_id The unique identifier for the pre-authenticated request. This can be used to manage operations against
    #   the pre-authenticated request, such as GET or DELETE.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::ObjectStorage::Models::PreauthenticatedRequestSummary PreauthenticatedRequestSummary}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/get_preauthenticated_request.rb.html) to see an example of how to use get_preauthenticated_request API.
    def get_preauthenticated_request(namespace_name, bucket_name, par_id, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#get_preauthenticated_request.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_preauthenticated_request." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling get_preauthenticated_request." if bucket_name.nil?
      raise "Missing the required parameter 'par_id' when calling get_preauthenticated_request." if par_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)
      raise "Parameter value for 'par_id' must not be blank" if OCI::Internal::Util.blank_string?(par_id)

      path = '/n/{namespaceName}/b/{bucketName}/p/{parId}'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s).sub('{parId}', par_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#get_preauthenticated_request') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ObjectStorage::Models::PreauthenticatedRequestSummary'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Get the replication policy.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [String] replication_id The ID of the replication policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::ObjectStorage::Models::ReplicationPolicy ReplicationPolicy}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/get_replication_policy.rb.html) to see an example of how to use get_replication_policy API.
    def get_replication_policy(namespace_name, bucket_name, replication_id, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#get_replication_policy.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_replication_policy." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling get_replication_policy." if bucket_name.nil?
      raise "Missing the required parameter 'replication_id' when calling get_replication_policy." if replication_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)
      raise "Parameter value for 'replication_id' must not be blank" if OCI::Internal::Util.blank_string?(replication_id)

      path = '/n/{namespaceName}/b/{bucketName}/replicationPolicies/{replicationId}'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s).sub('{replicationId}', replication_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#get_replication_policy') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ObjectStorage::Models::ReplicationPolicy'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Get the specified retention rule.
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [String] retention_rule_id The ID of the retention rule.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::ObjectStorage::Models::RetentionRule RetentionRule}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/get_retention_rule.rb.html) to see an example of how to use get_retention_rule API.
    def get_retention_rule(namespace_name, bucket_name, retention_rule_id, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#get_retention_rule.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_retention_rule." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling get_retention_rule." if bucket_name.nil?
      raise "Missing the required parameter 'retention_rule_id' when calling get_retention_rule." if retention_rule_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)
      raise "Parameter value for 'retention_rule_id' must not be blank" if OCI::Internal::Util.blank_string?(retention_rule_id)

      path = '/n/{namespaceName}/b/{bucketName}/retentionRules/{retentionRuleId}'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s).sub('{retentionRuleId}', retention_rule_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#get_retention_rule') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ObjectStorage::Models::RetentionRule'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the status of the work request for the given ID.
    # @param [String] work_request_id The ID of the asynchronous request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::ObjectStorage::Models::WorkRequest WorkRequest}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/get_work_request.rb.html) to see an example of how to use get_work_request API.
    def get_work_request(work_request_id, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#get_work_request.' if logger

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
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#get_work_request') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ObjectStorage::Models::WorkRequest'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Efficiently checks to see if a bucket exists and gets the current entity tag (ETag) for the bucket.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The entity tag (ETag) to match with the ETag of an existing resource. If the specified ETag matches the ETag of
    #   the existing resource, GET and HEAD requests will return the resource and PUT and POST requests will upload
    #   the resource.
    #
    # @option opts [String] :if_none_match The entity tag (ETag) to avoid matching. Wildcards ('*') are not allowed. If the specified ETag does not
    #   match the ETag of the existing resource, the request returns the expected response. If the ETag matches
    #   the ETag of the existing resource, the request returns an HTTP 304 status without a response body.
    #
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/head_bucket.rb.html) to see an example of how to use head_bucket API.
    def head_bucket(namespace_name, bucket_name, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#head_bucket.' if logger

      raise "Missing the required parameter 'namespace_name' when calling head_bucket." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling head_bucket." if bucket_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)

      path = '/n/{namespaceName}/b/{bucketName}/'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#head_bucket') do
        @api_client.call_api(
          :HEAD,
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


    # Gets the user-defined metadata and entity tag (ETag) for an object.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [String] object_name The name of the object. Avoid entering confidential information.
    #   Example: `test/object1.log`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :version_id VersionId used to identify a particular version of the object
    # @option opts [String] :if_match The entity tag (ETag) to match with the ETag of an existing resource. If the specified ETag matches the ETag of
    #   the existing resource, GET and HEAD requests will return the resource and PUT and POST requests will upload
    #   the resource.
    #
    # @option opts [String] :if_none_match The entity tag (ETag) to avoid matching. Wildcards ('*') are not allowed. If the specified ETag does not
    #   match the ETag of the existing resource, the request returns the expected response. If the ETag matches
    #   the ETag of the existing resource, the request returns an HTTP 304 status without a response body.
    #
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @option opts [String] :opc_sse_customer_algorithm The optional header that specifies \"AES256\" as the encryption algorithm. For more information, see
    #   [Using Your Own Keys for Server-Side Encryption](https://docs.cloud.oracle.com/Content/Object/Tasks/usingyourencryptionkeys.htm).
    #
    # @option opts [String] :opc_sse_customer_key The optional header that specifies the base64-encoded 256-bit encryption key to use to encrypt or
    #   decrypt the data. For more information, see
    #   [Using Your Own Keys for Server-Side Encryption](https://docs.cloud.oracle.com/Content/Object/Tasks/usingyourencryptionkeys.htm).
    #
    # @option opts [String] :opc_sse_customer_key_sha256 The optional header that specifies the base64-encoded SHA256 hash of the encryption key. This
    #   value is used to check the integrity of the encryption key. For more information, see
    #   [Using Your Own Keys for Server-Side Encryption](https://docs.cloud.oracle.com/Content/Object/Tasks/usingyourencryptionkeys.htm).
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/head_object.rb.html) to see an example of how to use head_object API.
    def head_object(namespace_name, bucket_name, object_name, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#head_object.' if logger

      raise "Missing the required parameter 'namespace_name' when calling head_object." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling head_object." if bucket_name.nil?
      raise "Missing the required parameter 'object_name' when calling head_object." if object_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)
      raise "Parameter value for 'object_name' must not be blank" if OCI::Internal::Util.blank_string?(object_name)

      path = '/n/{namespaceName}/b/{bucketName}/o/{objectName}'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s).sub('{objectName}', object_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:versionId] = opts[:version_id] if opts[:version_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      header_params[:'opc-sse-customer-algorithm'] = opts[:opc_sse_customer_algorithm] if opts[:opc_sse_customer_algorithm]
      header_params[:'opc-sse-customer-key'] = opts[:opc_sse_customer_key] if opts[:opc_sse_customer_key]
      header_params[:'opc-sse-customer-key-sha256'] = opts[:opc_sse_customer_key_sha256] if opts[:opc_sse_customer_key_sha256]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#head_object') do
        @api_client.call_api(
          :HEAD,
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


    # Gets a list of all BucketSummary items in a compartment. A BucketSummary contains only summary fields for the bucket
    # and does not contain fields like the user-defined metadata.
    #
    # ListBuckets returns a BucketSummary containing at most 1000 buckets. To paginate through more buckets, use the returned
    # `opc-next-page` value with the `page` request parameter.
    #
    # To use this and other API operations, you must be authorized in an IAM policy. If you are not authorized,
    # talk to an administrator. If you are an administrator who needs to write policies to give users access, see
    # [Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] compartment_id The ID of the compartment in which to list buckets.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to return in a paginated
    #   \"List\" call. For important details about how pagination works, see
    #   [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from the previous \"List\" call. For important
    #   details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [Array<String>] :fields Bucket summary in list of buckets includes the 'namespace', 'name', 'compartmentId', 'createdBy', 'timeCreated',
    #   and 'etag' fields. This parameter can also include 'tags' (freeformTags and definedTags). The only supported value of this parameter is 'tags' for now. Example 'tags'.
    #
    #   Allowed values are: tags
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type Array<{OCI::ObjectStorage::Models::BucketSummary BucketSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/list_buckets.rb.html) to see an example of how to use list_buckets API.
    def list_buckets(namespace_name, compartment_id, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#list_buckets.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_buckets." if namespace_name.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_buckets." if compartment_id.nil?


      fields_allowable_values = %w[tags]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of tags.'
          end
        end
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/n/{namespaceName}/b/'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :csv) if opts[:fields] && !opts[:fields].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#list_buckets') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::ObjectStorage::Models::BucketSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the parts of an in-progress multipart upload.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [String] object_name The name of the object. Avoid entering confidential information.
    #   Example: `test/object1.log`
    #
    # @param [String] upload_id The upload ID for a multipart upload.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to return in a paginated
    #   \"List\" call. For important details about how pagination works, see
    #   [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from the previous \"List\" call. For important
    #   details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type Array<{OCI::ObjectStorage::Models::MultipartUploadPartSummary MultipartUploadPartSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/list_multipart_upload_parts.rb.html) to see an example of how to use list_multipart_upload_parts API.
    def list_multipart_upload_parts(namespace_name, bucket_name, object_name, upload_id, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#list_multipart_upload_parts.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_multipart_upload_parts." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling list_multipart_upload_parts." if bucket_name.nil?
      raise "Missing the required parameter 'object_name' when calling list_multipart_upload_parts." if object_name.nil?
      raise "Missing the required parameter 'upload_id' when calling list_multipart_upload_parts." if upload_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)
      raise "Parameter value for 'object_name' must not be blank" if OCI::Internal::Util.blank_string?(object_name)

      path = '/n/{namespaceName}/b/{bucketName}/u/{objectName}'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s).sub('{objectName}', object_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:uploadId] = upload_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#list_multipart_upload_parts') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::ObjectStorage::Models::MultipartUploadPartSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists all of the in-progress multipart uploads for the given bucket in the given Object Storage namespace.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to return in a paginated
    #   \"List\" call. For important details about how pagination works, see
    #   [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from the previous \"List\" call. For important
    #   details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type Array<{OCI::ObjectStorage::Models::MultipartUpload MultipartUpload}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/list_multipart_uploads.rb.html) to see an example of how to use list_multipart_uploads API.
    def list_multipart_uploads(namespace_name, bucket_name, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#list_multipart_uploads.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_multipart_uploads." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling list_multipart_uploads." if bucket_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)

      path = '/n/{namespaceName}/b/{bucketName}/u'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#list_multipart_uploads') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::ObjectStorage::Models::MultipartUpload>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the object versions in a bucket.
    #
    # ListObjectVersions returns an ObjectVersionCollection containing at most 1000 object versions. To paginate through
    # more object versions, use the returned `opc-next-page` value with the `page` request parameter.
    #
    # To use this and other API operations, you must be authorized in an IAM policy. If you are not authorized,
    # talk to an administrator. If you are an administrator who needs to write policies to give users access, see
    # [Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :prefix The string to use for matching against the start of object names in a list query.
    # @option opts [String] :start Object names returned by a list query must be greater or equal to this parameter.
    # @option opts [String] :_end Object names returned by a list query must be strictly less than this parameter.
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to return in a paginated
    #   \"List\" call. For important details about how pagination works, see
    #   [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :delimiter When this parameter is set, only objects whose names do not contain the delimiter character
    #   (after an optionally specified prefix) are returned in the objects key of the response body.
    #   Scanned objects whose names contain the delimiter have the part of their name up to the first
    #   occurrence of the delimiter (including the optional prefix) returned as a set of prefixes.
    #   Note that only '/' is a supported delimiter character at this time.
    #
    # @option opts [String] :fields Object summary by default includes only the 'name' field. Use this parameter to also
    #   include 'size' (object size in bytes), 'etag', 'md5', 'timeCreated' (object creation date and time),
    #   'timeModified' (object modification date and time), 'storageTier' and 'archivalState' fields.
    #   Specify the value of this parameter as a comma-separated, case-insensitive list of those field names.
    #   For example 'name,etag,timeCreated,md5,timeModified,storageTier,archivalState'.
    #
    #   Allowed values are: name, size, etag, timeCreated, md5, timeModified, storageTier, archivalState
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @option opts [String] :start_after Object names returned by a list query must be greater than this parameter.
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from the previous \"List\" call. For important
    #   details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @return [Response] A Response object with data of type {OCI::ObjectStorage::Models::ObjectVersionCollection ObjectVersionCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/list_object_versions.rb.html) to see an example of how to use list_object_versions API.
    def list_object_versions(namespace_name, bucket_name, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#list_object_versions.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_object_versions." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling list_object_versions." if bucket_name.nil?

      if opts[:fields] && !%w[name size etag timeCreated md5 timeModified storageTier archivalState].include?(opts[:fields])
        raise 'Invalid value for "fields", must be one of name, size, etag, timeCreated, md5, timeModified, storageTier, archivalState.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)

      path = '/n/{namespaceName}/b/{bucketName}/objectversions'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:prefix] = opts[:prefix] if opts[:prefix]
      query_params[:start] = opts[:start] if opts[:start]
      query_params[:end] = opts[:_end] if opts[:_end]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:delimiter] = opts[:delimiter] if opts[:delimiter]
      query_params[:fields] = opts[:fields] if opts[:fields]
      query_params[:startAfter] = opts[:start_after] if opts[:start_after]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#list_object_versions') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ObjectStorage::Models::ObjectVersionCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the objects in a bucket. By default, ListObjects returns object names only. See the `fields`
    # parameter for other fields that you can optionally include in ListObjects response.
    #
    # ListObjects returns at most 1000 objects. To paginate through more objects, use the returned 'nextStartWith'
    # value with the 'start' parameter. To filter which objects ListObjects returns, use the 'start' and 'end'
    # parameters.
    #
    # To use this and other API operations, you must be authorized in an IAM policy. If you are not authorized,
    # talk to an administrator. If you are an administrator who needs to write policies to give users access, see
    # [Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :prefix The string to use for matching against the start of object names in a list query.
    # @option opts [String] :start Object names returned by a list query must be greater or equal to this parameter.
    # @option opts [String] :_end Object names returned by a list query must be strictly less than this parameter.
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to return in a paginated
    #   \"List\" call. For important details about how pagination works, see
    #   [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :delimiter When this parameter is set, only objects whose names do not contain the delimiter character
    #   (after an optionally specified prefix) are returned in the objects key of the response body.
    #   Scanned objects whose names contain the delimiter have the part of their name up to the first
    #   occurrence of the delimiter (including the optional prefix) returned as a set of prefixes.
    #   Note that only '/' is a supported delimiter character at this time.
    #
    # @option opts [String] :fields Object summary by default includes only the 'name' field. Use this parameter to also
    #   include 'size' (object size in bytes), 'etag', 'md5', 'timeCreated' (object creation date and time),
    #   'timeModified' (object modification date and time), 'storageTier' and 'archivalState' fields.
    #   Specify the value of this parameter as a comma-separated, case-insensitive list of those field names.
    #   For example 'name,etag,timeCreated,md5,timeModified,storageTier,archivalState'.
    #
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @option opts [String] :start_after Object names returned by a list query must be greater than this parameter.
    # @return [Response] A Response object with data of type {OCI::ObjectStorage::Models::ListObjects ListObjects}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/list_objects.rb.html) to see an example of how to use list_objects API.
    def list_objects(namespace_name, bucket_name, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#list_objects.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_objects." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling list_objects." if bucket_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)

      path = '/n/{namespaceName}/b/{bucketName}/o'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:prefix] = opts[:prefix] if opts[:prefix]
      query_params[:start] = opts[:start] if opts[:start]
      query_params[:end] = opts[:_end] if opts[:_end]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:delimiter] = opts[:delimiter] if opts[:delimiter]
      query_params[:fields] = opts[:fields] if opts[:fields]
      query_params[:startAfter] = opts[:start_after] if opts[:start_after]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#list_objects') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ObjectStorage::Models::ListObjects'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists pre-authenticated requests for the bucket.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :object_name_prefix User-specified object name prefixes can be used to query and return a list of pre-authenticated requests.
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to return in a paginated
    #   \"List\" call. For important details about how pagination works, see
    #   [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from the previous \"List\" call. For important
    #   details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type Array<{OCI::ObjectStorage::Models::PreauthenticatedRequestSummary PreauthenticatedRequestSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/list_preauthenticated_requests.rb.html) to see an example of how to use list_preauthenticated_requests API.
    def list_preauthenticated_requests(namespace_name, bucket_name, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#list_preauthenticated_requests.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_preauthenticated_requests." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling list_preauthenticated_requests." if bucket_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)

      path = '/n/{namespaceName}/b/{bucketName}/p/'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:objectNamePrefix] = opts[:object_name_prefix] if opts[:object_name_prefix]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#list_preauthenticated_requests') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::ObjectStorage::Models::PreauthenticatedRequestSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # List the replication policies associated with a bucket.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from the previous \"List\" call. For important
    #   details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to return in a paginated
    #   \"List\" call. For important details about how pagination works, see
    #   [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #    (default to 100)
    # @return [Response] A Response object with data of type Array<{OCI::ObjectStorage::Models::ReplicationPolicySummary ReplicationPolicySummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/list_replication_policies.rb.html) to see an example of how to use list_replication_policies API.
    def list_replication_policies(namespace_name, bucket_name, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#list_replication_policies.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_replication_policies." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling list_replication_policies." if bucket_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)

      path = '/n/{namespaceName}/b/{bucketName}/replicationPolicies'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s)
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
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#list_replication_policies') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::ObjectStorage::Models::ReplicationPolicySummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # List the replication sources of a destination bucket.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from the previous \"List\" call. For important
    #   details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to return in a paginated
    #   \"List\" call. For important details about how pagination works, see
    #   [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #    (default to 100)
    # @return [Response] A Response object with data of type Array<{OCI::ObjectStorage::Models::ReplicationSource ReplicationSource}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/list_replication_sources.rb.html) to see an example of how to use list_replication_sources API.
    def list_replication_sources(namespace_name, bucket_name, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#list_replication_sources.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_replication_sources." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling list_replication_sources." if bucket_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)

      path = '/n/{namespaceName}/b/{bucketName}/replicationSources'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s)
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
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#list_replication_sources') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::ObjectStorage::Models::ReplicationSource>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # List the retention rules for a bucket. The retention rules are sorted based on creation time,
    # with the most recently created retention rule returned first.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from the previous \"List\" call. For important
    #   details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @return [Response] A Response object with data of type {OCI::ObjectStorage::Models::RetentionRuleCollection RetentionRuleCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/list_retention_rules.rb.html) to see an example of how to use list_retention_rules API.
    def list_retention_rules(namespace_name, bucket_name, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#list_retention_rules.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_retention_rules." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling list_retention_rules." if bucket_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)

      path = '/n/{namespaceName}/b/{bucketName}/retentionRules'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#list_retention_rules') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ObjectStorage::Models::RetentionRuleCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the errors of the work request with the given ID.
    # @param [String] work_request_id The ID of the asynchronous request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from the previous \"List\" call. For important
    #   details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to return in a paginated
    #   \"List\" call. For important details about how pagination works, see
    #   [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type Array<{OCI::ObjectStorage::Models::WorkRequestError WorkRequestError}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/list_work_request_errors.rb.html) to see an example of how to use list_work_request_errors API.
    def list_work_request_errors(work_request_id, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#list_work_request_errors.' if logger

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
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#list_work_request_errors') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::ObjectStorage::Models::WorkRequestError>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the logs of the work request with the given ID.
    # @param [String] work_request_id The ID of the asynchronous request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from the previous \"List\" call. For important
    #   details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to return in a paginated
    #   \"List\" call. For important details about how pagination works, see
    #   [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type Array<{OCI::ObjectStorage::Models::WorkRequestLogEntry WorkRequestLogEntry}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/list_work_request_logs.rb.html) to see an example of how to use list_work_request_logs API.
    def list_work_request_logs(work_request_id, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#list_work_request_logs.' if logger

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
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#list_work_request_logs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::ObjectStorage::Models::WorkRequestLogEntry>'
        )
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
    # @param [String] compartment_id The ID of the compartment in which to list buckets.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from the previous \"List\" call. For important
    #   details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to return in a paginated
    #   \"List\" call. For important details about how pagination works, see
    #   [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @return [Response] A Response object with data of type Array<{OCI::ObjectStorage::Models::WorkRequestSummary WorkRequestSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/list_work_requests.rb.html) to see an example of how to use list_work_requests API.
    def list_work_requests(compartment_id, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#list_work_requests.' if logger

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
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#list_work_requests') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::ObjectStorage::Models::WorkRequestSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Stops replication to the destination bucket and removes the replication policy. When the replication
    # policy was created, this destination bucket became read-only except for new and changed objects replicated
    # automatically from the source bucket. MakeBucketWritable removes the replication policy. This bucket is no
    # longer the target for replication and is now writable, allowing users to make changes to bucket contents.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/make_bucket_writable.rb.html) to see an example of how to use make_bucket_writable API.
    def make_bucket_writable(namespace_name, bucket_name, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#make_bucket_writable.' if logger

      raise "Missing the required parameter 'namespace_name' when calling make_bucket_writable." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling make_bucket_writable." if bucket_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)

      path = '/n/{namespaceName}/b/{bucketName}/actions/makeBucketWritable'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#make_bucket_writable') do
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


    # Creates a new object or overwrites an existing object with the same name. The maximum object size allowed by
    # PutObject is 50 GiB.
    #
    # See [Object Names](https://docs.cloud.oracle.com/Content/Object/Tasks/managingobjects.htm#namerequirements)
    # for object naming requirements.
    #
    # See [Special Instructions for Object Storage PUT](https://docs.cloud.oracle.com/Content/API/Concepts/signingrequests.htm#ObjectStoragePut)
    # for request signature requirements.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [String] object_name The name of the object. Avoid entering confidential information.
    #   Example: `test/object1.log`
    #
    # @param [String, IO] put_object_body The object to upload to the object store.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :content_length The content length of the body.
    # @option opts [String] :if_match The entity tag (ETag) to match with the ETag of an existing resource. If the specified ETag matches the ETag of
    #   the existing resource, GET and HEAD requests will return the resource and PUT and POST requests will upload
    #   the resource.
    #
    # @option opts [String] :if_none_match The entity tag (ETag) to avoid matching. The only valid value is '*', which indicates that the request should
    #   fail if the resource already exists.
    #
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @option opts [String] :expect A value of `100-continue` requests preliminary verification of the request method, path, and headers before the request body is sent.
    #   If no error results from such verification, the server will send a 100 (Continue) interim response to indicate readiness for the request body.
    #   The only allowed value for this parameter is \"100-Continue\" (case-insensitive).
    #
    # @option opts [String] :content_md5 The optional base-64 header that defines the encoded MD5 hash of the body. If the optional Content-MD5 header is present, Object
    #   Storage performs an integrity check on the body of the HTTP request by computing the MD5 hash for the body and comparing it to the
    #   MD5 hash supplied in the header. If the two hashes do not match, the object is rejected and an HTTP-400 Unmatched Content MD5 error
    #   is returned with the message:
    #
    #   \"The computed MD5 of the request body (ACTUAL_MD5) does not match the Content-MD5 header (HEADER_MD5)\"
    #
    # @option opts [String] :content_type The optional Content-Type header that defines the standard MIME type format of the object. Content type defaults to
    #   'application/octet-stream' if not specified in the PutObject call. Specifying values for this header has no effect
    #   on Object Storage behavior. Programs that read the object determine what to do based on the value provided. For example,
    #   you could use this header to identify and perform special operations on text only objects.
    #
    # @option opts [String] :content_language The optional Content-Language header that defines the content language of the object to upload. Specifying
    #   values for this header has no effect on Object Storage behavior. Programs that read the object determine what
    #   to do based on the value provided. For example, you could use this header to identify and differentiate objects
    #   based on a particular language.
    #
    # @option opts [String] :content_encoding The optional Content-Encoding header that defines the content encodings that were applied to the object to
    #   upload. Specifying values for this header has no effect on Object Storage behavior. Programs that read the
    #   object determine what to do based on the value provided. For example, you could use this header to determine
    #   what decoding mechanisms need to be applied to obtain the media-type specified by the Content-Type header of
    #   the object.
    #
    # @option opts [String] :content_disposition The optional Content-Disposition header that defines presentational information for the object to be
    #   returned in GetObject and HeadObject responses. Specifying values for this header has no effect on Object
    #   Storage behavior. Programs that read the object determine what to do based on the value provided.
    #   For example, you could use this header to let users download objects with custom filenames in a browser.
    #
    # @option opts [String] :cache_control The optional Cache-Control header that defines the caching behavior value to be returned in GetObject and
    #   HeadObject responses. Specifying values for this header has no effect on Object Storage behavior. Programs
    #   that read the object determine what to do based on the value provided.
    #   For example, you could use this header to identify objects that require caching restrictions.
    #
    # @option opts [String] :opc_sse_customer_algorithm The optional header that specifies \"AES256\" as the encryption algorithm. For more information, see
    #   [Using Your Own Keys for Server-Side Encryption](https://docs.cloud.oracle.com/Content/Object/Tasks/usingyourencryptionkeys.htm).
    #
    # @option opts [String] :opc_sse_customer_key The optional header that specifies the base64-encoded 256-bit encryption key to use to encrypt or
    #   decrypt the data. For more information, see
    #   [Using Your Own Keys for Server-Side Encryption](https://docs.cloud.oracle.com/Content/Object/Tasks/usingyourencryptionkeys.htm).
    #
    # @option opts [String] :opc_sse_customer_key_sha256 The optional header that specifies the base64-encoded SHA256 hash of the encryption key. This
    #   value is used to check the integrity of the encryption key. For more information, see
    #   [Using Your Own Keys for Server-Side Encryption](https://docs.cloud.oracle.com/Content/Object/Tasks/usingyourencryptionkeys.htm).
    #
    # @option opts [String] :opc_sse_kms_key_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of a master encryption key used to call the Key
    #   Management service to generate a data encryption key or to encrypt or decrypt a data encryption key.
    #
    # @option opts [String] :storage_tier The storage tier that the object should be stored in. If not specified, the object will be stored in
    #   the same storage tier as the bucket.
    #
    # @option opts [Hash<String, String>] :opc_meta Optional user-defined metadata key and value.
    #   "opc-meta-" will be appended to each Hash key before it is sent to the server.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/put_object.rb.html) to see an example of how to use put_object API.
    def put_object(namespace_name, bucket_name, object_name, put_object_body, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#put_object.' if logger

      raise "Missing the required parameter 'namespace_name' when calling put_object." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling put_object." if bucket_name.nil?
      raise "Missing the required parameter 'object_name' when calling put_object." if object_name.nil?
      raise "Missing the required parameter 'put_object_body' when calling put_object." if put_object_body.nil?

      if opts[:storage_tier] && !OCI::ObjectStorage::Models::STORAGE_TIER_ENUM.include?(opts[:storage_tier])
        raise 'Invalid value for "storage_tier", must be one of the values in OCI::ObjectStorage::Models::STORAGE_TIER_ENUM.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)
      raise "Parameter value for 'object_name' must not be blank" if OCI::Internal::Util.blank_string?(object_name)

      path = '/n/{namespaceName}/b/{bucketName}/o/{objectName}'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s).sub('{objectName}', object_name.to_s)
      operation_signing_strategy = :exclude_body

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      header_params[:expect] = opts[:expect] if opts[:expect]
      header_params[:'content-length'] = opts[:content_length] if opts[:content_length]
      header_params[:'content-md5'] = opts[:content_md5] if opts[:content_md5]
      header_params[:'content-type'] = opts[:content_type] if opts[:content_type]
      header_params[:'content-language'] = opts[:content_language] if opts[:content_language]
      header_params[:'content-encoding'] = opts[:content_encoding] if opts[:content_encoding]
      header_params[:'content-disposition'] = opts[:content_disposition] if opts[:content_disposition]
      header_params[:'cache-control'] = opts[:cache_control] if opts[:cache_control]
      header_params[:'opc-sse-customer-algorithm'] = opts[:opc_sse_customer_algorithm] if opts[:opc_sse_customer_algorithm]
      header_params[:'opc-sse-customer-key'] = opts[:opc_sse_customer_key] if opts[:opc_sse_customer_key]
      header_params[:'opc-sse-customer-key-sha256'] = opts[:opc_sse_customer_key_sha256] if opts[:opc_sse_customer_key_sha256]
      header_params[:'opc-sse-kms-key-id'] = opts[:opc_sse_kms_key_id] if opts[:opc_sse_kms_key_id]
      header_params[:'storage-tier'] = opts[:storage_tier] if opts[:storage_tier]
      # rubocop:enable Style/NegatedIf

      if opts[:opc_meta]
        opts[:opc_meta].each do |key, value|
          header_params["opc-meta-#{key}".to_sym] = value
        end
      end
      header_params[:'content-type'] ||= 'application/octet-stream'
      header_params[:expect] ||= '100-continue'

      post_body = @api_client.object_to_http_body(put_object_body)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#put_object') do
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


    # Creates or replaces the object lifecycle policy for the bucket.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [OCI::ObjectStorage::Models::PutObjectLifecyclePolicyDetails] put_object_lifecycle_policy_details The lifecycle policy to apply to the bucket.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @option opts [String] :if_match The entity tag (ETag) to match with the ETag of an existing resource. If the specified ETag matches the ETag of
    #   the existing resource, GET and HEAD requests will return the resource and PUT and POST requests will upload
    #   the resource.
    #
    # @option opts [String] :if_none_match The entity tag (ETag) to avoid matching. The only valid value is '*', which indicates that the request should
    #   fail if the resource already exists.
    #
    # @return [Response] A Response object with data of type {OCI::ObjectStorage::Models::ObjectLifecyclePolicy ObjectLifecyclePolicy}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/put_object_lifecycle_policy.rb.html) to see an example of how to use put_object_lifecycle_policy API.
    def put_object_lifecycle_policy(namespace_name, bucket_name, put_object_lifecycle_policy_details, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#put_object_lifecycle_policy.' if logger

      raise "Missing the required parameter 'namespace_name' when calling put_object_lifecycle_policy." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling put_object_lifecycle_policy." if bucket_name.nil?
      raise "Missing the required parameter 'put_object_lifecycle_policy_details' when calling put_object_lifecycle_policy." if put_object_lifecycle_policy_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)

      path = '/n/{namespaceName}/b/{bucketName}/l'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(put_object_lifecycle_policy_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#put_object_lifecycle_policy') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ObjectStorage::Models::ObjectLifecyclePolicy'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Re-encrypts the unique data encryption key that encrypts each object written to the bucket by using the most recent
    # version of the master encryption key assigned to the bucket. (All data encryption keys are encrypted by a master
    # encryption key. Master encryption keys are assigned to buckets and managed by Oracle by default, but you can assign
    # a key that you created and control through the Oracle Cloud Infrastructure Key Management service.) The kmsKeyId property
    # of the bucket determines which master encryption key is assigned to the bucket. If you assigned a different Key Management
    # master encryption key to the bucket, you can call this API to re-encrypt all data encryption keys with the newly
    # assigned key. Similarly, you might want to re-encrypt all data encryption keys if the assigned key has been rotated to
    # a new key version since objects were last added to the bucket. If you call this API and there is no kmsKeyId associated
    # with the bucket, the call will fail.
    #
    # Calling this API starts a work request task to re-encrypt the data encryption key of all objects in the bucket. Only
    # objects created before the time of the API call will be re-encrypted. The call can take a long time, depending on how many
    # objects are in the bucket and how big they are. This API returns a work request ID that you can use to retrieve the status
    # of the work request task.
    # All the versions of objects will be re-encrypted whether versioning is enabled or suspended at the bucket.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/reencrypt_bucket.rb.html) to see an example of how to use reencrypt_bucket API.
    def reencrypt_bucket(namespace_name, bucket_name, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#reencrypt_bucket.' if logger

      raise "Missing the required parameter 'namespace_name' when calling reencrypt_bucket." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling reencrypt_bucket." if bucket_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)

      path = '/n/{namespaceName}/b/{bucketName}/actions/reencrypt'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#reencrypt_bucket') do
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


    # Re-encrypts the data encryption keys that encrypt the object and its chunks. By default, when you create a bucket, the Object Storage
    # service manages the master encryption key used to encrypt each object's data encryption keys. The encryption mechanism that you specify for
    # the bucket applies to the objects it contains.
    #
    # You can alternatively employ one of these encryption strategies for an object:
    #
    # - You can assign a key that you created and control through the Oracle Cloud Infrastructure Vault service.
    #
    # - You can encrypt an object using your own encryption key. The key you supply is known as a customer-provided encryption key (SSE-C).
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [String] object_name The name of the object. Avoid entering confidential information.
    #   Example: `test/object1.log`
    #
    # @param [OCI::ObjectStorage::Models::ReencryptObjectDetails] reencrypt_object_details Request object for re-encrypting the data encryption key associated with an object.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :version_id VersionId used to identify a particular version of the object
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/reencrypt_object.rb.html) to see an example of how to use reencrypt_object API.
    def reencrypt_object(namespace_name, bucket_name, object_name, reencrypt_object_details, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#reencrypt_object.' if logger

      raise "Missing the required parameter 'namespace_name' when calling reencrypt_object." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling reencrypt_object." if bucket_name.nil?
      raise "Missing the required parameter 'object_name' when calling reencrypt_object." if object_name.nil?
      raise "Missing the required parameter 'reencrypt_object_details' when calling reencrypt_object." if reencrypt_object_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)
      raise "Parameter value for 'object_name' must not be blank" if OCI::Internal::Util.blank_string?(object_name)

      path = '/n/{namespaceName}/b/{bucketName}/actions/reencrypt/{objectName}'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s).sub('{objectName}', object_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:versionId] = opts[:version_id] if opts[:version_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(reencrypt_object_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#reencrypt_object') do
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


    # Rename an object in the given Object Storage namespace.
    #
    # See [Object Names](https://docs.cloud.oracle.com/Content/Object/Tasks/managingobjects.htm#namerequirements)
    # for object naming requirements.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [OCI::ObjectStorage::Models::RenameObjectDetails] rename_object_details The sourceName and newName of rename operation. Avoid entering confidential information.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/rename_object.rb.html) to see an example of how to use rename_object API.
    def rename_object(namespace_name, bucket_name, rename_object_details, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#rename_object.' if logger

      raise "Missing the required parameter 'namespace_name' when calling rename_object." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling rename_object." if bucket_name.nil?
      raise "Missing the required parameter 'rename_object_details' when calling rename_object." if rename_object_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)

      path = '/n/{namespaceName}/b/{bucketName}/actions/renameObject'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(rename_object_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#rename_object') do
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


    # Restores one or more objects specified by the objectName parameter.
    # By default objects will be restored for 24 hours. Duration can be configured using the hours parameter.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [OCI::ObjectStorage::Models::RestoreObjectsDetails] restore_objects_details Request to restore objects.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/restore_objects.rb.html) to see an example of how to use restore_objects API.
    def restore_objects(namespace_name, bucket_name, restore_objects_details, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#restore_objects.' if logger

      raise "Missing the required parameter 'namespace_name' when calling restore_objects." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling restore_objects." if bucket_name.nil?
      raise "Missing the required parameter 'restore_objects_details' when calling restore_objects." if restore_objects_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)

      path = '/n/{namespaceName}/b/{bucketName}/actions/restoreObjects'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(restore_objects_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#restore_objects') do
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


    # Performs a partial or full update of a bucket's user-defined metadata.
    #
    # Use UpdateBucket to move a bucket from one compartment to another within the same tenancy. Supply the compartmentID
    # of the compartment that you want to move the bucket to. For more information about moving resources between compartments,
    # see [Moving Resources to a Different Compartment](https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/managingcompartments.htm#moveRes).
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [OCI::ObjectStorage::Models::UpdateBucketDetails] update_bucket_details Request object for updating a bucket.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The entity tag (ETag) to match with the ETag of an existing resource. If the specified ETag matches the ETag of
    #   the existing resource, GET and HEAD requests will return the resource and PUT and POST requests will upload
    #   the resource.
    #
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::ObjectStorage::Models::Bucket Bucket}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/update_bucket.rb.html) to see an example of how to use update_bucket API.
    def update_bucket(namespace_name, bucket_name, update_bucket_details, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#update_bucket.' if logger

      raise "Missing the required parameter 'namespace_name' when calling update_bucket." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling update_bucket." if bucket_name.nil?
      raise "Missing the required parameter 'update_bucket_details' when calling update_bucket." if update_bucket_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)

      path = '/n/{namespaceName}/b/{bucketName}/'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_bucket_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#update_bucket') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ObjectStorage::Models::Bucket'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # By default, buckets created using the Amazon S3 Compatibility API or the Swift API are created in the root
    # compartment of the Oracle Cloud Infrastructure tenancy.
    #
    # You can change the default Swift/Amazon S3 compartmentId designation to a different compartmentId. All
    # subsequent bucket creations will use the new default compartment, but no previously created
    # buckets will be modified. A user must have OBJECTSTORAGE_NAMESPACE_UPDATE permission to make changes to the default
    # compartments for Amazon S3 and Swift.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [OCI::ObjectStorage::Models::UpdateNamespaceMetadataDetails] update_namespace_metadata_details Request object for update NamespaceMetadata.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::ObjectStorage::Models::NamespaceMetadata NamespaceMetadata}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/update_namespace_metadata.rb.html) to see an example of how to use update_namespace_metadata API.
    def update_namespace_metadata(namespace_name, update_namespace_metadata_details, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#update_namespace_metadata.' if logger

      raise "Missing the required parameter 'namespace_name' when calling update_namespace_metadata." if namespace_name.nil?
      raise "Missing the required parameter 'update_namespace_metadata_details' when calling update_namespace_metadata." if update_namespace_metadata_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/n/{namespaceName}'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_namespace_metadata_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#update_namespace_metadata') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ObjectStorage::Models::NamespaceMetadata'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Changes the storage tier of the object specified by the objectName parameter.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [OCI::ObjectStorage::Models::UpdateObjectStorageTierDetails] update_object_storage_tier_details The object name and the desired storage tier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/update_object_storage_tier.rb.html) to see an example of how to use update_object_storage_tier API.
    def update_object_storage_tier(namespace_name, bucket_name, update_object_storage_tier_details, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#update_object_storage_tier.' if logger

      raise "Missing the required parameter 'namespace_name' when calling update_object_storage_tier." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling update_object_storage_tier." if bucket_name.nil?
      raise "Missing the required parameter 'update_object_storage_tier_details' when calling update_object_storage_tier." if update_object_storage_tier_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)

      path = '/n/{namespaceName}/b/{bucketName}/actions/updateObjectStorageTier'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_object_storage_tier_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#update_object_storage_tier') do
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


    # Updates the specified retention rule. Rule changes take effect typically within 30 seconds.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [String] retention_rule_id The ID of the retention rule.
    # @param [OCI::ObjectStorage::Models::UpdateRetentionRuleDetails] update_retention_rule_details Request object for updating the retention rule.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The entity tag (ETag) to match with the ETag of an existing resource. If the specified ETag matches the ETag of
    #   the existing resource, GET and HEAD requests will return the resource and PUT and POST requests will upload
    #   the resource.
    #
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::ObjectStorage::Models::RetentionRule RetentionRule}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/update_retention_rule.rb.html) to see an example of how to use update_retention_rule API.
    def update_retention_rule(namespace_name, bucket_name, retention_rule_id, update_retention_rule_details, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#update_retention_rule.' if logger

      raise "Missing the required parameter 'namespace_name' when calling update_retention_rule." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling update_retention_rule." if bucket_name.nil?
      raise "Missing the required parameter 'retention_rule_id' when calling update_retention_rule." if retention_rule_id.nil?
      raise "Missing the required parameter 'update_retention_rule_details' when calling update_retention_rule." if update_retention_rule_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)
      raise "Parameter value for 'retention_rule_id' must not be blank" if OCI::Internal::Util.blank_string?(retention_rule_id)

      path = '/n/{namespaceName}/b/{bucketName}/retentionRules/{retentionRuleId}'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s).sub('{retentionRuleId}', retention_rule_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_retention_rule_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#update_retention_rule') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ObjectStorage::Models::RetentionRule'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Uploads a single part of a multipart upload.
    #
    # @param [String] namespace_name The Object Storage namespace used for the request.
    # @param [String] bucket_name The name of the bucket. Avoid entering confidential information.
    #   Example: `my-new-bucket1`
    #
    # @param [String] object_name The name of the object. Avoid entering confidential information.
    #   Example: `test/object1.log`
    #
    # @param [String] upload_id The upload ID for a multipart upload.
    # @param [Integer] upload_part_num The part number that identifies the object part currently being uploaded.
    # @param [String, IO] upload_part_body The part being uploaded to the Object Storage service.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :content_length The content length of the body.
    # @option opts [String] :opc_client_request_id The client request ID for tracing.
    # @option opts [String] :if_match The entity tag (ETag) to match with the ETag of an existing resource. If the specified ETag matches the ETag of
    #   the existing resource, GET and HEAD requests will return the resource and PUT and POST requests will upload
    #   the resource.
    #
    # @option opts [String] :if_none_match The entity tag (ETag) to avoid matching. The only valid value is '*', which indicates that the request should
    #   fail if the resource already exists.
    #
    # @option opts [String] :expect A value of `100-continue` requests preliminary verification of the request method, path, and headers before the request body is sent.
    #   If no error results from such verification, the server will send a 100 (Continue) interim response to indicate readiness for the request body.
    #   The only allowed value for this parameter is \"100-Continue\" (case-insensitive).
    #
    # @option opts [String] :content_md5 The optional base-64 header that defines the encoded MD5 hash of the body. If the optional Content-MD5 header is present, Object
    #   Storage performs an integrity check on the body of the HTTP request by computing the MD5 hash for the body and comparing it to the
    #   MD5 hash supplied in the header. If the two hashes do not match, the object is rejected and an HTTP-400 Unmatched Content MD5 error
    #   is returned with the message:
    #
    #   \"The computed MD5 of the request body (ACTUAL_MD5) does not match the Content-MD5 header (HEADER_MD5)\"
    #
    # @option opts [String] :opc_sse_customer_algorithm The optional header that specifies \"AES256\" as the encryption algorithm. For more information, see
    #   [Using Your Own Keys for Server-Side Encryption](https://docs.cloud.oracle.com/Content/Object/Tasks/usingyourencryptionkeys.htm).
    #
    # @option opts [String] :opc_sse_customer_key The optional header that specifies the base64-encoded 256-bit encryption key to use to encrypt or
    #   decrypt the data. For more information, see
    #   [Using Your Own Keys for Server-Side Encryption](https://docs.cloud.oracle.com/Content/Object/Tasks/usingyourencryptionkeys.htm).
    #
    # @option opts [String] :opc_sse_customer_key_sha256 The optional header that specifies the base64-encoded SHA256 hash of the encryption key. This
    #   value is used to check the integrity of the encryption key. For more information, see
    #   [Using Your Own Keys for Server-Side Encryption](https://docs.cloud.oracle.com/Content/Object/Tasks/usingyourencryptionkeys.htm).
    #
    # @option opts [String] :opc_sse_kms_key_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of a master encryption key used to call the Key
    #   Management service to generate a data encryption key or to encrypt or decrypt a data encryption key.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/objectstorage/upload_part.rb.html) to see an example of how to use upload_part API.
    def upload_part(namespace_name, bucket_name, object_name, upload_id, upload_part_num, upload_part_body, opts = {})
      logger.debug 'Calling operation ObjectStorageClient#upload_part.' if logger

      raise "Missing the required parameter 'namespace_name' when calling upload_part." if namespace_name.nil?
      raise "Missing the required parameter 'bucket_name' when calling upload_part." if bucket_name.nil?
      raise "Missing the required parameter 'object_name' when calling upload_part." if object_name.nil?
      raise "Missing the required parameter 'upload_id' when calling upload_part." if upload_id.nil?
      raise "Missing the required parameter 'upload_part_num' when calling upload_part." if upload_part_num.nil?
      raise "Missing the required parameter 'upload_part_body' when calling upload_part." if upload_part_body.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'bucket_name' must not be blank" if OCI::Internal::Util.blank_string?(bucket_name)
      raise "Parameter value for 'object_name' must not be blank" if OCI::Internal::Util.blank_string?(object_name)

      path = '/n/{namespaceName}/b/{bucketName}/u/{objectName}'.sub('{namespaceName}', namespace_name.to_s).sub('{bucketName}', bucket_name.to_s).sub('{objectName}', object_name.to_s)
      operation_signing_strategy = :exclude_body

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:uploadId] = upload_id
      query_params[:uploadPartNum] = upload_part_num

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'opc-client-request-id'] = opts[:opc_client_request_id] if opts[:opc_client_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      header_params[:expect] = opts[:expect] if opts[:expect]
      header_params[:'content-length'] = opts[:content_length] if opts[:content_length]
      header_params[:'content-md5'] = opts[:content_md5] if opts[:content_md5]
      header_params[:'opc-sse-customer-algorithm'] = opts[:opc_sse_customer_algorithm] if opts[:opc_sse_customer_algorithm]
      header_params[:'opc-sse-customer-key'] = opts[:opc_sse_customer_key] if opts[:opc_sse_customer_key]
      header_params[:'opc-sse-customer-key-sha256'] = opts[:opc_sse_customer_key_sha256] if opts[:opc_sse_customer_key_sha256]
      header_params[:'opc-sse-kms-key-id'] = opts[:opc_sse_kms_key_id] if opts[:opc_sse_kms_key_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'content-type'] ||= 'application/octet-stream'
      header_params[:expect] ||= '100-continue'

      post_body = @api_client.object_to_http_body(upload_part_body)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ObjectStorageClient#upload_part') do
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
