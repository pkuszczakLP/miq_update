# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # This class provides a wrapper around {OCI::ManagementDashboard::DashxApisClient} and offers convenience methods
  # for operations that would otherwise need to be chained together. For example, instead of performing an action
  # on a resource (e.g. launching an instance, creating a load balancer) and then using a waiter to wait for the resource
  # to enter a given state, you can call a single method in this class to accomplish the same functionality
  class ManagementDashboard::DashxApisClientCompositeOperations
    # The {OCI::ManagementDashboard::DashxApisClient} used to communicate with the service_client
    #
    # @return [OCI::ManagementDashboard::DashxApisClient]
    attr_reader :service_client

    # Initializes a new DashxApisClientCompositeOperations
    #
    # @param [OCI::ManagementDashboard::DashxApisClient] service_client The client used to communicate with the service.
    #   Defaults to a new service client created via {OCI::ManagementDashboard::DashxApisClient#initialize} with no arguments
    def initialize(service_client = OCI::ManagementDashboard::DashxApisClient.new)
      @service_client = service_client
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:disable Layout/EmptyLines


    # Calls {OCI::ManagementDashboard::DashxApisClient#change_management_dashboards_compartment} and then waits for the {OCI::ManagementDashboard::Models::ManagementDashboard} acted upon
    # to enter the given state(s).
    #
    # @param [String] management_dashboard_id A unique dashboard identifier.
    # @param [OCI::ManagementDashboard::Models::ChangeManagementDashboardsCompartmentDetails] change_management_dashboards_compartment_details ID of the dashboard that is being moved.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::ManagementDashboard::Models::ManagementDashboard#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::ManagementDashboard::DashxApisClient#change_management_dashboards_compartment}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::ManagementDashboard::Models::ManagementDashboard}
    def change_management_dashboards_compartment_and_wait_for_state(management_dashboard_id, change_management_dashboards_compartment_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.change_management_dashboards_compartment(management_dashboard_id, change_management_dashboards_compartment_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_management_dashboard(wait_for_resource_id).wait_until(
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


    # Calls {OCI::ManagementDashboard::DashxApisClient#change_management_saved_searches_compartment} and then waits for the {OCI::ManagementDashboard::Models::ManagementSavedSearch} acted upon
    # to enter the given state(s).
    #
    # @param [String] management_saved_search_id A unique saved search identifier.
    # @param [OCI::ManagementDashboard::Models::ChangeManagementSavedSearchesCompartmentDetails] change_management_saved_searches_compartment_details ID of the saved search that is being moved.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::ManagementDashboard::Models::ManagementSavedSearch#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::ManagementDashboard::DashxApisClient#change_management_saved_searches_compartment}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::ManagementDashboard::Models::ManagementSavedSearch}
    def change_management_saved_searches_compartment_and_wait_for_state(management_saved_search_id, change_management_saved_searches_compartment_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.change_management_saved_searches_compartment(management_saved_search_id, change_management_saved_searches_compartment_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_management_saved_search(wait_for_resource_id).wait_until(
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


    # Calls {OCI::ManagementDashboard::DashxApisClient#create_management_dashboard} and then waits for the {OCI::ManagementDashboard::Models::ManagementDashboard} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::ManagementDashboard::Models::CreateManagementDashboardDetails] create_management_dashboard_details JSON metadata for creating a new dashboard.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::ManagementDashboard::Models::ManagementDashboard#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::ManagementDashboard::DashxApisClient#create_management_dashboard}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::ManagementDashboard::Models::ManagementDashboard}
    def create_management_dashboard_and_wait_for_state(create_management_dashboard_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_management_dashboard(create_management_dashboard_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_management_dashboard(wait_for_resource_id).wait_until(
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


    # Calls {OCI::ManagementDashboard::DashxApisClient#create_management_saved_search} and then waits for the {OCI::ManagementDashboard::Models::ManagementSavedSearch} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::ManagementDashboard::Models::CreateManagementSavedSearchDetails] create_management_saved_search_details JSON metadata for the saved search.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::ManagementDashboard::Models::ManagementSavedSearch#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::ManagementDashboard::DashxApisClient#create_management_saved_search}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::ManagementDashboard::Models::ManagementSavedSearch}
    def create_management_saved_search_and_wait_for_state(create_management_saved_search_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_management_saved_search(create_management_saved_search_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_management_saved_search(wait_for_resource_id).wait_until(
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


    # Calls {OCI::ManagementDashboard::DashxApisClient#delete_management_dashboard} and then waits for the {OCI::ManagementDashboard::Models::ManagementDashboard} acted upon
    # to enter the given state(s).
    #
    # @param [String] management_dashboard_id A unique dashboard identifier.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::ManagementDashboard::Models::ManagementDashboard#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::ManagementDashboard::DashxApisClient#delete_management_dashboard}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type nil
    def delete_management_dashboard_and_wait_for_state(management_dashboard_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      initial_get_result = @service_client.get_management_dashboard(management_dashboard_id)
      operation_result = @service_client.delete_management_dashboard(management_dashboard_id, base_operation_opts)

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


    # Calls {OCI::ManagementDashboard::DashxApisClient#delete_management_saved_search} and then waits for the {OCI::ManagementDashboard::Models::ManagementSavedSearch} acted upon
    # to enter the given state(s).
    #
    # @param [String] management_saved_search_id A unique saved search identifier.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::ManagementDashboard::Models::ManagementSavedSearch#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::ManagementDashboard::DashxApisClient#delete_management_saved_search}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type nil
    def delete_management_saved_search_and_wait_for_state(management_saved_search_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      initial_get_result = @service_client.get_management_saved_search(management_saved_search_id)
      operation_result = @service_client.delete_management_saved_search(management_saved_search_id, base_operation_opts)

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


    # Calls {OCI::ManagementDashboard::DashxApisClient#update_management_dashboard} and then waits for the {OCI::ManagementDashboard::Models::ManagementDashboard} acted upon
    # to enter the given state(s).
    #
    # @param [String] management_dashboard_id A unique dashboard identifier.
    # @param [OCI::ManagementDashboard::Models::UpdateManagementDashboardDetails] update_management_dashboard_details JSON metadata for changed dashboard properties.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::ManagementDashboard::Models::ManagementDashboard#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::ManagementDashboard::DashxApisClient#update_management_dashboard}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::ManagementDashboard::Models::ManagementDashboard}
    def update_management_dashboard_and_wait_for_state(management_dashboard_id, update_management_dashboard_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_management_dashboard(management_dashboard_id, update_management_dashboard_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_management_dashboard(wait_for_resource_id).wait_until(
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


    # Calls {OCI::ManagementDashboard::DashxApisClient#update_management_saved_search} and then waits for the {OCI::ManagementDashboard::Models::ManagementSavedSearch} acted upon
    # to enter the given state(s).
    #
    # @param [String] management_saved_search_id A unique saved search identifier.
    # @param [OCI::ManagementDashboard::Models::UpdateManagementSavedSearchDetails] update_management_saved_search_details JSON metadata for changed saved search properties.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::ManagementDashboard::Models::ManagementSavedSearch#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::ManagementDashboard::DashxApisClient#update_management_saved_search}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::ManagementDashboard::Models::ManagementSavedSearch}
    def update_management_saved_search_and_wait_for_state(management_saved_search_id, update_management_saved_search_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_management_saved_search(management_saved_search_id, update_management_saved_search_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_management_saved_search(wait_for_resource_id).wait_until(
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
