# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'
require_relative 'scheduled_task'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Log analytics scheduled task resource.
  #
  class LogAnalytics::Models::StandardTask < LogAnalytics::Models::ScheduledTask
    LAST_EXECUTION_STATUS_ENUM = [
      LAST_EXECUTION_STATUS_FAILED = 'FAILED'.freeze,
      LAST_EXECUTION_STATUS_SUCCEEDED = 'SUCCEEDED'.freeze,
      LAST_EXECUTION_STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The most recent task execution status.
    # @return [String]
    attr_reader :last_execution_status

    # The date and time the scheduled task last executed, in the format defined by RFC3339.
    # @return [DateTime]
    attr_accessor :time_last_executed

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'kind': :'kind',
        'id': :'id',
        'display_name': :'displayName',
        'task_type': :'taskType',
        'schedules': :'schedules',
        'action': :'action',
        'task_status': :'taskStatus',
        'pause_reason': :'pauseReason',
        'work_request_id': :'workRequestId',
        'num_occurrences': :'numOccurrences',
        'compartment_id': :'compartmentId',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'time_of_next_execution': :'timeOfNextExecution',
        'lifecycle_state': :'lifecycleState',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'last_execution_status': :'lastExecutionStatus',
        'time_last_executed': :'timeLastExecuted'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'kind': :'String',
        'id': :'String',
        'display_name': :'String',
        'task_type': :'String',
        'schedules': :'Array<OCI::LogAnalytics::Models::Schedule>',
        'action': :'OCI::LogAnalytics::Models::Action',
        'task_status': :'String',
        'pause_reason': :'String',
        'work_request_id': :'String',
        'num_occurrences': :'Integer',
        'compartment_id': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'time_of_next_execution': :'DateTime',
        'lifecycle_state': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'last_execution_status': :'String',
        'time_last_executed': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {OCI::LogAnalytics::Models::ScheduledTask#id #id} proprety
    # @option attributes [String] :display_name The value to assign to the {OCI::LogAnalytics::Models::ScheduledTask#display_name #display_name} proprety
    # @option attributes [String] :task_type The value to assign to the {OCI::LogAnalytics::Models::ScheduledTask#task_type #task_type} proprety
    # @option attributes [Array<OCI::LogAnalytics::Models::Schedule>] :schedules The value to assign to the {OCI::LogAnalytics::Models::ScheduledTask#schedules #schedules} proprety
    # @option attributes [OCI::LogAnalytics::Models::Action] :action The value to assign to the {OCI::LogAnalytics::Models::ScheduledTask#action #action} proprety
    # @option attributes [String] :task_status The value to assign to the {OCI::LogAnalytics::Models::ScheduledTask#task_status #task_status} proprety
    # @option attributes [String] :pause_reason The value to assign to the {OCI::LogAnalytics::Models::ScheduledTask#pause_reason #pause_reason} proprety
    # @option attributes [String] :work_request_id The value to assign to the {OCI::LogAnalytics::Models::ScheduledTask#work_request_id #work_request_id} proprety
    # @option attributes [Integer] :num_occurrences The value to assign to the {OCI::LogAnalytics::Models::ScheduledTask#num_occurrences #num_occurrences} proprety
    # @option attributes [String] :compartment_id The value to assign to the {OCI::LogAnalytics::Models::ScheduledTask#compartment_id #compartment_id} proprety
    # @option attributes [DateTime] :time_created The value to assign to the {OCI::LogAnalytics::Models::ScheduledTask#time_created #time_created} proprety
    # @option attributes [DateTime] :time_updated The value to assign to the {OCI::LogAnalytics::Models::ScheduledTask#time_updated #time_updated} proprety
    # @option attributes [DateTime] :time_of_next_execution The value to assign to the {OCI::LogAnalytics::Models::ScheduledTask#time_of_next_execution #time_of_next_execution} proprety
    # @option attributes [String] :lifecycle_state The value to assign to the {OCI::LogAnalytics::Models::ScheduledTask#lifecycle_state #lifecycle_state} proprety
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {OCI::LogAnalytics::Models::ScheduledTask#freeform_tags #freeform_tags} proprety
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {OCI::LogAnalytics::Models::ScheduledTask#defined_tags #defined_tags} proprety
    # @option attributes [String] :last_execution_status The value to assign to the {#last_execution_status} property
    # @option attributes [DateTime] :time_last_executed The value to assign to the {#time_last_executed} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['kind'] = 'STANDARD'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.last_execution_status = attributes[:'lastExecutionStatus'] if attributes[:'lastExecutionStatus']

      raise 'You cannot provide both :lastExecutionStatus and :last_execution_status' if attributes.key?(:'lastExecutionStatus') && attributes.key?(:'last_execution_status')

      self.last_execution_status = attributes[:'last_execution_status'] if attributes[:'last_execution_status']

      self.time_last_executed = attributes[:'timeLastExecuted'] if attributes[:'timeLastExecuted']

      raise 'You cannot provide both :timeLastExecuted and :time_last_executed' if attributes.key?(:'timeLastExecuted') && attributes.key?(:'time_last_executed')

      self.time_last_executed = attributes[:'time_last_executed'] if attributes[:'time_last_executed']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] last_execution_status Object to be assigned
    def last_execution_status=(last_execution_status)
      # rubocop:disable Style/ConditionalAssignment
      if last_execution_status && !LAST_EXECUTION_STATUS_ENUM.include?(last_execution_status)
        OCI.logger.debug("Unknown value for 'last_execution_status' [" + last_execution_status + "]. Mapping to 'LAST_EXECUTION_STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @last_execution_status = LAST_EXECUTION_STATUS_UNKNOWN_ENUM_VALUE
      else
        @last_execution_status = last_execution_status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        kind == other.kind &&
        id == other.id &&
        display_name == other.display_name &&
        task_type == other.task_type &&
        schedules == other.schedules &&
        action == other.action &&
        task_status == other.task_status &&
        pause_reason == other.pause_reason &&
        work_request_id == other.work_request_id &&
        num_occurrences == other.num_occurrences &&
        compartment_id == other.compartment_id &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        time_of_next_execution == other.time_of_next_execution &&
        lifecycle_state == other.lifecycle_state &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        last_execution_status == other.last_execution_status &&
        time_last_executed == other.time_last_executed
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
      [kind, id, display_name, task_type, schedules, action, task_status, pause_reason, work_request_id, num_occurrences, compartment_id, time_created, time_updated, time_of_next_execution, lifecycle_state, freeform_tags, defined_tags, last_execution_status, time_last_executed].hash
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
