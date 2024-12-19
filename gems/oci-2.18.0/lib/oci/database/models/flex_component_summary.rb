# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The Flex Components for a DB system. The Flex Component determines resources to allocate to the DB system -  CPU cores, memory and storage for Flex shapes.
  #
  # To use any of the API operations, you must be authorized in an IAM policy. If you're not authorized, talk to an administrator.
  # If you're an administrator who needs to write policies to give users access,
  # see [Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).
  #
  class Database::Models::FlexComponentSummary
    # **[Required]** The name of the Flex Component used for the DB system.
    # @return [String]
    attr_accessor :name

    # The minimum number of CPU cores that can be enabled on the DB Server for this Flex Component.
    # @return [Integer]
    attr_accessor :minimum_core_count

    # The maximum number of CPU cores that can ben enabled on the DB Server for this Flex Component.
    # @return [Integer]
    attr_accessor :available_core_count

    # The maximum  storage that can be enabled on the Storage Server for this Flex Component.
    # @return [Integer]
    attr_accessor :available_db_storage_in_gbs

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'minimum_core_count': :'minimumCoreCount',
        'available_core_count': :'availableCoreCount',
        'available_db_storage_in_gbs': :'availableDbStorageInGBs'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'minimum_core_count': :'Integer',
        'available_core_count': :'Integer',
        'available_db_storage_in_gbs': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [Integer] :minimum_core_count The value to assign to the {#minimum_core_count} property
    # @option attributes [Integer] :available_core_count The value to assign to the {#available_core_count} property
    # @option attributes [Integer] :available_db_storage_in_gbs The value to assign to the {#available_db_storage_in_gbs} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.minimum_core_count = attributes[:'minimumCoreCount'] if attributes[:'minimumCoreCount']

      raise 'You cannot provide both :minimumCoreCount and :minimum_core_count' if attributes.key?(:'minimumCoreCount') && attributes.key?(:'minimum_core_count')

      self.minimum_core_count = attributes[:'minimum_core_count'] if attributes[:'minimum_core_count']

      self.available_core_count = attributes[:'availableCoreCount'] if attributes[:'availableCoreCount']

      raise 'You cannot provide both :availableCoreCount and :available_core_count' if attributes.key?(:'availableCoreCount') && attributes.key?(:'available_core_count')

      self.available_core_count = attributes[:'available_core_count'] if attributes[:'available_core_count']

      self.available_db_storage_in_gbs = attributes[:'availableDbStorageInGBs'] if attributes[:'availableDbStorageInGBs']

      raise 'You cannot provide both :availableDbStorageInGBs and :available_db_storage_in_gbs' if attributes.key?(:'availableDbStorageInGBs') && attributes.key?(:'available_db_storage_in_gbs')

      self.available_db_storage_in_gbs = attributes[:'available_db_storage_in_gbs'] if attributes[:'available_db_storage_in_gbs']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        name == other.name &&
        minimum_core_count == other.minimum_core_count &&
        available_core_count == other.available_core_count &&
        available_db_storage_in_gbs == other.available_db_storage_in_gbs
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
      [name, minimum_core_count, available_core_count, available_db_storage_in_gbs].hash
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