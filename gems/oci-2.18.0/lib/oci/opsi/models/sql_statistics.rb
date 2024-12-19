# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Performance statistics for the SQL.
  class Opsi::Models::SqlStatistics
    # **[Required]** Database Time in seconds
    # @return [Float]
    attr_accessor :database_time_in_sec

    # **[Required]** Number of executions per hour
    # @return [Float]
    attr_accessor :executions_per_hour

    # **[Required]** Total number of executions
    # @return [Integer]
    attr_accessor :executions_count

    # **[Required]** CPU Time in seconds
    # @return [Float]
    attr_accessor :cpu_time_in_sec

    # **[Required]** I/O Time in seconds
    # @return [Float]
    attr_accessor :io_time_in_sec

    # **[Required]** Inefficient Wait Time in seconds
    # @return [Float]
    attr_accessor :inefficient_wait_time_in_sec

    # **[Required]** Response time is the average elaspsed time per execution. It is the ratio of Total Database Time to the number of executions
    # @return [Float]
    attr_accessor :response_time_in_sec

    # **[Required]** Number of SQL execution plans used by the SQL
    # @return [Integer]
    attr_accessor :plan_count

    # **[Required]** Variability is the ratio of the standard deviation in response time to the mean of response time of the SQL
    # @return [Float]
    attr_accessor :variability

    # **[Required]** Average Active Sessions represent the average active sessions at a point in time. It is the number of sessions that are either working or waiting.
    # @return [Float]
    attr_accessor :average_active_sessions

    # **[Required]** Percentage of Database Time
    # @return [Float]
    attr_accessor :database_time_pct

    # **[Required]** Percentage of Inefficiency. It is calculated by Total Database Time divided by Total Wait Time
    # @return [Float]
    attr_accessor :inefficiency_in_pct

    # **[Required]** Percent change in CPU Time based on linear regression
    # @return [Float]
    attr_accessor :change_in_cpu_time_in_pct

    # **[Required]** Percent change in IO Time based on linear regression
    # @return [Float]
    attr_accessor :change_in_io_time_in_pct

    # **[Required]** Percent change in Inefficient Wait Time based on linear regression
    # @return [Float]
    attr_accessor :change_in_inefficient_wait_time_in_pct

    # **[Required]** Percent change in Response Time based on linear regression
    # @return [Float]
    attr_accessor :change_in_response_time_in_pct

    # **[Required]** Percent change in Average Active Sessions based on linear regression
    # @return [Float]
    attr_accessor :change_in_average_active_sessions_in_pct

    # **[Required]** Percent change in Executions per hour based on linear regression
    # @return [Float]
    attr_accessor :change_in_executions_per_hour_in_pct

    # **[Required]** Percent change in Inefficiency based on linear regression
    # @return [Float]
    attr_accessor :change_in_inefficiency_in_pct

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'database_time_in_sec': :'databaseTimeInSec',
        'executions_per_hour': :'executionsPerHour',
        'executions_count': :'executionsCount',
        'cpu_time_in_sec': :'cpuTimeInSec',
        'io_time_in_sec': :'ioTimeInSec',
        'inefficient_wait_time_in_sec': :'inefficientWaitTimeInSec',
        'response_time_in_sec': :'responseTimeInSec',
        'plan_count': :'planCount',
        'variability': :'variability',
        'average_active_sessions': :'averageActiveSessions',
        'database_time_pct': :'databaseTimePct',
        'inefficiency_in_pct': :'inefficiencyInPct',
        'change_in_cpu_time_in_pct': :'changeInCpuTimeInPct',
        'change_in_io_time_in_pct': :'changeInIoTimeInPct',
        'change_in_inefficient_wait_time_in_pct': :'changeInInefficientWaitTimeInPct',
        'change_in_response_time_in_pct': :'changeInResponseTimeInPct',
        'change_in_average_active_sessions_in_pct': :'changeInAverageActiveSessionsInPct',
        'change_in_executions_per_hour_in_pct': :'changeInExecutionsPerHourInPct',
        'change_in_inefficiency_in_pct': :'changeInInefficiencyInPct'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'database_time_in_sec': :'Float',
        'executions_per_hour': :'Float',
        'executions_count': :'Integer',
        'cpu_time_in_sec': :'Float',
        'io_time_in_sec': :'Float',
        'inefficient_wait_time_in_sec': :'Float',
        'response_time_in_sec': :'Float',
        'plan_count': :'Integer',
        'variability': :'Float',
        'average_active_sessions': :'Float',
        'database_time_pct': :'Float',
        'inefficiency_in_pct': :'Float',
        'change_in_cpu_time_in_pct': :'Float',
        'change_in_io_time_in_pct': :'Float',
        'change_in_inefficient_wait_time_in_pct': :'Float',
        'change_in_response_time_in_pct': :'Float',
        'change_in_average_active_sessions_in_pct': :'Float',
        'change_in_executions_per_hour_in_pct': :'Float',
        'change_in_inefficiency_in_pct': :'Float'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Float] :database_time_in_sec The value to assign to the {#database_time_in_sec} property
    # @option attributes [Float] :executions_per_hour The value to assign to the {#executions_per_hour} property
    # @option attributes [Integer] :executions_count The value to assign to the {#executions_count} property
    # @option attributes [Float] :cpu_time_in_sec The value to assign to the {#cpu_time_in_sec} property
    # @option attributes [Float] :io_time_in_sec The value to assign to the {#io_time_in_sec} property
    # @option attributes [Float] :inefficient_wait_time_in_sec The value to assign to the {#inefficient_wait_time_in_sec} property
    # @option attributes [Float] :response_time_in_sec The value to assign to the {#response_time_in_sec} property
    # @option attributes [Integer] :plan_count The value to assign to the {#plan_count} property
    # @option attributes [Float] :variability The value to assign to the {#variability} property
    # @option attributes [Float] :average_active_sessions The value to assign to the {#average_active_sessions} property
    # @option attributes [Float] :database_time_pct The value to assign to the {#database_time_pct} property
    # @option attributes [Float] :inefficiency_in_pct The value to assign to the {#inefficiency_in_pct} property
    # @option attributes [Float] :change_in_cpu_time_in_pct The value to assign to the {#change_in_cpu_time_in_pct} property
    # @option attributes [Float] :change_in_io_time_in_pct The value to assign to the {#change_in_io_time_in_pct} property
    # @option attributes [Float] :change_in_inefficient_wait_time_in_pct The value to assign to the {#change_in_inefficient_wait_time_in_pct} property
    # @option attributes [Float] :change_in_response_time_in_pct The value to assign to the {#change_in_response_time_in_pct} property
    # @option attributes [Float] :change_in_average_active_sessions_in_pct The value to assign to the {#change_in_average_active_sessions_in_pct} property
    # @option attributes [Float] :change_in_executions_per_hour_in_pct The value to assign to the {#change_in_executions_per_hour_in_pct} property
    # @option attributes [Float] :change_in_inefficiency_in_pct The value to assign to the {#change_in_inefficiency_in_pct} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.database_time_in_sec = attributes[:'databaseTimeInSec'] if attributes[:'databaseTimeInSec']

      raise 'You cannot provide both :databaseTimeInSec and :database_time_in_sec' if attributes.key?(:'databaseTimeInSec') && attributes.key?(:'database_time_in_sec')

      self.database_time_in_sec = attributes[:'database_time_in_sec'] if attributes[:'database_time_in_sec']

      self.executions_per_hour = attributes[:'executionsPerHour'] if attributes[:'executionsPerHour']

      raise 'You cannot provide both :executionsPerHour and :executions_per_hour' if attributes.key?(:'executionsPerHour') && attributes.key?(:'executions_per_hour')

      self.executions_per_hour = attributes[:'executions_per_hour'] if attributes[:'executions_per_hour']

      self.executions_count = attributes[:'executionsCount'] if attributes[:'executionsCount']

      raise 'You cannot provide both :executionsCount and :executions_count' if attributes.key?(:'executionsCount') && attributes.key?(:'executions_count')

      self.executions_count = attributes[:'executions_count'] if attributes[:'executions_count']

      self.cpu_time_in_sec = attributes[:'cpuTimeInSec'] if attributes[:'cpuTimeInSec']

      raise 'You cannot provide both :cpuTimeInSec and :cpu_time_in_sec' if attributes.key?(:'cpuTimeInSec') && attributes.key?(:'cpu_time_in_sec')

      self.cpu_time_in_sec = attributes[:'cpu_time_in_sec'] if attributes[:'cpu_time_in_sec']

      self.io_time_in_sec = attributes[:'ioTimeInSec'] if attributes[:'ioTimeInSec']

      raise 'You cannot provide both :ioTimeInSec and :io_time_in_sec' if attributes.key?(:'ioTimeInSec') && attributes.key?(:'io_time_in_sec')

      self.io_time_in_sec = attributes[:'io_time_in_sec'] if attributes[:'io_time_in_sec']

      self.inefficient_wait_time_in_sec = attributes[:'inefficientWaitTimeInSec'] if attributes[:'inefficientWaitTimeInSec']

      raise 'You cannot provide both :inefficientWaitTimeInSec and :inefficient_wait_time_in_sec' if attributes.key?(:'inefficientWaitTimeInSec') && attributes.key?(:'inefficient_wait_time_in_sec')

      self.inefficient_wait_time_in_sec = attributes[:'inefficient_wait_time_in_sec'] if attributes[:'inefficient_wait_time_in_sec']

      self.response_time_in_sec = attributes[:'responseTimeInSec'] if attributes[:'responseTimeInSec']

      raise 'You cannot provide both :responseTimeInSec and :response_time_in_sec' if attributes.key?(:'responseTimeInSec') && attributes.key?(:'response_time_in_sec')

      self.response_time_in_sec = attributes[:'response_time_in_sec'] if attributes[:'response_time_in_sec']

      self.plan_count = attributes[:'planCount'] if attributes[:'planCount']

      raise 'You cannot provide both :planCount and :plan_count' if attributes.key?(:'planCount') && attributes.key?(:'plan_count')

      self.plan_count = attributes[:'plan_count'] if attributes[:'plan_count']

      self.variability = attributes[:'variability'] if attributes[:'variability']

      self.average_active_sessions = attributes[:'averageActiveSessions'] if attributes[:'averageActiveSessions']

      raise 'You cannot provide both :averageActiveSessions and :average_active_sessions' if attributes.key?(:'averageActiveSessions') && attributes.key?(:'average_active_sessions')

      self.average_active_sessions = attributes[:'average_active_sessions'] if attributes[:'average_active_sessions']

      self.database_time_pct = attributes[:'databaseTimePct'] if attributes[:'databaseTimePct']

      raise 'You cannot provide both :databaseTimePct and :database_time_pct' if attributes.key?(:'databaseTimePct') && attributes.key?(:'database_time_pct')

      self.database_time_pct = attributes[:'database_time_pct'] if attributes[:'database_time_pct']

      self.inefficiency_in_pct = attributes[:'inefficiencyInPct'] if attributes[:'inefficiencyInPct']

      raise 'You cannot provide both :inefficiencyInPct and :inefficiency_in_pct' if attributes.key?(:'inefficiencyInPct') && attributes.key?(:'inefficiency_in_pct')

      self.inefficiency_in_pct = attributes[:'inefficiency_in_pct'] if attributes[:'inefficiency_in_pct']

      self.change_in_cpu_time_in_pct = attributes[:'changeInCpuTimeInPct'] if attributes[:'changeInCpuTimeInPct']

      raise 'You cannot provide both :changeInCpuTimeInPct and :change_in_cpu_time_in_pct' if attributes.key?(:'changeInCpuTimeInPct') && attributes.key?(:'change_in_cpu_time_in_pct')

      self.change_in_cpu_time_in_pct = attributes[:'change_in_cpu_time_in_pct'] if attributes[:'change_in_cpu_time_in_pct']

      self.change_in_io_time_in_pct = attributes[:'changeInIoTimeInPct'] if attributes[:'changeInIoTimeInPct']

      raise 'You cannot provide both :changeInIoTimeInPct and :change_in_io_time_in_pct' if attributes.key?(:'changeInIoTimeInPct') && attributes.key?(:'change_in_io_time_in_pct')

      self.change_in_io_time_in_pct = attributes[:'change_in_io_time_in_pct'] if attributes[:'change_in_io_time_in_pct']

      self.change_in_inefficient_wait_time_in_pct = attributes[:'changeInInefficientWaitTimeInPct'] if attributes[:'changeInInefficientWaitTimeInPct']

      raise 'You cannot provide both :changeInInefficientWaitTimeInPct and :change_in_inefficient_wait_time_in_pct' if attributes.key?(:'changeInInefficientWaitTimeInPct') && attributes.key?(:'change_in_inefficient_wait_time_in_pct')

      self.change_in_inefficient_wait_time_in_pct = attributes[:'change_in_inefficient_wait_time_in_pct'] if attributes[:'change_in_inefficient_wait_time_in_pct']

      self.change_in_response_time_in_pct = attributes[:'changeInResponseTimeInPct'] if attributes[:'changeInResponseTimeInPct']

      raise 'You cannot provide both :changeInResponseTimeInPct and :change_in_response_time_in_pct' if attributes.key?(:'changeInResponseTimeInPct') && attributes.key?(:'change_in_response_time_in_pct')

      self.change_in_response_time_in_pct = attributes[:'change_in_response_time_in_pct'] if attributes[:'change_in_response_time_in_pct']

      self.change_in_average_active_sessions_in_pct = attributes[:'changeInAverageActiveSessionsInPct'] if attributes[:'changeInAverageActiveSessionsInPct']

      raise 'You cannot provide both :changeInAverageActiveSessionsInPct and :change_in_average_active_sessions_in_pct' if attributes.key?(:'changeInAverageActiveSessionsInPct') && attributes.key?(:'change_in_average_active_sessions_in_pct')

      self.change_in_average_active_sessions_in_pct = attributes[:'change_in_average_active_sessions_in_pct'] if attributes[:'change_in_average_active_sessions_in_pct']

      self.change_in_executions_per_hour_in_pct = attributes[:'changeInExecutionsPerHourInPct'] if attributes[:'changeInExecutionsPerHourInPct']

      raise 'You cannot provide both :changeInExecutionsPerHourInPct and :change_in_executions_per_hour_in_pct' if attributes.key?(:'changeInExecutionsPerHourInPct') && attributes.key?(:'change_in_executions_per_hour_in_pct')

      self.change_in_executions_per_hour_in_pct = attributes[:'change_in_executions_per_hour_in_pct'] if attributes[:'change_in_executions_per_hour_in_pct']

      self.change_in_inefficiency_in_pct = attributes[:'changeInInefficiencyInPct'] if attributes[:'changeInInefficiencyInPct']

      raise 'You cannot provide both :changeInInefficiencyInPct and :change_in_inefficiency_in_pct' if attributes.key?(:'changeInInefficiencyInPct') && attributes.key?(:'change_in_inefficiency_in_pct')

      self.change_in_inefficiency_in_pct = attributes[:'change_in_inefficiency_in_pct'] if attributes[:'change_in_inefficiency_in_pct']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        database_time_in_sec == other.database_time_in_sec &&
        executions_per_hour == other.executions_per_hour &&
        executions_count == other.executions_count &&
        cpu_time_in_sec == other.cpu_time_in_sec &&
        io_time_in_sec == other.io_time_in_sec &&
        inefficient_wait_time_in_sec == other.inefficient_wait_time_in_sec &&
        response_time_in_sec == other.response_time_in_sec &&
        plan_count == other.plan_count &&
        variability == other.variability &&
        average_active_sessions == other.average_active_sessions &&
        database_time_pct == other.database_time_pct &&
        inefficiency_in_pct == other.inefficiency_in_pct &&
        change_in_cpu_time_in_pct == other.change_in_cpu_time_in_pct &&
        change_in_io_time_in_pct == other.change_in_io_time_in_pct &&
        change_in_inefficient_wait_time_in_pct == other.change_in_inefficient_wait_time_in_pct &&
        change_in_response_time_in_pct == other.change_in_response_time_in_pct &&
        change_in_average_active_sessions_in_pct == other.change_in_average_active_sessions_in_pct &&
        change_in_executions_per_hour_in_pct == other.change_in_executions_per_hour_in_pct &&
        change_in_inefficiency_in_pct == other.change_in_inefficiency_in_pct
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
      [database_time_in_sec, executions_per_hour, executions_count, cpu_time_in_sec, io_time_in_sec, inefficient_wait_time_in_sec, response_time_in_sec, plan_count, variability, average_active_sessions, database_time_pct, inefficiency_in_pct, change_in_cpu_time_in_pct, change_in_io_time_in_pct, change_in_inefficient_wait_time_in_pct, change_in_response_time_in_pct, change_in_average_active_sessions_in_pct, change_in_executions_per_hour_in_pct, change_in_inefficiency_in_pct].hash
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
