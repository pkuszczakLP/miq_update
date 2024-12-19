# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Job details outlining parameters specified when job was submitted.
  #
  class LogAnalytics::Models::QueryWorkRequest
    STATUS_ENUM = [
      STATUS_ACCEPTED = 'ACCEPTED'.freeze,
      STATUS_CANCELED = 'CANCELED'.freeze,
      STATUS_FAILED = 'FAILED'.freeze,
      STATUS_IN_PROGRESS = 'IN_PROGRESS'.freeze,
      STATUS_SUCCEEDED = 'SUCCEEDED'.freeze,
      STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    OPERATION_TYPE_ENUM = [
      OPERATION_TYPE_EXECUTE_QUERY_JOB = 'EXECUTE_QUERY_JOB'.freeze,
      OPERATION_TYPE_EXECUTE_PURGE_JOB = 'EXECUTE_PURGE_JOB'.freeze,
      OPERATION_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    MODE_ENUM = [
      MODE_FOREGROUND = 'FOREGROUND'.freeze,
      MODE_BACKGROUND = 'BACKGROUND'.freeze,
      MODE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    SUB_SYSTEM_ENUM = [
      SUB_SYSTEM_LOG = 'LOG'.freeze,
      SUB_SYSTEM_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Unique OCID identifier to reference this query job work Request with.
    #
    # @return [String]
    attr_accessor :id

    # **[Required]** Compartment Identifier [OCID] (https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** When the job was started.
    # @return [DateTime]
    attr_accessor :time_started

    # When the work request was accepted. Should match timeStarted in all cases.
    #
    # @return [DateTime]
    attr_accessor :time_accepted

    # When the job finished execution.
    # @return [DateTime]
    attr_accessor :time_finished

    # When the job will expire.
    # @return [DateTime]
    attr_accessor :time_expires

    # Percentage progress completion of the query.
    #
    # @return [Integer]
    attr_accessor :percent_complete

    # Work request status.
    #
    # @return [String]
    attr_reader :status

    # Asynchronous action name.
    #
    # @return [String]
    attr_reader :operation_type

    # **[Required]** Current execution mode for the job.
    # @return [String]
    attr_reader :mode

    # When the job was put in to the background.
    # @return [DateTime]
    attr_accessor :time_background_at

    # @return [OCI::LogAnalytics::Models::TimeRange]
    attr_accessor :time_filter

    # List of filters applied when the query executed.
    #
    # @return [Array<OCI::LogAnalytics::Models::ScopeFilter>]
    attr_accessor :scope_filters

    # **[Required]** Default subsystem to qualify fields with in the queryString if not specified.
    #
    # @return [String]
    attr_reader :sub_system

    # **[Required]** Display version of the user speciified queryString.
    #
    # @return [String]
    attr_accessor :display_query_string

    # **[Required]** Internal version of the user specified queryString.
    #
    # @return [String]
    attr_accessor :internal_query_string

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'compartment_id': :'compartmentId',
        'time_started': :'timeStarted',
        'time_accepted': :'timeAccepted',
        'time_finished': :'timeFinished',
        'time_expires': :'timeExpires',
        'percent_complete': :'percentComplete',
        'status': :'status',
        'operation_type': :'operationType',
        'mode': :'mode',
        'time_background_at': :'timeBackgroundAt',
        'time_filter': :'timeFilter',
        'scope_filters': :'scopeFilters',
        'sub_system': :'subSystem',
        'display_query_string': :'displayQueryString',
        'internal_query_string': :'internalQueryString'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'compartment_id': :'String',
        'time_started': :'DateTime',
        'time_accepted': :'DateTime',
        'time_finished': :'DateTime',
        'time_expires': :'DateTime',
        'percent_complete': :'Integer',
        'status': :'String',
        'operation_type': :'String',
        'mode': :'String',
        'time_background_at': :'DateTime',
        'time_filter': :'OCI::LogAnalytics::Models::TimeRange',
        'scope_filters': :'Array<OCI::LogAnalytics::Models::ScopeFilter>',
        'sub_system': :'String',
        'display_query_string': :'String',
        'internal_query_string': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [DateTime] :time_started The value to assign to the {#time_started} property
    # @option attributes [DateTime] :time_accepted The value to assign to the {#time_accepted} property
    # @option attributes [DateTime] :time_finished The value to assign to the {#time_finished} property
    # @option attributes [DateTime] :time_expires The value to assign to the {#time_expires} property
    # @option attributes [Integer] :percent_complete The value to assign to the {#percent_complete} property
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [String] :operation_type The value to assign to the {#operation_type} property
    # @option attributes [String] :mode The value to assign to the {#mode} property
    # @option attributes [DateTime] :time_background_at The value to assign to the {#time_background_at} property
    # @option attributes [OCI::LogAnalytics::Models::TimeRange] :time_filter The value to assign to the {#time_filter} property
    # @option attributes [Array<OCI::LogAnalytics::Models::ScopeFilter>] :scope_filters The value to assign to the {#scope_filters} property
    # @option attributes [String] :sub_system The value to assign to the {#sub_system} property
    # @option attributes [String] :display_query_string The value to assign to the {#display_query_string} property
    # @option attributes [String] :internal_query_string The value to assign to the {#internal_query_string} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.time_started = attributes[:'timeStarted'] if attributes[:'timeStarted']

      raise 'You cannot provide both :timeStarted and :time_started' if attributes.key?(:'timeStarted') && attributes.key?(:'time_started')

      self.time_started = attributes[:'time_started'] if attributes[:'time_started']

      self.time_accepted = attributes[:'timeAccepted'] if attributes[:'timeAccepted']

      raise 'You cannot provide both :timeAccepted and :time_accepted' if attributes.key?(:'timeAccepted') && attributes.key?(:'time_accepted')

      self.time_accepted = attributes[:'time_accepted'] if attributes[:'time_accepted']

      self.time_finished = attributes[:'timeFinished'] if attributes[:'timeFinished']

      raise 'You cannot provide both :timeFinished and :time_finished' if attributes.key?(:'timeFinished') && attributes.key?(:'time_finished')

      self.time_finished = attributes[:'time_finished'] if attributes[:'time_finished']

      self.time_expires = attributes[:'timeExpires'] if attributes[:'timeExpires']

      raise 'You cannot provide both :timeExpires and :time_expires' if attributes.key?(:'timeExpires') && attributes.key?(:'time_expires')

      self.time_expires = attributes[:'time_expires'] if attributes[:'time_expires']

      self.percent_complete = attributes[:'percentComplete'] if attributes[:'percentComplete']

      raise 'You cannot provide both :percentComplete and :percent_complete' if attributes.key?(:'percentComplete') && attributes.key?(:'percent_complete')

      self.percent_complete = attributes[:'percent_complete'] if attributes[:'percent_complete']

      self.status = attributes[:'status'] if attributes[:'status']

      self.operation_type = attributes[:'operationType'] if attributes[:'operationType']

      raise 'You cannot provide both :operationType and :operation_type' if attributes.key?(:'operationType') && attributes.key?(:'operation_type')

      self.operation_type = attributes[:'operation_type'] if attributes[:'operation_type']

      self.mode = attributes[:'mode'] if attributes[:'mode']

      self.time_background_at = attributes[:'timeBackgroundAt'] if attributes[:'timeBackgroundAt']

      raise 'You cannot provide both :timeBackgroundAt and :time_background_at' if attributes.key?(:'timeBackgroundAt') && attributes.key?(:'time_background_at')

      self.time_background_at = attributes[:'time_background_at'] if attributes[:'time_background_at']

      self.time_filter = attributes[:'timeFilter'] if attributes[:'timeFilter']

      raise 'You cannot provide both :timeFilter and :time_filter' if attributes.key?(:'timeFilter') && attributes.key?(:'time_filter')

      self.time_filter = attributes[:'time_filter'] if attributes[:'time_filter']

      self.scope_filters = attributes[:'scopeFilters'] if attributes[:'scopeFilters']

      raise 'You cannot provide both :scopeFilters and :scope_filters' if attributes.key?(:'scopeFilters') && attributes.key?(:'scope_filters')

      self.scope_filters = attributes[:'scope_filters'] if attributes[:'scope_filters']

      self.sub_system = attributes[:'subSystem'] if attributes[:'subSystem']

      raise 'You cannot provide both :subSystem and :sub_system' if attributes.key?(:'subSystem') && attributes.key?(:'sub_system')

      self.sub_system = attributes[:'sub_system'] if attributes[:'sub_system']

      self.display_query_string = attributes[:'displayQueryString'] if attributes[:'displayQueryString']

      raise 'You cannot provide both :displayQueryString and :display_query_string' if attributes.key?(:'displayQueryString') && attributes.key?(:'display_query_string')

      self.display_query_string = attributes[:'display_query_string'] if attributes[:'display_query_string']

      self.internal_query_string = attributes[:'internalQueryString'] if attributes[:'internalQueryString']

      raise 'You cannot provide both :internalQueryString and :internal_query_string' if attributes.key?(:'internalQueryString') && attributes.key?(:'internal_query_string')

      self.internal_query_string = attributes[:'internal_query_string'] if attributes[:'internal_query_string']
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
    # @param [Object] mode Object to be assigned
    def mode=(mode)
      # rubocop:disable Style/ConditionalAssignment
      if mode && !MODE_ENUM.include?(mode)
        OCI.logger.debug("Unknown value for 'mode' [" + mode + "]. Mapping to 'MODE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @mode = MODE_UNKNOWN_ENUM_VALUE
      else
        @mode = mode
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] sub_system Object to be assigned
    def sub_system=(sub_system)
      # rubocop:disable Style/ConditionalAssignment
      if sub_system && !SUB_SYSTEM_ENUM.include?(sub_system)
        OCI.logger.debug("Unknown value for 'sub_system' [" + sub_system + "]. Mapping to 'SUB_SYSTEM_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @sub_system = SUB_SYSTEM_UNKNOWN_ENUM_VALUE
      else
        @sub_system = sub_system
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
        time_started == other.time_started &&
        time_accepted == other.time_accepted &&
        time_finished == other.time_finished &&
        time_expires == other.time_expires &&
        percent_complete == other.percent_complete &&
        status == other.status &&
        operation_type == other.operation_type &&
        mode == other.mode &&
        time_background_at == other.time_background_at &&
        time_filter == other.time_filter &&
        scope_filters == other.scope_filters &&
        sub_system == other.sub_system &&
        display_query_string == other.display_query_string &&
        internal_query_string == other.internal_query_string
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
      [id, compartment_id, time_started, time_accepted, time_finished, time_expires, percent_complete, status, operation_type, mode, time_background_at, time_filter, scope_filters, sub_system, display_query_string, internal_query_string].hash
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
