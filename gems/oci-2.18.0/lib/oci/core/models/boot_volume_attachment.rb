# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Represents an attachment between a boot volume and an instance.
  #
  # **Warning:** Oracle recommends that you avoid using any confidential information when you
  # supply string values using the API.
  #
  class Core::Models::BootVolumeAttachment
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_ATTACHING = 'ATTACHING'.freeze,
      LIFECYCLE_STATE_ATTACHED = 'ATTACHED'.freeze,
      LIFECYCLE_STATE_DETACHING = 'DETACHING'.freeze,
      LIFECYCLE_STATE_DETACHED = 'DETACHED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    ENCRYPTION_IN_TRANSIT_TYPE_ENUM = [
      ENCRYPTION_IN_TRANSIT_TYPE_NONE = 'NONE'.freeze,
      ENCRYPTION_IN_TRANSIT_TYPE_BM_ENCRYPTION_IN_TRANSIT = 'BM_ENCRYPTION_IN_TRANSIT'.freeze,
      ENCRYPTION_IN_TRANSIT_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The availability domain of an instance.
    #
    # Example: `Uocm:PHX-AD-1`
    #
    # @return [String]
    attr_accessor :availability_domain

    # **[Required]** The OCID of the boot volume.
    # @return [String]
    attr_accessor :boot_volume_id

    # **[Required]** The OCID of the compartment.
    # @return [String]
    attr_accessor :compartment_id

    # A user-friendly name. Does not have to be unique, and it's changeable.
    # Avoid entering confidential information.
    #
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The OCID of the boot volume attachment.
    # @return [String]
    attr_accessor :id

    # **[Required]** The OCID of the instance the boot volume is attached to.
    # @return [String]
    attr_accessor :instance_id

    # **[Required]** The current state of the boot volume attachment.
    # @return [String]
    attr_reader :lifecycle_state

    # **[Required]** The date and time the boot volume was created, in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    #
    # Example: `2016-08-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # Whether in-transit encryption for the boot volume's paravirtualized attachment is enabled or not.
    #
    # @return [BOOLEAN]
    attr_accessor :is_pv_encryption_in_transit_enabled

    # Refer the top-level definition of encryptionInTransitType.
    # The default value is NONE.
    #
    # @return [String]
    attr_reader :encryption_in_transit_type

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'availability_domain': :'availabilityDomain',
        'boot_volume_id': :'bootVolumeId',
        'compartment_id': :'compartmentId',
        'display_name': :'displayName',
        'id': :'id',
        'instance_id': :'instanceId',
        'lifecycle_state': :'lifecycleState',
        'time_created': :'timeCreated',
        'is_pv_encryption_in_transit_enabled': :'isPvEncryptionInTransitEnabled',
        'encryption_in_transit_type': :'encryptionInTransitType'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'availability_domain': :'String',
        'boot_volume_id': :'String',
        'compartment_id': :'String',
        'display_name': :'String',
        'id': :'String',
        'instance_id': :'String',
        'lifecycle_state': :'String',
        'time_created': :'DateTime',
        'is_pv_encryption_in_transit_enabled': :'BOOLEAN',
        'encryption_in_transit_type': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :availability_domain The value to assign to the {#availability_domain} property
    # @option attributes [String] :boot_volume_id The value to assign to the {#boot_volume_id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :instance_id The value to assign to the {#instance_id} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [BOOLEAN] :is_pv_encryption_in_transit_enabled The value to assign to the {#is_pv_encryption_in_transit_enabled} property
    # @option attributes [String] :encryption_in_transit_type The value to assign to the {#encryption_in_transit_type} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.availability_domain = attributes[:'availabilityDomain'] if attributes[:'availabilityDomain']

      raise 'You cannot provide both :availabilityDomain and :availability_domain' if attributes.key?(:'availabilityDomain') && attributes.key?(:'availability_domain')

      self.availability_domain = attributes[:'availability_domain'] if attributes[:'availability_domain']

      self.boot_volume_id = attributes[:'bootVolumeId'] if attributes[:'bootVolumeId']

      raise 'You cannot provide both :bootVolumeId and :boot_volume_id' if attributes.key?(:'bootVolumeId') && attributes.key?(:'boot_volume_id')

      self.boot_volume_id = attributes[:'boot_volume_id'] if attributes[:'boot_volume_id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.id = attributes[:'id'] if attributes[:'id']

      self.instance_id = attributes[:'instanceId'] if attributes[:'instanceId']

      raise 'You cannot provide both :instanceId and :instance_id' if attributes.key?(:'instanceId') && attributes.key?(:'instance_id')

      self.instance_id = attributes[:'instance_id'] if attributes[:'instance_id']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.is_pv_encryption_in_transit_enabled = attributes[:'isPvEncryptionInTransitEnabled'] unless attributes[:'isPvEncryptionInTransitEnabled'].nil?

      raise 'You cannot provide both :isPvEncryptionInTransitEnabled and :is_pv_encryption_in_transit_enabled' if attributes.key?(:'isPvEncryptionInTransitEnabled') && attributes.key?(:'is_pv_encryption_in_transit_enabled')

      self.is_pv_encryption_in_transit_enabled = attributes[:'is_pv_encryption_in_transit_enabled'] unless attributes[:'is_pv_encryption_in_transit_enabled'].nil?

      self.encryption_in_transit_type = attributes[:'encryptionInTransitType'] if attributes[:'encryptionInTransitType']
      self.encryption_in_transit_type = "NONE" if encryption_in_transit_type.nil? && !attributes.key?(:'encryptionInTransitType') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :encryptionInTransitType and :encryption_in_transit_type' if attributes.key?(:'encryptionInTransitType') && attributes.key?(:'encryption_in_transit_type')

      self.encryption_in_transit_type = attributes[:'encryption_in_transit_type'] if attributes[:'encryption_in_transit_type']
      self.encryption_in_transit_type = "NONE" if encryption_in_transit_type.nil? && !attributes.key?(:'encryptionInTransitType') && !attributes.key?(:'encryption_in_transit_type') # rubocop:disable Style/StringLiterals
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
    # @param [Object] encryption_in_transit_type Object to be assigned
    def encryption_in_transit_type=(encryption_in_transit_type)
      # rubocop:disable Style/ConditionalAssignment
      if encryption_in_transit_type && !ENCRYPTION_IN_TRANSIT_TYPE_ENUM.include?(encryption_in_transit_type)
        OCI.logger.debug("Unknown value for 'encryption_in_transit_type' [" + encryption_in_transit_type + "]. Mapping to 'ENCRYPTION_IN_TRANSIT_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @encryption_in_transit_type = ENCRYPTION_IN_TRANSIT_TYPE_UNKNOWN_ENUM_VALUE
      else
        @encryption_in_transit_type = encryption_in_transit_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        availability_domain == other.availability_domain &&
        boot_volume_id == other.boot_volume_id &&
        compartment_id == other.compartment_id &&
        display_name == other.display_name &&
        id == other.id &&
        instance_id == other.instance_id &&
        lifecycle_state == other.lifecycle_state &&
        time_created == other.time_created &&
        is_pv_encryption_in_transit_enabled == other.is_pv_encryption_in_transit_enabled &&
        encryption_in_transit_type == other.encryption_in_transit_type
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
      [availability_domain, boot_volume_id, compartment_id, display_name, id, instance_id, lifecycle_state, time_created, is_pv_encryption_in_transit_enabled, encryption_in_transit_type].hash
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