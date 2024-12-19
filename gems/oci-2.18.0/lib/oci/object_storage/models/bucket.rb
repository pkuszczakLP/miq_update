# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A bucket is a container for storing objects in a compartment within a namespace. A bucket is associated with a single compartment.
  # The compartment has policies that indicate what actions a user can perform on a bucket and all the objects in the bucket. For more
  # information, see [Managing Buckets](https://docs.cloud.oracle.com/Content/Object/Tasks/managingbuckets.htm).
  #
  # To use any of the API operations, you must be authorized in an IAM policy. If you are not authorized,
  # talk to an administrator. If you are an administrator who needs to write policies to give users access, see
  # [Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).
  #
  class ObjectStorage::Models::Bucket
    PUBLIC_ACCESS_TYPE_ENUM = [
      PUBLIC_ACCESS_TYPE_NO_PUBLIC_ACCESS = 'NoPublicAccess'.freeze,
      PUBLIC_ACCESS_TYPE_OBJECT_READ = 'ObjectRead'.freeze,
      PUBLIC_ACCESS_TYPE_OBJECT_READ_WITHOUT_LIST = 'ObjectReadWithoutList'.freeze,
      PUBLIC_ACCESS_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    STORAGE_TIER_ENUM = [
      STORAGE_TIER_STANDARD = 'Standard'.freeze,
      STORAGE_TIER_ARCHIVE = 'Archive'.freeze,
      STORAGE_TIER_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    VERSIONING_ENUM = [
      VERSIONING_ENABLED = 'Enabled'.freeze,
      VERSIONING_SUSPENDED = 'Suspended'.freeze,
      VERSIONING_DISABLED = 'Disabled'.freeze,
      VERSIONING_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    AUTO_TIERING_ENUM = [
      AUTO_TIERING_DISABLED = 'Disabled'.freeze,
      AUTO_TIERING_INFREQUENT_ACCESS = 'InfrequentAccess'.freeze,
      AUTO_TIERING_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The Object Storage namespace in which the bucket resides.
    # @return [String]
    attr_accessor :namespace

    # **[Required]** The name of the bucket. Avoid entering confidential information.
    # Example: my-new-bucket1
    #
    # @return [String]
    attr_accessor :name

    # **[Required]** The compartment ID in which the bucket is authorized.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** Arbitrary string keys and values for user-defined metadata.
    # @return [Hash<String, String>]
    attr_accessor :metadata

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the user who created the bucket.
    # @return [String]
    attr_accessor :created_by

    # **[Required]** The date and time the bucket was created, as described in [RFC 2616](https://tools.ietf.org/html/rfc2616#section-14.29).
    # @return [DateTime]
    attr_accessor :time_created

    # **[Required]** The entity tag (ETag) for the bucket.
    # @return [String]
    attr_accessor :etag

    # The type of public access enabled on this bucket.
    # A bucket is set to `NoPublicAccess` by default, which only allows an authenticated caller to access the
    # bucket and its contents. When `ObjectRead` is enabled on the bucket, public access is allowed for the
    # `GetObject`, `HeadObject`, and `ListObjects` operations. When `ObjectReadWithoutList` is enabled on the
    # bucket, public access is allowed for the `GetObject` and `HeadObject` operations.
    #
    # @return [String]
    attr_reader :public_access_type

    # The storage tier type assigned to the bucket. A bucket is set to `Standard` tier by default, which means
    # objects uploaded or copied to the bucket will be in the standard storage tier. When the `Archive` tier type
    # is set explicitly for a bucket, objects uploaded or copied to the bucket will be stored in archive storage.
    # The `storageTier` property is immutable after bucket is created.
    #
    # @return [String]
    attr_reader :storage_tier

    # Whether or not events are emitted for object state changes in this bucket. By default, `objectEventsEnabled` is
    # set to `false`. Set `objectEventsEnabled` to `true` to emit events for object state changes. For more information
    # about events, see [Overview of Events](https://docs.cloud.oracle.com/Content/Events/Concepts/eventsoverview.htm).
    #
    # @return [BOOLEAN]
    attr_accessor :object_events_enabled

    # Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of a master encryption key used to call the Key Management
    # service to generate a data encryption key or to encrypt or decrypt a data encryption key.
    #
    # @return [String]
    attr_accessor :kms_key_id

    # The entity tag (ETag) for the live object lifecycle policy on the bucket.
    # @return [String]
    attr_accessor :object_lifecycle_policy_etag

    # The approximate number of objects in the bucket. Count statistics are reported periodically. You will see a
    # lag between what is displayed and the actual object count.
    #
    # @return [Integer]
    attr_accessor :approximate_count

    # The approximate total size in bytes of all objects in the bucket. Size statistics are reported periodically. You will
    # see a lag between what is displayed and the actual size of the bucket.
    #
    # @return [Integer]
    attr_accessor :approximate_size

    # Whether or not this bucket is a replication source. By default, `replicationEnabled` is set to `false`. This will
    # be set to 'true' when you create a replication policy for the bucket.
    #
    # @return [BOOLEAN]
    attr_accessor :replication_enabled

    # Whether or not this bucket is read only. By default, `isReadOnly` is set to `false`. This will
    # be set to 'true' when this bucket is configured as a destination in a replication policy.
    #
    # @return [BOOLEAN]
    attr_accessor :is_read_only

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the bucket.
    #
    # @return [String]
    attr_accessor :id

    # The versioning status on the bucket. A bucket is created with versioning `Disabled` by default.
    # For versioning `Enabled`, objects are protected from overwrites and deletes, by maintaining their version history. When versioning is `Suspended`, the previous versions will still remain but new versions will no longer be created when overwitten or deleted.
    #
    # @return [String]
    attr_reader :versioning

    # The auto tiering status on the bucket. A bucket is created with auto tiering `Disabled` by default.
    # For auto tiering `InfrequentAccess`, objects are transitioned automatically between the 'Standard'
    # and 'InfrequentAccess' tiers based on the access pattern of the objects.
    #
    # @return [String]
    attr_reader :auto_tiering

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'namespace': :'namespace',
        'name': :'name',
        'compartment_id': :'compartmentId',
        'metadata': :'metadata',
        'created_by': :'createdBy',
        'time_created': :'timeCreated',
        'etag': :'etag',
        'public_access_type': :'publicAccessType',
        'storage_tier': :'storageTier',
        'object_events_enabled': :'objectEventsEnabled',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'kms_key_id': :'kmsKeyId',
        'object_lifecycle_policy_etag': :'objectLifecyclePolicyEtag',
        'approximate_count': :'approximateCount',
        'approximate_size': :'approximateSize',
        'replication_enabled': :'replicationEnabled',
        'is_read_only': :'isReadOnly',
        'id': :'id',
        'versioning': :'versioning',
        'auto_tiering': :'autoTiering'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'namespace': :'String',
        'name': :'String',
        'compartment_id': :'String',
        'metadata': :'Hash<String, String>',
        'created_by': :'String',
        'time_created': :'DateTime',
        'etag': :'String',
        'public_access_type': :'String',
        'storage_tier': :'String',
        'object_events_enabled': :'BOOLEAN',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'kms_key_id': :'String',
        'object_lifecycle_policy_etag': :'String',
        'approximate_count': :'Integer',
        'approximate_size': :'Integer',
        'replication_enabled': :'BOOLEAN',
        'is_read_only': :'BOOLEAN',
        'id': :'String',
        'versioning': :'String',
        'auto_tiering': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :namespace The value to assign to the {#namespace} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [Hash<String, String>] :metadata The value to assign to the {#metadata} property
    # @option attributes [String] :created_by The value to assign to the {#created_by} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [String] :etag The value to assign to the {#etag} property
    # @option attributes [String] :public_access_type The value to assign to the {#public_access_type} property
    # @option attributes [String] :storage_tier The value to assign to the {#storage_tier} property
    # @option attributes [BOOLEAN] :object_events_enabled The value to assign to the {#object_events_enabled} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :kms_key_id The value to assign to the {#kms_key_id} property
    # @option attributes [String] :object_lifecycle_policy_etag The value to assign to the {#object_lifecycle_policy_etag} property
    # @option attributes [Integer] :approximate_count The value to assign to the {#approximate_count} property
    # @option attributes [Integer] :approximate_size The value to assign to the {#approximate_size} property
    # @option attributes [BOOLEAN] :replication_enabled The value to assign to the {#replication_enabled} property
    # @option attributes [BOOLEAN] :is_read_only The value to assign to the {#is_read_only} property
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :versioning The value to assign to the {#versioning} property
    # @option attributes [String] :auto_tiering The value to assign to the {#auto_tiering} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.namespace = attributes[:'namespace'] if attributes[:'namespace']

      self.name = attributes[:'name'] if attributes[:'name']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.metadata = attributes[:'metadata'] if attributes[:'metadata']

      self.created_by = attributes[:'createdBy'] if attributes[:'createdBy']

      raise 'You cannot provide both :createdBy and :created_by' if attributes.key?(:'createdBy') && attributes.key?(:'created_by')

      self.created_by = attributes[:'created_by'] if attributes[:'created_by']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.etag = attributes[:'etag'] if attributes[:'etag']

      self.public_access_type = attributes[:'publicAccessType'] if attributes[:'publicAccessType']

      raise 'You cannot provide both :publicAccessType and :public_access_type' if attributes.key?(:'publicAccessType') && attributes.key?(:'public_access_type')

      self.public_access_type = attributes[:'public_access_type'] if attributes[:'public_access_type']

      self.storage_tier = attributes[:'storageTier'] if attributes[:'storageTier']

      raise 'You cannot provide both :storageTier and :storage_tier' if attributes.key?(:'storageTier') && attributes.key?(:'storage_tier')

      self.storage_tier = attributes[:'storage_tier'] if attributes[:'storage_tier']

      self.object_events_enabled = attributes[:'objectEventsEnabled'] unless attributes[:'objectEventsEnabled'].nil?

      raise 'You cannot provide both :objectEventsEnabled and :object_events_enabled' if attributes.key?(:'objectEventsEnabled') && attributes.key?(:'object_events_enabled')

      self.object_events_enabled = attributes[:'object_events_enabled'] unless attributes[:'object_events_enabled'].nil?

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.kms_key_id = attributes[:'kmsKeyId'] if attributes[:'kmsKeyId']

      raise 'You cannot provide both :kmsKeyId and :kms_key_id' if attributes.key?(:'kmsKeyId') && attributes.key?(:'kms_key_id')

      self.kms_key_id = attributes[:'kms_key_id'] if attributes[:'kms_key_id']

      self.object_lifecycle_policy_etag = attributes[:'objectLifecyclePolicyEtag'] if attributes[:'objectLifecyclePolicyEtag']

      raise 'You cannot provide both :objectLifecyclePolicyEtag and :object_lifecycle_policy_etag' if attributes.key?(:'objectLifecyclePolicyEtag') && attributes.key?(:'object_lifecycle_policy_etag')

      self.object_lifecycle_policy_etag = attributes[:'object_lifecycle_policy_etag'] if attributes[:'object_lifecycle_policy_etag']

      self.approximate_count = attributes[:'approximateCount'] if attributes[:'approximateCount']

      raise 'You cannot provide both :approximateCount and :approximate_count' if attributes.key?(:'approximateCount') && attributes.key?(:'approximate_count')

      self.approximate_count = attributes[:'approximate_count'] if attributes[:'approximate_count']

      self.approximate_size = attributes[:'approximateSize'] if attributes[:'approximateSize']

      raise 'You cannot provide both :approximateSize and :approximate_size' if attributes.key?(:'approximateSize') && attributes.key?(:'approximate_size')

      self.approximate_size = attributes[:'approximate_size'] if attributes[:'approximate_size']

      self.replication_enabled = attributes[:'replicationEnabled'] unless attributes[:'replicationEnabled'].nil?

      raise 'You cannot provide both :replicationEnabled and :replication_enabled' if attributes.key?(:'replicationEnabled') && attributes.key?(:'replication_enabled')

      self.replication_enabled = attributes[:'replication_enabled'] unless attributes[:'replication_enabled'].nil?

      self.is_read_only = attributes[:'isReadOnly'] unless attributes[:'isReadOnly'].nil?

      raise 'You cannot provide both :isReadOnly and :is_read_only' if attributes.key?(:'isReadOnly') && attributes.key?(:'is_read_only')

      self.is_read_only = attributes[:'is_read_only'] unless attributes[:'is_read_only'].nil?

      self.id = attributes[:'id'] if attributes[:'id']

      self.versioning = attributes[:'versioning'] if attributes[:'versioning']

      self.auto_tiering = attributes[:'autoTiering'] if attributes[:'autoTiering']

      raise 'You cannot provide both :autoTiering and :auto_tiering' if attributes.key?(:'autoTiering') && attributes.key?(:'auto_tiering')

      self.auto_tiering = attributes[:'auto_tiering'] if attributes[:'auto_tiering']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] public_access_type Object to be assigned
    def public_access_type=(public_access_type)
      # rubocop:disable Style/ConditionalAssignment
      if public_access_type && !PUBLIC_ACCESS_TYPE_ENUM.include?(public_access_type)
        OCI.logger.debug("Unknown value for 'public_access_type' [" + public_access_type + "]. Mapping to 'PUBLIC_ACCESS_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @public_access_type = PUBLIC_ACCESS_TYPE_UNKNOWN_ENUM_VALUE
      else
        @public_access_type = public_access_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] storage_tier Object to be assigned
    def storage_tier=(storage_tier)
      # rubocop:disable Style/ConditionalAssignment
      if storage_tier && !STORAGE_TIER_ENUM.include?(storage_tier)
        OCI.logger.debug("Unknown value for 'storage_tier' [" + storage_tier + "]. Mapping to 'STORAGE_TIER_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @storage_tier = STORAGE_TIER_UNKNOWN_ENUM_VALUE
      else
        @storage_tier = storage_tier
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] versioning Object to be assigned
    def versioning=(versioning)
      # rubocop:disable Style/ConditionalAssignment
      if versioning && !VERSIONING_ENUM.include?(versioning)
        OCI.logger.debug("Unknown value for 'versioning' [" + versioning + "]. Mapping to 'VERSIONING_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @versioning = VERSIONING_UNKNOWN_ENUM_VALUE
      else
        @versioning = versioning
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] auto_tiering Object to be assigned
    def auto_tiering=(auto_tiering)
      # rubocop:disable Style/ConditionalAssignment
      if auto_tiering && !AUTO_TIERING_ENUM.include?(auto_tiering)
        OCI.logger.debug("Unknown value for 'auto_tiering' [" + auto_tiering + "]. Mapping to 'AUTO_TIERING_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @auto_tiering = AUTO_TIERING_UNKNOWN_ENUM_VALUE
      else
        @auto_tiering = auto_tiering
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        namespace == other.namespace &&
        name == other.name &&
        compartment_id == other.compartment_id &&
        metadata == other.metadata &&
        created_by == other.created_by &&
        time_created == other.time_created &&
        etag == other.etag &&
        public_access_type == other.public_access_type &&
        storage_tier == other.storage_tier &&
        object_events_enabled == other.object_events_enabled &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        kms_key_id == other.kms_key_id &&
        object_lifecycle_policy_etag == other.object_lifecycle_policy_etag &&
        approximate_count == other.approximate_count &&
        approximate_size == other.approximate_size &&
        replication_enabled == other.replication_enabled &&
        is_read_only == other.is_read_only &&
        id == other.id &&
        versioning == other.versioning &&
        auto_tiering == other.auto_tiering
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
      [namespace, name, compartment_id, metadata, created_by, time_created, etag, public_access_type, storage_tier, object_events_enabled, freeform_tags, defined_tags, kms_key_id, object_lifecycle_policy_etag, approximate_count, approximate_size, replication_enabled, is_read_only, id, versioning, auto_tiering].hash
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
