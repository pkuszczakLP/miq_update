# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # CreateBootVolumeDetails model.
  class Core::Models::CreateBootVolumeDetails
    # The availability domain of the volume. Omissible for cloning a volume. The new volume will be created in the availability domain of the source volume.
    #
    # Example: `Uocm:PHX-AD-1`
    #
    # @return [String]
    attr_accessor :availability_domain

    # If provided, specifies the ID of the boot volume backup policy to assign to the newly
    # created boot volume. If omitted, no policy will be assigned.
    #
    # @return [String]
    attr_accessor :backup_policy_id

    # **[Required]** The OCID of the compartment that contains the boot volume.
    # @return [String]
    attr_accessor :compartment_id

    # Defined tags for this resource. Each key is predefined and scoped to a
    # namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # A user-friendly name. Does not have to be unique, and it's changeable.
    # Avoid entering confidential information.
    #
    # @return [String]
    attr_accessor :display_name

    # Free-form tags for this resource. Each tag is a simple key-value pair with no
    # predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # The OCID of the Key Management key to assign as the master encryption key
    # for the boot volume.
    #
    # @return [String]
    attr_accessor :kms_key_id

    # The size of the volume in GBs.
    # @return [Integer]
    attr_accessor :size_in_gbs

    # The number of volume performance units (VPUs) that will be applied to this volume per GB,
    # representing the Block Volume service's elastic performance options.
    # See [Block Volume Performance Levels](https://docs.cloud.oracle.com/iaas/Content/Block/Concepts/blockvolumeperformance.htm#perf_levels) for more information.
    #
    # Allowed values:
    #
    #   * `10`: Represents Balanced option.
    #
    #   * `20`: Represents Higher Performance option.
    #
    #   * `30`-`120`: Represents the Ultra High Performance option.
    #
    # @return [Integer]
    attr_accessor :vpus_per_gb

    # This attribute is required.
    # @return [OCI::Core::Models::BootVolumeSourceDetails]
    attr_accessor :source_details

    # Specifies whether the auto-tune performance is enabled for this boot volume.
    #
    # @return [BOOLEAN]
    attr_accessor :is_auto_tune_enabled

    # The list of boot volume replicas to be enabled for this boot volume
    # in the specified destination availability domains.
    #
    # @return [Array<OCI::Core::Models::BootVolumeReplicaDetails>]
    attr_accessor :boot_volume_replicas

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'availability_domain': :'availabilityDomain',
        'backup_policy_id': :'backupPolicyId',
        'compartment_id': :'compartmentId',
        'defined_tags': :'definedTags',
        'display_name': :'displayName',
        'freeform_tags': :'freeformTags',
        'kms_key_id': :'kmsKeyId',
        'size_in_gbs': :'sizeInGBs',
        'vpus_per_gb': :'vpusPerGB',
        'source_details': :'sourceDetails',
        'is_auto_tune_enabled': :'isAutoTuneEnabled',
        'boot_volume_replicas': :'bootVolumeReplicas'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'availability_domain': :'String',
        'backup_policy_id': :'String',
        'compartment_id': :'String',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'display_name': :'String',
        'freeform_tags': :'Hash<String, String>',
        'kms_key_id': :'String',
        'size_in_gbs': :'Integer',
        'vpus_per_gb': :'Integer',
        'source_details': :'OCI::Core::Models::BootVolumeSourceDetails',
        'is_auto_tune_enabled': :'BOOLEAN',
        'boot_volume_replicas': :'Array<OCI::Core::Models::BootVolumeReplicaDetails>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :availability_domain The value to assign to the {#availability_domain} property
    # @option attributes [String] :backup_policy_id The value to assign to the {#backup_policy_id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [String] :kms_key_id The value to assign to the {#kms_key_id} property
    # @option attributes [Integer] :size_in_gbs The value to assign to the {#size_in_gbs} property
    # @option attributes [Integer] :vpus_per_gb The value to assign to the {#vpus_per_gb} property
    # @option attributes [OCI::Core::Models::BootVolumeSourceDetails] :source_details The value to assign to the {#source_details} property
    # @option attributes [BOOLEAN] :is_auto_tune_enabled The value to assign to the {#is_auto_tune_enabled} property
    # @option attributes [Array<OCI::Core::Models::BootVolumeReplicaDetails>] :boot_volume_replicas The value to assign to the {#boot_volume_replicas} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.availability_domain = attributes[:'availabilityDomain'] if attributes[:'availabilityDomain']

      raise 'You cannot provide both :availabilityDomain and :availability_domain' if attributes.key?(:'availabilityDomain') && attributes.key?(:'availability_domain')

      self.availability_domain = attributes[:'availability_domain'] if attributes[:'availability_domain']

      self.backup_policy_id = attributes[:'backupPolicyId'] if attributes[:'backupPolicyId']

      raise 'You cannot provide both :backupPolicyId and :backup_policy_id' if attributes.key?(:'backupPolicyId') && attributes.key?(:'backup_policy_id')

      self.backup_policy_id = attributes[:'backup_policy_id'] if attributes[:'backup_policy_id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.kms_key_id = attributes[:'kmsKeyId'] if attributes[:'kmsKeyId']

      raise 'You cannot provide both :kmsKeyId and :kms_key_id' if attributes.key?(:'kmsKeyId') && attributes.key?(:'kms_key_id')

      self.kms_key_id = attributes[:'kms_key_id'] if attributes[:'kms_key_id']

      self.size_in_gbs = attributes[:'sizeInGBs'] if attributes[:'sizeInGBs']

      raise 'You cannot provide both :sizeInGBs and :size_in_gbs' if attributes.key?(:'sizeInGBs') && attributes.key?(:'size_in_gbs')

      self.size_in_gbs = attributes[:'size_in_gbs'] if attributes[:'size_in_gbs']

      self.vpus_per_gb = attributes[:'vpusPerGB'] if attributes[:'vpusPerGB']

      raise 'You cannot provide both :vpusPerGB and :vpus_per_gb' if attributes.key?(:'vpusPerGB') && attributes.key?(:'vpus_per_gb')

      self.vpus_per_gb = attributes[:'vpus_per_gb'] if attributes[:'vpus_per_gb']

      self.source_details = attributes[:'sourceDetails'] if attributes[:'sourceDetails']

      raise 'You cannot provide both :sourceDetails and :source_details' if attributes.key?(:'sourceDetails') && attributes.key?(:'source_details')

      self.source_details = attributes[:'source_details'] if attributes[:'source_details']

      self.is_auto_tune_enabled = attributes[:'isAutoTuneEnabled'] unless attributes[:'isAutoTuneEnabled'].nil?

      raise 'You cannot provide both :isAutoTuneEnabled and :is_auto_tune_enabled' if attributes.key?(:'isAutoTuneEnabled') && attributes.key?(:'is_auto_tune_enabled')

      self.is_auto_tune_enabled = attributes[:'is_auto_tune_enabled'] unless attributes[:'is_auto_tune_enabled'].nil?

      self.boot_volume_replicas = attributes[:'bootVolumeReplicas'] if attributes[:'bootVolumeReplicas']

      raise 'You cannot provide both :bootVolumeReplicas and :boot_volume_replicas' if attributes.key?(:'bootVolumeReplicas') && attributes.key?(:'boot_volume_replicas')

      self.boot_volume_replicas = attributes[:'boot_volume_replicas'] if attributes[:'boot_volume_replicas']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        availability_domain == other.availability_domain &&
        backup_policy_id == other.backup_policy_id &&
        compartment_id == other.compartment_id &&
        defined_tags == other.defined_tags &&
        display_name == other.display_name &&
        freeform_tags == other.freeform_tags &&
        kms_key_id == other.kms_key_id &&
        size_in_gbs == other.size_in_gbs &&
        vpus_per_gb == other.vpus_per_gb &&
        source_details == other.source_details &&
        is_auto_tune_enabled == other.is_auto_tune_enabled &&
        boot_volume_replicas == other.boot_volume_replicas
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
      [availability_domain, backup_policy_id, compartment_id, defined_tags, display_name, freeform_tags, kms_key_id, size_in_gbs, vpus_per_gb, source_details, is_auto_tune_enabled, boot_volume_replicas].hash
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