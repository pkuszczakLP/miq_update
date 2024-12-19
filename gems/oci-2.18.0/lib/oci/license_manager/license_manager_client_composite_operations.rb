# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # This class provides a wrapper around {OCI::LicenseManager::LicenseManagerClient} and offers convenience methods
  # for operations that would otherwise need to be chained together. For example, instead of performing an action
  # on a resource (e.g. launching an instance, creating a load balancer) and then using a waiter to wait for the resource
  # to enter a given state, you can call a single method in this class to accomplish the same functionality
  class LicenseManager::LicenseManagerClientCompositeOperations
    # The {OCI::LicenseManager::LicenseManagerClient} used to communicate with the service_client
    #
    # @return [OCI::LicenseManager::LicenseManagerClient]
    attr_reader :service_client

    # Initializes a new LicenseManagerClientCompositeOperations
    #
    # @param [OCI::LicenseManager::LicenseManagerClient] service_client The client used to communicate with the service.
    #   Defaults to a new service client created via {OCI::LicenseManager::LicenseManagerClient#initialize} with no arguments
    def initialize(service_client = OCI::LicenseManager::LicenseManagerClient.new)
      @service_client = service_client
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:disable Layout/EmptyLines


    # Calls {OCI::LicenseManager::LicenseManagerClient#create_license_record} and then waits for the {OCI::LicenseManager::Models::LicenseRecord} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::LicenseManager::Models::CreateLicenseRecordDetails] create_license_record_details Details needed to create a new license record.
    # @param [String] product_license_id Unique product license identifier.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LicenseManager::Models::LicenseRecord#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LicenseManager::LicenseManagerClient#create_license_record}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::LicenseManager::Models::LicenseRecord}
    def create_license_record_and_wait_for_state(create_license_record_details, product_license_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_license_record(create_license_record_details, product_license_id, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_license_record(wait_for_resource_id).wait_until(
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


    # Calls {OCI::LicenseManager::LicenseManagerClient#create_product_license} and then waits for the {OCI::LicenseManager::Models::ProductLicense} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::LicenseManager::Models::CreateProductLicenseDetails] create_product_license_details Details for creating a new product license.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LicenseManager::Models::ProductLicense#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LicenseManager::LicenseManagerClient#create_product_license}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::LicenseManager::Models::ProductLicense}
    def create_product_license_and_wait_for_state(create_product_license_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_product_license(create_product_license_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_product_license(wait_for_resource_id).wait_until(
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


    # Calls {OCI::LicenseManager::LicenseManagerClient#delete_license_record} and then waits for the {OCI::LicenseManager::Models::LicenseRecord} acted upon
    # to enter the given state(s).
    #
    # @param [String] license_record_id Unique license record identifier.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LicenseManager::Models::LicenseRecord#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LicenseManager::LicenseManagerClient#delete_license_record}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type nil
    def delete_license_record_and_wait_for_state(license_record_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      initial_get_result = @service_client.get_license_record(license_record_id)
      operation_result = @service_client.delete_license_record(license_record_id, base_operation_opts)

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


    # Calls {OCI::LicenseManager::LicenseManagerClient#delete_product_license} and then waits for the {OCI::LicenseManager::Models::ProductLicense} acted upon
    # to enter the given state(s).
    #
    # @param [String] product_license_id Unique product license identifier.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LicenseManager::Models::ProductLicense#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LicenseManager::LicenseManagerClient#delete_product_license}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type nil
    def delete_product_license_and_wait_for_state(product_license_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      initial_get_result = @service_client.get_product_license(product_license_id)
      operation_result = @service_client.delete_product_license(product_license_id, base_operation_opts)

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


    # Calls {OCI::LicenseManager::LicenseManagerClient#update_license_record} and then waits for the {OCI::LicenseManager::Models::LicenseRecord} acted upon
    # to enter the given state(s).
    #
    # @param [String] license_record_id Unique license record identifier.
    # @param [OCI::LicenseManager::Models::UpdateLicenseRecordDetails] update_license_record_details Details to update a license record entity.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LicenseManager::Models::LicenseRecord#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LicenseManager::LicenseManagerClient#update_license_record}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::LicenseManager::Models::LicenseRecord}
    def update_license_record_and_wait_for_state(license_record_id, update_license_record_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_license_record(license_record_id, update_license_record_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_license_record(wait_for_resource_id).wait_until(
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


    # Calls {OCI::LicenseManager::LicenseManagerClient#update_product_license} and then waits for the {OCI::LicenseManager::Models::ProductLicense} acted upon
    # to enter the given state(s).
    #
    # @param [String] product_license_id Unique product license identifier.
    # @param [OCI::LicenseManager::Models::UpdateProductLicenseDetails] update_product_license_details The list of images that needs to be updated.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::LicenseManager::Models::ProductLicense#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::LicenseManager::LicenseManagerClient#update_product_license}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::LicenseManager::Models::ProductLicense}
    def update_product_license_and_wait_for_state(product_license_id, update_product_license_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_product_license(product_license_id, update_product_license_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_product_license(wait_for_resource_id).wait_until(
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
