# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Throughput and storage limits configuration of a table.
  class Nosql::Models::TableLimits
    CAPACITY_MODE_ENUM = [
      CAPACITY_MODE_PROVISIONED = 'PROVISIONED'.freeze,
      CAPACITY_MODE_ON_DEMAND = 'ON_DEMAND'.freeze,
      CAPACITY_MODE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Maximum sustained read throughput limit for the table.
    # @return [Integer]
    attr_accessor :max_read_units

    # **[Required]** Maximum sustained write throughput limit for the table.
    # @return [Integer]
    attr_accessor :max_write_units

    # **[Required]** Maximum size of storage used by the table.
    # @return [Integer]
    attr_accessor :max_storage_in_g_bs

    # The capacity mode of the table.  If capacityMode = ON_DEMAND,
    # maxReadUnits and maxWriteUnits are not used, and both will have
    # the value of zero.
    #
    # @return [String]
    attr_reader :capacity_mode

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'max_read_units': :'maxReadUnits',
        'max_write_units': :'maxWriteUnits',
        'max_storage_in_g_bs': :'maxStorageInGBs',
        'capacity_mode': :'capacityMode'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'max_read_units': :'Integer',
        'max_write_units': :'Integer',
        'max_storage_in_g_bs': :'Integer',
        'capacity_mode': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :max_read_units The value to assign to the {#max_read_units} property
    # @option attributes [Integer] :max_write_units The value to assign to the {#max_write_units} property
    # @option attributes [Integer] :max_storage_in_g_bs The value to assign to the {#max_storage_in_g_bs} property
    # @option attributes [String] :capacity_mode The value to assign to the {#capacity_mode} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.max_read_units = attributes[:'maxReadUnits'] if attributes[:'maxReadUnits']

      raise 'You cannot provide both :maxReadUnits and :max_read_units' if attributes.key?(:'maxReadUnits') && attributes.key?(:'max_read_units')

      self.max_read_units = attributes[:'max_read_units'] if attributes[:'max_read_units']

      self.max_write_units = attributes[:'maxWriteUnits'] if attributes[:'maxWriteUnits']

      raise 'You cannot provide both :maxWriteUnits and :max_write_units' if attributes.key?(:'maxWriteUnits') && attributes.key?(:'max_write_units')

      self.max_write_units = attributes[:'max_write_units'] if attributes[:'max_write_units']

      self.max_storage_in_g_bs = attributes[:'maxStorageInGBs'] if attributes[:'maxStorageInGBs']

      raise 'You cannot provide both :maxStorageInGBs and :max_storage_in_g_bs' if attributes.key?(:'maxStorageInGBs') && attributes.key?(:'max_storage_in_g_bs')

      self.max_storage_in_g_bs = attributes[:'max_storage_in_g_bs'] if attributes[:'max_storage_in_g_bs']

      self.capacity_mode = attributes[:'capacityMode'] if attributes[:'capacityMode']

      raise 'You cannot provide both :capacityMode and :capacity_mode' if attributes.key?(:'capacityMode') && attributes.key?(:'capacity_mode')

      self.capacity_mode = attributes[:'capacity_mode'] if attributes[:'capacity_mode']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] capacity_mode Object to be assigned
    def capacity_mode=(capacity_mode)
      # rubocop:disable Style/ConditionalAssignment
      if capacity_mode && !CAPACITY_MODE_ENUM.include?(capacity_mode)
        OCI.logger.debug("Unknown value for 'capacity_mode' [" + capacity_mode + "]. Mapping to 'CAPACITY_MODE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @capacity_mode = CAPACITY_MODE_UNKNOWN_ENUM_VALUE
      else
        @capacity_mode = capacity_mode
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        max_read_units == other.max_read_units &&
        max_write_units == other.max_write_units &&
        max_storage_in_g_bs == other.max_storage_in_g_bs &&
        capacity_mode == other.capacity_mode
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
      [max_read_units, max_write_units, max_storage_in_g_bs, capacity_mode].hash
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
