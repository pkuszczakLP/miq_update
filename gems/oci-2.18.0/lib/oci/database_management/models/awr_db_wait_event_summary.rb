# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The summary of the AWR wait event time series data for one event.
  class DatabaseManagement::Models::AwrDbWaitEventSummary
    # **[Required]** The name of the event.
    # @return [String]
    attr_accessor :name

    # The begin time of the wait event.
    # @return [DateTime]
    attr_accessor :time_begin

    # The end time of the wait event.
    # @return [DateTime]
    attr_accessor :time_end

    # The wait count per second.
    # @return [Float]
    attr_accessor :waits_per_sec

    # The average wait time per second.
    # @return [Float]
    attr_accessor :avg_wait_time_per_sec

    # The ID of the snapshot. The snapshot ID is not the [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # It can be retrieved from the following endpoint:
    # /managedDatabases/{managedDatabaseId}/awrDbs/{awrDbId}/awrDbSnapshots
    #
    # @return [Integer]
    attr_accessor :snapshot_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'time_begin': :'timeBegin',
        'time_end': :'timeEnd',
        'waits_per_sec': :'waitsPerSec',
        'avg_wait_time_per_sec': :'avgWaitTimePerSec',
        'snapshot_id': :'snapshotId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'time_begin': :'DateTime',
        'time_end': :'DateTime',
        'waits_per_sec': :'Float',
        'avg_wait_time_per_sec': :'Float',
        'snapshot_id': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [DateTime] :time_begin The value to assign to the {#time_begin} property
    # @option attributes [DateTime] :time_end The value to assign to the {#time_end} property
    # @option attributes [Float] :waits_per_sec The value to assign to the {#waits_per_sec} property
    # @option attributes [Float] :avg_wait_time_per_sec The value to assign to the {#avg_wait_time_per_sec} property
    # @option attributes [Integer] :snapshot_id The value to assign to the {#snapshot_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.time_begin = attributes[:'timeBegin'] if attributes[:'timeBegin']

      raise 'You cannot provide both :timeBegin and :time_begin' if attributes.key?(:'timeBegin') && attributes.key?(:'time_begin')

      self.time_begin = attributes[:'time_begin'] if attributes[:'time_begin']

      self.time_end = attributes[:'timeEnd'] if attributes[:'timeEnd']

      raise 'You cannot provide both :timeEnd and :time_end' if attributes.key?(:'timeEnd') && attributes.key?(:'time_end')

      self.time_end = attributes[:'time_end'] if attributes[:'time_end']

      self.waits_per_sec = attributes[:'waitsPerSec'] if attributes[:'waitsPerSec']

      raise 'You cannot provide both :waitsPerSec and :waits_per_sec' if attributes.key?(:'waitsPerSec') && attributes.key?(:'waits_per_sec')

      self.waits_per_sec = attributes[:'waits_per_sec'] if attributes[:'waits_per_sec']

      self.avg_wait_time_per_sec = attributes[:'avgWaitTimePerSec'] if attributes[:'avgWaitTimePerSec']

      raise 'You cannot provide both :avgWaitTimePerSec and :avg_wait_time_per_sec' if attributes.key?(:'avgWaitTimePerSec') && attributes.key?(:'avg_wait_time_per_sec')

      self.avg_wait_time_per_sec = attributes[:'avg_wait_time_per_sec'] if attributes[:'avg_wait_time_per_sec']

      self.snapshot_id = attributes[:'snapshotId'] if attributes[:'snapshotId']

      raise 'You cannot provide both :snapshotId and :snapshot_id' if attributes.key?(:'snapshotId') && attributes.key?(:'snapshot_id')

      self.snapshot_id = attributes[:'snapshot_id'] if attributes[:'snapshot_id']
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
        time_begin == other.time_begin &&
        time_end == other.time_end &&
        waits_per_sec == other.waits_per_sec &&
        avg_wait_time_per_sec == other.avg_wait_time_per_sec &&
        snapshot_id == other.snapshot_id
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
      [name, time_begin, time_end, waits_per_sec, avg_wait_time_per_sec, snapshot_id].hash
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
