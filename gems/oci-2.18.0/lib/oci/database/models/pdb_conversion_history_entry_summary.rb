# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details of operations performed to convert a non-container database to pluggable database.
  #
  class Database::Models::PdbConversionHistoryEntrySummary
    ACTION_ENUM = [
      ACTION_PRECHECK = 'PRECHECK'.freeze,
      ACTION_CONVERT = 'CONVERT'.freeze,
      ACTION_SYNC = 'SYNC'.freeze,
      ACTION_SYNC_ROLLBACK = 'SYNC_ROLLBACK'.freeze,
      ACTION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    TARGET_ENUM = [
      TARGET_NEW_DATABASE = 'NEW_DATABASE'.freeze,
      TARGET_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_SUCCEEDED = 'SUCCEEDED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_IN_PROGRESS = 'IN_PROGRESS'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the database conversion history.
    # @return [String]
    attr_accessor :id

    # **[Required]** The operations used to convert a non-container database to a pluggable database.
    # - Use `PRECHECK` to run a pre-check operation on non-container database prior to converting it into a pluggable database.
    # - Use `CONVERT` to convert a non-container database into a pluggable database.
    # - Use `SYNC` if the non-container database was manually converted into a pluggable database using the dbcli command-line utility. Databases may need to be converted manually if the CONVERT action fails when converting a non-container database using the API.
    # - Use `SYNC_ROLLBACK` if the conversion of a non-container database into a pluggable database was manually rolled back using the dbcli command line utility. Conversions may need to be manually rolled back if the CONVERT action fails when converting a non-container database using the API.
    #
    # @return [String]
    attr_reader :action

    # The target container database of the pluggable database created by the database conversion operation. Currently, the database conversion operation only supports creating the pluggable database in a new container database.
    #  - Use `NEW_DATABASE` to specify that the pluggable database be created within a new container database in the same database home.
    #
    # @return [String]
    attr_reader :target

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the database.
    # @return [String]
    attr_accessor :source_database_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the database.
    # @return [String]
    attr_accessor :target_database_id

    # **[Required]** The database name. The name must begin with an alphabetic character and can contain a maximum of 8 alphanumeric characters. Special characters are not permitted. The database name must be unique in the tenancy.
    # @return [String]
    attr_accessor :cdb_name

    # **[Required]** Status of an operation performed during the conversion of a non-container database to a pluggable database.
    # @return [String]
    attr_reader :lifecycle_state

    # Additional information about the current lifecycle state for the conversion operation.
    # @return [String]
    attr_accessor :lifecycle_details

    # **[Required]** The date and time when the database conversion operation started.
    # @return [DateTime]
    attr_accessor :time_started

    # The date and time when the database conversion operation ended.
    # @return [DateTime]
    attr_accessor :time_ended

    # Additional container database parameter.
    #
    # @return [String]
    attr_accessor :additional_cdb_params

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'action': :'action',
        'target': :'target',
        'source_database_id': :'sourceDatabaseId',
        'target_database_id': :'targetDatabaseId',
        'cdb_name': :'cdbName',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'time_started': :'timeStarted',
        'time_ended': :'timeEnded',
        'additional_cdb_params': :'additionalCdbParams'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'action': :'String',
        'target': :'String',
        'source_database_id': :'String',
        'target_database_id': :'String',
        'cdb_name': :'String',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'time_started': :'DateTime',
        'time_ended': :'DateTime',
        'additional_cdb_params': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :action The value to assign to the {#action} property
    # @option attributes [String] :target The value to assign to the {#target} property
    # @option attributes [String] :source_database_id The value to assign to the {#source_database_id} property
    # @option attributes [String] :target_database_id The value to assign to the {#target_database_id} property
    # @option attributes [String] :cdb_name The value to assign to the {#cdb_name} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [DateTime] :time_started The value to assign to the {#time_started} property
    # @option attributes [DateTime] :time_ended The value to assign to the {#time_ended} property
    # @option attributes [String] :additional_cdb_params The value to assign to the {#additional_cdb_params} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.action = attributes[:'action'] if attributes[:'action']

      self.target = attributes[:'target'] if attributes[:'target']

      self.source_database_id = attributes[:'sourceDatabaseId'] if attributes[:'sourceDatabaseId']

      raise 'You cannot provide both :sourceDatabaseId and :source_database_id' if attributes.key?(:'sourceDatabaseId') && attributes.key?(:'source_database_id')

      self.source_database_id = attributes[:'source_database_id'] if attributes[:'source_database_id']

      self.target_database_id = attributes[:'targetDatabaseId'] if attributes[:'targetDatabaseId']

      raise 'You cannot provide both :targetDatabaseId and :target_database_id' if attributes.key?(:'targetDatabaseId') && attributes.key?(:'target_database_id')

      self.target_database_id = attributes[:'target_database_id'] if attributes[:'target_database_id']

      self.cdb_name = attributes[:'cdbName'] if attributes[:'cdbName']

      raise 'You cannot provide both :cdbName and :cdb_name' if attributes.key?(:'cdbName') && attributes.key?(:'cdb_name')

      self.cdb_name = attributes[:'cdb_name'] if attributes[:'cdb_name']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.time_started = attributes[:'timeStarted'] if attributes[:'timeStarted']

      raise 'You cannot provide both :timeStarted and :time_started' if attributes.key?(:'timeStarted') && attributes.key?(:'time_started')

      self.time_started = attributes[:'time_started'] if attributes[:'time_started']

      self.time_ended = attributes[:'timeEnded'] if attributes[:'timeEnded']

      raise 'You cannot provide both :timeEnded and :time_ended' if attributes.key?(:'timeEnded') && attributes.key?(:'time_ended')

      self.time_ended = attributes[:'time_ended'] if attributes[:'time_ended']

      self.additional_cdb_params = attributes[:'additionalCdbParams'] if attributes[:'additionalCdbParams']

      raise 'You cannot provide both :additionalCdbParams and :additional_cdb_params' if attributes.key?(:'additionalCdbParams') && attributes.key?(:'additional_cdb_params')

      self.additional_cdb_params = attributes[:'additional_cdb_params'] if attributes[:'additional_cdb_params']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] action Object to be assigned
    def action=(action)
      # rubocop:disable Style/ConditionalAssignment
      if action && !ACTION_ENUM.include?(action)
        OCI.logger.debug("Unknown value for 'action' [" + action + "]. Mapping to 'ACTION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @action = ACTION_UNKNOWN_ENUM_VALUE
      else
        @action = action
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] target Object to be assigned
    def target=(target)
      # rubocop:disable Style/ConditionalAssignment
      if target && !TARGET_ENUM.include?(target)
        OCI.logger.debug("Unknown value for 'target' [" + target + "]. Mapping to 'TARGET_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @target = TARGET_UNKNOWN_ENUM_VALUE
      else
        @target = target
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] lifecycle_state Object to be assigned
    def lifecycle_state=(lifecycle_state)
      # rubocop:disable Style/ConditionalAssignment
      if lifecycle_state && !LIFECYCLE_STATE_ENUM.include?(lifecycle_state)
        OCI.logger.debug("Unknown value for 'lifecycle_state' [" + lifecycle_state + "]. Mapping to 'LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @lifecycle_state = LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE
      else
        @lifecycle_state = lifecycle_state
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
        action == other.action &&
        target == other.target &&
        source_database_id == other.source_database_id &&
        target_database_id == other.target_database_id &&
        cdb_name == other.cdb_name &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        time_started == other.time_started &&
        time_ended == other.time_ended &&
        additional_cdb_params == other.additional_cdb_params
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
      [id, action, target, source_database_id, target_database_id, cdb_name, lifecycle_state, lifecycle_details, time_started, time_ended, additional_cdb_params].hash
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