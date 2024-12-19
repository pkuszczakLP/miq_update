# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The details required to create a job.
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class DatabaseManagement::Models::CreateJobDetails
    DATABASE_SUB_TYPE_ENUM = [
      DATABASE_SUB_TYPE_CDB = 'CDB'.freeze,
      DATABASE_SUB_TYPE_PDB = 'PDB'.freeze,
      DATABASE_SUB_TYPE_NON_CDB = 'NON_CDB'.freeze,
      DATABASE_SUB_TYPE_ACD = 'ACD'.freeze,
      DATABASE_SUB_TYPE_ADB = 'ADB'.freeze
    ].freeze

    JOB_TYPE_ENUM = [
      JOB_TYPE_SQL = 'SQL'.freeze
    ].freeze

    # **[Required]** The name of the job. Valid characters are uppercase or lowercase letters,
    # numbers, and \"_\". The name of the job cannot be modified. It must be unique
    # in the compartment and must begin with an alphabetic character.
    #
    # @return [String]
    attr_accessor :name

    # The description of the job.
    # @return [String]
    attr_accessor :description

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment in which the job resides.
    # @return [String]
    attr_accessor :compartment_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database Group where the job has to be executed.
    # @return [String]
    attr_accessor :managed_database_group_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database where the job has to be executed.
    # @return [String]
    attr_accessor :managed_database_id

    # The subtype of the Oracle Database where the job has to be executed. Only applicable when managedDatabaseGroupId is provided.
    # @return [String]
    attr_reader :database_sub_type

    # **[Required]** The schedule type of the job.
    # @return [String]
    attr_accessor :schedule_type

    # **[Required]** The type of job.
    # @return [String]
    attr_reader :job_type

    # The job timeout duration, which is expressed like \"1h 10m 15s\".
    # @return [String]
    attr_accessor :timeout

    # @return [OCI::DatabaseManagement::Models::JobExecutionResultLocation]
    attr_accessor :result_location

    # @return [OCI::DatabaseManagement::Models::JobScheduleDetails]
    attr_accessor :schedule_details

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'description': :'description',
        'compartment_id': :'compartmentId',
        'managed_database_group_id': :'managedDatabaseGroupId',
        'managed_database_id': :'managedDatabaseId',
        'database_sub_type': :'databaseSubType',
        'schedule_type': :'scheduleType',
        'job_type': :'jobType',
        'timeout': :'timeout',
        'result_location': :'resultLocation',
        'schedule_details': :'scheduleDetails'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'description': :'String',
        'compartment_id': :'String',
        'managed_database_group_id': :'String',
        'managed_database_id': :'String',
        'database_sub_type': :'String',
        'schedule_type': :'String',
        'job_type': :'String',
        'timeout': :'String',
        'result_location': :'OCI::DatabaseManagement::Models::JobExecutionResultLocation',
        'schedule_details': :'OCI::DatabaseManagement::Models::JobScheduleDetails'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'jobType'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::DatabaseManagement::Models::CreateSqlJobDetails' if type == 'SQL'

      # TODO: Log a warning when the subtype is not found.
      'OCI::DatabaseManagement::Models::CreateJobDetails'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :managed_database_group_id The value to assign to the {#managed_database_group_id} property
    # @option attributes [String] :managed_database_id The value to assign to the {#managed_database_id} property
    # @option attributes [String] :database_sub_type The value to assign to the {#database_sub_type} property
    # @option attributes [String] :schedule_type The value to assign to the {#schedule_type} property
    # @option attributes [String] :job_type The value to assign to the {#job_type} property
    # @option attributes [String] :timeout The value to assign to the {#timeout} property
    # @option attributes [OCI::DatabaseManagement::Models::JobExecutionResultLocation] :result_location The value to assign to the {#result_location} property
    # @option attributes [OCI::DatabaseManagement::Models::JobScheduleDetails] :schedule_details The value to assign to the {#schedule_details} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.managed_database_group_id = attributes[:'managedDatabaseGroupId'] if attributes[:'managedDatabaseGroupId']

      raise 'You cannot provide both :managedDatabaseGroupId and :managed_database_group_id' if attributes.key?(:'managedDatabaseGroupId') && attributes.key?(:'managed_database_group_id')

      self.managed_database_group_id = attributes[:'managed_database_group_id'] if attributes[:'managed_database_group_id']

      self.managed_database_id = attributes[:'managedDatabaseId'] if attributes[:'managedDatabaseId']

      raise 'You cannot provide both :managedDatabaseId and :managed_database_id' if attributes.key?(:'managedDatabaseId') && attributes.key?(:'managed_database_id')

      self.managed_database_id = attributes[:'managed_database_id'] if attributes[:'managed_database_id']

      self.database_sub_type = attributes[:'databaseSubType'] if attributes[:'databaseSubType']

      raise 'You cannot provide both :databaseSubType and :database_sub_type' if attributes.key?(:'databaseSubType') && attributes.key?(:'database_sub_type')

      self.database_sub_type = attributes[:'database_sub_type'] if attributes[:'database_sub_type']

      self.schedule_type = attributes[:'scheduleType'] if attributes[:'scheduleType']

      raise 'You cannot provide both :scheduleType and :schedule_type' if attributes.key?(:'scheduleType') && attributes.key?(:'schedule_type')

      self.schedule_type = attributes[:'schedule_type'] if attributes[:'schedule_type']

      self.job_type = attributes[:'jobType'] if attributes[:'jobType']

      raise 'You cannot provide both :jobType and :job_type' if attributes.key?(:'jobType') && attributes.key?(:'job_type')

      self.job_type = attributes[:'job_type'] if attributes[:'job_type']

      self.timeout = attributes[:'timeout'] if attributes[:'timeout']

      self.result_location = attributes[:'resultLocation'] if attributes[:'resultLocation']

      raise 'You cannot provide both :resultLocation and :result_location' if attributes.key?(:'resultLocation') && attributes.key?(:'result_location')

      self.result_location = attributes[:'result_location'] if attributes[:'result_location']

      self.schedule_details = attributes[:'scheduleDetails'] if attributes[:'scheduleDetails']

      raise 'You cannot provide both :scheduleDetails and :schedule_details' if attributes.key?(:'scheduleDetails') && attributes.key?(:'schedule_details')

      self.schedule_details = attributes[:'schedule_details'] if attributes[:'schedule_details']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] database_sub_type Object to be assigned
    def database_sub_type=(database_sub_type)
      raise "Invalid value for 'database_sub_type': this must be one of the values in DATABASE_SUB_TYPE_ENUM." if database_sub_type && !DATABASE_SUB_TYPE_ENUM.include?(database_sub_type)

      @database_sub_type = database_sub_type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] job_type Object to be assigned
    def job_type=(job_type)
      raise "Invalid value for 'job_type': this must be one of the values in JOB_TYPE_ENUM." if job_type && !JOB_TYPE_ENUM.include?(job_type)

      @job_type = job_type
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        name == other.name &&
        description == other.description &&
        compartment_id == other.compartment_id &&
        managed_database_group_id == other.managed_database_group_id &&
        managed_database_id == other.managed_database_id &&
        database_sub_type == other.database_sub_type &&
        schedule_type == other.schedule_type &&
        job_type == other.job_type &&
        timeout == other.timeout &&
        result_location == other.result_location &&
        schedule_details == other.schedule_details
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
      [name, description, compartment_id, managed_database_group_id, managed_database_id, database_sub_type, schedule_type, job_type, timeout, result_location, schedule_details].hash
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
