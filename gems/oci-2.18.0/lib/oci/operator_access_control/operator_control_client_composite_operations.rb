# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # This class provides a wrapper around {OCI::OperatorAccessControl::OperatorControlClient} and offers convenience methods
  # for operations that would otherwise need to be chained together. For example, instead of performing an action
  # on a resource (e.g. launching an instance, creating a load balancer) and then using a waiter to wait for the resource
  # to enter a given state, you can call a single method in this class to accomplish the same functionality
  class OperatorAccessControl::OperatorControlClientCompositeOperations
    # The {OCI::OperatorAccessControl::OperatorControlClient} used to communicate with the service_client
    #
    # @return [OCI::OperatorAccessControl::OperatorControlClient]
    attr_reader :service_client

    # Initializes a new OperatorControlClientCompositeOperations
    #
    # @param [OCI::OperatorAccessControl::OperatorControlClient] service_client The client used to communicate with the service.
    #   Defaults to a new service client created via {OCI::OperatorAccessControl::OperatorControlClient#initialize} with no arguments
    def initialize(service_client = OCI::OperatorAccessControl::OperatorControlClient.new)
      @service_client = service_client
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:disable Layout/EmptyLines


    # Calls {OCI::OperatorAccessControl::OperatorControlClient#create_operator_control} and then waits for the {OCI::OperatorAccessControl::Models::OperatorControl} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::OperatorAccessControl::Models::CreateOperatorControlDetails] create_operator_control_details Details for the new Operator Control.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::OperatorAccessControl::Models::OperatorControl#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::OperatorAccessControl::OperatorControlClient#create_operator_control}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::OperatorAccessControl::Models::OperatorControl}
    def create_operator_control_and_wait_for_state(create_operator_control_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_operator_control(create_operator_control_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_operator_control(wait_for_resource_id).wait_until(
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


    # Calls {OCI::OperatorAccessControl::OperatorControlClient#delete_operator_control} and then waits for the {OCI::OperatorAccessControl::Models::OperatorControl} acted upon
    # to enter the given state(s).
    #
    # @param [String] operator_control_id unique OperatorControl identifier
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::OperatorAccessControl::Models::OperatorControl#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::OperatorAccessControl::OperatorControlClient#delete_operator_control}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type nil
    def delete_operator_control_and_wait_for_state(operator_control_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      initial_get_result = @service_client.get_operator_control(operator_control_id)
      operation_result = @service_client.delete_operator_control(operator_control_id, base_operation_opts)

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


    # Calls {OCI::OperatorAccessControl::OperatorControlClient#update_operator_control} and then waits for the {OCI::OperatorAccessControl::Models::OperatorControl} acted upon
    # to enter the given state(s).
    #
    # @param [String] operator_control_id unique OperatorControl identifier
    # @param [OCI::OperatorAccessControl::Models::UpdateOperatorControlDetails] update_operator_control_details Details for the new OperatorControl.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::OperatorAccessControl::Models::OperatorControl#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::OperatorAccessControl::OperatorControlClient#update_operator_control}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::OperatorAccessControl::Models::OperatorControl}
    def update_operator_control_and_wait_for_state(operator_control_id, update_operator_control_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_operator_control(operator_control_id, update_operator_control_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_operator_control(wait_for_resource_id).wait_until(
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
