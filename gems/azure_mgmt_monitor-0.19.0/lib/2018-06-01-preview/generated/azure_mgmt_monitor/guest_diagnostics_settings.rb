# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Monitor::Mgmt::V2018_06_01_preview
  #
  # GuestDiagnosticsSettings
  #
  class GuestDiagnosticsSettings
    include MsRestAzure

    #
    # Creates and initializes a new instance of the GuestDiagnosticsSettings class.
    # @param client service class for accessing basic functionality.
    #
    def initialize(client)
      @client = client
    end

    # @return [MonitorManagementClient] reference to the MonitorManagementClient
    attr_reader :client

    #
    # Creates or updates guest diagnostics settings.
    #
    # @param resource_group_name [String] The name of the resource group.
    # @param diagnostic_settings_name [String] The name of the diagnostic setting.
    # @param diagnostic_settings [GuestDiagnosticSettingsResource] The
    # configuration to create or update.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [GuestDiagnosticSettingsResource] operation results.
    #
    def create_or_update(resource_group_name, diagnostic_settings_name, diagnostic_settings, custom_headers:nil)
      response = create_or_update_async(resource_group_name, diagnostic_settings_name, diagnostic_settings, custom_headers:custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Creates or updates guest diagnostics settings.
    #
    # @param resource_group_name [String] The name of the resource group.
    # @param diagnostic_settings_name [String] The name of the diagnostic setting.
    # @param diagnostic_settings [GuestDiagnosticSettingsResource] The
    # configuration to create or update.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def create_or_update_with_http_info(resource_group_name, diagnostic_settings_name, diagnostic_settings, custom_headers:nil)
      create_or_update_async(resource_group_name, diagnostic_settings_name, diagnostic_settings, custom_headers:custom_headers).value!
    end

    #
    # Creates or updates guest diagnostics settings.
    #
    # @param resource_group_name [String] The name of the resource group.
    # @param diagnostic_settings_name [String] The name of the diagnostic setting.
    # @param diagnostic_settings [GuestDiagnosticSettingsResource] The
    # configuration to create or update.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def create_or_update_async(resource_group_name, diagnostic_settings_name, diagnostic_settings, custom_headers:nil)
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, 'diagnostic_settings_name is nil' if diagnostic_settings_name.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      fail ArgumentError, 'diagnostic_settings is nil' if diagnostic_settings.nil?


      request_headers = {}
      request_headers['Content-Type'] = 'application/json; charset=utf-8'

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?

      # Serialize Request
      request_mapper = Azure::Monitor::Mgmt::V2018_06_01_preview::Models::GuestDiagnosticSettingsResource.mapper()
      request_content = @client.serialize(request_mapper,  diagnostic_settings)
      request_content = request_content != nil ? JSON.generate(request_content, quirks_mode: true) : nil

      path_template = 'subscriptions/{subscriptionId}/resourcegroups/{resourceGroupName}/providers/microsoft.insights/guestDiagnosticSettings/{diagnosticSettingsName}'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'resourceGroupName' => resource_group_name,'diagnosticSettingsName' => diagnostic_settings_name,'subscriptionId' => @client.subscription_id},
          query_params: {'api-version' => @client.api_version},
          body: request_content,
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:put, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200 || status_code == 201
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        result.correlation_request_id = http_response['x-ms-correlation-request-id'] unless http_response['x-ms-correlation-request-id'].nil?
        result.client_request_id = http_response['x-ms-client-request-id'] unless http_response['x-ms-client-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = Azure::Monitor::Mgmt::V2018_06_01_preview::Models::GuestDiagnosticSettingsResource.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response)
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end
        # Deserialize Response
        if status_code == 201
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = Azure::Monitor::Mgmt::V2018_06_01_preview::Models::GuestDiagnosticSettingsResource.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response)
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Gets guest diagnostics settings.
    #
    # @param resource_group_name [String] The name of the resource group.
    # @param diagnostic_settings_name [String] The name of the diagnostic setting.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [GuestDiagnosticSettingsResource] operation results.
    #
    def get(resource_group_name, diagnostic_settings_name, custom_headers:nil)
      response = get_async(resource_group_name, diagnostic_settings_name, custom_headers:custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Gets guest diagnostics settings.
    #
    # @param resource_group_name [String] The name of the resource group.
    # @param diagnostic_settings_name [String] The name of the diagnostic setting.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def get_with_http_info(resource_group_name, diagnostic_settings_name, custom_headers:nil)
      get_async(resource_group_name, diagnostic_settings_name, custom_headers:custom_headers).value!
    end

    #
    # Gets guest diagnostics settings.
    #
    # @param resource_group_name [String] The name of the resource group.
    # @param diagnostic_settings_name [String] The name of the diagnostic setting.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def get_async(resource_group_name, diagnostic_settings_name, custom_headers:nil)
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, 'diagnostic_settings_name is nil' if diagnostic_settings_name.nil?
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?


      request_headers = {}
      request_headers['Content-Type'] = 'application/json; charset=utf-8'

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = 'subscriptions/{subscriptionId}/resourcegroups/{resourceGroupName}/providers/microsoft.insights/guestDiagnosticSettings/{diagnosticSettingsName}'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'resourceGroupName' => resource_group_name,'diagnosticSettingsName' => diagnostic_settings_name,'subscriptionId' => @client.subscription_id},
          query_params: {'api-version' => @client.api_version},
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:get, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        result.correlation_request_id = http_response['x-ms-correlation-request-id'] unless http_response['x-ms-correlation-request-id'].nil?
        result.client_request_id = http_response['x-ms-client-request-id'] unless http_response['x-ms-client-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = Azure::Monitor::Mgmt::V2018_06_01_preview::Models::GuestDiagnosticSettingsResource.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response)
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Updates guest diagnostics settings.
    #
    # @param resource_group_name [String] The name of the resource group.
    # @param diagnostic_settings_name [String] The name of the diagnostic setting.
    # @param parameters [GuestDiagnosticSettingsPatchResource] The configuration to
    # patch.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [GuestDiagnosticSettingsResource] operation results.
    #
    def update(resource_group_name, diagnostic_settings_name, parameters, custom_headers:nil)
      response = update_async(resource_group_name, diagnostic_settings_name, parameters, custom_headers:custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Updates guest diagnostics settings.
    #
    # @param resource_group_name [String] The name of the resource group.
    # @param diagnostic_settings_name [String] The name of the diagnostic setting.
    # @param parameters [GuestDiagnosticSettingsPatchResource] The configuration to
    # patch.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def update_with_http_info(resource_group_name, diagnostic_settings_name, parameters, custom_headers:nil)
      update_async(resource_group_name, diagnostic_settings_name, parameters, custom_headers:custom_headers).value!
    end

    #
    # Updates guest diagnostics settings.
    #
    # @param resource_group_name [String] The name of the resource group.
    # @param diagnostic_settings_name [String] The name of the diagnostic setting.
    # @param parameters [GuestDiagnosticSettingsPatchResource] The configuration to
    # patch.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def update_async(resource_group_name, diagnostic_settings_name, parameters, custom_headers:nil)
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, 'diagnostic_settings_name is nil' if diagnostic_settings_name.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      fail ArgumentError, 'parameters is nil' if parameters.nil?


      request_headers = {}
      request_headers['Content-Type'] = 'application/json; charset=utf-8'

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?

      # Serialize Request
      request_mapper = Azure::Monitor::Mgmt::V2018_06_01_preview::Models::GuestDiagnosticSettingsPatchResource.mapper()
      request_content = @client.serialize(request_mapper,  parameters)
      request_content = request_content != nil ? JSON.generate(request_content, quirks_mode: true) : nil

      path_template = 'subscriptions/{subscriptionId}/resourcegroups/{resourceGroupName}/providers/microsoft.insights/guestDiagnosticSettings/{diagnosticSettingsName}'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'resourceGroupName' => resource_group_name,'diagnosticSettingsName' => diagnostic_settings_name,'subscriptionId' => @client.subscription_id},
          query_params: {'api-version' => @client.api_version},
          body: request_content,
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:patch, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200 || status_code == 201
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        result.correlation_request_id = http_response['x-ms-correlation-request-id'] unless http_response['x-ms-correlation-request-id'].nil?
        result.client_request_id = http_response['x-ms-client-request-id'] unless http_response['x-ms-client-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = Azure::Monitor::Mgmt::V2018_06_01_preview::Models::GuestDiagnosticSettingsResource.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response)
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end
        # Deserialize Response
        if status_code == 201
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = Azure::Monitor::Mgmt::V2018_06_01_preview::Models::GuestDiagnosticSettingsResource.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response)
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Delete guest diagnostics settings.
    #
    # @param resource_group_name [String] The name of the resource group.
    # @param diagnostic_settings_name [String] The name of the diagnostic setting.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    #
    def delete(resource_group_name, diagnostic_settings_name, custom_headers:nil)
      response = delete_async(resource_group_name, diagnostic_settings_name, custom_headers:custom_headers).value!
      nil
    end

    #
    # Delete guest diagnostics settings.
    #
    # @param resource_group_name [String] The name of the resource group.
    # @param diagnostic_settings_name [String] The name of the diagnostic setting.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def delete_with_http_info(resource_group_name, diagnostic_settings_name, custom_headers:nil)
      delete_async(resource_group_name, diagnostic_settings_name, custom_headers:custom_headers).value!
    end

    #
    # Delete guest diagnostics settings.
    #
    # @param resource_group_name [String] The name of the resource group.
    # @param diagnostic_settings_name [String] The name of the diagnostic setting.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def delete_async(resource_group_name, diagnostic_settings_name, custom_headers:nil)
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, 'diagnostic_settings_name is nil' if diagnostic_settings_name.nil?
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?


      request_headers = {}
      request_headers['Content-Type'] = 'application/json; charset=utf-8'

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = 'subscriptions/{subscriptionId}/resourcegroups/{resourceGroupName}/providers/microsoft.insights/guestDiagnosticSettings/{diagnosticSettingsName}'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'resourceGroupName' => resource_group_name,'diagnosticSettingsName' => diagnostic_settings_name,'subscriptionId' => @client.subscription_id},
          query_params: {'api-version' => @client.api_version},
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:delete, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200 || status_code == 204
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        result.correlation_request_id = http_response['x-ms-correlation-request-id'] unless http_response['x-ms-correlation-request-id'].nil?
        result.client_request_id = http_response['x-ms-client-request-id'] unless http_response['x-ms-client-request-id'].nil?

        result
      end

      promise.execute
    end

    #
    # Get a list of all guest diagnostic settings in a subscription.
    #
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [GuestDiagnosticSettingsList] operation results.
    #
    def list(custom_headers:nil)
      response = list_async(custom_headers:custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Get a list of all guest diagnostic settings in a subscription.
    #
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def list_with_http_info(custom_headers:nil)
      list_async(custom_headers:custom_headers).value!
    end

    #
    # Get a list of all guest diagnostic settings in a subscription.
    #
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def list_async(custom_headers:nil)
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?


      request_headers = {}
      request_headers['Content-Type'] = 'application/json; charset=utf-8'

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = 'subscriptions/{subscriptionId}/providers/microsoft.insights/guestDiagnosticSettings'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'subscriptionId' => @client.subscription_id},
          query_params: {'api-version' => @client.api_version},
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:get, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        result.correlation_request_id = http_response['x-ms-correlation-request-id'] unless http_response['x-ms-correlation-request-id'].nil?
        result.client_request_id = http_response['x-ms-client-request-id'] unless http_response['x-ms-client-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = Azure::Monitor::Mgmt::V2018_06_01_preview::Models::GuestDiagnosticSettingsList.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response)
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Get a list of all guest diagnostic settings in a resource group.
    #
    # @param resource_group_name [String] The name of the resource group.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [GuestDiagnosticSettingsList] operation results.
    #
    def list_by_resource_group(resource_group_name, custom_headers:nil)
      response = list_by_resource_group_async(resource_group_name, custom_headers:custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Get a list of all guest diagnostic settings in a resource group.
    #
    # @param resource_group_name [String] The name of the resource group.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def list_by_resource_group_with_http_info(resource_group_name, custom_headers:nil)
      list_by_resource_group_async(resource_group_name, custom_headers:custom_headers).value!
    end

    #
    # Get a list of all guest diagnostic settings in a resource group.
    #
    # @param resource_group_name [String] The name of the resource group.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def list_by_resource_group_async(resource_group_name, custom_headers:nil)
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?


      request_headers = {}
      request_headers['Content-Type'] = 'application/json; charset=utf-8'

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = 'subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/microsoft.insights/guestDiagnosticSettings'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'resourceGroupName' => resource_group_name,'subscriptionId' => @client.subscription_id},
          query_params: {'api-version' => @client.api_version},
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:get, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        result.correlation_request_id = http_response['x-ms-correlation-request-id'] unless http_response['x-ms-correlation-request-id'].nil?
        result.client_request_id = http_response['x-ms-client-request-id'] unless http_response['x-ms-client-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = Azure::Monitor::Mgmt::V2018_06_01_preview::Models::GuestDiagnosticSettingsList.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response)
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

  end
end