# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A backup of the current state of the GoldenGate deployment. Can be used to restore a deployment, or create a new deployment with that state as the starting deployment state.
  #
  class GoldenGate::Models::DeploymentBackup
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_NEEDS_ATTENTION = 'NEEDS_ATTENTION'.freeze,
      LIFECYCLE_STATE_IN_PROGRESS = 'IN_PROGRESS'.freeze,
      LIFECYCLE_STATE_CANCELING = 'CANCELING'.freeze,
      LIFECYCLE_STATE_CANCELED = 'CANCELED'.freeze,
      LIFECYCLE_STATE_SUCCEEDED = 'SUCCEEDED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    BACKUP_TYPE_ENUM = [
      BACKUP_TYPE_INCREMENTAL = 'INCREMENTAL'.freeze,
      BACKUP_TYPE_FULL = 'FULL'.freeze,
      BACKUP_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the backup being referenced.
    #
    # @return [String]
    attr_accessor :id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the deployment being referenced.
    #
    # @return [String]
    attr_accessor :deployment_id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment being referenced.
    #
    # @return [String]
    attr_accessor :compartment_id

    # An object's Display Name.
    #
    # @return [String]
    attr_accessor :display_name

    # True if this object is automatically created
    #
    # @return [BOOLEAN]
    attr_accessor :is_automatic

    # **[Required]** Possible lifecycle states.
    #
    # @return [String]
    attr_reader :lifecycle_state

    # Describes the object's current state in detail. For example, it can be used to provide actionable information for a resource in a Failed state.
    #
    # @return [String]
    attr_accessor :lifecycle_details

    # The time of the resource backup. The format is defined by [RFC3339](https://tools.ietf.org/html/rfc3339), such as `2016-08-25T21:10:29.600Z`.
    #
    # @return [DateTime]
    attr_accessor :time_of_backup

    # The time of the resource backup finish. The format is defined by [RFC3339](https://tools.ietf.org/html/rfc3339), such as `2016-08-25T21:10:29.600Z`.
    #
    # @return [DateTime]
    attr_accessor :time_backup_finished

    # The size of the backup stored in object storage (in bytes)
    #
    # @return [Float]
    attr_accessor :size_in_bytes

    # Possible Deployment backup types.
    #
    # @return [String]
    attr_reader :backup_type

    # **[Required]** Version of OGG
    #
    # @return [String]
    attr_accessor :ogg_version

    # Name of namespace that serves as a container for all of your buckets
    # @return [String]
    attr_accessor :namespace_name

    # Name of the bucket where the object is to be uploaded in the object storage
    # @return [String]
    attr_accessor :bucket_name

    # Name of the object to be uploaded to object storage
    # @return [String]
    attr_accessor :object_name

    # The time the resource was created. The format is defined by [RFC3339](https://tools.ietf.org/html/rfc3339), such as `2016-08-25T21:10:29.600Z`.
    #
    # @return [DateTime]
    attr_accessor :time_created

    # The time the resource was last updated. The format is defined by [RFC3339](https://tools.ietf.org/html/rfc3339), such as `2016-08-25T21:10:29.600Z`.
    #
    # @return [DateTime]
    attr_accessor :time_updated

    # A simple key-value pair that is applied without any predefined name, type, or scope. Exists for cross-compatibility only.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Tags defined for this resource. Each key is predefined and scoped to a namespace.
    # Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # The system tags associated with this resource, if any. The system tags are set by Oracle Cloud Infrastructure services. Each key is predefined and scoped to namespaces.  For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).
    # Example: `{orcl-cloud: {free-tier-retain: true}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :system_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'deployment_id': :'deploymentId',
        'compartment_id': :'compartmentId',
        'display_name': :'displayName',
        'is_automatic': :'isAutomatic',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'time_of_backup': :'timeOfBackup',
        'time_backup_finished': :'timeBackupFinished',
        'size_in_bytes': :'sizeInBytes',
        'backup_type': :'backupType',
        'ogg_version': :'oggVersion',
        'namespace_name': :'namespaceName',
        'bucket_name': :'bucketName',
        'object_name': :'objectName',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
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
        'deployment_id': :'String',
        'compartment_id': :'String',
        'display_name': :'String',
        'is_automatic': :'BOOLEAN',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'time_of_backup': :'DateTime',
        'time_backup_finished': :'DateTime',
        'size_in_bytes': :'Float',
        'backup_type': :'String',
        'ogg_version': :'String',
        'namespace_name': :'String',
        'bucket_name': :'String',
        'object_name': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
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
    # @option attributes [String] :deployment_id The value to assign to the {#deployment_id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [BOOLEAN] :is_automatic The value to assign to the {#is_automatic} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [DateTime] :time_of_backup The value to assign to the {#time_of_backup} property
    # @option attributes [DateTime] :time_backup_finished The value to assign to the {#time_backup_finished} property
    # @option attributes [Float] :size_in_bytes The value to assign to the {#size_in_bytes} property
    # @option attributes [String] :backup_type The value to assign to the {#backup_type} property
    # @option attributes [String] :ogg_version The value to assign to the {#ogg_version} property
    # @option attributes [String] :namespace_name The value to assign to the {#namespace_name} property
    # @option attributes [String] :bucket_name The value to assign to the {#bucket_name} property
    # @option attributes [String] :object_name The value to assign to the {#object_name} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {#system_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.deployment_id = attributes[:'deploymentId'] if attributes[:'deploymentId']

      raise 'You cannot provide both :deploymentId and :deployment_id' if attributes.key?(:'deploymentId') && attributes.key?(:'deployment_id')

      self.deployment_id = attributes[:'deployment_id'] if attributes[:'deployment_id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.is_automatic = attributes[:'isAutomatic'] unless attributes[:'isAutomatic'].nil?

      raise 'You cannot provide both :isAutomatic and :is_automatic' if attributes.key?(:'isAutomatic') && attributes.key?(:'is_automatic')

      self.is_automatic = attributes[:'is_automatic'] unless attributes[:'is_automatic'].nil?

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.time_of_backup = attributes[:'timeOfBackup'] if attributes[:'timeOfBackup']

      raise 'You cannot provide both :timeOfBackup and :time_of_backup' if attributes.key?(:'timeOfBackup') && attributes.key?(:'time_of_backup')

      self.time_of_backup = attributes[:'time_of_backup'] if attributes[:'time_of_backup']

      self.time_backup_finished = attributes[:'timeBackupFinished'] if attributes[:'timeBackupFinished']

      raise 'You cannot provide both :timeBackupFinished and :time_backup_finished' if attributes.key?(:'timeBackupFinished') && attributes.key?(:'time_backup_finished')

      self.time_backup_finished = attributes[:'time_backup_finished'] if attributes[:'time_backup_finished']

      self.size_in_bytes = attributes[:'sizeInBytes'] if attributes[:'sizeInBytes']

      raise 'You cannot provide both :sizeInBytes and :size_in_bytes' if attributes.key?(:'sizeInBytes') && attributes.key?(:'size_in_bytes')

      self.size_in_bytes = attributes[:'size_in_bytes'] if attributes[:'size_in_bytes']

      self.backup_type = attributes[:'backupType'] if attributes[:'backupType']

      raise 'You cannot provide both :backupType and :backup_type' if attributes.key?(:'backupType') && attributes.key?(:'backup_type')

      self.backup_type = attributes[:'backup_type'] if attributes[:'backup_type']

      self.ogg_version = attributes[:'oggVersion'] if attributes[:'oggVersion']

      raise 'You cannot provide both :oggVersion and :ogg_version' if attributes.key?(:'oggVersion') && attributes.key?(:'ogg_version')

      self.ogg_version = attributes[:'ogg_version'] if attributes[:'ogg_version']

      self.namespace_name = attributes[:'namespaceName'] if attributes[:'namespaceName']

      raise 'You cannot provide both :namespaceName and :namespace_name' if attributes.key?(:'namespaceName') && attributes.key?(:'namespace_name')

      self.namespace_name = attributes[:'namespace_name'] if attributes[:'namespace_name']

      self.bucket_name = attributes[:'bucketName'] if attributes[:'bucketName']

      raise 'You cannot provide both :bucketName and :bucket_name' if attributes.key?(:'bucketName') && attributes.key?(:'bucket_name')

      self.bucket_name = attributes[:'bucket_name'] if attributes[:'bucket_name']

      self.object_name = attributes[:'objectName'] if attributes[:'objectName']

      raise 'You cannot provide both :objectName and :object_name' if attributes.key?(:'objectName') && attributes.key?(:'object_name')

      self.object_name = attributes[:'object_name'] if attributes[:'object_name']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

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

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] backup_type Object to be assigned
    def backup_type=(backup_type)
      # rubocop:disable Style/ConditionalAssignment
      if backup_type && !BACKUP_TYPE_ENUM.include?(backup_type)
        OCI.logger.debug("Unknown value for 'backup_type' [" + backup_type + "]. Mapping to 'BACKUP_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @backup_type = BACKUP_TYPE_UNKNOWN_ENUM_VALUE
      else
        @backup_type = backup_type
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
        deployment_id == other.deployment_id &&
        compartment_id == other.compartment_id &&
        display_name == other.display_name &&
        is_automatic == other.is_automatic &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        time_of_backup == other.time_of_backup &&
        time_backup_finished == other.time_backup_finished &&
        size_in_bytes == other.size_in_bytes &&
        backup_type == other.backup_type &&
        ogg_version == other.ogg_version &&
        namespace_name == other.namespace_name &&
        bucket_name == other.bucket_name &&
        object_name == other.object_name &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
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
      [id, deployment_id, compartment_id, display_name, is_automatic, lifecycle_state, lifecycle_details, time_of_backup, time_backup_finished, size_in_bytes, backup_type, ogg_version, namespace_name, bucket_name, object_name, time_created, time_updated, freeform_tags, defined_tags, system_tags].hash
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
