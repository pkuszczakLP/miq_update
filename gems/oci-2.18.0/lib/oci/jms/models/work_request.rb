# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # An asynchronous work request. See [Work Requests](https://docs.cloud.oracle.com/Content/General/Concepts/workrequestoverview.htm).
  class Jms::Models::WorkRequest
    OPERATION_TYPE_ENUM = [
      OPERATION_TYPE_CREATE_FLEET = 'CREATE_FLEET'.freeze,
      OPERATION_TYPE_DELETE_FLEET = 'DELETE_FLEET'.freeze,
      OPERATION_TYPE_MOVE_FLEET = 'MOVE_FLEET'.freeze,
      OPERATION_TYPE_UPDATE_FLEET = 'UPDATE_FLEET'.freeze,
      OPERATION_TYPE_UPDATE_FLEET_AGENT_CONFIGURATION = 'UPDATE_FLEET_AGENT_CONFIGURATION'.freeze,
      OPERATION_TYPE_DELETE_JAVA_INSTALLATION = 'DELETE_JAVA_INSTALLATION'.freeze,
      OPERATION_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    STATUS_ENUM = [
      STATUS_ACCEPTED = 'ACCEPTED'.freeze,
      STATUS_CANCELED = 'CANCELED'.freeze,
      STATUS_CANCELING = 'CANCELING'.freeze,
      STATUS_FAILED = 'FAILED'.freeze,
      STATUS_IN_PROGRESS = 'IN_PROGRESS'.freeze,
      STATUS_SUCCEEDED = 'SUCCEEDED'.freeze,
      STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The asynchronous operation tracked by this work request.
    # @return [String]
    attr_reader :operation_type

    # **[Required]** The status of the work request.
    # @return [String]
    attr_reader :status

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the work request.
    # @return [String]
    attr_accessor :id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment that contains the work request. Work requests should be scoped to
    # the same compartment as the resource the work request affects. If the work request affects multiple resources,
    # and those resources are not in the same compartment, it is up to the service team to pick the primary
    # resource whose compartment should be used.
    #
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The resources that are affected by this work request.
    # @return [Array<OCI::Jms::Models::WorkRequestResource>]
    attr_accessor :resources

    # **[Required]** The percentage complete of the operation tracked by this work request.
    # @return [Float]
    attr_accessor :percent_complete

    # **[Required]** The date and time the request was created (formatted according to [RFC3339](https://datatracker.ietf.org/doc/html/rfc3339)).
    #
    # @return [DateTime]
    attr_accessor :time_accepted

    # The date and time the work request transitioned from _ACCEPTED_ to _IN_PROGRESS_ (formatted according to [RFC3339](https://datatracker.ietf.org/doc/html/rfc3339)).
    #
    # @return [DateTime]
    attr_accessor :time_started

    # The date and time the work request reached a terminal state, either _FAILED_ or _SUCCEEDED_ (formatted according to [RFC3339](https://datatracker.ietf.org/doc/html/rfc3339)).
    #
    # @return [DateTime]
    attr_accessor :time_finished

    # @return [OCI::Jms::Models::Principal]
    attr_accessor :created_by

    # The date and time the work request percentage was last updated. (formatted according to [RFC3339](https://datatracker.ietf.org/doc/html/rfc3339)).
    #
    # @return [DateTime]
    attr_accessor :time_last_updated

    # The total number of tasks to be executed for this work request.
    # @return [Integer]
    attr_accessor :total_task_count

    # The number of tasks had been executed to a terminal state.
    # @return [Integer]
    attr_accessor :completed_task_count

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'operation_type': :'operationType',
        'status': :'status',
        'id': :'id',
        'compartment_id': :'compartmentId',
        'resources': :'resources',
        'percent_complete': :'percentComplete',
        'time_accepted': :'timeAccepted',
        'time_started': :'timeStarted',
        'time_finished': :'timeFinished',
        'created_by': :'createdBy',
        'time_last_updated': :'timeLastUpdated',
        'total_task_count': :'totalTaskCount',
        'completed_task_count': :'completedTaskCount'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'operation_type': :'String',
        'status': :'String',
        'id': :'String',
        'compartment_id': :'String',
        'resources': :'Array<OCI::Jms::Models::WorkRequestResource>',
        'percent_complete': :'Float',
        'time_accepted': :'DateTime',
        'time_started': :'DateTime',
        'time_finished': :'DateTime',
        'created_by': :'OCI::Jms::Models::Principal',
        'time_last_updated': :'DateTime',
        'total_task_count': :'Integer',
        'completed_task_count': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :operation_type The value to assign to the {#operation_type} property
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [Array<OCI::Jms::Models::WorkRequestResource>] :resources The value to assign to the {#resources} property
    # @option attributes [Float] :percent_complete The value to assign to the {#percent_complete} property
    # @option attributes [DateTime] :time_accepted The value to assign to the {#time_accepted} property
    # @option attributes [DateTime] :time_started The value to assign to the {#time_started} property
    # @option attributes [DateTime] :time_finished The value to assign to the {#time_finished} property
    # @option attributes [OCI::Jms::Models::Principal] :created_by The value to assign to the {#created_by} property
    # @option attributes [DateTime] :time_last_updated The value to assign to the {#time_last_updated} property
    # @option attributes [Integer] :total_task_count The value to assign to the {#total_task_count} property
    # @option attributes [Integer] :completed_task_count The value to assign to the {#completed_task_count} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.operation_type = attributes[:'operationType'] if attributes[:'operationType']

      raise 'You cannot provide both :operationType and :operation_type' if attributes.key?(:'operationType') && attributes.key?(:'operation_type')

      self.operation_type = attributes[:'operation_type'] if attributes[:'operation_type']

      self.status = attributes[:'status'] if attributes[:'status']

      self.id = attributes[:'id'] if attributes[:'id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.resources = attributes[:'resources'] if attributes[:'resources']

      self.percent_complete = attributes[:'percentComplete'] if attributes[:'percentComplete']

      raise 'You cannot provide both :percentComplete and :percent_complete' if attributes.key?(:'percentComplete') && attributes.key?(:'percent_complete')

      self.percent_complete = attributes[:'percent_complete'] if attributes[:'percent_complete']

      self.time_accepted = attributes[:'timeAccepted'] if attributes[:'timeAccepted']

      raise 'You cannot provide both :timeAccepted and :time_accepted' if attributes.key?(:'timeAccepted') && attributes.key?(:'time_accepted')

      self.time_accepted = attributes[:'time_accepted'] if attributes[:'time_accepted']

      self.time_started = attributes[:'timeStarted'] if attributes[:'timeStarted']

      raise 'You cannot provide both :timeStarted and :time_started' if attributes.key?(:'timeStarted') && attributes.key?(:'time_started')

      self.time_started = attributes[:'time_started'] if attributes[:'time_started']

      self.time_finished = attributes[:'timeFinished'] if attributes[:'timeFinished']

      raise 'You cannot provide both :timeFinished and :time_finished' if attributes.key?(:'timeFinished') && attributes.key?(:'time_finished')

      self.time_finished = attributes[:'time_finished'] if attributes[:'time_finished']

      self.created_by = attributes[:'createdBy'] if attributes[:'createdBy']

      raise 'You cannot provide both :createdBy and :created_by' if attributes.key?(:'createdBy') && attributes.key?(:'created_by')

      self.created_by = attributes[:'created_by'] if attributes[:'created_by']

      self.time_last_updated = attributes[:'timeLastUpdated'] if attributes[:'timeLastUpdated']

      raise 'You cannot provide both :timeLastUpdated and :time_last_updated' if attributes.key?(:'timeLastUpdated') && attributes.key?(:'time_last_updated')

      self.time_last_updated = attributes[:'time_last_updated'] if attributes[:'time_last_updated']

      self.total_task_count = attributes[:'totalTaskCount'] if attributes[:'totalTaskCount']

      raise 'You cannot provide both :totalTaskCount and :total_task_count' if attributes.key?(:'totalTaskCount') && attributes.key?(:'total_task_count')

      self.total_task_count = attributes[:'total_task_count'] if attributes[:'total_task_count']

      self.completed_task_count = attributes[:'completedTaskCount'] if attributes[:'completedTaskCount']

      raise 'You cannot provide both :completedTaskCount and :completed_task_count' if attributes.key?(:'completedTaskCount') && attributes.key?(:'completed_task_count')

      self.completed_task_count = attributes[:'completed_task_count'] if attributes[:'completed_task_count']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

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

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        operation_type == other.operation_type &&
        status == other.status &&
        id == other.id &&
        compartment_id == other.compartment_id &&
        resources == other.resources &&
        percent_complete == other.percent_complete &&
        time_accepted == other.time_accepted &&
        time_started == other.time_started &&
        time_finished == other.time_finished &&
        created_by == other.created_by &&
        time_last_updated == other.time_last_updated &&
        total_task_count == other.total_task_count &&
        completed_task_count == other.completed_task_count
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
      [operation_type, status, id, compartment_id, resources, percent_complete, time_accepted, time_started, time_finished, created_by, time_last_updated, total_task_count, completed_task_count].hash
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
