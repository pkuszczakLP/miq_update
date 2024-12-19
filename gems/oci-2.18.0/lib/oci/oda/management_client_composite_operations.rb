# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # This class provides a wrapper around {OCI::Oda::ManagementClient} and offers convenience methods
  # for operations that would otherwise need to be chained together. For example, instead of performing an action
  # on a resource (e.g. launching an instance, creating a load balancer) and then using a waiter to wait for the resource
  # to enter a given state, you can call a single method in this class to accomplish the same functionality
  class Oda::ManagementClientCompositeOperations
    # The {OCI::Oda::ManagementClient} used to communicate with the service_client
    #
    # @return [OCI::Oda::ManagementClient]
    attr_reader :service_client

    # Initializes a new ManagementClientCompositeOperations
    #
    # @param [OCI::Oda::ManagementClient] service_client The client used to communicate with the service.
    #   Defaults to a new service client created via {OCI::Oda::ManagementClient#initialize} with no arguments
    def initialize(service_client = OCI::Oda::ManagementClient.new)
      @service_client = service_client
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:disable Layout/EmptyLines


    # Calls {OCI::Oda::ManagementClient#create_authentication_provider} and then waits for the {OCI::Oda::Models::AuthenticationProvider} acted upon
    # to enter the given state(s).
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [OCI::Oda::Models::CreateAuthenticationProviderDetails] create_authentication_provider_details Property values required to create the new Authentication Provider.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Oda::Models::AuthenticationProvider#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Oda::ManagementClient#create_authentication_provider}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Oda::Models::AuthenticationProvider}
    def create_authentication_provider_and_wait_for_state(oda_instance_id, create_authentication_provider_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_authentication_provider(oda_instance_id, create_authentication_provider_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_authentication_provider(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Oda::ManagementClient#create_digital_assistant} and then waits for the {OCI::Oda::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [OCI::Oda::Models::CreateDigitalAssistantDetails] create_digital_assistant_details Property values for creating the new Digital Assistant.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Oda::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Oda::ManagementClient#create_digital_assistant}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Oda::Models::WorkRequest}
    def create_digital_assistant_and_wait_for_state(oda_instance_id, create_digital_assistant_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_digital_assistant(oda_instance_id, create_digital_assistant_details, base_operation_opts)
      use_util = OCI::Oda::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Oda::Util.wait_on_work_request(
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


    # Calls {OCI::Oda::ManagementClient#create_skill} and then waits for the {OCI::Oda::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [OCI::Oda::Models::CreateSkillDetails] create_skill_details Property values for creating the Skill.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Oda::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Oda::ManagementClient#create_skill}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Oda::Models::WorkRequest}
    def create_skill_and_wait_for_state(oda_instance_id, create_skill_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_skill(oda_instance_id, create_skill_details, base_operation_opts)
      use_util = OCI::Oda::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Oda::Util.wait_on_work_request(
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


    # Calls {OCI::Oda::ManagementClient#create_skill_parameter} and then waits for the {OCI::Oda::Models::SkillParameter} acted upon
    # to enter the given state(s).
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] skill_id Unique Skill identifier.
    # @param [OCI::Oda::Models::CreateSkillParameterDetails] create_skill_parameter_details Property values for creating the new Skill Parameter.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Oda::Models::SkillParameter#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Oda::ManagementClient#create_skill_parameter}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Oda::Models::SkillParameter}
    def create_skill_parameter_and_wait_for_state(oda_instance_id, skill_id, create_skill_parameter_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_skill_parameter(oda_instance_id, skill_id, create_skill_parameter_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_skill_parameter(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Oda::ManagementClient#create_translator} and then waits for the {OCI::Oda::Models::Translator} acted upon
    # to enter the given state(s).
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [OCI::Oda::Models::CreateTranslatorDetails] create_translator_details Property values to create the new Translator.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Oda::Models::Translator#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Oda::ManagementClient#create_translator}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Oda::Models::Translator}
    def create_translator_and_wait_for_state(oda_instance_id, create_translator_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_translator(oda_instance_id, create_translator_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_translator(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Oda::ManagementClient#export_digital_assistant} and then waits for the {OCI::Oda::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] digital_assistant_id Unique Digital Assistant identifier.
    # @param [OCI::Oda::Models::ExportDigitalAssistantDetails] export_digital_assistant_details Where in Object Storage to export the Digital Assistant to.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Oda::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Oda::ManagementClient#export_digital_assistant}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Oda::Models::WorkRequest}
    def export_digital_assistant_and_wait_for_state(oda_instance_id, digital_assistant_id, export_digital_assistant_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.export_digital_assistant(oda_instance_id, digital_assistant_id, export_digital_assistant_details, base_operation_opts)
      use_util = OCI::Oda::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Oda::Util.wait_on_work_request(
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


    # Calls {OCI::Oda::ManagementClient#export_skill} and then waits for the {OCI::Oda::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] skill_id Unique Skill identifier.
    # @param [OCI::Oda::Models::ExportSkillDetails] export_skill_details Where in Object Storage to export the Skill to.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Oda::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Oda::ManagementClient#export_skill}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Oda::Models::WorkRequest}
    def export_skill_and_wait_for_state(oda_instance_id, skill_id, export_skill_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.export_skill(oda_instance_id, skill_id, export_skill_details, base_operation_opts)
      use_util = OCI::Oda::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Oda::Util.wait_on_work_request(
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


    # Calls {OCI::Oda::ManagementClient#import_bot} and then waits for the {OCI::Oda::Models::WorkRequest}
    # to enter the given state(s).
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [OCI::Oda::Models::ImportBotDetails] import_bot_details Properties for where in Object Storage to import the Bot archive from.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Oda::Models::WorkRequest#status}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Oda::ManagementClient#import_bot}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object containing the completed {OCI::Oda::Models::WorkRequest}
    def import_bot_and_wait_for_state(oda_instance_id, import_bot_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.import_bot(oda_instance_id, import_bot_details, base_operation_opts)
      use_util = OCI::Oda::Util.respond_to?(:wait_on_work_request)

      return operation_result if wait_for_states.empty? && !use_util

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.headers['opc-work-request-id']

      begin
        if use_util
          waiter_result = OCI::Oda::Util.wait_on_work_request(
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


    # Calls {OCI::Oda::ManagementClient#publish_digital_assistant} and then waits for the {OCI::Oda::Models::DigitalAssistant} acted upon
    # to enter the given state(s).
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] digital_assistant_id Unique Digital Assistant identifier.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Oda::Models::DigitalAssistant#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Oda::ManagementClient#publish_digital_assistant}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Oda::Models::DigitalAssistant}
    def publish_digital_assistant_and_wait_for_state(oda_instance_id, digital_assistant_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.publish_digital_assistant(oda_instance_id, digital_assistant_id, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_digital_assistant(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Oda::ManagementClient#publish_skill} and then waits for the {OCI::Oda::Models::Skill} acted upon
    # to enter the given state(s).
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] skill_id Unique Skill identifier.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Oda::Models::Skill#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Oda::ManagementClient#publish_skill}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Oda::Models::Skill}
    def publish_skill_and_wait_for_state(oda_instance_id, skill_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.publish_skill(oda_instance_id, skill_id, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_skill(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Oda::ManagementClient#start_channel} and then waits for the {OCI::Oda::Models::Channel} acted upon
    # to enter the given state(s).
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] channel_id Unique Channel identifier.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Oda::Models::Channel#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Oda::ManagementClient#start_channel}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Oda::Models::Channel}
    def start_channel_and_wait_for_state(oda_instance_id, channel_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.start_channel(oda_instance_id, channel_id, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_channel(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Oda::ManagementClient#stop_channel} and then waits for the {OCI::Oda::Models::Channel} acted upon
    # to enter the given state(s).
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] channel_id Unique Channel identifier.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Oda::Models::Channel#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Oda::ManagementClient#stop_channel}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Oda::Models::Channel}
    def stop_channel_and_wait_for_state(oda_instance_id, channel_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.stop_channel(oda_instance_id, channel_id, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_channel(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Oda::ManagementClient#update_authentication_provider} and then waits for the {OCI::Oda::Models::AuthenticationProvider} acted upon
    # to enter the given state(s).
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] authentication_provider_id Unique Authentication Provider identifier.
    # @param [OCI::Oda::Models::UpdateAuthenticationProviderDetails] update_authentication_provider_details Property values to update the Authentication Provider.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Oda::Models::AuthenticationProvider#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Oda::ManagementClient#update_authentication_provider}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Oda::Models::AuthenticationProvider}
    def update_authentication_provider_and_wait_for_state(oda_instance_id, authentication_provider_id, update_authentication_provider_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_authentication_provider(oda_instance_id, authentication_provider_id, update_authentication_provider_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_authentication_provider(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Oda::ManagementClient#update_channel} and then waits for the {OCI::Oda::Models::Channel} acted upon
    # to enter the given state(s).
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] channel_id Unique Channel identifier.
    # @param [OCI::Oda::Models::UpdateChannelDetails] update_channel_details Property values to update the Channel.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Oda::Models::Channel#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Oda::ManagementClient#update_channel}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Oda::Models::Channel}
    def update_channel_and_wait_for_state(oda_instance_id, channel_id, update_channel_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_channel(oda_instance_id, channel_id, update_channel_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_channel(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Oda::ManagementClient#update_digital_assistant} and then waits for the {OCI::Oda::Models::DigitalAssistant} acted upon
    # to enter the given state(s).
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] digital_assistant_id Unique Digital Assistant identifier.
    # @param [OCI::Oda::Models::UpdateDigitalAssistantDetails] update_digital_assistant_details Property values to update the Digital Assistant.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Oda::Models::DigitalAssistant#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Oda::ManagementClient#update_digital_assistant}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Oda::Models::DigitalAssistant}
    def update_digital_assistant_and_wait_for_state(oda_instance_id, digital_assistant_id, update_digital_assistant_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_digital_assistant(oda_instance_id, digital_assistant_id, update_digital_assistant_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_digital_assistant(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Oda::ManagementClient#update_digital_assistant_parameter} and then waits for the {OCI::Oda::Models::DigitalAssistantParameter} acted upon
    # to enter the given state(s).
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] digital_assistant_id Unique Digital Assistant identifier.
    # @param [String] parameter_name The name of a Digital Assistant Parameter.  This is unique with the Digital Assistant.
    # @param [OCI::Oda::Models::UpdateDigitalAssistantParameterDetails] update_digital_assistant_parameter_details Property values to update the Digital Assistant Parameter.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Oda::Models::DigitalAssistantParameter#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Oda::ManagementClient#update_digital_assistant_parameter}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Oda::Models::DigitalAssistantParameter}
    def update_digital_assistant_parameter_and_wait_for_state(oda_instance_id, digital_assistant_id, parameter_name, update_digital_assistant_parameter_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_digital_assistant_parameter(oda_instance_id, digital_assistant_id, parameter_name, update_digital_assistant_parameter_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_digital_assistant_parameter(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Oda::ManagementClient#update_skill} and then waits for the {OCI::Oda::Models::Skill} acted upon
    # to enter the given state(s).
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] skill_id Unique Skill identifier.
    # @param [OCI::Oda::Models::UpdateSkillDetails] update_skill_details Property values to update the Skill.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Oda::Models::Skill#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Oda::ManagementClient#update_skill}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Oda::Models::Skill}
    def update_skill_and_wait_for_state(oda_instance_id, skill_id, update_skill_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_skill(oda_instance_id, skill_id, update_skill_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_skill(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Oda::ManagementClient#update_skill_parameter} and then waits for the {OCI::Oda::Models::SkillParameter} acted upon
    # to enter the given state(s).
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] skill_id Unique Skill identifier.
    # @param [String] parameter_name The name of a Skill Parameter.
    # @param [OCI::Oda::Models::UpdateSkillParameterDetails] update_skill_parameter_details Property values to update the Skill Parameter.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Oda::Models::SkillParameter#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Oda::ManagementClient#update_skill_parameter}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Oda::Models::SkillParameter}
    def update_skill_parameter_and_wait_for_state(oda_instance_id, skill_id, parameter_name, update_skill_parameter_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_skill_parameter(oda_instance_id, skill_id, parameter_name, update_skill_parameter_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_skill_parameter(wait_for_resource_id).wait_until(
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


    # Calls {OCI::Oda::ManagementClient#update_translator} and then waits for the {OCI::Oda::Models::Translator} acted upon
    # to enter the given state(s).
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] translator_id Unique Translator identifier.
    # @param [OCI::Oda::Models::UpdateTranslatorDetails] update_translator_details Property values to update the Translator.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::Oda::Models::Translator#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::Oda::ManagementClient#update_translator}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::Oda::Models::Translator}
    def update_translator_and_wait_for_state(oda_instance_id, translator_id, update_translator_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_translator(oda_instance_id, translator_id, update_translator_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_translator(wait_for_resource_id).wait_until(
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
