# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The summary of a replication policy.
  class ObjectStorage::Models::ReplicationPolicySummary
    STATUS_ENUM = [
      STATUS_ACTIVE = 'ACTIVE'.freeze,
      STATUS_CLIENT_ERROR = 'CLIENT_ERROR'.freeze,
      STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The id of the replication policy.
    # @return [String]
    attr_accessor :id

    # **[Required]** The name of the policy.
    # @return [String]
    attr_accessor :name

    # **[Required]** The destination region to replicate to, for example \"us-ashburn-1\".
    # @return [String]
    attr_accessor :destination_region_name

    # **[Required]** The bucket to replicate to in the destination region. Replication policy creation does not automatically
    # create a destination bucket. Create the destination bucket before creating the policy.
    #
    # @return [String]
    attr_accessor :destination_bucket_name

    # **[Required]** The date when the replication policy was created as per [RFC 3339](https://tools.ietf.org/html/rfc3339).
    #
    # @return [DateTime]
    attr_accessor :time_created

    # **[Required]** Changes made to the source bucket before this time has been replicated.
    #
    # @return [DateTime]
    attr_accessor :time_last_sync

    # **[Required]** The replication status of the policy. If the status is CLIENT_ERROR, once the user fixes the issue
    # described in the status message, the status will become ACTIVE.
    #
    # @return [String]
    attr_reader :status

    # **[Required]** A human-readable description of the status.
    # @return [String]
    attr_accessor :status_message

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'name': :'name',
        'destination_region_name': :'destinationRegionName',
        'destination_bucket_name': :'destinationBucketName',
        'time_created': :'timeCreated',
        'time_last_sync': :'timeLastSync',
        'status': :'status',
        'status_message': :'statusMessage'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'name': :'String',
        'destination_region_name': :'String',
        'destination_bucket_name': :'String',
        'time_created': :'DateTime',
        'time_last_sync': :'DateTime',
        'status': :'String',
        'status_message': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :destination_region_name The value to assign to the {#destination_region_name} property
    # @option attributes [String] :destination_bucket_name The value to assign to the {#destination_bucket_name} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_last_sync The value to assign to the {#time_last_sync} property
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [String] :status_message The value to assign to the {#status_message} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.name = attributes[:'name'] if attributes[:'name']

      self.destination_region_name = attributes[:'destinationRegionName'] if attributes[:'destinationRegionName']

      raise 'You cannot provide both :destinationRegionName and :destination_region_name' if attributes.key?(:'destinationRegionName') && attributes.key?(:'destination_region_name')

      self.destination_region_name = attributes[:'destination_region_name'] if attributes[:'destination_region_name']

      self.destination_bucket_name = attributes[:'destinationBucketName'] if attributes[:'destinationBucketName']

      raise 'You cannot provide both :destinationBucketName and :destination_bucket_name' if attributes.key?(:'destinationBucketName') && attributes.key?(:'destination_bucket_name')

      self.destination_bucket_name = attributes[:'destination_bucket_name'] if attributes[:'destination_bucket_name']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_last_sync = attributes[:'timeLastSync'] if attributes[:'timeLastSync']

      raise 'You cannot provide both :timeLastSync and :time_last_sync' if attributes.key?(:'timeLastSync') && attributes.key?(:'time_last_sync')

      self.time_last_sync = attributes[:'time_last_sync'] if attributes[:'time_last_sync']

      self.status = attributes[:'status'] if attributes[:'status']

      self.status_message = attributes[:'statusMessage'] if attributes[:'statusMessage']

      raise 'You cannot provide both :statusMessage and :status_message' if attributes.key?(:'statusMessage') && attributes.key?(:'status_message')

      self.status_message = attributes[:'status_message'] if attributes[:'status_message']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] status Object to be assigned
    def status=(status)
      # rubocop:disable Style/ConditionalAssignment
      if status && !STATUS_ENUM.include?(status)
        OCI.logger.debug("Unknown value for 'status' [" + status + "]. Mapping to 'STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @status = STATUS_UNKNOWN_ENUM_VALUE
      else
        @status = status
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
        name == other.name &&
        destination_region_name == other.destination_region_name &&
        destination_bucket_name == other.destination_bucket_name &&
        time_created == other.time_created &&
        time_last_sync == other.time_last_sync &&
        status == other.status &&
        status_message == other.status_message
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
      [id, name, destination_region_name, destination_bucket_name, time_created, time_last_sync, status, status_message].hash
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
