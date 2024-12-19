# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The summary data for a range of AWR snapshots.
  class DatabaseManagement::Models::AwrDbSnapshotRangeSummary
    # **[Required]** The internal ID of the database. The internal ID of the database is not the [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # It can be retrieved from the following endpoint:
    # /managedDatabases/{managedDatabaseId}/awrDbs
    #
    # @return [String]
    attr_accessor :awr_db_id

    # **[Required]** The name of the database.
    # @return [String]
    attr_accessor :db_name

    # The database instance numbers.
    # @return [Array<Integer>]
    attr_accessor :instance_list

    # The timestamp of the database startup.
    # @return [DateTime]
    attr_accessor :time_db_startup

    # The start time of the earliest snapshot.
    # @return [DateTime]
    attr_accessor :time_first_snapshot_begin

    # The end time of the latest snapshot.
    # @return [DateTime]
    attr_accessor :time_latest_snapshot_end

    # The ID of the earliest snapshot. The snapshot ID is not the [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # It can be retrieved from the following endpoint:
    # /managedDatabases/{managedDatabaseId}/awrDbs/{awrDbId}/awrDbSnapshots
    #
    # @return [Integer]
    attr_accessor :first_snapshot_id

    # The ID of the latest snapshot. The snapshot ID is not the [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # It can be retrieved from the following endpoint:
    # /managedDatabases/{managedDatabaseId}/awrDbs/{awrDbId}/awrDbSnapshots
    #
    # @return [Integer]
    attr_accessor :latest_snapshot_id

    # The total number of snapshots.
    # @return [Integer]
    attr_accessor :snapshot_count

    # The interval time between snapshots (in minutes).
    # @return [Integer]
    attr_accessor :snapshot_interval_in_min

    # ID of the database container. The database container ID is not the [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # It can be retrieved from the following endpoint:
    # /managedDatabases/{managedDatabaseId}/awrDbSnapshotRanges
    #
    # @return [Integer]
    attr_accessor :container_id

    # The version of the database.
    # @return [String]
    attr_accessor :db_version

    # The time zone of the snapshot.
    # @return [String]
    attr_accessor :snapshot_timezone

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'awr_db_id': :'awrDbId',
        'db_name': :'dbName',
        'instance_list': :'instanceList',
        'time_db_startup': :'timeDbStartup',
        'time_first_snapshot_begin': :'timeFirstSnapshotBegin',
        'time_latest_snapshot_end': :'timeLatestSnapshotEnd',
        'first_snapshot_id': :'firstSnapshotId',
        'latest_snapshot_id': :'latestSnapshotId',
        'snapshot_count': :'snapshotCount',
        'snapshot_interval_in_min': :'snapshotIntervalInMin',
        'container_id': :'containerId',
        'db_version': :'dbVersion',
        'snapshot_timezone': :'snapshotTimezone'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'awr_db_id': :'String',
        'db_name': :'String',
        'instance_list': :'Array<Integer>',
        'time_db_startup': :'DateTime',
        'time_first_snapshot_begin': :'DateTime',
        'time_latest_snapshot_end': :'DateTime',
        'first_snapshot_id': :'Integer',
        'latest_snapshot_id': :'Integer',
        'snapshot_count': :'Integer',
        'snapshot_interval_in_min': :'Integer',
        'container_id': :'Integer',
        'db_version': :'String',
        'snapshot_timezone': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :awr_db_id The value to assign to the {#awr_db_id} property
    # @option attributes [String] :db_name The value to assign to the {#db_name} property
    # @option attributes [Array<Integer>] :instance_list The value to assign to the {#instance_list} property
    # @option attributes [DateTime] :time_db_startup The value to assign to the {#time_db_startup} property
    # @option attributes [DateTime] :time_first_snapshot_begin The value to assign to the {#time_first_snapshot_begin} property
    # @option attributes [DateTime] :time_latest_snapshot_end The value to assign to the {#time_latest_snapshot_end} property
    # @option attributes [Integer] :first_snapshot_id The value to assign to the {#first_snapshot_id} property
    # @option attributes [Integer] :latest_snapshot_id The value to assign to the {#latest_snapshot_id} property
    # @option attributes [Integer] :snapshot_count The value to assign to the {#snapshot_count} property
    # @option attributes [Integer] :snapshot_interval_in_min The value to assign to the {#snapshot_interval_in_min} property
    # @option attributes [Integer] :container_id The value to assign to the {#container_id} property
    # @option attributes [String] :db_version The value to assign to the {#db_version} property
    # @option attributes [String] :snapshot_timezone The value to assign to the {#snapshot_timezone} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      self.awr_db_id = attributes[:'awrDbId'] if attributes[:'awrDbId']

      raise 'You cannot provide both :awrDbId and :awr_db_id' if attributes.key?(:'awrDbId') && attributes.key?(:'awr_db_id')

      self.awr_db_id = attributes[:'awr_db_id'] if attributes[:'awr_db_id']

      self.db_name = attributes[:'dbName'] if attributes[:'dbName']

      raise 'You cannot provide both :dbName and :db_name' if attributes.key?(:'dbName') && attributes.key?(:'db_name')

      self.db_name = attributes[:'db_name'] if attributes[:'db_name']

      self.instance_list = attributes[:'instanceList'] if attributes[:'instanceList']

      raise 'You cannot provide both :instanceList and :instance_list' if attributes.key?(:'instanceList') && attributes.key?(:'instance_list')

      self.instance_list = attributes[:'instance_list'] if attributes[:'instance_list']

      self.time_db_startup = attributes[:'timeDbStartup'] if attributes[:'timeDbStartup']

      raise 'You cannot provide both :timeDbStartup and :time_db_startup' if attributes.key?(:'timeDbStartup') && attributes.key?(:'time_db_startup')

      self.time_db_startup = attributes[:'time_db_startup'] if attributes[:'time_db_startup']

      self.time_first_snapshot_begin = attributes[:'timeFirstSnapshotBegin'] if attributes[:'timeFirstSnapshotBegin']

      raise 'You cannot provide both :timeFirstSnapshotBegin and :time_first_snapshot_begin' if attributes.key?(:'timeFirstSnapshotBegin') && attributes.key?(:'time_first_snapshot_begin')

      self.time_first_snapshot_begin = attributes[:'time_first_snapshot_begin'] if attributes[:'time_first_snapshot_begin']

      self.time_latest_snapshot_end = attributes[:'timeLatestSnapshotEnd'] if attributes[:'timeLatestSnapshotEnd']

      raise 'You cannot provide both :timeLatestSnapshotEnd and :time_latest_snapshot_end' if attributes.key?(:'timeLatestSnapshotEnd') && attributes.key?(:'time_latest_snapshot_end')

      self.time_latest_snapshot_end = attributes[:'time_latest_snapshot_end'] if attributes[:'time_latest_snapshot_end']

      self.first_snapshot_id = attributes[:'firstSnapshotId'] if attributes[:'firstSnapshotId']

      raise 'You cannot provide both :firstSnapshotId and :first_snapshot_id' if attributes.key?(:'firstSnapshotId') && attributes.key?(:'first_snapshot_id')

      self.first_snapshot_id = attributes[:'first_snapshot_id'] if attributes[:'first_snapshot_id']

      self.latest_snapshot_id = attributes[:'latestSnapshotId'] if attributes[:'latestSnapshotId']

      raise 'You cannot provide both :latestSnapshotId and :latest_snapshot_id' if attributes.key?(:'latestSnapshotId') && attributes.key?(:'latest_snapshot_id')

      self.latest_snapshot_id = attributes[:'latest_snapshot_id'] if attributes[:'latest_snapshot_id']

      self.snapshot_count = attributes[:'snapshotCount'] if attributes[:'snapshotCount']

      raise 'You cannot provide both :snapshotCount and :snapshot_count' if attributes.key?(:'snapshotCount') && attributes.key?(:'snapshot_count')

      self.snapshot_count = attributes[:'snapshot_count'] if attributes[:'snapshot_count']

      self.snapshot_interval_in_min = attributes[:'snapshotIntervalInMin'] if attributes[:'snapshotIntervalInMin']

      raise 'You cannot provide both :snapshotIntervalInMin and :snapshot_interval_in_min' if attributes.key?(:'snapshotIntervalInMin') && attributes.key?(:'snapshot_interval_in_min')

      self.snapshot_interval_in_min = attributes[:'snapshot_interval_in_min'] if attributes[:'snapshot_interval_in_min']

      self.container_id = attributes[:'containerId'] if attributes[:'containerId']

      raise 'You cannot provide both :containerId and :container_id' if attributes.key?(:'containerId') && attributes.key?(:'container_id')

      self.container_id = attributes[:'container_id'] if attributes[:'container_id']

      self.db_version = attributes[:'dbVersion'] if attributes[:'dbVersion']

      raise 'You cannot provide both :dbVersion and :db_version' if attributes.key?(:'dbVersion') && attributes.key?(:'db_version')

      self.db_version = attributes[:'db_version'] if attributes[:'db_version']

      self.snapshot_timezone = attributes[:'snapshotTimezone'] if attributes[:'snapshotTimezone']

      raise 'You cannot provide both :snapshotTimezone and :snapshot_timezone' if attributes.key?(:'snapshotTimezone') && attributes.key?(:'snapshot_timezone')

      self.snapshot_timezone = attributes[:'snapshot_timezone'] if attributes[:'snapshot_timezone']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        awr_db_id == other.awr_db_id &&
        db_name == other.db_name &&
        instance_list == other.instance_list &&
        time_db_startup == other.time_db_startup &&
        time_first_snapshot_begin == other.time_first_snapshot_begin &&
        time_latest_snapshot_end == other.time_latest_snapshot_end &&
        first_snapshot_id == other.first_snapshot_id &&
        latest_snapshot_id == other.latest_snapshot_id &&
        snapshot_count == other.snapshot_count &&
        snapshot_interval_in_min == other.snapshot_interval_in_min &&
        container_id == other.container_id &&
        db_version == other.db_version &&
        snapshot_timezone == other.snapshot_timezone
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
      [awr_db_id, db_name, instance_list, time_db_startup, time_first_snapshot_begin, time_latest_snapshot_end, first_snapshot_id, latest_snapshot_id, snapshot_count, snapshot_interval_in_min, container_id, db_version, snapshot_timezone].hash
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
