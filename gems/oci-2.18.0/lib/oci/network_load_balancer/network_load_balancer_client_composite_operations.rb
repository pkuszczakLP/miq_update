# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # This class provides a wrapper around {OCI::NetworkLoadBalancer::NetworkLoadBalancerClient} and offers convenience methods
  # for operations that would otherwise need to be chained together. For example, instead of performing an action
  # on a resource (e.g. launching an instance, creating a load balancer) and then using a waiter to wait for the resource
  # to enter a given state, you can call a single method in this class to accomplish the same functionality
  class NetworkLoadBalancer::NetworkLoadBalancerClientCompositeOperations
    # The {OCI::NetworkLoadBalancer::NetworkLoadBalancerClient} used to communicate with the service_client
    #
    # @return [OCI::NetworkLoadBalancer::NetworkLoadBalancerClient]
    attr_reader :service_client

    # Initializes a new NetworkLoadBalancerClientCompositeOperations
    #
    # @param [OCI::NetworkLoadBalancer::NetworkLoadBalancerClient] service_client The client used to communicate with the service.
    #   Defaults to a new service client created via {OCI::NetworkLoadBalancer::NetworkLoadBalancerClient#initialize} with no arguments
    def initialize(service_client = OCI::NetworkLoadBalancer::NetworkLoadBalancerClient.new)
      @service_client = service_client
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:disable Layout/EmptyLines


    # Calls {OCI::NetworkLoadBalancer::NetworkLoadBalancerClient#change_network_load_balancer_compartment} and then waits for the {OCI::NetworkLoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] network_load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network load balancer to update.
    # @param [OCI::NetworkLoadBalancer::Models::ChangeNetworkLoadBalancerCompartmentDetails] change_network_load_balancer_compartment_details The configuration details for moving a network load balancer to a different compartment.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::NetworkLoadBalancer::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::NetworkLoadBalancer::NetworkLoadBalancerClient#change_network_load_balancer_compartment}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::NetworkLoadBalancer::Models::WorkRequest}
    def change_network_load_balancer_compartment_and_wait_for_state(network_load_balancer_id, change_network_load_balancer_compartment_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.change_network_load_balancer_compartment(network_load_balancer_id, change_network_load_balancer_compartment_details, base_operation_opts)
      use_util = OCI::NetworkLoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::NetworkLoadBalancer::Util.wait_on_work_request(
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


    # Calls {OCI::NetworkLoadBalancer::NetworkLoadBalancerClient#create_backend} and then waits for the {OCI::NetworkLoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] network_load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network load balancer to update.
    # @param [OCI::NetworkLoadBalancer::Models::CreateBackendDetails] create_backend_details The details to add a backend server to a backend set.
    # @param [String] backend_set_name The name of the backend set to which to add the backend server.
    #
    #   Example: `example_backend_set`
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::NetworkLoadBalancer::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::NetworkLoadBalancer::NetworkLoadBalancerClient#create_backend}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::NetworkLoadBalancer::Models::WorkRequest}
    def create_backend_and_wait_for_state(network_load_balancer_id, create_backend_details, backend_set_name, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_backend(network_load_balancer_id, create_backend_details, backend_set_name, base_operation_opts)
      use_util = OCI::NetworkLoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::NetworkLoadBalancer::Util.wait_on_work_request(
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


    # Calls {OCI::NetworkLoadBalancer::NetworkLoadBalancerClient#create_backend_set} and then waits for the {OCI::NetworkLoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] network_load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network load balancer to update.
    # @param [OCI::NetworkLoadBalancer::Models::CreateBackendSetDetails] create_backend_set_details The details for adding a backend set.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::NetworkLoadBalancer::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::NetworkLoadBalancer::NetworkLoadBalancerClient#create_backend_set}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::NetworkLoadBalancer::Models::WorkRequest}
    def create_backend_set_and_wait_for_state(network_load_balancer_id, create_backend_set_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_backend_set(network_load_balancer_id, create_backend_set_details, base_operation_opts)
      use_util = OCI::NetworkLoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::NetworkLoadBalancer::Util.wait_on_work_request(
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


    # Calls {OCI::NetworkLoadBalancer::NetworkLoadBalancerClient#create_listener} and then waits for the {OCI::NetworkLoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] network_load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network load balancer to update.
    # @param [OCI::NetworkLoadBalancer::Models::CreateListenerDetails] create_listener_details Details to add a listener.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::NetworkLoadBalancer::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::NetworkLoadBalancer::NetworkLoadBalancerClient#create_listener}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::NetworkLoadBalancer::Models::WorkRequest}
    def create_listener_and_wait_for_state(network_load_balancer_id, create_listener_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_listener(network_load_balancer_id, create_listener_details, base_operation_opts)
      use_util = OCI::NetworkLoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::NetworkLoadBalancer::Util.wait_on_work_request(
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


    # Calls {OCI::NetworkLoadBalancer::NetworkLoadBalancerClient#create_network_load_balancer} and then waits for the {OCI::NetworkLoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [OCI::NetworkLoadBalancer::Models::CreateNetworkLoadBalancerDetails] create_network_load_balancer_details Details for the new network load balancer.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::NetworkLoadBalancer::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::NetworkLoadBalancer::NetworkLoadBalancerClient#create_network_load_balancer}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::NetworkLoadBalancer::Models::WorkRequest}
    def create_network_load_balancer_and_wait_for_state(create_network_load_balancer_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_network_load_balancer(create_network_load_balancer_details, base_operation_opts)
      use_util = OCI::NetworkLoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::NetworkLoadBalancer::Util.wait_on_work_request(
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


    # Calls {OCI::NetworkLoadBalancer::NetworkLoadBalancerClient#delete_backend} and then waits for the {OCI::NetworkLoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] network_load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network load balancer to update.
    # @param [String] backend_set_name The name of the backend set associated with the backend server.
    #
    #   Example: `example_backend_set`
    #
    # @param [String] backend_name The name of the backend server to remove.
    #   If the backend was created with an explicitly specified name, that name should be used here.
    #   If the backend was created without explicitly specifying the name, but was created using ipAddress, this is specified as <ipAddress>:<port>.
    #   If the backend was created without explicitly specifying the name, but was created using targetId, this is specified as <targetId>:<port>.
    #
    #   Example: `10.0.0.3:8080` or `ocid1.privateip..oc1.<var>&lt;unique_ID&gt;</var>:8080`
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::NetworkLoadBalancer::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::NetworkLoadBalancer::NetworkLoadBalancerClient#delete_backend}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::NetworkLoadBalancer::Models::WorkRequest}
    def delete_backend_and_wait_for_state(network_load_balancer_id, backend_set_name, backend_name, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.delete_backend(network_load_balancer_id, backend_set_name, backend_name, base_operation_opts)
      use_util = OCI::NetworkLoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::NetworkLoadBalancer::Util.wait_on_work_request(
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


    # Calls {OCI::NetworkLoadBalancer::NetworkLoadBalancerClient#delete_backend_set} and then waits for the {OCI::NetworkLoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] network_load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network load balancer to update.
    # @param [String] backend_set_name The name of the backend set to delete.
    #
    #   Example: `example_backend_set`
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::NetworkLoadBalancer::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::NetworkLoadBalancer::NetworkLoadBalancerClient#delete_backend_set}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::NetworkLoadBalancer::Models::WorkRequest}
    def delete_backend_set_and_wait_for_state(network_load_balancer_id, backend_set_name, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.delete_backend_set(network_load_balancer_id, backend_set_name, base_operation_opts)
      use_util = OCI::NetworkLoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::NetworkLoadBalancer::Util.wait_on_work_request(
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


    # Calls {OCI::NetworkLoadBalancer::NetworkLoadBalancerClient#delete_listener} and then waits for the {OCI::NetworkLoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] network_load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network load balancer to update.
    # @param [String] listener_name The name of the listener to delete.
    #
    #   Example: `example_listener`
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::NetworkLoadBalancer::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::NetworkLoadBalancer::NetworkLoadBalancerClient#delete_listener}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::NetworkLoadBalancer::Models::WorkRequest}
    def delete_listener_and_wait_for_state(network_load_balancer_id, listener_name, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.delete_listener(network_load_balancer_id, listener_name, base_operation_opts)
      use_util = OCI::NetworkLoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::NetworkLoadBalancer::Util.wait_on_work_request(
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


    # Calls {OCI::NetworkLoadBalancer::NetworkLoadBalancerClient#delete_network_load_balancer} and then waits for the {OCI::NetworkLoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] network_load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network load balancer to update.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::NetworkLoadBalancer::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::NetworkLoadBalancer::NetworkLoadBalancerClient#delete_network_load_balancer}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::NetworkLoadBalancer::Models::WorkRequest}
    def delete_network_load_balancer_and_wait_for_state(network_load_balancer_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.delete_network_load_balancer(network_load_balancer_id, base_operation_opts)
      use_util = OCI::NetworkLoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::NetworkLoadBalancer::Util.wait_on_work_request(
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


    # Calls {OCI::NetworkLoadBalancer::NetworkLoadBalancerClient#update_backend} and then waits for the {OCI::NetworkLoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] network_load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network load balancer to update.
    # @param [OCI::NetworkLoadBalancer::Models::UpdateBackendDetails] update_backend_details Details for updating a backend server.
    # @param [String] backend_set_name The name of the backend set associated with the backend server.
    #
    #   Example: `example_backend_set`
    #
    # @param [String] backend_name The name of the backend server to update.
    #   If the backend was created with an explicitly specified name, that name should be used here.
    #   If the backend was created without explicitly specifying the name, but was created using ipAddress, this is specified as <ipAddress>:<port>.
    #   If the backend was created without explicitly specifying the name, but was created using targetId, this is specified as <targetId>:<port>.
    #
    #   Example: `10.0.0.3:8080` or `ocid1.privateip..oc1.<var>&lt;unique_ID&gt;</var>:8080`
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::NetworkLoadBalancer::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::NetworkLoadBalancer::NetworkLoadBalancerClient#update_backend}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::NetworkLoadBalancer::Models::WorkRequest}
    def update_backend_and_wait_for_state(network_load_balancer_id, update_backend_details, backend_set_name, backend_name, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_backend(network_load_balancer_id, update_backend_details, backend_set_name, backend_name, base_operation_opts)
      use_util = OCI::NetworkLoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::NetworkLoadBalancer::Util.wait_on_work_request(
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


    # Calls {OCI::NetworkLoadBalancer::NetworkLoadBalancerClient#update_backend_set} and then waits for the {OCI::NetworkLoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] network_load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network load balancer to update.
    # @param [OCI::NetworkLoadBalancer::Models::UpdateBackendSetDetails] update_backend_set_details The details to update a backend set.
    # @param [String] backend_set_name The name of the backend set to update.
    #
    #   Example: `example_backend_set`
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::NetworkLoadBalancer::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::NetworkLoadBalancer::NetworkLoadBalancerClient#update_backend_set}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::NetworkLoadBalancer::Models::WorkRequest}
    def update_backend_set_and_wait_for_state(network_load_balancer_id, update_backend_set_details, backend_set_name, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_backend_set(network_load_balancer_id, update_backend_set_details, backend_set_name, base_operation_opts)
      use_util = OCI::NetworkLoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::NetworkLoadBalancer::Util.wait_on_work_request(
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


    # Calls {OCI::NetworkLoadBalancer::NetworkLoadBalancerClient#update_health_checker} and then waits for the {OCI::NetworkLoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] network_load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network load balancer to update.
    # @param [OCI::NetworkLoadBalancer::Models::UpdateHealthCheckerDetails] update_health_checker_details The health check policy configuration details.
    # @param [String] backend_set_name The name of the backend set associated with the health check policy to be retrieved.
    #
    #   Example: `example_backend_set`
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::NetworkLoadBalancer::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::NetworkLoadBalancer::NetworkLoadBalancerClient#update_health_checker}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::NetworkLoadBalancer::Models::WorkRequest}
    def update_health_checker_and_wait_for_state(network_load_balancer_id, update_health_checker_details, backend_set_name, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_health_checker(network_load_balancer_id, update_health_checker_details, backend_set_name, base_operation_opts)
      use_util = OCI::NetworkLoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::NetworkLoadBalancer::Util.wait_on_work_request(
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


    # Calls {OCI::NetworkLoadBalancer::NetworkLoadBalancerClient#update_listener} and then waits for the {OCI::NetworkLoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] network_load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network load balancer to update.
    # @param [OCI::NetworkLoadBalancer::Models::UpdateListenerDetails] update_listener_details Details to update a listener.
    # @param [String] listener_name The name of the listener to update.
    #
    #   Example: `example_listener`
    #
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::NetworkLoadBalancer::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::NetworkLoadBalancer::NetworkLoadBalancerClient#update_listener}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::NetworkLoadBalancer::Models::WorkRequest}
    def update_listener_and_wait_for_state(network_load_balancer_id, update_listener_details, listener_name, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_listener(network_load_balancer_id, update_listener_details, listener_name, base_operation_opts)
      use_util = OCI::NetworkLoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::NetworkLoadBalancer::Util.wait_on_work_request(
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


    # Calls {OCI::NetworkLoadBalancer::NetworkLoadBalancerClient#update_network_load_balancer} and then waits for the {OCI::NetworkLoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] network_load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network load balancer to update.
    # @param [OCI::NetworkLoadBalancer::Models::UpdateNetworkLoadBalancerDetails] update_network_load_balancer_details The information to be updated.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::NetworkLoadBalancer::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::NetworkLoadBalancer::NetworkLoadBalancerClient#update_network_load_balancer}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::NetworkLoadBalancer::Models::WorkRequest}
    def update_network_load_balancer_and_wait_for_state(network_load_balancer_id, update_network_load_balancer_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_network_load_balancer(network_load_balancer_id, update_network_load_balancer_details, base_operation_opts)
      use_util = OCI::NetworkLoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::NetworkLoadBalancer::Util.wait_on_work_request(
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


    # Calls {OCI::NetworkLoadBalancer::NetworkLoadBalancerClient#update_network_security_groups} and then waits for the {OCI::NetworkLoadBalancer::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] network_load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network load balancer to update.
    # @param [OCI::NetworkLoadBalancer::Models::UpdateNetworkSecurityGroupsDetails] update_network_security_groups_details The details for updating the network security groups associated with the specified network load balancer.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::NetworkLoadBalancer::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::NetworkLoadBalancer::NetworkLoadBalancerClient#update_network_security_groups}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::NetworkLoadBalancer::Models::WorkRequest}
    def update_network_security_groups_and_wait_for_state(network_load_balancer_id, update_network_security_groups_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_network_security_groups(network_load_balancer_id, update_network_security_groups_details, base_operation_opts)
      use_util = OCI::NetworkLoadBalancer::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::NetworkLoadBalancer::Util.wait_on_work_request(
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
  end
end
# rubocop:enable Lint/UnneededCopDisableDirective, Metrics/LineLength
