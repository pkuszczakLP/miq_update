=begin
#Site Manager API

#Site Manager API

The version of the OpenAPI document: 1.0.0
Contact: autosde@il.ibm.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.0.0

=end

require 'cgi'

module AutosdeOpenapiClient
  class ServiceResourceAttachmentApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # @param [Hash] opts the optional parameters
    # @return [Array<ServiceResourceAttachmentResponse>]
    def service_resource_attachment_get(opts = {})
      data, _status_code, _headers = service_resource_attachment_get_with_http_info(opts)
      data
    end

    # @param [Hash] opts the optional parameters
    # @return [Array<(Array<ServiceResourceAttachmentResponse>, Integer, Hash)>] Array<ServiceResourceAttachmentResponse> data, response status code and response headers
    def service_resource_attachment_get_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ServiceResourceAttachmentApi.service_resource_attachment_get ...'
      end
      # resource path
      local_var_path = '/service-resource-attachment'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['*/*'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Array<ServiceResourceAttachmentResponse>'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"ServiceResourceAttachmentApi.service_resource_attachment_get",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ServiceResourceAttachmentApi#service_resource_attachment_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # @param pk [Integer] 
    # @param [Hash] opts the optional parameters
    # @return [AsyncResponse]
    def service_resource_attachment_pk_delete(pk, opts = {})
      data, _status_code, _headers = service_resource_attachment_pk_delete_with_http_info(pk, opts)
      data
    end

    # @param pk [Integer] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(AsyncResponse, Integer, Hash)>] AsyncResponse data, response status code and response headers
    def service_resource_attachment_pk_delete_with_http_info(pk, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ServiceResourceAttachmentApi.service_resource_attachment_pk_delete ...'
      end
      # verify the required parameter 'pk' is set
      if @api_client.config.client_side_validation && pk.nil?
        fail ArgumentError, "Missing the required parameter 'pk' when calling ServiceResourceAttachmentApi.service_resource_attachment_pk_delete"
      end
      # resource path
      local_var_path = '/service-resource-attachment/{pk}'.sub('{' + 'pk' + '}', CGI.escape(pk.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['*/*'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'AsyncResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"ServiceResourceAttachmentApi.service_resource_attachment_pk_delete",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ServiceResourceAttachmentApi#service_resource_attachment_pk_delete\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # @param pk [Integer] 
    # @param [Hash] opts the optional parameters
    # @return [ServiceResourceAttachmentResponse]
    def service_resource_attachment_pk_get(pk, opts = {})
      data, _status_code, _headers = service_resource_attachment_pk_get_with_http_info(pk, opts)
      data
    end

    # @param pk [Integer] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(ServiceResourceAttachmentResponse, Integer, Hash)>] ServiceResourceAttachmentResponse data, response status code and response headers
    def service_resource_attachment_pk_get_with_http_info(pk, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ServiceResourceAttachmentApi.service_resource_attachment_pk_get ...'
      end
      # verify the required parameter 'pk' is set
      if @api_client.config.client_side_validation && pk.nil?
        fail ArgumentError, "Missing the required parameter 'pk' when calling ServiceResourceAttachmentApi.service_resource_attachment_pk_get"
      end
      # resource path
      local_var_path = '/service-resource-attachment/{pk}'.sub('{' + 'pk' + '}', CGI.escape(pk.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['*/*'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'ServiceResourceAttachmentResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"ServiceResourceAttachmentApi.service_resource_attachment_pk_get",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ServiceResourceAttachmentApi#service_resource_attachment_pk_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # @param service_resource_attachment_create [ServiceResourceAttachmentCreate] 
    # @param [Hash] opts the optional parameters
    # @return [AsyncResponse]
    def service_resource_attachment_post(service_resource_attachment_create, opts = {})
      data, _status_code, _headers = service_resource_attachment_post_with_http_info(service_resource_attachment_create, opts)
      data
    end

    # @param service_resource_attachment_create [ServiceResourceAttachmentCreate] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(AsyncResponse, Integer, Hash)>] AsyncResponse data, response status code and response headers
    def service_resource_attachment_post_with_http_info(service_resource_attachment_create, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ServiceResourceAttachmentApi.service_resource_attachment_post ...'
      end
      # verify the required parameter 'service_resource_attachment_create' is set
      if @api_client.config.client_side_validation && service_resource_attachment_create.nil?
        fail ArgumentError, "Missing the required parameter 'service_resource_attachment_create' when calling ServiceResourceAttachmentApi.service_resource_attachment_post"
      end
      # resource path
      local_var_path = '/service-resource-attachment'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['*/*'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(service_resource_attachment_create)

      # return_type
      return_type = opts[:debug_return_type] || 'AsyncResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"ServiceResourceAttachmentApi.service_resource_attachment_post",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ServiceResourceAttachmentApi#service_resource_attachment_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
