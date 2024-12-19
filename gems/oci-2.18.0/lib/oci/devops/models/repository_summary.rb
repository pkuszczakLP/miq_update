# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Summary of the repository.
  class Devops::Models::RepositorySummary
    # **[Required]** The OCID of the repository. This value is unique and immutable.
    # @return [String]
    attr_accessor :id

    # Unique name of a repository. This value is mutable.
    # @return [String]
    attr_accessor :name

    # **[Required]** The OCID of the repository's compartment.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The OCID of the DevOps project containing the repository.
    # @return [String]
    attr_accessor :project_id

    # Tenancy unique namespace.
    # @return [String]
    attr_accessor :namespace

    # Unique project name in a namespace.
    # @return [String]
    attr_accessor :project_name

    # Details of the repository. Avoid entering confidential information.
    # @return [String]
    attr_accessor :description

    # The default branch of the repository.
    # @return [String]
    attr_accessor :default_branch

    # Type of repository.
    # @return [String]
    attr_accessor :repository_type

    # SSH URL that you use to git clone, pull and push.
    # @return [String]
    attr_accessor :ssh_url

    # HTTP URL that you use to git clone, pull and push.
    # @return [String]
    attr_accessor :http_url

    # @return [OCI::Devops::Models::MirrorRepositoryConfig]
    attr_accessor :mirror_repository_config

    # The time the repository was created. Format defined by [RFC3339](https://datatracker.ietf.org/doc/html/rfc3339).
    # @return [DateTime]
    attr_accessor :time_created

    # The time the repository was updated. Format defined by [RFC3339](https://datatracker.ietf.org/doc/html/rfc3339).
    # @return [DateTime]
    attr_accessor :time_updated

    # The current state of the repository.
    # @return [String]
    attr_accessor :lifecycle_state

    # A message describing the current state in more detail. For example, can be used to provide actionable information for a resource in Failed state.
    # @return [String]
    attr_accessor :lifecycle_details

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
        'name': :'name',
        'compartment_id': :'compartmentId',
        'project_id': :'projectId',
        'namespace': :'namespace',
        'project_name': :'projectName',
        'description': :'description',
        'default_branch': :'defaultBranch',
        'repository_type': :'repositoryType',
        'ssh_url': :'sshUrl',
        'http_url': :'httpUrl',
        'mirror_repository_config': :'mirrorRepositoryConfig',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
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
        'name': :'String',
        'compartment_id': :'String',
        'project_id': :'String',
        'namespace': :'String',
        'project_name': :'String',
        'description': :'String',
        'default_branch': :'String',
        'repository_type': :'String',
        'ssh_url': :'String',
        'http_url': :'String',
        'mirror_repository_config': :'OCI::Devops::Models::MirrorRepositoryConfig',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'system_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :project_id The value to assign to the {#project_id} property
    # @option attributes [String] :namespace The value to assign to the {#namespace} property
    # @option attributes [String] :project_name The value to assign to the {#project_name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :default_branch The value to assign to the {#default_branch} property
    # @option attributes [String] :repository_type The value to assign to the {#repository_type} property
    # @option attributes [String] :ssh_url The value to assign to the {#ssh_url} property
    # @option attributes [String] :http_url The value to assign to the {#http_url} property
    # @option attributes [OCI::Devops::Models::MirrorRepositoryConfig] :mirror_repository_config The value to assign to the {#mirror_repository_config} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {#system_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.name = attributes[:'name'] if attributes[:'name']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.project_id = attributes[:'projectId'] if attributes[:'projectId']

      raise 'You cannot provide both :projectId and :project_id' if attributes.key?(:'projectId') && attributes.key?(:'project_id')

      self.project_id = attributes[:'project_id'] if attributes[:'project_id']

      self.namespace = attributes[:'namespace'] if attributes[:'namespace']

      self.project_name = attributes[:'projectName'] if attributes[:'projectName']

      raise 'You cannot provide both :projectName and :project_name' if attributes.key?(:'projectName') && attributes.key?(:'project_name')

      self.project_name = attributes[:'project_name'] if attributes[:'project_name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.default_branch = attributes[:'defaultBranch'] if attributes[:'defaultBranch']

      raise 'You cannot provide both :defaultBranch and :default_branch' if attributes.key?(:'defaultBranch') && attributes.key?(:'default_branch')

      self.default_branch = attributes[:'default_branch'] if attributes[:'default_branch']

      self.repository_type = attributes[:'repositoryType'] if attributes[:'repositoryType']

      raise 'You cannot provide both :repositoryType and :repository_type' if attributes.key?(:'repositoryType') && attributes.key?(:'repository_type')

      self.repository_type = attributes[:'repository_type'] if attributes[:'repository_type']

      self.ssh_url = attributes[:'sshUrl'] if attributes[:'sshUrl']

      raise 'You cannot provide both :sshUrl and :ssh_url' if attributes.key?(:'sshUrl') && attributes.key?(:'ssh_url')

      self.ssh_url = attributes[:'ssh_url'] if attributes[:'ssh_url']

      self.http_url = attributes[:'httpUrl'] if attributes[:'httpUrl']

      raise 'You cannot provide both :httpUrl and :http_url' if attributes.key?(:'httpUrl') && attributes.key?(:'http_url')

      self.http_url = attributes[:'http_url'] if attributes[:'http_url']

      self.mirror_repository_config = attributes[:'mirrorRepositoryConfig'] if attributes[:'mirrorRepositoryConfig']

      raise 'You cannot provide both :mirrorRepositoryConfig and :mirror_repository_config' if attributes.key?(:'mirrorRepositoryConfig') && attributes.key?(:'mirror_repository_config')

      self.mirror_repository_config = attributes[:'mirror_repository_config'] if attributes[:'mirror_repository_config']

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
        name == other.name &&
        compartment_id == other.compartment_id &&
        project_id == other.project_id &&
        namespace == other.namespace &&
        project_name == other.project_name &&
        description == other.description &&
        default_branch == other.default_branch &&
        repository_type == other.repository_type &&
        ssh_url == other.ssh_url &&
        http_url == other.http_url &&
        mirror_repository_config == other.mirror_repository_config &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
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
      [id, name, compartment_id, project_id, namespace, project_name, description, default_branch, repository_type, ssh_url, http_url, mirror_repository_config, time_created, time_updated, lifecycle_state, lifecycle_details, freeform_tags, defined_tags, system_tags].hash
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
