# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Multipart uploads provide efficient and resilient uploads, especially for large objects. Multipart uploads also accommodate
  # objects that are too large for a single upload operation. With multipart uploads, individual parts of an object can be
  # uploaded in parallel to reduce the amount of time you spend uploading. Multipart uploads can also minimize the impact
  # of network failures by letting you retry a failed part upload instead of requiring you to retry an entire object upload.
  # See [Using Multipart Uploads](https://docs.cloud.oracle.com/Content/Object/Tasks/usingmultipartuploads.htm).
  #
  # To use any of the API operations, you must be authorized in an IAM policy. If you are not authorized,
  # talk to an administrator. If you are an administrator who needs to write policies to give users access, see
  # [Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).
  #
  class ObjectStorage::Models::MultipartUpload
    STORAGE_TIER_ENUM = [
      STORAGE_TIER_STANDARD = 'Standard'.freeze,
      STORAGE_TIER_INFREQUENT_ACCESS = 'InfrequentAccess'.freeze,
      STORAGE_TIER_ARCHIVE = 'Archive'.freeze,
      STORAGE_TIER_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The Object Storage namespace in which the in-progress multipart upload is stored.
    # @return [String]
    attr_accessor :namespace

    # **[Required]** The bucket in which the in-progress multipart upload is stored.
    # @return [String]
    attr_accessor :bucket

    # **[Required]** The object name of the in-progress multipart upload.
    # @return [String]
    attr_accessor :object

    # **[Required]** The unique identifier for the in-progress multipart upload.
    # @return [String]
    attr_accessor :upload_id

    # **[Required]** The date and time the upload was created, as described in [RFC 2616](https://tools.ietf.org/html/rfc2616#section-14.29).
    # @return [DateTime]
    attr_accessor :time_created

    # The storage tier that the object is stored in.
    # @return [String]
    attr_reader :storage_tier

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'namespace': :'namespace',
        'bucket': :'bucket',
        'object': :'object',
        'upload_id': :'uploadId',
        'time_created': :'timeCreated',
        'storage_tier': :'storageTier'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'namespace': :'String',
        'bucket': :'String',
        'object': :'String',
        'upload_id': :'String',
        'time_created': :'DateTime',
        'storage_tier': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :namespace The value to assign to the {#namespace} property
    # @option attributes [String] :bucket The value to assign to the {#bucket} property
    # @option attributes [String] :object The value to assign to the {#object} property
    # @option attributes [String] :upload_id The value to assign to the {#upload_id} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [String] :storage_tier The value to assign to the {#storage_tier} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.namespace = attributes[:'namespace'] if attributes[:'namespace']

      self.bucket = attributes[:'bucket'] if attributes[:'bucket']

      self.object = attributes[:'object'] if attributes[:'object']

      self.upload_id = attributes[:'uploadId'] if attributes[:'uploadId']

      raise 'You cannot provide both :uploadId and :upload_id' if attributes.key?(:'uploadId') && attributes.key?(:'upload_id')

      self.upload_id = attributes[:'upload_id'] if attributes[:'upload_id']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.storage_tier = attributes[:'storageTier'] if attributes[:'storageTier']

      raise 'You cannot provide both :storageTier and :storage_tier' if attributes.key?(:'storageTier') && attributes.key?(:'storage_tier')

      self.storage_tier = attributes[:'storage_tier'] if attributes[:'storage_tier']
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

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        namespace == other.namespace &&
        bucket == other.bucket &&
        object == other.object &&
        upload_id == other.upload_id &&
        time_created == other.time_created &&
        storage_tier == other.storage_tier
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
      [namespace, bucket, object, upload_id, time_created, storage_tier].hash
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
