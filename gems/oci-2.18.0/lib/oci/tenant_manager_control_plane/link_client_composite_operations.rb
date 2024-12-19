# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # This class provides a wrapper around {OCI::TenantManagerControlPlane::LinkClient} and offers convenience methods
  # for operations that would otherwise need to be chained together. For example, instead of performing an action
  # on a resource (e.g. launching an instance, creating a load balancer) and then using a waiter to wait for the resource
  # to enter a given state, you can call a single method in this class to accomplish the same functionality
  class TenantManagerControlPlane::LinkClientCompositeOperations
    # The {OCI::TenantManagerControlPlane::LinkClient} used to communicate with the service_client
    #
    # @return [OCI::TenantManagerControlPlane::LinkClient]
    attr_reader :service_client

    # Initializes a new LinkClientCompositeOperations
    #
    # @param [OCI::TenantManagerControlPlane::LinkClient] service_client The client used to communicate with the service.
    #   Defaults to a new service client created via {OCI::TenantManagerControlPlane::LinkClient#initialize} with no arguments
    def initialize(service_client = OCI::TenantManagerControlPlane::LinkClient.new)
      @service_client = service_client
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:disable Layout/EmptyLines


    # Calls {OCI::TenantManagerControlPlane::LinkClient#delete_link} and then waits for the {OCI::TenantManagerControlPlane::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] link_id OCID of the link to terminate.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::TenantManagerControlPlane::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::TenantManagerControlPlane::LinkClient#delete_link}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::TenantManagerControlPlane::Models::WorkRequest}
    def delete_link_and_wait_for_state(link_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.delete_link(link_id, base_operation_opts)
      use_util = OCI::TenantManagerControlPlane::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::TenantManagerControlPlane::Util.wait_on_work_request(
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