# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # This class provides a wrapper around {OCI::VnMonitoring::VnMonitoringClient} and offers convenience methods
  # for operations that would otherwise need to be chained together. For example, instead of performing an action
  # on a resource (e.g. launching an instance, creating a load balancer) and then using a waiter to wait for the resource
  # to enter a given state, you can call a single method in this class to accomplish the same functionality
  class VnMonitoring::VnMonitoringClientCompositeOperations
    # The {OCI::VnMonitoring::VnMonitoringClient} used to communicate with the service_client
    #
    # @return [OCI::VnMonitoring::VnMonitoringClient]
    attr_reader :service_client

    # Initializes a new VnMonitoringClientCompositeOperations
    #
    # @param [OCI::VnMonitoring::VnMonitoringClient] service_client The client used to communicate with the service.
    #   Defaults to a new service client created via {OCI::VnMonitoring::VnMonitoringClient#initialize} with no arguments
    def initialize(service_client = OCI::VnMonitoring::VnMonitoringClient.new)
      @service_client = service_client
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:disable Layout/EmptyLines


    # Calls {OCI::VnMonitoring::VnMonitoringClient#create_path_analyzer_test} and then waits for the {OCI::VnMonitoring::Models::PathAnalyzerTest} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::VnMonitoring::Models::CreatePathAnalyzerTestDetails] create_path_analyzer_test_details Details for creating a new PathAnalyzerTest.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::VnMonitoring::Models::PathAnalyzerTest#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::VnMonitoring::VnMonitoringClient#create_path_analyzer_test}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::VnMonitoring::Models::PathAnalyzerTest}
    def create_path_analyzer_test_and_wait_for_state(create_path_analyzer_test_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_path_analyzer_test(create_path_analyzer_test_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_path_analyzer_test(wait_for_resource_id).wait_until(
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


    # Calls {OCI::VnMonitoring::VnMonitoringClient#delete_path_analyzer_test} and then waits for the {OCI::VnMonitoring::Models::PathAnalyzerTest} acted upon
    # to enter the given state(s).
    #
    # @param [String] path_analyzer_test_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the `PathAnalyzerTest` resource.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::VnMonitoring::Models::PathAnalyzerTest#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::VnMonitoring::VnMonitoringClient#delete_path_analyzer_test}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type nil
    def delete_path_analyzer_test_and_wait_for_state(path_analyzer_test_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      initial_get_result = @service_client.get_path_analyzer_test(path_analyzer_test_id)
      operation_result = @service_client.delete_path_analyzer_test(path_analyzer_test_id, base_operation_opts)

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


    # Calls {OCI::VnMonitoring::VnMonitoringClient#get_path_analysis} and then waits for the {OCI::VnMonitoring::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::VnMonitoring::Models::GetPathAnalysisDetails] get_path_analysis_details Details for the path analysis query.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::VnMonitoring::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::VnMonitoring::VnMonitoringClient#get_path_analysis}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::VnMonitoring::Models::WorkRequest}
    def get_path_analysis_and_wait_for_state(get_path_analysis_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.get_path_analysis(get_path_analysis_details, base_operation_opts)
      use_util = OCI::VnMonitoring::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::VnMonitoring::Util.wait_on_work_request(
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


    # Calls {OCI::VnMonitoring::VnMonitoringClient#update_path_analyzer_test} and then waits for the {OCI::VnMonitoring::Models::PathAnalyzerTest} acted upon
    # to enter the given state(s).
    #
    # @param [String] path_analyzer_test_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the `PathAnalyzerTest` resource.
    # @param [OCI::VnMonitoring::Models::UpdatePathAnalyzerTestDetails] update_path_analyzer_test_details The information to update.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::VnMonitoring::Models::PathAnalyzerTest#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::VnMonitoring::VnMonitoringClient#update_path_analyzer_test}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::VnMonitoring::Models::PathAnalyzerTest}
    def update_path_analyzer_test_and_wait_for_state(path_analyzer_test_id, update_path_analyzer_test_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_path_analyzer_test(path_analyzer_test_id, update_path_analyzer_test_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_path_analyzer_test(wait_for_resource_id).wait_until(
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
