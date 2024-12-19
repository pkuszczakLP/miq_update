# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The AWR snapshot summary of one snapshot.
  class Opsi::Models::AwrSnapshotSummary
    # **[Required]** DatabaseId of the Source database for which AWR Data will be uploaded to AWR Hub.
    # @return [String]
    attr_accessor :awr_source_database_id

    # The database instance number.
    # @return [Integer]
    attr_accessor :instance_number

    # The timestamp of the database startup.
    # @return [DateTime]
    attr_accessor :time_db_startup

    # The start time of the snapshot.
    # @return [DateTime]
    attr_accessor :time_snapshot_begin

    # The end time of the snapshot.
    # @return [DateTime]
    attr_accessor :time_snapshot_end

    # **[Required]** The identifier of the snapshot.
    # @return [Integer]
    attr_accessor :snapshot_identifier

    # The total number of errors.
    # @return [Integer]
    attr_accessor :error_count

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'awr_source_database_id': :'awrSourceDatabaseId',
        'instance_number': :'instanceNumber',
        'time_db_startup': :'timeDbStartup',
        'time_snapshot_begin': :'timeSnapshotBegin',
        'time_snapshot_end': :'timeSnapshotEnd',
        'snapshot_identifier': :'snapshotIdentifier',
        'error_count': :'errorCount'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'awr_source_database_id': :'String',
        'instance_number': :'Integer',
        'time_db_startup': :'DateTime',
        'time_snapshot_begin': :'DateTime',
        'time_snapshot_end': :'DateTime',
        'snapshot_identifier': :'Integer',
        'error_count': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :awr_source_database_id The value to assign to the {#awr_source_database_id} property
    # @option attributes [Integer] :instance_number The value to assign to the {#instance_number} property
    # @option attributes [DateTime] :time_db_startup The value to assign to the {#time_db_startup} property
    # @option attributes [DateTime] :time_snapshot_begin The value to assign to the {#time_snapshot_begin} property
    # @option attributes [DateTime] :time_snapshot_end The value to assign to the {#time_snapshot_end} property
    # @option attributes [Integer] :snapshot_identifier The value to assign to the {#snapshot_identifier} property
    # @option attributes [Integer] :error_count The value to assign to the {#error_count} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.awr_source_database_id = attributes[:'awrSourceDatabaseId'] if attributes[:'awrSourceDatabaseId']

      raise 'You cannot provide both :awrSourceDatabaseId and :awr_source_database_id' if attributes.key?(:'awrSourceDatabaseId') && attributes.key?(:'awr_source_database_id')

      self.awr_source_database_id = attributes[:'awr_source_database_id'] if attributes[:'awr_source_database_id']

      self.instance_number = attributes[:'instanceNumber'] if attributes[:'instanceNumber']

      raise 'You cannot provide both :instanceNumber and :instance_number' if attributes.key?(:'instanceNumber') && attributes.key?(:'instance_number')

      self.instance_number = attributes[:'instance_number'] if attributes[:'instance_number']

      self.time_db_startup = attributes[:'timeDbStartup'] if attributes[:'timeDbStartup']

      raise 'You cannot provide both :timeDbStartup and :time_db_startup' if attributes.key?(:'timeDbStartup') && attributes.key?(:'time_db_startup')

      self.time_db_startup = attributes[:'time_db_startup'] if attributes[:'time_db_startup']

      self.time_snapshot_begin = attributes[:'timeSnapshotBegin'] if attributes[:'timeSnapshotBegin']

      raise 'You cannot provide both :timeSnapshotBegin and :time_snapshot_begin' if attributes.key?(:'timeSnapshotBegin') && attributes.key?(:'time_snapshot_begin')

      self.time_snapshot_begin = attributes[:'time_snapshot_begin'] if attributes[:'time_snapshot_begin']

      self.time_snapshot_end = attributes[:'timeSnapshotEnd'] if attributes[:'timeSnapshotEnd']

      raise 'You cannot provide both :timeSnapshotEnd and :time_snapshot_end' if attributes.key?(:'timeSnapshotEnd') && attributes.key?(:'time_snapshot_end')

      self.time_snapshot_end = attributes[:'time_snapshot_end'] if attributes[:'time_snapshot_end']

      self.snapshot_identifier = attributes[:'snapshotIdentifier'] if attributes[:'snapshotIdentifier']

      raise 'You cannot provide both :snapshotIdentifier and :snapshot_identifier' if attributes.key?(:'snapshotIdentifier') && attributes.key?(:'snapshot_identifier')

      self.snapshot_identifier = attributes[:'snapshot_identifier'] if attributes[:'snapshot_identifier']

      self.error_count = attributes[:'errorCount'] if attributes[:'errorCount']

      raise 'You cannot provide both :errorCount and :error_count' if attributes.key?(:'errorCount') && attributes.key?(:'error_count')

      self.error_count = attributes[:'error_count'] if attributes[:'error_count']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        awr_source_database_id == other.awr_source_database_id &&
        instance_number == other.instance_number &&
        time_db_startup == other.time_db_startup &&
        time_snapshot_begin == other.time_snapshot_begin &&
        time_snapshot_end == other.time_snapshot_end &&
        snapshot_identifier == other.snapshot_identifier &&
        error_count == other.error_count
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
      [awr_source_database_id, instance_number, time_db_startup, time_snapshot_begin, time_snapshot_end, snapshot_identifier, error_count].hash
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
