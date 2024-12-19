# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'
require_relative 'job'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The details of the SQL job.
  class DatabaseManagement::Models::SqlJob < DatabaseManagement::Models::Job
    SQL_TYPE_ENUM = [
      SQL_TYPE_QUERY = 'QUERY'.freeze,
      SQL_TYPE_DML = 'DML'.freeze,
      SQL_TYPE_DDL = 'DDL'.freeze,
      SQL_TYPE_PLSQL = 'PLSQL'.freeze,
      SQL_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    OPERATION_TYPE_ENUM = [
      OPERATION_TYPE_EXECUTE_SQL = 'EXECUTE_SQL'.freeze,
      OPERATION_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    ROLE_ENUM = [
      ROLE_NORMAL = 'NORMAL'.freeze,
      ROLE_SYSDBA = 'SYSDBA'.freeze,
      ROLE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The type of SQL. This is a mandatory field for the EXECUTE_SQL operationType.
    # @return [String]
    attr_reader :sql_type

    # The SQL text to be executed in the job. This is a mandatory field for the EXECUTE_SQL operationType.
    # @return [String]
    attr_accessor :sql_text

    # **[Required]** The SQL operation type.
    # @return [String]
    attr_reader :operation_type

    # The database user name used to execute the SQL job. If the job is being executed on a Managed Database Group,
    # then the user name should exist on all the databases in the group with the same password.
    #
    # @return [String]
    attr_accessor :user_name

    # The role of the database user. Indicates whether the database user is a normal user or sysdba.
    # @return [String]
    attr_reader :role

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'compartment_id': :'compartmentId',
        'name': :'name',
        'description': :'description',
        'managed_database_group_id': :'managedDatabaseGroupId',
        'managed_database_id': :'managedDatabaseId',
        'managed_databases_details': :'managedDatabasesDetails',
        'database_sub_type': :'databaseSubType',
        'schedule_type': :'scheduleType',
        'job_type': :'jobType',
        'lifecycle_state': :'lifecycleState',
        'timeout': :'timeout',
        'result_location': :'resultLocation',
        'schedule_details': :'scheduleDetails',
        'submission_error_message': :'submissionErrorMessage',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'sql_type': :'sqlType',
        'sql_text': :'sqlText',
        'operation_type': :'operationType',
        'user_name': :'userName',
        'role': :'role'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'compartment_id': :'String',
        'name': :'String',
        'description': :'String',
        'managed_database_group_id': :'String',
        'managed_database_id': :'String',
        'managed_databases_details': :'Array<OCI::DatabaseManagement::Models::JobDatabase>',
        'database_sub_type': :'String',
        'schedule_type': :'String',
        'job_type': :'String',
        'lifecycle_state': :'String',
        'timeout': :'String',
        'result_location': :'OCI::DatabaseManagement::Models::JobExecutionResultLocation',
        'schedule_details': :'OCI::DatabaseManagement::Models::JobScheduleDetails',
        'submission_error_message': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'sql_type': :'String',
        'sql_text': :'String',
        'operation_type': :'String',
        'user_name': :'String',
        'role': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {OCI::DatabaseManagement::Models::Job#id #id} proprety
    # @option attributes [String] :compartment_id The value to assign to the {OCI::DatabaseManagement::Models::Job#compartment_id #compartment_id} proprety
    # @option attributes [String] :name The value to assign to the {OCI::DatabaseManagement::Models::Job#name #name} proprety
    # @option attributes [String] :description The value to assign to the {OCI::DatabaseManagement::Models::Job#description #description} proprety
    # @option attributes [String] :managed_database_group_id The value to assign to the {OCI::DatabaseManagement::Models::Job#managed_database_group_id #managed_database_group_id} proprety
    # @option attributes [String] :managed_database_id The value to assign to the {OCI::DatabaseManagement::Models::Job#managed_database_id #managed_database_id} proprety
    # @option attributes [Array<OCI::DatabaseManagement::Models::JobDatabase>] :managed_databases_details The value to assign to the {OCI::DatabaseManagement::Models::Job#managed_databases_details #managed_databases_details} proprety
    # @option attributes [String] :database_sub_type The value to assign to the {OCI::DatabaseManagement::Models::Job#database_sub_type #database_sub_type} proprety
    # @option attributes [String] :schedule_type The value to assign to the {OCI::DatabaseManagement::Models::Job#schedule_type #schedule_type} proprety
    # @option attributes [String] :lifecycle_state The value to assign to the {OCI::DatabaseManagement::Models::Job#lifecycle_state #lifecycle_state} proprety
    # @option attributes [String] :timeout The value to assign to the {OCI::DatabaseManagement::Models::Job#timeout #timeout} proprety
    # @option attributes [OCI::DatabaseManagement::Models::JobExecutionResultLocation] :result_location The value to assign to the {OCI::DatabaseManagement::Models::Job#result_location #result_location} proprety
    # @option attributes [OCI::DatabaseManagement::Models::JobScheduleDetails] :schedule_details The value to assign to the {OCI::DatabaseManagement::Models::Job#schedule_details #schedule_details} proprety
    # @option attributes [String] :submission_error_message The value to assign to the {OCI::DatabaseManagement::Models::Job#submission_error_message #submission_error_message} proprety
    # @option attributes [DateTime] :time_created The value to assign to the {OCI::DatabaseManagement::Models::Job#time_created #time_created} proprety
    # @option attributes [DateTime] :time_updated The value to assign to the {OCI::DatabaseManagement::Models::Job#time_updated #time_updated} proprety
    # @option attributes [String] :sql_type The value to assign to the {#sql_type} property
    # @option attributes [String] :sql_text The value to assign to the {#sql_text} property
    # @option attributes [String] :operation_type The value to assign to the {#operation_type} property
    # @option attributes [String] :user_name The value to assign to the {#user_name} property
    # @option attributes [String] :role The value to assign to the {#role} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['jobType'] = 'SQL'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.sql_type = attributes[:'sqlType'] if attributes[:'sqlType']

      raise 'You cannot provide both :sqlType and :sql_type' if attributes.key?(:'sqlType') && attributes.key?(:'sql_type')

      self.sql_type = attributes[:'sql_type'] if attributes[:'sql_type']

      self.sql_text = attributes[:'sqlText'] if attributes[:'sqlText']

      raise 'You cannot provide both :sqlText and :sql_text' if attributes.key?(:'sqlText') && attributes.key?(:'sql_text')

      self.sql_text = attributes[:'sql_text'] if attributes[:'sql_text']

      self.operation_type = attributes[:'operationType'] if attributes[:'operationType']

      raise 'You cannot provide both :operationType and :operation_type' if attributes.key?(:'operationType') && attributes.key?(:'operation_type')

      self.operation_type = attributes[:'operation_type'] if attributes[:'operation_type']

      self.user_name = attributes[:'userName'] if attributes[:'userName']

      raise 'You cannot provide both :userName and :user_name' if attributes.key?(:'userName') && attributes.key?(:'user_name')

      self.user_name = attributes[:'user_name'] if attributes[:'user_name']

      self.role = attributes[:'role'] if attributes[:'role']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] sql_type Object to be assigned
    def sql_type=(sql_type)
      # rubocop:disable Style/ConditionalAssignment
      if sql_type && !SQL_TYPE_ENUM.include?(sql_type)
        OCI.logger.debug("Unknown value for 'sql_type' [" + sql_type + "]. Mapping to 'SQL_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @sql_type = SQL_TYPE_UNKNOWN_ENUM_VALUE
      else
        @sql_type = sql_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] operation_type Object to be assigned
    def operation_type=(operation_type)
      # rubocop:disable Style/ConditionalAssignment
      if operation_type && !OPERATION_TYPE_ENUM.include?(operation_type)
        OCI.logger.debug("Unknown value for 'operation_type' [" + operation_type + "]. Mapping to 'OPERATION_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @operation_type = OPERATION_TYPE_UNKNOWN_ENUM_VALUE
      else
        @operation_type = operation_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] role Object to be assigned
    def role=(role)
      # rubocop:disable Style/ConditionalAssignment
      if role && !ROLE_ENUM.include?(role)
        OCI.logger.debug("Unknown value for 'role' [" + role + "]. Mapping to 'ROLE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @role = ROLE_UNKNOWN_ENUM_VALUE
      else
        @role = role
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
        compartment_id == other.compartment_id &&
        name == other.name &&
        description == other.description &&
        managed_database_group_id == other.managed_database_group_id &&
        managed_database_id == other.managed_database_id &&
        managed_databases_details == other.managed_databases_details &&
        database_sub_type == other.database_sub_type &&
        schedule_type == other.schedule_type &&
        job_type == other.job_type &&
        lifecycle_state == other.lifecycle_state &&
        timeout == other.timeout &&
        result_location == other.result_location &&
        schedule_details == other.schedule_details &&
        submission_error_message == other.submission_error_message &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        sql_type == other.sql_type &&
        sql_text == other.sql_text &&
        operation_type == other.operation_type &&
        user_name == other.user_name &&
        role == other.role
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
      [id, compartment_id, name, description, managed_database_group_id, managed_database_id, managed_databases_details, database_sub_type, schedule_type, job_type, lifecycle_state, timeout, result_location, schedule_details, submission_error_message, time_created, time_updated, sql_type, sql_text, operation_type, user_name, role].hash
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
