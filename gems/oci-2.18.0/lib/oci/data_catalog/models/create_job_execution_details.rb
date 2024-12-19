# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Properties for creating a new job execution.
  class DataCatalog::Models::CreateJobExecutionDetails
    JOB_TYPE_ENUM = [
      JOB_TYPE_HARVEST = 'HARVEST'.freeze,
      JOB_TYPE_PROFILING = 'PROFILING'.freeze,
      JOB_TYPE_SAMPLING = 'SAMPLING'.freeze,
      JOB_TYPE_PREVIEW = 'PREVIEW'.freeze,
      JOB_TYPE_IMPORT = 'IMPORT'.freeze,
      JOB_TYPE_EXPORT = 'EXPORT'.freeze,
      JOB_TYPE_IMPORT_GLOSSARY = 'IMPORT_GLOSSARY'.freeze,
      JOB_TYPE_EXPORT_GLOSSARY = 'EXPORT_GLOSSARY'.freeze,
      JOB_TYPE_INTERNAL = 'INTERNAL'.freeze,
      JOB_TYPE_PURGE = 'PURGE'.freeze,
      JOB_TYPE_IMMEDIATE = 'IMMEDIATE'.freeze,
      JOB_TYPE_SCHEDULED = 'SCHEDULED'.freeze,
      JOB_TYPE_IMMEDIATE_EXECUTION = 'IMMEDIATE_EXECUTION'.freeze,
      JOB_TYPE_SCHEDULED_EXECUTION = 'SCHEDULED_EXECUTION'.freeze,
      JOB_TYPE_SCHEDULED_EXECUTION_INSTANCE = 'SCHEDULED_EXECUTION_INSTANCE'.freeze,
      JOB_TYPE_ASYNC_DELETE = 'ASYNC_DELETE'.freeze,
      JOB_TYPE_IMPORT_DATA_ASSET = 'IMPORT_DATA_ASSET'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATED = 'CREATED'.freeze,
      LIFECYCLE_STATE_IN_PROGRESS = 'IN_PROGRESS'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_SUCCEEDED = 'SUCCEEDED'.freeze,
      LIFECYCLE_STATE_CANCELED = 'CANCELED'.freeze,
      LIFECYCLE_STATE_SUCCEEDED_WITH_WARNINGS = 'SUCCEEDED_WITH_WARNINGS'.freeze
    ].freeze

    # Sub-type of this job execution.
    # @return [String]
    attr_accessor :sub_type

    # Type of the job execution.
    # @return [String]
    attr_reader :job_type

    # The unique key of the parent execution or null if this job execution has no parent.
    # @return [String]
    attr_accessor :parent_key

    # Time that job execution started. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    # @return [DateTime]
    attr_accessor :time_started

    # Time that the job execution ended or null if it hasn't yet completed.
    # An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    #
    # @return [DateTime]
    attr_accessor :time_ended

    # Status of the job execution, such as running, paused, or completed.
    # @return [String]
    attr_reader :lifecycle_state

    # Error code returned from the job execution or null if job is still running or didn't return an error.
    #
    # @return [String]
    attr_accessor :error_code

    # Error message returned from the job execution or null if job is still running or didn't return an error.
    #
    # @return [String]
    attr_accessor :error_message

    # The unique key of the triggering external scheduler resource or null if this job execution is not externally triggered.
    # @return [String]
    attr_accessor :schedule_instance_key

    # Process identifier related to the job execution if the job is an external job.
    # @return [String]
    attr_accessor :process_key

    # If the job is an external process, then a URL of the job for accessing this resource and its status.
    #
    # @return [String]
    attr_accessor :external_url

    # An identifier used for log message correlation.
    #
    # @return [String]
    attr_accessor :event_key

    # The key of the associated data entity resource.
    # @return [String]
    attr_accessor :data_entity_key

    # A map of maps that contains the execution context properties which are specific to a job execution. Each job
    # execution may define it's set of required and optional properties. The map keys are category names and the
    # values are maps of property name to property value. Every property is contained inside of a category. Most
    # job executions have required properties within the \"default\" category.
    # Example: `{\"properties\": { \"default\": { \"host\": \"host1\", \"port\": \"1521\", \"database\": \"orcl\"}}}`
    #
    # @return [Hash<String, Hash<String, String>>]
    attr_accessor :properties

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'sub_type': :'subType',
        'job_type': :'jobType',
        'parent_key': :'parentKey',
        'time_started': :'timeStarted',
        'time_ended': :'timeEnded',
        'lifecycle_state': :'lifecycleState',
        'error_code': :'errorCode',
        'error_message': :'errorMessage',
        'schedule_instance_key': :'scheduleInstanceKey',
        'process_key': :'processKey',
        'external_url': :'externalUrl',
        'event_key': :'eventKey',
        'data_entity_key': :'dataEntityKey',
        'properties': :'properties'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'sub_type': :'String',
        'job_type': :'String',
        'parent_key': :'String',
        'time_started': :'DateTime',
        'time_ended': :'DateTime',
        'lifecycle_state': :'String',
        'error_code': :'String',
        'error_message': :'String',
        'schedule_instance_key': :'String',
        'process_key': :'String',
        'external_url': :'String',
        'event_key': :'String',
        'data_entity_key': :'String',
        'properties': :'Hash<String, Hash<String, String>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :sub_type The value to assign to the {#sub_type} property
    # @option attributes [String] :job_type The value to assign to the {#job_type} property
    # @option attributes [String] :parent_key The value to assign to the {#parent_key} property
    # @option attributes [DateTime] :time_started The value to assign to the {#time_started} property
    # @option attributes [DateTime] :time_ended The value to assign to the {#time_ended} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :error_code The value to assign to the {#error_code} property
    # @option attributes [String] :error_message The value to assign to the {#error_message} property
    # @option attributes [String] :schedule_instance_key The value to assign to the {#schedule_instance_key} property
    # @option attributes [String] :process_key The value to assign to the {#process_key} property
    # @option attributes [String] :external_url The value to assign to the {#external_url} property
    # @option attributes [String] :event_key The value to assign to the {#event_key} property
    # @option attributes [String] :data_entity_key The value to assign to the {#data_entity_key} property
    # @option attributes [Hash<String, Hash<String, String>>] :properties The value to assign to the {#properties} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.sub_type = attributes[:'subType'] if attributes[:'subType']

      raise 'You cannot provide both :subType and :sub_type' if attributes.key?(:'subType') && attributes.key?(:'sub_type')

      self.sub_type = attributes[:'sub_type'] if attributes[:'sub_type']

      self.job_type = attributes[:'jobType'] if attributes[:'jobType']

      raise 'You cannot provide both :jobType and :job_type' if attributes.key?(:'jobType') && attributes.key?(:'job_type')

      self.job_type = attributes[:'job_type'] if attributes[:'job_type']

      self.parent_key = attributes[:'parentKey'] if attributes[:'parentKey']

      raise 'You cannot provide both :parentKey and :parent_key' if attributes.key?(:'parentKey') && attributes.key?(:'parent_key')

      self.parent_key = attributes[:'parent_key'] if attributes[:'parent_key']

      self.time_started = attributes[:'timeStarted'] if attributes[:'timeStarted']

      raise 'You cannot provide both :timeStarted and :time_started' if attributes.key?(:'timeStarted') && attributes.key?(:'time_started')

      self.time_started = attributes[:'time_started'] if attributes[:'time_started']

      self.time_ended = attributes[:'timeEnded'] if attributes[:'timeEnded']

      raise 'You cannot provide both :timeEnded and :time_ended' if attributes.key?(:'timeEnded') && attributes.key?(:'time_ended')

      self.time_ended = attributes[:'time_ended'] if attributes[:'time_ended']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.error_code = attributes[:'errorCode'] if attributes[:'errorCode']

      raise 'You cannot provide both :errorCode and :error_code' if attributes.key?(:'errorCode') && attributes.key?(:'error_code')

      self.error_code = attributes[:'error_code'] if attributes[:'error_code']

      self.error_message = attributes[:'errorMessage'] if attributes[:'errorMessage']

      raise 'You cannot provide both :errorMessage and :error_message' if attributes.key?(:'errorMessage') && attributes.key?(:'error_message')

      self.error_message = attributes[:'error_message'] if attributes[:'error_message']

      self.schedule_instance_key = attributes[:'scheduleInstanceKey'] if attributes[:'scheduleInstanceKey']

      raise 'You cannot provide both :scheduleInstanceKey and :schedule_instance_key' if attributes.key?(:'scheduleInstanceKey') && attributes.key?(:'schedule_instance_key')

      self.schedule_instance_key = attributes[:'schedule_instance_key'] if attributes[:'schedule_instance_key']

      self.process_key = attributes[:'processKey'] if attributes[:'processKey']

      raise 'You cannot provide both :processKey and :process_key' if attributes.key?(:'processKey') && attributes.key?(:'process_key')

      self.process_key = attributes[:'process_key'] if attributes[:'process_key']

      self.external_url = attributes[:'externalUrl'] if attributes[:'externalUrl']

      raise 'You cannot provide both :externalUrl and :external_url' if attributes.key?(:'externalUrl') && attributes.key?(:'external_url')

      self.external_url = attributes[:'external_url'] if attributes[:'external_url']

      self.event_key = attributes[:'eventKey'] if attributes[:'eventKey']

      raise 'You cannot provide both :eventKey and :event_key' if attributes.key?(:'eventKey') && attributes.key?(:'event_key')

      self.event_key = attributes[:'event_key'] if attributes[:'event_key']

      self.data_entity_key = attributes[:'dataEntityKey'] if attributes[:'dataEntityKey']

      raise 'You cannot provide both :dataEntityKey and :data_entity_key' if attributes.key?(:'dataEntityKey') && attributes.key?(:'data_entity_key')

      self.data_entity_key = attributes[:'data_entity_key'] if attributes[:'data_entity_key']

      self.properties = attributes[:'properties'] if attributes[:'properties']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] job_type Object to be assigned
    def job_type=(job_type)
      raise "Invalid value for 'job_type': this must be one of the values in JOB_TYPE_ENUM." if job_type && !JOB_TYPE_ENUM.include?(job_type)

      @job_type = job_type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] lifecycle_state Object to be assigned
    def lifecycle_state=(lifecycle_state)
      raise "Invalid value for 'lifecycle_state': this must be one of the values in LIFECYCLE_STATE_ENUM." if lifecycle_state && !LIFECYCLE_STATE_ENUM.include?(lifecycle_state)

      @lifecycle_state = lifecycle_state
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        sub_type == other.sub_type &&
        job_type == other.job_type &&
        parent_key == other.parent_key &&
        time_started == other.time_started &&
        time_ended == other.time_ended &&
        lifecycle_state == other.lifecycle_state &&
        error_code == other.error_code &&
        error_message == other.error_message &&
        schedule_instance_key == other.schedule_instance_key &&
        process_key == other.process_key &&
        external_url == other.external_url &&
        event_key == other.event_key &&
        data_entity_key == other.data_entity_key &&
        properties == other.properties
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
      [sub_type, job_type, parent_key, time_started, time_ended, lifecycle_state, error_code, error_message, schedule_instance_key, process_key, external_url, event_key, data_entity_key, properties].hash
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
