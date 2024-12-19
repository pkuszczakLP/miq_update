# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The properties that define a job. Jobs perform the actions that are defined in your configuration.
  # - **Plan job**. A plan job takes your Terraform configuration, parses it, and creates an execution plan.
  # - **Apply job**. The apply job takes your execution plan, applies it to the associated stack, then executes
  # the configuration's instructions.
  # - **Destroy job**. To clean up the infrastructure controlled by the stack, you run a destroy job.
  # A destroy job does not delete the stack or associated job resources,
  # but instead releases the resources managed by the stack.
  # - **Import_TF_State job**. An import Terraform state job takes a Terraform state file and sets it as the current
  # state of the stack. This is used to migrate local Terraform environments to Resource Manager.
  #
  class ResourceManager::Models::Job
    OPERATION_ENUM = [
      OPERATION_PLAN = 'PLAN'.freeze,
      OPERATION_APPLY = 'APPLY'.freeze,
      OPERATION_DESTROY = 'DESTROY'.freeze,
      OPERATION_IMPORT_TF_STATE = 'IMPORT_TF_STATE'.freeze,
      OPERATION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_ACCEPTED = 'ACCEPTED'.freeze,
      LIFECYCLE_STATE_IN_PROGRESS = 'IN_PROGRESS'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_SUCCEEDED = 'SUCCEEDED'.freeze,
      LIFECYCLE_STATE_CANCELING = 'CANCELING'.freeze,
      LIFECYCLE_STATE_CANCELED = 'CANCELED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the job.
    # @return [String]
    attr_accessor :id

    # The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the stack that is associated with the job.
    # @return [String]
    attr_accessor :stack_id

    # The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment in which the job's associated stack resides.
    # @return [String]
    attr_accessor :compartment_id

    # The job's display name.
    # @return [String]
    attr_accessor :display_name

    # The type of job executing.
    # @return [String]
    attr_reader :operation

    # @return [OCI::ResourceManager::Models::JobOperationDetails]
    attr_accessor :job_operation_details

    # @return [OCI::ResourceManager::Models::ApplyJobPlanResolution]
    attr_accessor :apply_job_plan_resolution

    # Deprecated. Use the property `executionPlanJobId` in `jobOperationDetails` instead.
    # The plan job [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) that was used (if this was an apply job and was not auto-approved).
    #
    # @return [String]
    attr_accessor :resolved_plan_job_id

    # The date and time when the job was created.
    # Format is defined by RFC3339.
    # Example: `2020-01-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # The date and time when the job stopped running, irrespective of whether the job ran successfully.
    # Format is defined by RFC3339.
    # Example: `2020-01-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_finished

    # Current state of the specified job.
    # For more information about job lifecycle states in Resource Manager, see
    # [Key Concepts](https://docs.cloud.oracle.com/iaas/Content/ResourceManager/Concepts/resourcemanager.htm#concepts__JobStates).
    #
    # @return [String]
    attr_reader :lifecycle_state

    # @return [OCI::ResourceManager::Models::FailureDetails]
    attr_accessor :failure_details

    # @return [OCI::ResourceManager::Models::CancellationDetails]
    attr_accessor :cancellation_details

    # File path to the directory to use for running Terraform.
    # If not specified, the root directory is used.
    # Required when using a zip Terraform configuration (`configSourceType` value of `ZIP_UPLOAD`) that contains folders.
    # Ignored for the `configSourceType` value of `COMPARTMENT_CONFIG_SOURCE`.
    # For more information about required and recommended file structure, see
    # [File Structure (Terraform Configurations for Resource Manager)](https://docs.cloud.oracle.com/iaas/Content/ResourceManager/Concepts/terraformconfigresourcemanager.htm#filestructure).
    #
    # @return [String]
    attr_accessor :working_directory

    # Terraform variables associated with this resource.
    # Maximum number of variables supported is 250.
    # The maximum size of each variable, including both name and value, is 8192 bytes.
    # Example: `{\"CompartmentId\": \"compartment-id-value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :variables

    # @return [OCI::ResourceManager::Models::ConfigSourceRecord]
    attr_accessor :config_source

    # Free-form tags associated with this resource. Each tag is a key-value pair with no predefined name, type, or namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'stack_id': :'stackId',
        'compartment_id': :'compartmentId',
        'display_name': :'displayName',
        'operation': :'operation',
        'job_operation_details': :'jobOperationDetails',
        'apply_job_plan_resolution': :'applyJobPlanResolution',
        'resolved_plan_job_id': :'resolvedPlanJobId',
        'time_created': :'timeCreated',
        'time_finished': :'timeFinished',
        'lifecycle_state': :'lifecycleState',
        'failure_details': :'failureDetails',
        'cancellation_details': :'cancellationDetails',
        'working_directory': :'workingDirectory',
        'variables': :'variables',
        'config_source': :'configSource',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'stack_id': :'String',
        'compartment_id': :'String',
        'display_name': :'String',
        'operation': :'String',
        'job_operation_details': :'OCI::ResourceManager::Models::JobOperationDetails',
        'apply_job_plan_resolution': :'OCI::ResourceManager::Models::ApplyJobPlanResolution',
        'resolved_plan_job_id': :'String',
        'time_created': :'DateTime',
        'time_finished': :'DateTime',
        'lifecycle_state': :'String',
        'failure_details': :'OCI::ResourceManager::Models::FailureDetails',
        'cancellation_details': :'OCI::ResourceManager::Models::CancellationDetails',
        'working_directory': :'String',
        'variables': :'Hash<String, String>',
        'config_source': :'OCI::ResourceManager::Models::ConfigSourceRecord',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :stack_id The value to assign to the {#stack_id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :operation The value to assign to the {#operation} property
    # @option attributes [OCI::ResourceManager::Models::JobOperationDetails] :job_operation_details The value to assign to the {#job_operation_details} property
    # @option attributes [OCI::ResourceManager::Models::ApplyJobPlanResolution] :apply_job_plan_resolution The value to assign to the {#apply_job_plan_resolution} property
    # @option attributes [String] :resolved_plan_job_id The value to assign to the {#resolved_plan_job_id} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_finished The value to assign to the {#time_finished} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [OCI::ResourceManager::Models::FailureDetails] :failure_details The value to assign to the {#failure_details} property
    # @option attributes [OCI::ResourceManager::Models::CancellationDetails] :cancellation_details The value to assign to the {#cancellation_details} property
    # @option attributes [String] :working_directory The value to assign to the {#working_directory} property
    # @option attributes [Hash<String, String>] :variables The value to assign to the {#variables} property
    # @option attributes [OCI::ResourceManager::Models::ConfigSourceRecord] :config_source The value to assign to the {#config_source} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.stack_id = attributes[:'stackId'] if attributes[:'stackId']

      raise 'You cannot provide both :stackId and :stack_id' if attributes.key?(:'stackId') && attributes.key?(:'stack_id')

      self.stack_id = attributes[:'stack_id'] if attributes[:'stack_id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.operation = attributes[:'operation'] if attributes[:'operation']

      self.job_operation_details = attributes[:'jobOperationDetails'] if attributes[:'jobOperationDetails']

      raise 'You cannot provide both :jobOperationDetails and :job_operation_details' if attributes.key?(:'jobOperationDetails') && attributes.key?(:'job_operation_details')

      self.job_operation_details = attributes[:'job_operation_details'] if attributes[:'job_operation_details']

      self.apply_job_plan_resolution = attributes[:'applyJobPlanResolution'] if attributes[:'applyJobPlanResolution']

      raise 'You cannot provide both :applyJobPlanResolution and :apply_job_plan_resolution' if attributes.key?(:'applyJobPlanResolution') && attributes.key?(:'apply_job_plan_resolution')

      self.apply_job_plan_resolution = attributes[:'apply_job_plan_resolution'] if attributes[:'apply_job_plan_resolution']

      self.resolved_plan_job_id = attributes[:'resolvedPlanJobId'] if attributes[:'resolvedPlanJobId']

      raise 'You cannot provide both :resolvedPlanJobId and :resolved_plan_job_id' if attributes.key?(:'resolvedPlanJobId') && attributes.key?(:'resolved_plan_job_id')

      self.resolved_plan_job_id = attributes[:'resolved_plan_job_id'] if attributes[:'resolved_plan_job_id']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_finished = attributes[:'timeFinished'] if attributes[:'timeFinished']

      raise 'You cannot provide both :timeFinished and :time_finished' if attributes.key?(:'timeFinished') && attributes.key?(:'time_finished')

      self.time_finished = attributes[:'time_finished'] if attributes[:'time_finished']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.failure_details = attributes[:'failureDetails'] if attributes[:'failureDetails']

      raise 'You cannot provide both :failureDetails and :failure_details' if attributes.key?(:'failureDetails') && attributes.key?(:'failure_details')

      self.failure_details = attributes[:'failure_details'] if attributes[:'failure_details']

      self.cancellation_details = attributes[:'cancellationDetails'] if attributes[:'cancellationDetails']

      raise 'You cannot provide both :cancellationDetails and :cancellation_details' if attributes.key?(:'cancellationDetails') && attributes.key?(:'cancellation_details')

      self.cancellation_details = attributes[:'cancellation_details'] if attributes[:'cancellation_details']

      self.working_directory = attributes[:'workingDirectory'] if attributes[:'workingDirectory']

      raise 'You cannot provide both :workingDirectory and :working_directory' if attributes.key?(:'workingDirectory') && attributes.key?(:'working_directory')

      self.working_directory = attributes[:'working_directory'] if attributes[:'working_directory']

      self.variables = attributes[:'variables'] if attributes[:'variables']

      self.config_source = attributes[:'configSource'] if attributes[:'configSource']

      raise 'You cannot provide both :configSource and :config_source' if attributes.key?(:'configSource') && attributes.key?(:'config_source')

      self.config_source = attributes[:'config_source'] if attributes[:'config_source']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] operation Object to be assigned
    def operation=(operation)
      # rubocop:disable Style/ConditionalAssignment
      if operation && !OPERATION_ENUM.include?(operation)
        OCI.logger.debug("Unknown value for 'operation' [" + operation + "]. Mapping to 'OPERATION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @operation = OPERATION_UNKNOWN_ENUM_VALUE
      else
        @operation = operation
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] lifecycle_state Object to be assigned
    def lifecycle_state=(lifecycle_state)
      # rubocop:disable Style/ConditionalAssignment
      if lifecycle_state && !LIFECYCLE_STATE_ENUM.include?(lifecycle_state)
        OCI.logger.debug("Unknown value for 'lifecycle_state' [" + lifecycle_state + "]. Mapping to 'LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @lifecycle_state = LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE
      else
        @lifecycle_state = lifecycle_state
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        stack_id == other.stack_id &&
        compartment_id == other.compartment_id &&
        display_name == other.display_name &&
        operation == other.operation &&
        job_operation_details == other.job_operation_details &&
        apply_job_plan_resolution == other.apply_job_plan_resolution &&
        resolved_plan_job_id == other.resolved_plan_job_id &&
        time_created == other.time_created &&
        time_finished == other.time_finished &&
        lifecycle_state == other.lifecycle_state &&
        failure_details == other.failure_details &&
        cancellation_details == other.cancellation_details &&
        working_directory == other.working_directory &&
        variables == other.variables &&
        config_source == other.config_source &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines

    # @see the `==` method
    # @param [Object] other the other object to be compared
    def eql?(other)
      self == other
    end

    # rubocop:disable Metrics/AbcSize, Layout/EmptyLines


    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [id, stack_id, compartment_id, display_name, operation, job_operation_details, apply_job_plan_resolution, resolved_plan_job_id, time_created, time_finished, lifecycle_state, failure_details, cancellation_details, working_directory, variables, config_source, freeform_tags, defined_tags].hash
    end
    # rubocop:enable Metrics/AbcSize, Layout/EmptyLines

    # rubocop:disable Metrics/AbcSize, Layout/EmptyLines


    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)

      self.class.swagger_types.each_pair do |key, type|
        if type =~ /^Array<(.*)>/i
          # check to ensure the input is an array given that the the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            public_method("#{key}=").call(
              attributes[self.class.attribute_map[key]]
                .map { |v| OCI::Internal::Util.convert_to_type(Regexp.last_match(1), v) }
            )
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          public_method("#{key}=").call(
            OCI::Internal::Util.convert_to_type(type, attributes[self.class.attribute_map[key]])
          )
        end
        # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end
    # rubocop:enable Metrics/AbcSize, Layout/EmptyLines

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = public_method(attr).call
        next if value.nil? && !instance_variable_defined?("@#{attr}")

        hash[param] = _to_hash(value)
      end
      hash
    end

    private

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end
  end
end
# rubocop:enable Lint/UnneededCopDisableDirective, Metrics/LineLength
