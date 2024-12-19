# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The request to start a SQL tuning task.
  class DatabaseManagement::Models::StartSqlTuningTaskDetails
    SCOPE_ENUM = [
      SCOPE_LIMITED = 'LIMITED'.freeze,
      SCOPE_COMPREHENSIVE = 'COMPREHENSIVE'.freeze
    ].freeze

    # **[Required]** The name of the SQL tuning task. The name is unique per user in a database, and it is case-sensitive.
    # @return [String]
    attr_accessor :task_name

    # The description of the SQL tuning task.
    # @return [String]
    attr_accessor :task_description

    # This attribute is required.
    # @return [OCI::DatabaseManagement::Models::SqlTuningTaskCredentialDetails]
    attr_accessor :credential_details

    # **[Required]** The time limit for running the SQL tuning task.
    # @return [Integer]
    attr_accessor :total_time_limit_in_minutes

    # **[Required]** The scope for the SQL tuning task. For LIMITED scope, the SQL profile recommendation
    # is excluded, so the task is executed faster. For COMPREHENSIVE scope, the SQL profile recommendation
    # is included.
    #
    # @return [String]
    attr_reader :scope

    # The time limit per SQL statement (in minutes). This is for a task with the COMPREHENSIVE scope.
    # The time limit per SQL statement should not be more than the total time limit.
    #
    # @return [Integer]
    attr_accessor :statement_time_limit_in_minutes

    # @return [OCI::DatabaseManagement::Models::SqlTuningSetInput]
    attr_accessor :sql_tuning_set

    # The details of the SQL statement on which tuning is performed.
    # To obtain the details of the SQL statement, you must provide either the sqlTuningSet
    # or the tuple of sqlDetails/timeStarted/timeEnded.
    #
    # @return [Array<OCI::DatabaseManagement::Models::SqlTuningTaskSqlDetail>]
    attr_accessor :sql_details

    # The start time of the period in which SQL statements are running.
    # @return [DateTime]
    attr_accessor :time_started

    # The end time of the period in which SQL statements are running.
    # @return [DateTime]
    attr_accessor :time_ended

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'task_name': :'taskName',
        'task_description': :'taskDescription',
        'credential_details': :'credentialDetails',
        'total_time_limit_in_minutes': :'totalTimeLimitInMinutes',
        'scope': :'scope',
        'statement_time_limit_in_minutes': :'statementTimeLimitInMinutes',
        'sql_tuning_set': :'sqlTuningSet',
        'sql_details': :'sqlDetails',
        'time_started': :'timeStarted',
        'time_ended': :'timeEnded'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'task_name': :'String',
        'task_description': :'String',
        'credential_details': :'OCI::DatabaseManagement::Models::SqlTuningTaskCredentialDetails',
        'total_time_limit_in_minutes': :'Integer',
        'scope': :'String',
        'statement_time_limit_in_minutes': :'Integer',
        'sql_tuning_set': :'OCI::DatabaseManagement::Models::SqlTuningSetInput',
        'sql_details': :'Array<OCI::DatabaseManagement::Models::SqlTuningTaskSqlDetail>',
        'time_started': :'DateTime',
        'time_ended': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :task_name The value to assign to the {#task_name} property
    # @option attributes [String] :task_description The value to assign to the {#task_description} property
    # @option attributes [OCI::DatabaseManagement::Models::SqlTuningTaskCredentialDetails] :credential_details The value to assign to the {#credential_details} property
    # @option attributes [Integer] :total_time_limit_in_minutes The value to assign to the {#total_time_limit_in_minutes} property
    # @option attributes [String] :scope The value to assign to the {#scope} property
    # @option attributes [Integer] :statement_time_limit_in_minutes The value to assign to the {#statement_time_limit_in_minutes} property
    # @option attributes [OCI::DatabaseManagement::Models::SqlTuningSetInput] :sql_tuning_set The value to assign to the {#sql_tuning_set} property
    # @option attributes [Array<OCI::DatabaseManagement::Models::SqlTuningTaskSqlDetail>] :sql_details The value to assign to the {#sql_details} property
    # @option attributes [DateTime] :time_started The value to assign to the {#time_started} property
    # @option attributes [DateTime] :time_ended The value to assign to the {#time_ended} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.task_name = attributes[:'taskName'] if attributes[:'taskName']

      raise 'You cannot provide both :taskName and :task_name' if attributes.key?(:'taskName') && attributes.key?(:'task_name')

      self.task_name = attributes[:'task_name'] if attributes[:'task_name']

      self.task_description = attributes[:'taskDescription'] if attributes[:'taskDescription']

      raise 'You cannot provide both :taskDescription and :task_description' if attributes.key?(:'taskDescription') && attributes.key?(:'task_description')

      self.task_description = attributes[:'task_description'] if attributes[:'task_description']

      self.credential_details = attributes[:'credentialDetails'] if attributes[:'credentialDetails']

      raise 'You cannot provide both :credentialDetails and :credential_details' if attributes.key?(:'credentialDetails') && attributes.key?(:'credential_details')

      self.credential_details = attributes[:'credential_details'] if attributes[:'credential_details']

      self.total_time_limit_in_minutes = attributes[:'totalTimeLimitInMinutes'] if attributes[:'totalTimeLimitInMinutes']

      raise 'You cannot provide both :totalTimeLimitInMinutes and :total_time_limit_in_minutes' if attributes.key?(:'totalTimeLimitInMinutes') && attributes.key?(:'total_time_limit_in_minutes')

      self.total_time_limit_in_minutes = attributes[:'total_time_limit_in_minutes'] if attributes[:'total_time_limit_in_minutes']

      self.scope = attributes[:'scope'] if attributes[:'scope']

      self.statement_time_limit_in_minutes = attributes[:'statementTimeLimitInMinutes'] if attributes[:'statementTimeLimitInMinutes']

      raise 'You cannot provide both :statementTimeLimitInMinutes and :statement_time_limit_in_minutes' if attributes.key?(:'statementTimeLimitInMinutes') && attributes.key?(:'statement_time_limit_in_minutes')

      self.statement_time_limit_in_minutes = attributes[:'statement_time_limit_in_minutes'] if attributes[:'statement_time_limit_in_minutes']

      self.sql_tuning_set = attributes[:'sqlTuningSet'] if attributes[:'sqlTuningSet']

      raise 'You cannot provide both :sqlTuningSet and :sql_tuning_set' if attributes.key?(:'sqlTuningSet') && attributes.key?(:'sql_tuning_set')

      self.sql_tuning_set = attributes[:'sql_tuning_set'] if attributes[:'sql_tuning_set']

      self.sql_details = attributes[:'sqlDetails'] if attributes[:'sqlDetails']

      raise 'You cannot provide both :sqlDetails and :sql_details' if attributes.key?(:'sqlDetails') && attributes.key?(:'sql_details')

      self.sql_details = attributes[:'sql_details'] if attributes[:'sql_details']

      self.time_started = attributes[:'timeStarted'] if attributes[:'timeStarted']

      raise 'You cannot provide both :timeStarted and :time_started' if attributes.key?(:'timeStarted') && attributes.key?(:'time_started')

      self.time_started = attributes[:'time_started'] if attributes[:'time_started']

      self.time_ended = attributes[:'timeEnded'] if attributes[:'timeEnded']

      raise 'You cannot provide both :timeEnded and :time_ended' if attributes.key?(:'timeEnded') && attributes.key?(:'time_ended')

      self.time_ended = attributes[:'time_ended'] if attributes[:'time_ended']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] scope Object to be assigned
    def scope=(scope)
      raise "Invalid value for 'scope': this must be one of the values in SCOPE_ENUM." if scope && !SCOPE_ENUM.include?(scope)

      @scope = scope
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        task_name == other.task_name &&
        task_description == other.task_description &&
        credential_details == other.credential_details &&
        total_time_limit_in_minutes == other.total_time_limit_in_minutes &&
        scope == other.scope &&
        statement_time_limit_in_minutes == other.statement_time_limit_in_minutes &&
        sql_tuning_set == other.sql_tuning_set &&
        sql_details == other.sql_details &&
        time_started == other.time_started &&
        time_ended == other.time_ended
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
      [task_name, task_description, credential_details, total_time_limit_in_minutes, scope, statement_time_limit_in_minutes, sql_tuning_set, sql_details, time_started, time_ended].hash
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
