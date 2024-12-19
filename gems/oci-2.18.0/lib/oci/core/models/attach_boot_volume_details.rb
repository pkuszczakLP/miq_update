# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # AttachBootVolumeDetails model.
  class Core::Models::AttachBootVolumeDetails
    ENCRYPTION_IN_TRANSIT_TYPE_ENUM = [
      ENCRYPTION_IN_TRANSIT_TYPE_NONE = 'NONE'.freeze,
      ENCRYPTION_IN_TRANSIT_TYPE_BM_ENCRYPTION_IN_TRANSIT = 'BM_ENCRYPTION_IN_TRANSIT'.freeze
    ].freeze

    # **[Required]** The OCID of the  boot volume.
    # @return [String]
    attr_accessor :boot_volume_id

    # A user-friendly name. Does not have to be unique, and it's changeable.
    # Avoid entering confidential information.
    #
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The OCID of the instance.
    # @return [String]
    attr_accessor :instance_id

    # Refer the top-level definition of encryptionInTransitType.
    # The default value is NONE.
    #
    # @return [String]
    attr_reader :encryption_in_transit_type

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'boot_volume_id': :'bootVolumeId',
        'display_name': :'displayName',
        'instance_id': :'instanceId',
        'encryption_in_transit_type': :'encryptionInTransitType'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'boot_volume_id': :'String',
        'display_name': :'String',
        'instance_id': :'String',
        'encryption_in_transit_type': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :boot_volume_id The value to assign to the {#boot_volume_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :instance_id The value to assign to the {#instance_id} property
    # @option attributes [String] :encryption_in_transit_type The value to assign to the {#encryption_in_transit_type} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.boot_volume_id = attributes[:'bootVolumeId'] if attributes[:'bootVolumeId']

      raise 'You cannot provide both :bootVolumeId and :boot_volume_id' if attributes.key?(:'bootVolumeId') && attributes.key?(:'boot_volume_id')

      self.boot_volume_id = attributes[:'boot_volume_id'] if attributes[:'boot_volume_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.instance_id = attributes[:'instanceId'] if attributes[:'instanceId']

      raise 'You cannot provide both :instanceId and :instance_id' if attributes.key?(:'instanceId') && attributes.key?(:'instance_id')

      self.instance_id = attributes[:'instance_id'] if attributes[:'instance_id']

      self.encryption_in_transit_type = attributes[:'encryptionInTransitType'] if attributes[:'encryptionInTransitType']
      self.encryption_in_transit_type = "NONE" if encryption_in_transit_type.nil? && !attributes.key?(:'encryptionInTransitType') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :encryptionInTransitType and :encryption_in_transit_type' if attributes.key?(:'encryptionInTransitType') && attributes.key?(:'encryption_in_transit_type')

      self.encryption_in_transit_type = attributes[:'encryption_in_transit_type'] if attributes[:'encryption_in_transit_type']
      self.encryption_in_transit_type = "NONE" if encryption_in_transit_type.nil? && !attributes.key?(:'encryptionInTransitType') && !attributes.key?(:'encryption_in_transit_type') # rubocop:disable Style/StringLiterals
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] encryption_in_transit_type Object to be assigned
    def encryption_in_transit_type=(encryption_in_transit_type)
      raise "Invalid value for 'encryption_in_transit_type': this must be one of the values in ENCRYPTION_IN_TRANSIT_TYPE_ENUM." if encryption_in_transit_type && !ENCRYPTION_IN_TRANSIT_TYPE_ENUM.include?(encryption_in_transit_type)

      @encryption_in_transit_type = encryption_in_transit_type
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        boot_volume_id == other.boot_volume_id &&
        display_name == other.display_name &&
        instance_id == other.instance_id &&
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
      [boot_volume_id, display_name, instance_id, encryption_in_transit_type].hash
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