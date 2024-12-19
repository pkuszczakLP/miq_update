# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # This class provides a wrapper around {OCI::ManagementAgent::ManagementAgentClient} and offers convenience methods
  # for operations that would otherwise need to be chained together. For example, instead of performing an action
  # on a resource (e.g. launching an instance, creating a load balancer) and then using a waiter to wait for the resource
  # to enter a given state, you can call a single method in this class to accomplish the same functionality
  class ManagementAgent::ManagementAgentClientCompositeOperations
    # The {OCI::ManagementAgent::ManagementAgentClient} used to communicate with the service_client
    #
    # @return [OCI::ManagementAgent::ManagementAgentClient]
    attr_reader :service_client

    # Initializes a new ManagementAgentClientCompositeOperations
    #
    # @param [OCI::ManagementAgent::ManagementAgentClient] service_client The client used to communicate with the service.
    #   Defaults to a new service client created via {OCI::ManagementAgent::ManagementAgentClient#initialize} with no arguments
    def initialize(service_client = OCI::ManagementAgent::ManagementAgentClient.new)
      @service_client = service_client
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:disable Layout/EmptyLines


    # Calls {OCI::ManagementAgent::ManagementAgentClient#create_management_agent_install_key} and then waits for the {OCI::ManagementAgent::Models::ManagementAgentInstallKey} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::ManagementAgent::Models::CreateManagementAgentInstallKeyDetails] create_management_agent_install_key_details Details of the Agent install Key
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::ManagementAgent::Models::ManagementAgentInstallKey#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::ManagementAgent::ManagementAgentClient#create_management_agent_install_key}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::ManagementAgent::Models::ManagementAgentInstallKey}
    def create_management_agent_install_key_and_wait_for_state(create_management_agent_install_key_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_management_agent_install_key(create_management_agent_install_key_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_management_agent_install_key(wait_for_resource_id).wait_until(
          eval_proc: ->(response) { response.data.respond_to?(:lifecycle_state) && lowered_wait_for_states.include?(response.data.lifecycle_state.downcase) },
          max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
          max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
        )
        result_to_return = waiter_result

        return result_to_return
      rescue StandardError
        raise OCI::Errors::CompositeOperationError.new(partial_results: [operation_result])
      end
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:enable Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:disable Layout/EmptyLines


    # Calls {OCI::ManagementAgent::ManagementAgentClient#delete_management_agent} and then waits for the {OCI::ManagementAgent::Models::ManagementAgent} acted upon
    # to enter the given state(s).
    #
    # @param [String] management_agent_id Unique Management Agent identifier
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::ManagementAgent::Models::ManagementAgent#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::ManagementAgent::ManagementAgentClient#delete_management_agent}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type nil
    def delete_management_agent_and_wait_for_state(management_agent_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      initial_get_result = @service_client.get_management_agent(management_agent_id)
      operation_result = @service_client.delete_management_agent(management_agent_id, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)

      begin
        waiter_result = initial_get_result.wait_until(
          eval_proc: ->(response) { response.data.respond_to?(:lifecycle_state) && lowered_wait_for_states.include?(response.data.lifecycle_state.downcase) },
          max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
          max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200,
          succeed_on_not_found: true
        )
        result_to_return = waiter_result

        return result_to_return
      rescue StandardError
        raise OCI::Errors::CompositeOperationError.new(partial_results: [operation_result])
      end
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:enable Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:disable Layout/EmptyLines


    # Calls {OCI::ManagementAgent::ManagementAgentClient#delete_management_agent_install_key} and then waits for the {OCI::ManagementAgent::Models::ManagementAgentInstallKey} acted upon
    # to enter the given state(s).
    #
    # @param [String] management_agent_install_key_id Unique Management Agent Install Key identifier
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::ManagementAgent::Models::ManagementAgentInstallKey#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::ManagementAgent::ManagementAgentClient#delete_management_agent_install_key}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type nil
    def delete_management_agent_install_key_and_wait_for_state(management_agent_install_key_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      initial_get_result = @service_client.get_management_agent_install_key(management_agent_install_key_id)
      operation_result = @service_client.delete_management_agent_install_key(management_agent_install_key_id, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)

      begin
        waiter_result = initial_get_result.wait_until(
          eval_proc: ->(response) { response.data.respond_to?(:lifecycle_state) && lowered_wait_for_states.include?(response.data.lifecycle_state.downcase) },
          max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
          max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200,
          succeed_on_not_found: true
        )
        result_to_return = waiter_result

        return result_to_return
      rescue StandardError
        raise OCI::Errors::CompositeOperationError.new(partial_results: [operation_result])
      end
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:enable Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:disable Layout/EmptyLines


    # Calls {OCI::ManagementAgent::ManagementAgentClient#deploy_plugins} and then waits for the {OCI::ManagementAgent::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::ManagementAgent::Models::DeployPluginsDetails] deploy_plugins_details Details of Plugins to be deployed for a given list of Management Agents.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::ManagementAgent::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::ManagementAgent::ManagementAgentClient#deploy_plugins}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::ManagementAgent::Models::WorkRequest}
    def deploy_plugins_and_wait_for_state(deploy_plugins_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.deploy_plugins(deploy_plugins_details, base_operation_opts)
      use_util = OCI::ManagementAgent::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::ManagementAgent::Util.wait_on_work_request(
            @service_client,
            wait_for_resource_id,
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        else
          waiter_result = @service_client.get_work_request(wait_for_resource_id).wait_until(
            eval_proc: ->(response) { response.data.respond_to?(:status) && lowered_wait_for_states.include?(response.data.status.downcase) },
            max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
            max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
          )
        end
        result_to_return = waiter_result

        return result_to_return
      rescue StandardError
        raise OCI::Errors::CompositeOperationError.new(partial_results: [operation_result])
      end
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:enable Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:disable Layout/EmptyLines


    # Calls {OCI::ManagementAgent::ManagementAgentClient#update_management_agent} and then waits for the {OCI::ManagementAgent::Models::ManagementAgent} acted upon
    # to enter the given state(s).
    #
    # @param [String] management_agent_id Unique Management Agent identifier
    # @param [OCI::ManagementAgent::Models::UpdateManagementAgentDetails] update_management_agent_details Details required for changing the console managed properties of the Management Agent.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::ManagementAgent::Models::ManagementAgent#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::ManagementAgent::ManagementAgentClient#update_management_agent}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::ManagementAgent::Models::ManagementAgent}
    def update_management_agent_and_wait_for_state(management_agent_id, update_management_agent_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_management_agent(management_agent_id, update_management_agent_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_management_agent(wait_for_resource_id).wait_until(
          eval_proc: ->(response) { response.data.respond_to?(:lifecycle_state) && lowered_wait_for_states.include?(response.data.lifecycle_state.downcase) },
          max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
          max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
        )
        result_to_return = waiter_result

        return result_to_return
      rescue StandardError
        raise OCI::Errors::CompositeOperationError.new(partial_results: [operation_result])
      end
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:enable Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:disable Layout/EmptyLines


    # Calls {OCI::ManagementAgent::ManagementAgentClient#update_management_agent_install_key} and then waits for the {OCI::ManagementAgent::Models::ManagementAgentInstallKey} acted upon
    # to enter the given state(s).
    #
    # @param [String] management_agent_install_key_id Unique Management Agent Install Key identifier
    # @param [OCI::ManagementAgent::Models::UpdateManagementAgentInstallKeyDetails] update_management_agent_install_key_details Details required for changing the modifiable properties of the Management Agent install key.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::ManagementAgent::Models::ManagementAgentInstallKey#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::ManagementAgent::ManagementAgentClient#update_management_agent_install_key}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::ManagementAgent::Models::ManagementAgentInstallKey}
    def update_management_agent_install_key_and_wait_for_state(management_agent_install_key_id, update_management_agent_install_key_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_management_agent_install_key(management_agent_install_key_id, update_management_agent_install_key_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_management_agent_install_key(wait_for_resource_id).wait_until(
          eval_proc: ->(response) { response.data.respond_to?(:lifecycle_state) && lowered_wait_for_states.include?(response.data.lifecycle_state.downcase) },
          max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
          max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
        )
        result_to_return = waiter_result

        return result_to_return
      rescue StandardError
        raise OCI::Errors::CompositeOperationError.new(partial_results: [operation_result])
      end
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:enable Layout/EmptyLines
  end
end
# rubocop:enable Lint/UnneededCopDisableDirective, Metrics/LineLength
