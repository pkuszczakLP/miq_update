# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The details of the job schedule.
  class DatabaseManagement::Models::JobScheduleDetails
    INTERVAL_TYPE_ENUM = [
      INTERVAL_TYPE_DAILY = 'DAILY'.freeze,
      INTERVAL_TYPE_HOURLY = 'HOURLY'.freeze,
      INTERVAL_TYPE_WEEKLY = 'WEEKLY'.freeze,
      INTERVAL_TYPE_MONTHLY = 'MONTHLY'.freeze,
      INTERVAL_TYPE_NEVER = 'NEVER'.freeze,
      INTERVAL_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The start time of the scheduled job in UTC in ISO-8601 format, which is \"yyyy-MM-dd'T'hh:mm:ss.sss'Z'\".
    # @return [String]
    attr_accessor :start_time

    # The end time of the scheduled job in UTC in ISO-8601 format, which is \"yyyy-MM-dd'T'hh:mm:ss.sss'Z'\".
    # @return [String]
    attr_accessor :end_time

    # The interval type for a recurring scheduled job. For a non-recurring (one time) job, NEVER must be specified as the interval type.
    # @return [String]
    attr_reader :interval_type

    # The value for the interval period for a recurring scheduled job.
    # @return [String]
    attr_accessor :interval_value

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'start_time': :'startTime',
        'end_time': :'endTime',
        'interval_type': :'intervalType',
        'interval_value': :'intervalValue'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'start_time': :'String',
        'end_time': :'String',
        'interval_type': :'String',
        'interval_value': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :start_time The value to assign to the {#start_time} property
    # @option attributes [String] :end_time The value to assign to the {#end_time} property
    # @option attributes [String] :interval_type The value to assign to the {#interval_type} property
    # @option attributes [String] :interval_value The value to assign to the {#interval_value} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.start_time = attributes[:'startTime'] if attributes[:'startTime']

      raise 'You cannot provide both :startTime and :start_time' if attributes.key?(:'startTime') && attributes.key?(:'start_time')

      self.start_time = attributes[:'start_time'] if attributes[:'start_time']

      self.end_time = attributes[:'endTime'] if attributes[:'endTime']

      raise 'You cannot provide both :endTime and :end_time' if attributes.key?(:'endTime') && attributes.key?(:'end_time')

      self.end_time = attributes[:'end_time'] if attributes[:'end_time']

      self.interval_type = attributes[:'intervalType'] if attributes[:'intervalType']
      self.interval_type = "NEVER" if interval_type.nil? && !attributes.key?(:'intervalType') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :intervalType and :interval_type' if attributes.key?(:'intervalType') && attributes.key?(:'interval_type')

      self.interval_type = attributes[:'interval_type'] if attributes[:'interval_type']
      self.interval_type = "NEVER" if interval_type.nil? && !attributes.key?(:'intervalType') && !attributes.key?(:'interval_type') # rubocop:disable Style/StringLiterals

      self.interval_value = attributes[:'intervalValue'] if attributes[:'intervalValue']

      raise 'You cannot provide both :intervalValue and :interval_value' if attributes.key?(:'intervalValue') && attributes.key?(:'interval_value')

      self.interval_value = attributes[:'interval_value'] if attributes[:'interval_value']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] interval_type Object to be assigned
    def interval_type=(interval_type)
      # rubocop:disable Style/ConditionalAssignment
      if interval_type && !INTERVAL_TYPE_ENUM.include?(interval_type)
        OCI.logger.debug("Unknown value for 'interval_type' [" + interval_type + "]. Mapping to 'INTERVAL_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @interval_type = INTERVAL_TYPE_UNKNOWN_ENUM_VALUE
      else
        @interval_type = interval_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        start_time == other.start_time &&
        end_time == other.end_time &&
        interval_type == other.interval_type &&
        interval_value == other.interval_value
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
      [start_time, end_time, interval_type, interval_value].hash
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
