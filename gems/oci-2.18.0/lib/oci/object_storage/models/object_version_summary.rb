# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # To use any of the API operations, you must be authorized in an IAM policy. If you are not authorized,
  # talk to an administrator. If you are an administrator who needs to write policies to give users access, see
  # [Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).
  #
  class ObjectStorage::Models::ObjectVersionSummary
    STORAGE_TIER_ENUM = [
      STORAGE_TIER_STANDARD = 'Standard'.freeze,
      STORAGE_TIER_INFREQUENT_ACCESS = 'InfrequentAccess'.freeze,
      STORAGE_TIER_ARCHIVE = 'Archive'.freeze,
      STORAGE_TIER_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    ARCHIVAL_STATE_ENUM = [
      ARCHIVAL_STATE_ARCHIVED = 'Archived'.freeze,
      ARCHIVAL_STATE_RESTORING = 'Restoring'.freeze,
      ARCHIVAL_STATE_RESTORED = 'Restored'.freeze,
      ARCHIVAL_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The name of the object. Avoid entering confidential information.
    # Example: test/object1.log
    #
    # @return [String]
    attr_accessor :name

    # Size of the object in bytes.
    # @return [Integer]
    attr_accessor :size

    # Base64-encoded MD5 hash of the object data.
    # @return [String]
    attr_accessor :md5

    # The date and time the object was created, as described in [RFC 2616](https://tools.ietf.org/html/rfc2616#section-14.29).
    # @return [DateTime]
    attr_accessor :time_created

    # **[Required]** The date and time the object was modified, as described in [RFC 2616](https://tools.ietf.org/rfc/rfc2616#section-14.29).
    # @return [DateTime]
    attr_accessor :time_modified

    # The current entity tag (ETag) for the object.
    # @return [String]
    attr_accessor :etag

    # The storage tier that the object is stored in.
    # @return [String]
    attr_reader :storage_tier

    # Archival state of an object. This field is set only for objects in Archive tier.
    # @return [String]
    attr_reader :archival_state

    # **[Required]** VersionId of the object.
    # @return [String]
    attr_accessor :version_id

    # **[Required]** This flag will indicate if the version is deleted or not.
    # @return [BOOLEAN]
    attr_accessor :is_delete_marker

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'size': :'size',
        'md5': :'md5',
        'time_created': :'timeCreated',
        'time_modified': :'timeModified',
        'etag': :'etag',
        'storage_tier': :'storageTier',
        'archival_state': :'archivalState',
        'version_id': :'versionId',
        'is_delete_marker': :'isDeleteMarker'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'size': :'Integer',
        'md5': :'String',
        'time_created': :'DateTime',
        'time_modified': :'DateTime',
        'etag': :'String',
        'storage_tier': :'String',
        'archival_state': :'String',
        'version_id': :'String',
        'is_delete_marker': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [Integer] :size The value to assign to the {#size} property
    # @option attributes [String] :md5 The value to assign to the {#md5} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_modified The value to assign to the {#time_modified} property
    # @option attributes [String] :etag The value to assign to the {#etag} property
    # @option attributes [String] :storage_tier The value to assign to the {#storage_tier} property
    # @option attributes [String] :archival_state The value to assign to the {#archival_state} property
    # @option attributes [String] :version_id The value to assign to the {#version_id} property
    # @option attributes [BOOLEAN] :is_delete_marker The value to assign to the {#is_delete_marker} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.size = attributes[:'size'] if attributes[:'size']

      self.md5 = attributes[:'md5'] if attributes[:'md5']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_modified = attributes[:'timeModified'] if attributes[:'timeModified']

      raise 'You cannot provide both :timeModified and :time_modified' if attributes.key?(:'timeModified') && attributes.key?(:'time_modified')

      self.time_modified = attributes[:'time_modified'] if attributes[:'time_modified']

      self.etag = attributes[:'etag'] if attributes[:'etag']

      self.storage_tier = attributes[:'storageTier'] if attributes[:'storageTier']

      raise 'You cannot provide both :storageTier and :storage_tier' if attributes.key?(:'storageTier') && attributes.key?(:'storage_tier')

      self.storage_tier = attributes[:'storage_tier'] if attributes[:'storage_tier']

      self.archival_state = attributes[:'archivalState'] if attributes[:'archivalState']

      raise 'You cannot provide both :archivalState and :archival_state' if attributes.key?(:'archivalState') && attributes.key?(:'archival_state')

      self.archival_state = attributes[:'archival_state'] if attributes[:'archival_state']

      self.version_id = attributes[:'versionId'] if attributes[:'versionId']

      raise 'You cannot provide both :versionId and :version_id' if attributes.key?(:'versionId') && attributes.key?(:'version_id')

      self.version_id = attributes[:'version_id'] if attributes[:'version_id']

      self.is_delete_marker = attributes[:'isDeleteMarker'] unless attributes[:'isDeleteMarker'].nil?

      raise 'You cannot provide both :isDeleteMarker and :is_delete_marker' if attributes.key?(:'isDeleteMarker') && attributes.key?(:'is_delete_marker')

      self.is_delete_marker = attributes[:'is_delete_marker'] unless attributes[:'is_delete_marker'].nil?
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

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
    # @param [Object] archival_state Object to be assigned
    def archival_state=(archival_state)
      # rubocop:disable Style/ConditionalAssignment
      if archival_state && !ARCHIVAL_STATE_ENUM.include?(archival_state)
        OCI.logger.debug("Unknown value for 'archival_state' [" + archival_state + "]. Mapping to 'ARCHIVAL_STATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @archival_state = ARCHIVAL_STATE_UNKNOWN_ENUM_VALUE
      else
        @archival_state = archival_state
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        name == other.name &&
        size == other.size &&
        md5 == other.md5 &&
        time_created == other.time_created &&
        time_modified == other.time_modified &&
        etag == other.etag &&
        storage_tier == other.storage_tier &&
        archival_state == other.archival_state &&
        version_id == other.version_id &&
        is_delete_marker == other.is_delete_marker
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
      [name, size, md5, time_created, time_modified, etag, storage_tier, archival_state, version_id, is_delete_marker].hash
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
