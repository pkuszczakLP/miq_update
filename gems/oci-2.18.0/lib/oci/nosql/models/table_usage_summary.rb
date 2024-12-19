# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # TableUsageSummary represents a single usage record, or slice, that includes
  # information about read and write throughput consumed during that period
  # as well as the current information regarding storage capacity. In
  # addition the count of throttling exceptions for the period is reported.
  #
  class Nosql::Models::TableUsageSummary
    # The length of the sampling period.
    # @return [Integer]
    attr_accessor :seconds_in_period

    # Read throughput during the sampling period.
    # @return [Integer]
    attr_accessor :read_units

    # Write throughput during the sampling period.
    # @return [Integer]
    attr_accessor :write_units

    # The size of the table, in GB.
    # @return [Integer]
    attr_accessor :storage_in_g_bs

    # The number of times reads were throttled due to exceeding
    # the read throughput limit.
    #
    # @return [Integer]
    attr_accessor :read_throttle_count

    # The number of times writes were throttled due to exceeding
    # the write throughput limit.
    #
    # @return [Integer]
    attr_accessor :write_throttle_count

    # The number of times writes were throttled because the table
    # exceeded its size limit.
    #
    # @return [Integer]
    attr_accessor :storage_throttle_count

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'seconds_in_period': :'secondsInPeriod',
        'read_units': :'readUnits',
        'write_units': :'writeUnits',
        'storage_in_g_bs': :'storageInGBs',
        'read_throttle_count': :'readThrottleCount',
        'write_throttle_count': :'writeThrottleCount',
        'storage_throttle_count': :'storageThrottleCount'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'seconds_in_period': :'Integer',
        'read_units': :'Integer',
        'write_units': :'Integer',
        'storage_in_g_bs': :'Integer',
        'read_throttle_count': :'Integer',
        'write_throttle_count': :'Integer',
        'storage_throttle_count': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :seconds_in_period The value to assign to the {#seconds_in_period} property
    # @option attributes [Integer] :read_units The value to assign to the {#read_units} property
    # @option attributes [Integer] :write_units The value to assign to the {#write_units} property
    # @option attributes [Integer] :storage_in_g_bs The value to assign to the {#storage_in_g_bs} property
    # @option attributes [Integer] :read_throttle_count The value to assign to the {#read_throttle_count} property
    # @option attributes [Integer] :write_throttle_count The value to assign to the {#write_throttle_count} property
    # @option attributes [Integer] :storage_throttle_count The value to assign to the {#storage_throttle_count} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.seconds_in_period = attributes[:'secondsInPeriod'] if attributes[:'secondsInPeriod']

      raise 'You cannot provide both :secondsInPeriod and :seconds_in_period' if attributes.key?(:'secondsInPeriod') && attributes.key?(:'seconds_in_period')

      self.seconds_in_period = attributes[:'seconds_in_period'] if attributes[:'seconds_in_period']

      self.read_units = attributes[:'readUnits'] if attributes[:'readUnits']

      raise 'You cannot provide both :readUnits and :read_units' if attributes.key?(:'readUnits') && attributes.key?(:'read_units')

      self.read_units = attributes[:'read_units'] if attributes[:'read_units']

      self.write_units = attributes[:'writeUnits'] if attributes[:'writeUnits']

      raise 'You cannot provide both :writeUnits and :write_units' if attributes.key?(:'writeUnits') && attributes.key?(:'write_units')

      self.write_units = attributes[:'write_units'] if attributes[:'write_units']

      self.storage_in_g_bs = attributes[:'storageInGBs'] if attributes[:'storageInGBs']

      raise 'You cannot provide both :storageInGBs and :storage_in_g_bs' if attributes.key?(:'storageInGBs') && attributes.key?(:'storage_in_g_bs')

      self.storage_in_g_bs = attributes[:'storage_in_g_bs'] if attributes[:'storage_in_g_bs']

      self.read_throttle_count = attributes[:'readThrottleCount'] if attributes[:'readThrottleCount']

      raise 'You cannot provide both :readThrottleCount and :read_throttle_count' if attributes.key?(:'readThrottleCount') && attributes.key?(:'read_throttle_count')

      self.read_throttle_count = attributes[:'read_throttle_count'] if attributes[:'read_throttle_count']

      self.write_throttle_count = attributes[:'writeThrottleCount'] if attributes[:'writeThrottleCount']

      raise 'You cannot provide both :writeThrottleCount and :write_throttle_count' if attributes.key?(:'writeThrottleCount') && attributes.key?(:'write_throttle_count')

      self.write_throttle_count = attributes[:'write_throttle_count'] if attributes[:'write_throttle_count']

      self.storage_throttle_count = attributes[:'storageThrottleCount'] if attributes[:'storageThrottleCount']

      raise 'You cannot provide both :storageThrottleCount and :storage_throttle_count' if attributes.key?(:'storageThrottleCount') && attributes.key?(:'storage_throttle_count')

      self.storage_throttle_count = attributes[:'storage_throttle_count'] if attributes[:'storage_throttle_count']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        seconds_in_period == other.seconds_in_period &&
        read_units == other.read_units &&
        write_units == other.write_units &&
        storage_in_g_bs == other.storage_in_g_bs &&
        read_throttle_count == other.read_throttle_count &&
        write_throttle_count == other.write_throttle_count &&
        storage_throttle_count == other.storage_throttle_count
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
      [seconds_in_period, read_units, write_units, storage_in_g_bs, read_throttle_count, write_throttle_count, storage_throttle_count].hash
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
