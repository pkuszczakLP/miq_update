# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details of Backups such as OCID, description, backupType, and so on.
  #
  # To use any of the API operations, you must be authorized in an IAM
  # policy. If you're not authorized, talk to an administrator. If you're an
  # administrator who needs to write policies to give users access, see
  # [Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).
  #
  class Mysql::Models::BackupSummary
    # **[Required]** OCID of the backup.
    # @return [String]
    attr_accessor :id

    # A user-supplied display name for the backup.
    # @return [String]
    attr_accessor :display_name

    # A user-supplied description of the backup.
    # @return [String]
    attr_accessor :description

    # **[Required]** The time the backup was created.
    # @return [DateTime]
    attr_accessor :time_created

    # **[Required]** The state of the backup.
    # @return [String]
    attr_accessor :lifecycle_state

    # **[Required]** The type of backup.
    # @return [String]
    attr_accessor :backup_type

    # **[Required]** If the backup was created automatically, or by a manual request.
    # @return [String]
    attr_accessor :creation_type

    # **[Required]** The OCID of the DB System the Backup is associated with.
    # @return [String]
    attr_accessor :db_system_id

    # Size of the data volume in GiBs.
    # @return [Integer]
    attr_accessor :data_storage_size_in_gbs

    # The size of the backup in GiBs.
    # @return [Integer]
    attr_accessor :backup_size_in_gbs

    # Number of days to retain this backup.
    # @return [Integer]
    attr_accessor :retention_in_days

    # The version of the DB System used for backup.
    # @return [String]
    attr_accessor :mysql_version

    # The shape of the DB System instance used for backup.
    # @return [String]
    attr_accessor :shape_name

    # Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'display_name': :'displayName',
        'description': :'description',
        'time_created': :'timeCreated',
        'lifecycle_state': :'lifecycleState',
        'backup_type': :'backupType',
        'creation_type': :'creationType',
        'db_system_id': :'dbSystemId',
        'data_storage_size_in_gbs': :'dataStorageSizeInGBs',
        'backup_size_in_gbs': :'backupSizeInGBs',
        'retention_in_days': :'retentionInDays',
        'mysql_version': :'mysqlVersion',
        'shape_name': :'shapeName',
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
        'display_name': :'String',
        'description': :'String',
        'time_created': :'DateTime',
        'lifecycle_state': :'String',
        'backup_type': :'String',
        'creation_type': :'String',
        'db_system_id': :'String',
        'data_storage_size_in_gbs': :'Integer',
        'backup_size_in_gbs': :'Integer',
        'retention_in_days': :'Integer',
        'mysql_version': :'String',
        'shape_name': :'String',
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
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :backup_type The value to assign to the {#backup_type} property
    # @option attributes [String] :creation_type The value to assign to the {#creation_type} property
    # @option attributes [String] :db_system_id The value to assign to the {#db_system_id} property
    # @option attributes [Integer] :data_storage_size_in_gbs The value to assign to the {#data_storage_size_in_gbs} property
    # @option attributes [Integer] :backup_size_in_gbs The value to assign to the {#backup_size_in_gbs} property
    # @option attributes [Integer] :retention_in_days The value to assign to the {#retention_in_days} property
    # @option attributes [String] :mysql_version The value to assign to the {#mysql_version} property
    # @option attributes [String] :shape_name The value to assign to the {#shape_name} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.backup_type = attributes[:'backupType'] if attributes[:'backupType']

      raise 'You cannot provide both :backupType and :backup_type' if attributes.key?(:'backupType') && attributes.key?(:'backup_type')

      self.backup_type = attributes[:'backup_type'] if attributes[:'backup_type']

      self.creation_type = attributes[:'creationType'] if attributes[:'creationType']

      raise 'You cannot provide both :creationType and :creation_type' if attributes.key?(:'creationType') && attributes.key?(:'creation_type')

      self.creation_type = attributes[:'creation_type'] if attributes[:'creation_type']

      self.db_system_id = attributes[:'dbSystemId'] if attributes[:'dbSystemId']

      raise 'You cannot provide both :dbSystemId and :db_system_id' if attributes.key?(:'dbSystemId') && attributes.key?(:'db_system_id')

      self.db_system_id = attributes[:'db_system_id'] if attributes[:'db_system_id']

      self.data_storage_size_in_gbs = attributes[:'dataStorageSizeInGBs'] if attributes[:'dataStorageSizeInGBs']

      raise 'You cannot provide both :dataStorageSizeInGBs and :data_storage_size_in_gbs' if attributes.key?(:'dataStorageSizeInGBs') && attributes.key?(:'data_storage_size_in_gbs')

      self.data_storage_size_in_gbs = attributes[:'data_storage_size_in_gbs'] if attributes[:'data_storage_size_in_gbs']

      self.backup_size_in_gbs = attributes[:'backupSizeInGBs'] if attributes[:'backupSizeInGBs']

      raise 'You cannot provide both :backupSizeInGBs and :backup_size_in_gbs' if attributes.key?(:'backupSizeInGBs') && attributes.key?(:'backup_size_in_gbs')

      self.backup_size_in_gbs = attributes[:'backup_size_in_gbs'] if attributes[:'backup_size_in_gbs']

      self.retention_in_days = attributes[:'retentionInDays'] if attributes[:'retentionInDays']

      raise 'You cannot provide both :retentionInDays and :retention_in_days' if attributes.key?(:'retentionInDays') && attributes.key?(:'retention_in_days')

      self.retention_in_days = attributes[:'retention_in_days'] if attributes[:'retention_in_days']

      self.mysql_version = attributes[:'mysqlVersion'] if attributes[:'mysqlVersion']

      raise 'You cannot provide both :mysqlVersion and :mysql_version' if attributes.key?(:'mysqlVersion') && attributes.key?(:'mysql_version')

      self.mysql_version = attributes[:'mysql_version'] if attributes[:'mysql_version']

      self.shape_name = attributes[:'shapeName'] if attributes[:'shapeName']

      raise 'You cannot provide both :shapeName and :shape_name' if attributes.key?(:'shapeName') && attributes.key?(:'shape_name')

      self.shape_name = attributes[:'shape_name'] if attributes[:'shape_name']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']
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
        description == other.description &&
        time_created == other.time_created &&
        lifecycle_state == other.lifecycle_state &&
        backup_type == other.backup_type &&
        creation_type == other.creation_type &&
        db_system_id == other.db_system_id &&
        data_storage_size_in_gbs == other.data_storage_size_in_gbs &&
        backup_size_in_gbs == other.backup_size_in_gbs &&
        retention_in_days == other.retention_in_days &&
        mysql_version == other.mysql_version &&
        shape_name == other.shape_name &&
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
      [id, display_name, description, time_created, lifecycle_state, backup_type, creation_type, db_system_id, data_storage_size_in_gbs, backup_size_in_gbs, retention_in_days, mysql_version, shape_name, freeform_tags, defined_tags].hash
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
