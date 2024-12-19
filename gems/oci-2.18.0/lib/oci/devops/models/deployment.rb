# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A single execution or run of a pipeline.
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class Devops::Models::Deployment
    DEPLOYMENT_TYPE_ENUM = [
      DEPLOYMENT_TYPE_PIPELINE_DEPLOYMENT = 'PIPELINE_DEPLOYMENT'.freeze,
      DEPLOYMENT_TYPE_PIPELINE_REDEPLOYMENT = 'PIPELINE_REDEPLOYMENT'.freeze,
      DEPLOYMENT_TYPE_SINGLE_STAGE_DEPLOYMENT = 'SINGLE_STAGE_DEPLOYMENT'.freeze,
      DEPLOYMENT_TYPE_SINGLE_STAGE_REDEPLOYMENT = 'SINGLE_STAGE_REDEPLOYMENT'.freeze,
      DEPLOYMENT_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
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

    # @return [OCI::Devops::Models::DeployPipelineArtifactCollection]
    attr_accessor :deploy_pipeline_artifacts

    # @return [OCI::Devops::Models::DeployPipelineEnvironmentCollection]
    attr_accessor :deploy_pipeline_environments

    # **[Required]** Specifies type of deployment.
    # @return [String]
    attr_reader :deployment_type

    # **[Required]** Unique identifier that is immutable on creation.
    # @return [String]
    attr_accessor :id

    # Deployment identifier which can be renamed and is not necessarily unique. Avoid entering confidential information.
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The OCID of a project.
    # @return [String]
    attr_accessor :project_id

    # **[Required]** The OCID of a pipeline.
    # @return [String]
    attr_accessor :deploy_pipeline_id

    # **[Required]** The OCID of a compartment.
    # @return [String]
    attr_accessor :compartment_id

    # Time the deployment was created. Format defined by [RFC3339](https://datatracker.ietf.org/doc/html/rfc3339).
    # @return [DateTime]
    attr_accessor :time_created

    # Time the deployment was updated. Format defined by [RFC3339](https://datatracker.ietf.org/doc/html/rfc3339).
    # @return [DateTime]
    attr_accessor :time_updated

    # The current state of the deployment.
    # @return [String]
    attr_reader :lifecycle_state

    # A message describing the current state in more detail. For example, can be used to provide actionable information for a resource in Failed state.
    # @return [String]
    attr_accessor :lifecycle_details

    # @return [OCI::Devops::Models::DeploymentArgumentCollection]
    attr_accessor :deployment_arguments

    # @return [OCI::Devops::Models::DeployArtifactOverrideArgumentCollection]
    attr_accessor :deploy_artifact_override_arguments

    # @return [OCI::Devops::Models::DeploymentExecutionProgress]
    attr_accessor :deployment_execution_progress

    # Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only.  See [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm). Example: `{\"bar-key\": \"value\"}`
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace. See [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm). Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Usage of system tag keys. These predefined keys are scoped to namespaces. See [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm). Example: `{\"orcl-cloud\": {\"free-tier-retained\": \"true\"}}`
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :system_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'deploy_pipeline_artifacts': :'deployPipelineArtifacts',
        'deploy_pipeline_environments': :'deployPipelineEnvironments',
        'deployment_type': :'deploymentType',
        'id': :'id',
        'display_name': :'displayName',
        'project_id': :'projectId',
        'deploy_pipeline_id': :'deployPipelineId',
        'compartment_id': :'compartmentId',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'deployment_arguments': :'deploymentArguments',
        'deploy_artifact_override_arguments': :'deployArtifactOverrideArguments',
        'deployment_execution_progress': :'deploymentExecutionProgress',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'system_tags': :'systemTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'deploy_pipeline_artifacts': :'OCI::Devops::Models::DeployPipelineArtifactCollection',
        'deploy_pipeline_environments': :'OCI::Devops::Models::DeployPipelineEnvironmentCollection',
        'deployment_type': :'String',
        'id': :'String',
        'display_name': :'String',
        'project_id': :'String',
        'deploy_pipeline_id': :'String',
        'compartment_id': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'deployment_arguments': :'OCI::Devops::Models::DeploymentArgumentCollection',
        'deploy_artifact_override_arguments': :'OCI::Devops::Models::DeployArtifactOverrideArgumentCollection',
        'deployment_execution_progress': :'OCI::Devops::Models::DeploymentExecutionProgress',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'system_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'deploymentType'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::Devops::Models::SingleDeployStageRedeployment' if type == 'SINGLE_STAGE_REDEPLOYMENT'
      return 'OCI::Devops::Models::DeployPipelineDeployment' if type == 'PIPELINE_DEPLOYMENT'
      return 'OCI::Devops::Models::DeployPipelineRedeployment' if type == 'PIPELINE_REDEPLOYMENT'
      return 'OCI::Devops::Models::SingleDeployStageDeployment' if type == 'SINGLE_STAGE_DEPLOYMENT'

      # TODO: Log a warning when the subtype is not found.
      'OCI::Devops::Models::Deployment'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [OCI::Devops::Models::DeployPipelineArtifactCollection] :deploy_pipeline_artifacts The value to assign to the {#deploy_pipeline_artifacts} property
    # @option attributes [OCI::Devops::Models::DeployPipelineEnvironmentCollection] :deploy_pipeline_environments The value to assign to the {#deploy_pipeline_environments} property
    # @option attributes [String] :deployment_type The value to assign to the {#deployment_type} property
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :project_id The value to assign to the {#project_id} property
    # @option attributes [String] :deploy_pipeline_id The value to assign to the {#deploy_pipeline_id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [OCI::Devops::Models::DeploymentArgumentCollection] :deployment_arguments The value to assign to the {#deployment_arguments} property
    # @option attributes [OCI::Devops::Models::DeployArtifactOverrideArgumentCollection] :deploy_artifact_override_arguments The value to assign to the {#deploy_artifact_override_arguments} property
    # @option attributes [OCI::Devops::Models::DeploymentExecutionProgress] :deployment_execution_progress The value to assign to the {#deployment_execution_progress} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {#system_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.deploy_pipeline_artifacts = attributes[:'deployPipelineArtifacts'] if attributes[:'deployPipelineArtifacts']

      raise 'You cannot provide both :deployPipelineArtifacts and :deploy_pipeline_artifacts' if attributes.key?(:'deployPipelineArtifacts') && attributes.key?(:'deploy_pipeline_artifacts')

      self.deploy_pipeline_artifacts = attributes[:'deploy_pipeline_artifacts'] if attributes[:'deploy_pipeline_artifacts']

      self.deploy_pipeline_environments = attributes[:'deployPipelineEnvironments'] if attributes[:'deployPipelineEnvironments']

      raise 'You cannot provide both :deployPipelineEnvironments and :deploy_pipeline_environments' if attributes.key?(:'deployPipelineEnvironments') && attributes.key?(:'deploy_pipeline_environments')

      self.deploy_pipeline_environments = attributes[:'deploy_pipeline_environments'] if attributes[:'deploy_pipeline_environments']

      self.deployment_type = attributes[:'deploymentType'] if attributes[:'deploymentType']

      raise 'You cannot provide both :deploymentType and :deployment_type' if attributes.key?(:'deploymentType') && attributes.key?(:'deployment_type')

      self.deployment_type = attributes[:'deployment_type'] if attributes[:'deployment_type']

      self.id = attributes[:'id'] if attributes[:'id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.project_id = attributes[:'projectId'] if attributes[:'projectId']

      raise 'You cannot provide both :projectId and :project_id' if attributes.key?(:'projectId') && attributes.key?(:'project_id')

      self.project_id = attributes[:'project_id'] if attributes[:'project_id']

      self.deploy_pipeline_id = attributes[:'deployPipelineId'] if attributes[:'deployPipelineId']

      raise 'You cannot provide both :deployPipelineId and :deploy_pipeline_id' if attributes.key?(:'deployPipelineId') && attributes.key?(:'deploy_pipeline_id')

      self.deploy_pipeline_id = attributes[:'deploy_pipeline_id'] if attributes[:'deploy_pipeline_id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.deployment_arguments = attributes[:'deploymentArguments'] if attributes[:'deploymentArguments']

      raise 'You cannot provide both :deploymentArguments and :deployment_arguments' if attributes.key?(:'deploymentArguments') && attributes.key?(:'deployment_arguments')

      self.deployment_arguments = attributes[:'deployment_arguments'] if attributes[:'deployment_arguments']

      self.deploy_artifact_override_arguments = attributes[:'deployArtifactOverrideArguments'] if attributes[:'deployArtifactOverrideArguments']

      raise 'You cannot provide both :deployArtifactOverrideArguments and :deploy_artifact_override_arguments' if attributes.key?(:'deployArtifactOverrideArguments') && attributes.key?(:'deploy_artifact_override_arguments')

      self.deploy_artifact_override_arguments = attributes[:'deploy_artifact_override_arguments'] if attributes[:'deploy_artifact_override_arguments']

      self.deployment_execution_progress = attributes[:'deploymentExecutionProgress'] if attributes[:'deploymentExecutionProgress']

      raise 'You cannot provide both :deploymentExecutionProgress and :deployment_execution_progress' if attributes.key?(:'deploymentExecutionProgress') && attributes.key?(:'deployment_execution_progress')

      self.deployment_execution_progress = attributes[:'deployment_execution_progress'] if attributes[:'deployment_execution_progress']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.system_tags = attributes[:'systemTags'] if attributes[:'systemTags']

      raise 'You cannot provide both :systemTags and :system_tags' if attributes.key?(:'systemTags') && attributes.key?(:'system_tags')

      self.system_tags = attributes[:'system_tags'] if attributes[:'system_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] deployment_type Object to be assigned
    def deployment_type=(deployment_type)
      # rubocop:disable Style/ConditionalAssignment
      if deployment_type && !DEPLOYMENT_TYPE_ENUM.include?(deployment_type)
        OCI.logger.debug("Unknown value for 'deployment_type' [" + deployment_type + "]. Mapping to 'DEPLOYMENT_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @deployment_type = DEPLOYMENT_TYPE_UNKNOWN_ENUM_VALUE
      else
        @deployment_type = deployment_type
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
        deploy_pipeline_artifacts == other.deploy_pipeline_artifacts &&
        deploy_pipeline_environments == other.deploy_pipeline_environments &&
        deployment_type == other.deployment_type &&
        id == other.id &&
        display_name == other.display_name &&
        project_id == other.project_id &&
        deploy_pipeline_id == other.deploy_pipeline_id &&
        compartment_id == other.compartment_id &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        deployment_arguments == other.deployment_arguments &&
        deploy_artifact_override_arguments == other.deploy_artifact_override_arguments &&
        deployment_execution_progress == other.deployment_execution_progress &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        system_tags == other.system_tags
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
      [deploy_pipeline_artifacts, deploy_pipeline_environments, deployment_type, id, display_name, project_id, deploy_pipeline_id, compartment_id, time_created, time_updated, lifecycle_state, lifecycle_details, deployment_arguments, deploy_artifact_override_arguments, deployment_execution_progress, freeform_tags, defined_tags, system_tags].hash
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
