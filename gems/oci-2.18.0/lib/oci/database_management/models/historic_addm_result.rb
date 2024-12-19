# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The details of the historic ADDM task.
  #
  class DatabaseManagement::Models::HistoricAddmResult
    STATUS_ENUM = [
      STATUS_INITIAL = 'INITIAL'.freeze,
      STATUS_EXECUTING = 'EXECUTING'.freeze,
      STATUS_INTERRUPTED = 'INTERRUPTED'.freeze,
      STATUS_COMPLETED = 'COMPLETED'.freeze,
      STATUS_ERROR = 'ERROR'.freeze,
      STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    HOW_CREATED_ENUM = [
      HOW_CREATED_AUTO = 'AUTO'.freeze,
      HOW_CREATED_MANUAL = 'MANUAL'.freeze,
      HOW_CREATED_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # Specifies whether the ADDM task returned had already existed or was newly created by the api call.
    # @return [BOOLEAN]
    attr_accessor :is_newly_created

    # The name of the historic ADDM task.
    # @return [String]
    attr_accessor :task_name

    # **[Required]** The ID of the historic ADDM task.
    # @return [Integer]
    attr_accessor :task_id

    # The description of the ADDM task.
    # @return [String]
    attr_accessor :description

    # The database user who owns the historic ADDM task.
    # @return [String]
    attr_accessor :db_user

    # The status of the ADDM task.
    # @return [String]
    attr_reader :status

    # **[Required]** The creation date of the ADDM task.
    # @return [DateTime]
    attr_accessor :time_created

    # A description of how the task was created.
    # @return [String]
    attr_reader :how_created

    # The timestamp of the beginning AWR snapshot used in the ADDM task as defined by date-time RFC3339 format.
    #
    # @return [DateTime]
    attr_accessor :start_snapshot_time

    # The timestamp of the ending AWR snapshot used in the ADDM task as defined by date-time RFC3339 format.
    #
    # @return [DateTime]
    attr_accessor :end_snapshot_time

    # The ID number of the beginning AWR snapshot.
    #
    # @return [Integer]
    attr_accessor :begin_snapshot_id

    # The ID number of the ending AWR snapshot.
    #
    # @return [Integer]
    attr_accessor :end_snapshot_id

    # The number of ADDM findings.
    # @return [Integer]
    attr_accessor :findings

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'is_newly_created': :'isNewlyCreated',
        'task_name': :'taskName',
        'task_id': :'taskId',
        'description': :'description',
        'db_user': :'dbUser',
        'status': :'status',
        'time_created': :'timeCreated',
        'how_created': :'howCreated',
        'start_snapshot_time': :'startSnapshotTime',
        'end_snapshot_time': :'endSnapshotTime',
        'begin_snapshot_id': :'beginSnapshotId',
        'end_snapshot_id': :'endSnapshotId',
        'findings': :'findings'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'is_newly_created': :'BOOLEAN',
        'task_name': :'String',
        'task_id': :'Integer',
        'description': :'String',
        'db_user': :'String',
        'status': :'String',
        'time_created': :'DateTime',
        'how_created': :'String',
        'start_snapshot_time': :'DateTime',
        'end_snapshot_time': :'DateTime',
        'begin_snapshot_id': :'Integer',
        'end_snapshot_id': :'Integer',
        'findings': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [BOOLEAN] :is_newly_created The value to assign to the {#is_newly_created} property
    # @option attributes [String] :task_name The value to assign to the {#task_name} property
    # @option attributes [Integer] :task_id The value to assign to the {#task_id} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :db_user The value to assign to the {#db_user} property
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [String] :how_created The value to assign to the {#how_created} property
    # @option attributes [DateTime] :start_snapshot_time The value to assign to the {#start_snapshot_time} property
    # @option attributes [DateTime] :end_snapshot_time The value to assign to the {#end_snapshot_time} property
    # @option attributes [Integer] :begin_snapshot_id The value to assign to the {#begin_snapshot_id} property
    # @option attributes [Integer] :end_snapshot_id The value to assign to the {#end_snapshot_id} property
    # @option attributes [Integer] :findings The value to assign to the {#findings} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.is_newly_created = attributes[:'isNewlyCreated'] unless attributes[:'isNewlyCreated'].nil?

      raise 'You cannot provide both :isNewlyCreated and :is_newly_created' if attributes.key?(:'isNewlyCreated') && attributes.key?(:'is_newly_created')

      self.is_newly_created = attributes[:'is_newly_created'] unless attributes[:'is_newly_created'].nil?

      self.task_name = attributes[:'taskName'] if attributes[:'taskName']

      raise 'You cannot provide both :taskName and :task_name' if attributes.key?(:'taskName') && attributes.key?(:'task_name')

      self.task_name = attributes[:'task_name'] if attributes[:'task_name']

      self.task_id = attributes[:'taskId'] if attributes[:'taskId']

      raise 'You cannot provide both :taskId and :task_id' if attributes.key?(:'taskId') && attributes.key?(:'task_id')

      self.task_id = attributes[:'task_id'] if attributes[:'task_id']

      self.description = attributes[:'description'] if attributes[:'description']

      self.db_user = attributes[:'dbUser'] if attributes[:'dbUser']

      raise 'You cannot provide both :dbUser and :db_user' if attributes.key?(:'dbUser') && attributes.key?(:'db_user')

      self.db_user = attributes[:'db_user'] if attributes[:'db_user']

      self.status = attributes[:'status'] if attributes[:'status']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.how_created = attributes[:'howCreated'] if attributes[:'howCreated']

      raise 'You cannot provide both :howCreated and :how_created' if attributes.key?(:'howCreated') && attributes.key?(:'how_created')

      self.how_created = attributes[:'how_created'] if attributes[:'how_created']

      self.start_snapshot_time = attributes[:'startSnapshotTime'] if attributes[:'startSnapshotTime']

      raise 'You cannot provide both :startSnapshotTime and :start_snapshot_time' if attributes.key?(:'startSnapshotTime') && attributes.key?(:'start_snapshot_time')

      self.start_snapshot_time = attributes[:'start_snapshot_time'] if attributes[:'start_snapshot_time']

      self.end_snapshot_time = attributes[:'endSnapshotTime'] if attributes[:'endSnapshotTime']

      raise 'You cannot provide both :endSnapshotTime and :end_snapshot_time' if attributes.key?(:'endSnapshotTime') && attributes.key?(:'end_snapshot_time')

      self.end_snapshot_time = attributes[:'end_snapshot_time'] if attributes[:'end_snapshot_time']

      self.begin_snapshot_id = attributes[:'beginSnapshotId'] if attributes[:'beginSnapshotId']

      raise 'You cannot provide both :beginSnapshotId and :begin_snapshot_id' if attributes.key?(:'beginSnapshotId') && attributes.key?(:'begin_snapshot_id')

      self.begin_snapshot_id = attributes[:'begin_snapshot_id'] if attributes[:'begin_snapshot_id']

      self.end_snapshot_id = attributes[:'endSnapshotId'] if attributes[:'endSnapshotId']

      raise 'You cannot provide both :endSnapshotId and :end_snapshot_id' if attributes.key?(:'endSnapshotId') && attributes.key?(:'end_snapshot_id')

      self.end_snapshot_id = attributes[:'end_snapshot_id'] if attributes[:'end_snapshot_id']

      self.findings = attributes[:'findings'] if attributes[:'findings']
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

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] how_created Object to be assigned
    def how_created=(how_created)
      # rubocop:disable Style/ConditionalAssignment
      if how_created && !HOW_CREATED_ENUM.include?(how_created)
        OCI.logger.debug("Unknown value for 'how_created' [" + how_created + "]. Mapping to 'HOW_CREATED_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @how_created = HOW_CREATED_UNKNOWN_ENUM_VALUE
      else
        @how_created = how_created
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        is_newly_created == other.is_newly_created &&
        task_name == other.task_name &&
        task_id == other.task_id &&
        description == other.description &&
        db_user == other.db_user &&
        status == other.status &&
        time_created == other.time_created &&
        how_created == other.how_created &&
        start_snapshot_time == other.start_snapshot_time &&
        end_snapshot_time == other.end_snapshot_time &&
        begin_snapshot_id == other.begin_snapshot_id &&
        end_snapshot_id == other.end_snapshot_id &&
        findings == other.findings
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
      [is_newly_created, task_name, task_id, description, db_user, status, time_created, how_created, start_snapshot_time, end_snapshot_time, begin_snapshot_id, end_snapshot_id, findings].hash
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
