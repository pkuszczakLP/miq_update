# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A summary of a specific job run.
  class DatabaseManagement::Models::JobRunSummary
    # **[Required]** The identifier of the job run.
    # @return [String]
    attr_accessor :id

    # **[Required]** The name of the job run.
    # @return [String]
    attr_accessor :name

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment in which the parent job resides.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the parent job.
    # @return [String]
    attr_accessor :job_id

    # **[Required]** The name of the parent job.
    # @return [String]
    attr_accessor :job_name

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database Group where the parent job has to be executed.
    # @return [String]
    attr_accessor :managed_database_group_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database where the parent job has to be executed.
    # @return [String]
    attr_accessor :managed_database_id

    # **[Required]** The status of the job run.
    # @return [String]
    attr_accessor :run_status

    # **[Required]** The date and time when the job run was submitted.
    # @return [DateTime]
    attr_accessor :time_submitted

    # **[Required]** The date and time when the job run was last updated.
    # @return [DateTime]
    attr_accessor :time_updated

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'name': :'name',
        'compartment_id': :'compartmentId',
        'job_id': :'jobId',
        'job_name': :'jobName',
        'managed_database_group_id': :'managedDatabaseGroupId',
        'managed_database_id': :'managedDatabaseId',
        'run_status': :'runStatus',
        'time_submitted': :'timeSubmitted',
        'time_updated': :'timeUpdated'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'name': :'String',
        'compartment_id': :'String',
        'job_id': :'String',
        'job_name': :'String',
        'managed_database_group_id': :'String',
        'managed_database_id': :'String',
        'run_status': :'String',
        'time_submitted': :'DateTime',
        'time_updated': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :job_id The value to assign to the {#job_id} property
    # @option attributes [String] :job_name The value to assign to the {#job_name} property
    # @option attributes [String] :managed_database_group_id The value to assign to the {#managed_database_group_id} property
    # @option attributes [String] :managed_database_id The value to assign to the {#managed_database_id} property
    # @option attributes [String] :run_status The value to assign to the {#run_status} property
    # @option attributes [DateTime] :time_submitted The value to assign to the {#time_submitted} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.name = attributes[:'name'] if attributes[:'name']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.job_id = attributes[:'jobId'] if attributes[:'jobId']

      raise 'You cannot provide both :jobId and :job_id' if attributes.key?(:'jobId') && attributes.key?(:'job_id')

      self.job_id = attributes[:'job_id'] if attributes[:'job_id']

      self.job_name = attributes[:'jobName'] if attributes[:'jobName']

      raise 'You cannot provide both :jobName and :job_name' if attributes.key?(:'jobName') && attributes.key?(:'job_name')

      self.job_name = attributes[:'job_name'] if attributes[:'job_name']

      self.managed_database_group_id = attributes[:'managedDatabaseGroupId'] if attributes[:'managedDatabaseGroupId']

      raise 'You cannot provide both :managedDatabaseGroupId and :managed_database_group_id' if attributes.key?(:'managedDatabaseGroupId') && attributes.key?(:'managed_database_group_id')

      self.managed_database_group_id = attributes[:'managed_database_group_id'] if attributes[:'managed_database_group_id']

      self.managed_database_id = attributes[:'managedDatabaseId'] if attributes[:'managedDatabaseId']

      raise 'You cannot provide both :managedDatabaseId and :managed_database_id' if attributes.key?(:'managedDatabaseId') && attributes.key?(:'managed_database_id')

      self.managed_database_id = attributes[:'managed_database_id'] if attributes[:'managed_database_id']

      self.run_status = attributes[:'runStatus'] if attributes[:'runStatus']

      raise 'You cannot provide both :runStatus and :run_status' if attributes.key?(:'runStatus') && attributes.key?(:'run_status')

      self.run_status = attributes[:'run_status'] if attributes[:'run_status']

      self.time_submitted = attributes[:'timeSubmitted'] if attributes[:'timeSubmitted']

      raise 'You cannot provide both :timeSubmitted and :time_submitted' if attributes.key?(:'timeSubmitted') && attributes.key?(:'time_submitted')

      self.time_submitted = attributes[:'time_submitted'] if attributes[:'time_submitted']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        name == other.name &&
        compartment_id == other.compartment_id &&
        job_id == other.job_id &&
        job_name == other.job_name &&
        managed_database_group_id == other.managed_database_group_id &&
        managed_database_id == other.managed_database_id &&
        run_status == other.run_status &&
        time_submitted == other.time_submitted &&
        time_updated == other.time_updated
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
      [id, name, compartment_id, job_id, job_name, managed_database_group_id, managed_database_id, run_status, time_submitted, time_updated].hash
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
