# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Summary of the Stage.
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class Devops::Models::BuildPipelineStageSummary
    # **[Required]** Unique identifier that is immutable on creation.
    # @return [String]
    attr_accessor :id

    # Stage display name, which can be renamed and is not necessarily unique. Avoid entering confidential information.
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The OCID of the DevOps project.
    # @return [String]
    attr_accessor :project_id

    # **[Required]** The OCID of the build pipeline.
    # @return [String]
    attr_accessor :build_pipeline_id

    # **[Required]** The OCID of the compartment where the pipeline is created.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** Defines the stage type, which is one of the following: BUILD, DELIVER_ARTIFACT, WAIT, and TRIGGER_DEPLOYMENT_PIPELINE.
    #
    # @return [String]
    attr_accessor :build_pipeline_stage_type

    # The time the stage was created. Format defined by [RFC3339](https://datatracker.ietf.org/doc/html/rfc3339).
    # @return [DateTime]
    attr_accessor :time_created

    # The time the stage was updated. Format defined by [RFC3339](https://datatracker.ietf.org/doc/html/rfc3339).
    # @return [DateTime]
    attr_accessor :time_updated

    # The current state of the stage.
    #
    # @return [String]
    attr_accessor :lifecycle_state

    # A message describing the current state in more detail. For example, can be used to provide actionable information for a resource in Failed state.
    # @return [String]
    attr_accessor :lifecycle_details

    # Optional description about the build stage.
    # @return [String]
    attr_accessor :description

    # @return [OCI::Devops::Models::BuildPipelineStagePredecessorCollection]
    attr_accessor :build_pipeline_stage_predecessor_collection

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
        'id': :'id',
        'display_name': :'displayName',
        'project_id': :'projectId',
        'build_pipeline_id': :'buildPipelineId',
        'compartment_id': :'compartmentId',
        'build_pipeline_stage_type': :'buildPipelineStageType',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'description': :'description',
        'build_pipeline_stage_predecessor_collection': :'buildPipelineStagePredecessorCollection',
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
        'id': :'String',
        'display_name': :'String',
        'project_id': :'String',
        'build_pipeline_id': :'String',
        'compartment_id': :'String',
        'build_pipeline_stage_type': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'description': :'String',
        'build_pipeline_stage_predecessor_collection': :'OCI::Devops::Models::BuildPipelineStagePredecessorCollection',
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
      type = object_hash[:'buildPipelineStageType'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::Devops::Models::WaitStageSummary' if type == 'WAIT'
      return 'OCI::Devops::Models::BuildStageSummary' if type == 'BUILD'
      return 'OCI::Devops::Models::DeliverArtifactStageSummary' if type == 'DELIVER_ARTIFACT'
      return 'OCI::Devops::Models::TriggerDeploymentStageSummary' if type == 'TRIGGER_DEPLOYMENT_PIPELINE'

      # TODO: Log a warning when the subtype is not found.
      'OCI::Devops::Models::BuildPipelineStageSummary'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :project_id The value to assign to the {#project_id} property
    # @option attributes [String] :build_pipeline_id The value to assign to the {#build_pipeline_id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :build_pipeline_stage_type The value to assign to the {#build_pipeline_stage_type} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [OCI::Devops::Models::BuildPipelineStagePredecessorCollection] :build_pipeline_stage_predecessor_collection The value to assign to the {#build_pipeline_stage_predecessor_collection} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {#system_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.project_id = attributes[:'projectId'] if attributes[:'projectId']

      raise 'You cannot provide both :projectId and :project_id' if attributes.key?(:'projectId') && attributes.key?(:'project_id')

      self.project_id = attributes[:'project_id'] if attributes[:'project_id']

      self.build_pipeline_id = attributes[:'buildPipelineId'] if attributes[:'buildPipelineId']

      raise 'You cannot provide both :buildPipelineId and :build_pipeline_id' if attributes.key?(:'buildPipelineId') && attributes.key?(:'build_pipeline_id')

      self.build_pipeline_id = attributes[:'build_pipeline_id'] if attributes[:'build_pipeline_id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.build_pipeline_stage_type = attributes[:'buildPipelineStageType'] if attributes[:'buildPipelineStageType']

      raise 'You cannot provide both :buildPipelineStageType and :build_pipeline_stage_type' if attributes.key?(:'buildPipelineStageType') && attributes.key?(:'build_pipeline_stage_type')

      self.build_pipeline_stage_type = attributes[:'build_pipeline_stage_type'] if attributes[:'build_pipeline_stage_type']

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

      self.description = attributes[:'description'] if attributes[:'description']

      self.build_pipeline_stage_predecessor_collection = attributes[:'buildPipelineStagePredecessorCollection'] if attributes[:'buildPipelineStagePredecessorCollection']

      raise 'You cannot provide both :buildPipelineStagePredecessorCollection and :build_pipeline_stage_predecessor_collection' if attributes.key?(:'buildPipelineStagePredecessorCollection') && attributes.key?(:'build_pipeline_stage_predecessor_collection')

      self.build_pipeline_stage_predecessor_collection = attributes[:'build_pipeline_stage_predecessor_collection'] if attributes[:'build_pipeline_stage_predecessor_collection']

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

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        display_name == other.display_name &&
        project_id == other.project_id &&
        build_pipeline_id == other.build_pipeline_id &&
        compartment_id == other.compartment_id &&
        build_pipeline_stage_type == other.build_pipeline_stage_type &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        description == other.description &&
        build_pipeline_stage_predecessor_collection == other.build_pipeline_stage_predecessor_collection &&
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
      [id, display_name, project_id, build_pipeline_id, compartment_id, build_pipeline_stage_type, time_created, time_updated, lifecycle_state, lifecycle_details, description, build_pipeline_stage_predecessor_collection, freeform_tags, defined_tags, system_tags].hash
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
