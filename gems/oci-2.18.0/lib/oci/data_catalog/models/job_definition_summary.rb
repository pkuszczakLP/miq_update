# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A list of job definition resources. Job definitions define the harvest scope and includes the list of objects
  # to be harvested along with a schedule. The list of objects is usually specified through a combination of object
  # type, regular expressions, or specific names of objects and a sample size for the data harvested.
  #
  class DataCatalog::Models::JobDefinitionSummary
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
      JOB_TYPE_IMPORT_DATA_ASSET = 'IMPORT_DATA_ASSET'.freeze,
      JOB_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_MOVING = 'MOVING'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    JOB_EXECUTION_STATE_ENUM = [
      JOB_EXECUTION_STATE_CREATED = 'CREATED'.freeze,
      JOB_EXECUTION_STATE_IN_PROGRESS = 'IN_PROGRESS'.freeze,
      JOB_EXECUTION_STATE_INACTIVE = 'INACTIVE'.freeze,
      JOB_EXECUTION_STATE_FAILED = 'FAILED'.freeze,
      JOB_EXECUTION_STATE_SUCCEEDED = 'SUCCEEDED'.freeze,
      JOB_EXECUTION_STATE_CANCELED = 'CANCELED'.freeze,
      JOB_EXECUTION_STATE_SUCCEEDED_WITH_WARNINGS = 'SUCCEEDED_WITH_WARNINGS'.freeze,
      JOB_EXECUTION_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    SCHEDULE_TYPE_ENUM = [
      SCHEDULE_TYPE_SCHEDULED = 'SCHEDULED'.freeze,
      SCHEDULE_TYPE_IMMEDIATE = 'IMMEDIATE'.freeze,
      SCHEDULE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Unique key of the job definition resource that is immutable.
    # @return [String]
    attr_accessor :key

    # A user-friendly display name. Does not have to be unique, and it's changeable.
    # Avoid entering confidential information.
    #
    # @return [String]
    attr_accessor :display_name

    # Detailed description of the job definition.
    # @return [String]
    attr_accessor :description

    # The data catalog's OCID.
    # @return [String]
    attr_accessor :catalog_id

    # URI to the job definition instance in the API.
    # @return [String]
    attr_accessor :uri

    # Type of the job definition.
    # @return [String]
    attr_reader :job_type

    # Lifecycle state of the job definition.
    # @return [String]
    attr_reader :lifecycle_state

    # Specify if sample data to be extracted as part of this harvest.
    # @return [BOOLEAN]
    attr_accessor :is_sample_data_extracted

    # The date and time the job definition was created, in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    # Example: `2019-03-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # The key of the connection resource used in harvest, sampling, profiling jobs.
    #
    # @return [String]
    attr_accessor :connection_key

    # Time that the latest job execution started. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    # @return [DateTime]
    attr_accessor :time_latest_execution_started

    # Time that the latest job execution ended or null if it hasn't yet completed.
    # An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    #
    # @return [DateTime]
    attr_accessor :time_latest_execution_ended

    # Status of the latest job execution, such as running, paused, or completed.
    # @return [String]
    attr_reader :job_execution_state

    # Type of job schedule for the latest job executed.
    # @return [String]
    attr_reader :schedule_type

    # Unique key of the data asset to which this job applies, if the job involves a data asset.
    # @return [String]
    attr_accessor :data_asset_key

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'key': :'key',
        'display_name': :'displayName',
        'description': :'description',
        'catalog_id': :'catalogId',
        'uri': :'uri',
        'job_type': :'jobType',
        'lifecycle_state': :'lifecycleState',
        'is_sample_data_extracted': :'isSampleDataExtracted',
        'time_created': :'timeCreated',
        'connection_key': :'connectionKey',
        'time_latest_execution_started': :'timeLatestExecutionStarted',
        'time_latest_execution_ended': :'timeLatestExecutionEnded',
        'job_execution_state': :'jobExecutionState',
        'schedule_type': :'scheduleType',
        'data_asset_key': :'dataAssetKey'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'key': :'String',
        'display_name': :'String',
        'description': :'String',
        'catalog_id': :'String',
        'uri': :'String',
        'job_type': :'String',
        'lifecycle_state': :'String',
        'is_sample_data_extracted': :'BOOLEAN',
        'time_created': :'DateTime',
        'connection_key': :'String',
        'time_latest_execution_started': :'DateTime',
        'time_latest_execution_ended': :'DateTime',
        'job_execution_state': :'String',
        'schedule_type': :'String',
        'data_asset_key': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :key The value to assign to the {#key} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :catalog_id The value to assign to the {#catalog_id} property
    # @option attributes [String] :uri The value to assign to the {#uri} property
    # @option attributes [String] :job_type The value to assign to the {#job_type} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [BOOLEAN] :is_sample_data_extracted The value to assign to the {#is_sample_data_extracted} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [String] :connection_key The value to assign to the {#connection_key} property
    # @option attributes [DateTime] :time_latest_execution_started The value to assign to the {#time_latest_execution_started} property
    # @option attributes [DateTime] :time_latest_execution_ended The value to assign to the {#time_latest_execution_ended} property
    # @option attributes [String] :job_execution_state The value to assign to the {#job_execution_state} property
    # @option attributes [String] :schedule_type The value to assign to the {#schedule_type} property
    # @option attributes [String] :data_asset_key The value to assign to the {#data_asset_key} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.key = attributes[:'key'] if attributes[:'key']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.catalog_id = attributes[:'catalogId'] if attributes[:'catalogId']

      raise 'You cannot provide both :catalogId and :catalog_id' if attributes.key?(:'catalogId') && attributes.key?(:'catalog_id')

      self.catalog_id = attributes[:'catalog_id'] if attributes[:'catalog_id']

      self.uri = attributes[:'uri'] if attributes[:'uri']

      self.job_type = attributes[:'jobType'] if attributes[:'jobType']

      raise 'You cannot provide both :jobType and :job_type' if attributes.key?(:'jobType') && attributes.key?(:'job_type')

      self.job_type = attributes[:'job_type'] if attributes[:'job_type']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.is_sample_data_extracted = attributes[:'isSampleDataExtracted'] unless attributes[:'isSampleDataExtracted'].nil?
      self.is_sample_data_extracted = true if is_sample_data_extracted.nil? && !attributes.key?(:'isSampleDataExtracted') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isSampleDataExtracted and :is_sample_data_extracted' if attributes.key?(:'isSampleDataExtracted') && attributes.key?(:'is_sample_data_extracted')

      self.is_sample_data_extracted = attributes[:'is_sample_data_extracted'] unless attributes[:'is_sample_data_extracted'].nil?
      self.is_sample_data_extracted = true if is_sample_data_extracted.nil? && !attributes.key?(:'isSampleDataExtracted') && !attributes.key?(:'is_sample_data_extracted') # rubocop:disable Style/StringLiterals

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.connection_key = attributes[:'connectionKey'] if attributes[:'connectionKey']

      raise 'You cannot provide both :connectionKey and :connection_key' if attributes.key?(:'connectionKey') && attributes.key?(:'connection_key')

      self.connection_key = attributes[:'connection_key'] if attributes[:'connection_key']

      self.time_latest_execution_started = attributes[:'timeLatestExecutionStarted'] if attributes[:'timeLatestExecutionStarted']

      raise 'You cannot provide both :timeLatestExecutionStarted and :time_latest_execution_started' if attributes.key?(:'timeLatestExecutionStarted') && attributes.key?(:'time_latest_execution_started')

      self.time_latest_execution_started = attributes[:'time_latest_execution_started'] if attributes[:'time_latest_execution_started']

      self.time_latest_execution_ended = attributes[:'timeLatestExecutionEnded'] if attributes[:'timeLatestExecutionEnded']

      raise 'You cannot provide both :timeLatestExecutionEnded and :time_latest_execution_ended' if attributes.key?(:'timeLatestExecutionEnded') && attributes.key?(:'time_latest_execution_ended')

      self.time_latest_execution_ended = attributes[:'time_latest_execution_ended'] if attributes[:'time_latest_execution_ended']

      self.job_execution_state = attributes[:'jobExecutionState'] if attributes[:'jobExecutionState']

      raise 'You cannot provide both :jobExecutionState and :job_execution_state' if attributes.key?(:'jobExecutionState') && attributes.key?(:'job_execution_state')

      self.job_execution_state = attributes[:'job_execution_state'] if attributes[:'job_execution_state']

      self.schedule_type = attributes[:'scheduleType'] if attributes[:'scheduleType']

      raise 'You cannot provide both :scheduleType and :schedule_type' if attributes.key?(:'scheduleType') && attributes.key?(:'schedule_type')

      self.schedule_type = attributes[:'schedule_type'] if attributes[:'schedule_type']

      self.data_asset_key = attributes[:'dataAssetKey'] if attributes[:'dataAssetKey']

      raise 'You cannot provide both :dataAssetKey and :data_asset_key' if attributes.key?(:'dataAssetKey') && attributes.key?(:'data_asset_key')

      self.data_asset_key = attributes[:'data_asset_key'] if attributes[:'data_asset_key']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] job_type Object to be assigned
    def job_type=(job_type)
      # rubocop:disable Style/ConditionalAssignment
      if job_type && !JOB_TYPE_ENUM.include?(job_type)
        OCI.logger.debug("Unknown value for 'job_type' [" + job_type + "]. Mapping to 'JOB_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @job_type = JOB_TYPE_UNKNOWN_ENUM_VALUE
      else
        @job_type = job_type
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

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] job_execution_state Object to be assigned
    def job_execution_state=(job_execution_state)
      # rubocop:disable Style/ConditionalAssignment
      if job_execution_state && !JOB_EXECUTION_STATE_ENUM.include?(job_execution_state)
        OCI.logger.debug("Unknown value for 'job_execution_state' [" + job_execution_state + "]. Mapping to 'JOB_EXECUTION_STATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @job_execution_state = JOB_EXECUTION_STATE_UNKNOWN_ENUM_VALUE
      else
        @job_execution_state = job_execution_state
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] schedule_type Object to be assigned
    def schedule_type=(schedule_type)
      # rubocop:disable Style/ConditionalAssignment
      if schedule_type && !SCHEDULE_TYPE_ENUM.include?(schedule_type)
        OCI.logger.debug("Unknown value for 'schedule_type' [" + schedule_type + "]. Mapping to 'SCHEDULE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @schedule_type = SCHEDULE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @schedule_type = schedule_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        key == other.key &&
        display_name == other.display_name &&
        description == other.description &&
        catalog_id == other.catalog_id &&
        uri == other.uri &&
        job_type == other.job_type &&
        lifecycle_state == other.lifecycle_state &&
        is_sample_data_extracted == other.is_sample_data_extracted &&
        time_created == other.time_created &&
        connection_key == other.connection_key &&
        time_latest_execution_started == other.time_latest_execution_started &&
        time_latest_execution_ended == other.time_latest_execution_ended &&
        job_execution_state == other.job_execution_state &&
        schedule_type == other.schedule_type &&
        data_asset_key == other.data_asset_key
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
      [key, display_name, description, catalog_id, uri, job_type, lifecycle_state, is_sample_data_extracted, time_created, connection_key, time_latest_execution_started, time_latest_execution_ended, job_execution_state, schedule_type, data_asset_key].hash
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