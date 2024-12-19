# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Aggregated data for top processes
  class Opsi::Models::TopProcessesUsageTrend
    # **[Required]** The timestamp in which the current sampling period ends in RFC 3339 format.
    # @return [DateTime]
    attr_accessor :end_timestamp

    # **[Required]** Process CPU usage.
    # @return [Float]
    attr_accessor :cpu_usage

    # **[Required]** Process CPU utilization percentage
    # @return [Float]
    attr_accessor :cpu_utilization

    # **[Required]** Process memory utilization percentage
    # @return [Float]
    attr_accessor :memory_utilization

    # **[Required]** Process virtual memory in Megabytes
    # @return [Float]
    attr_accessor :virtual_memory_in_mbs

    # **[Required]** Procress physical memory in Megabytes
    # @return [Float]
    attr_accessor :physical_memory_in_mbs

    # **[Required]** Maximum number of processes running at time of collection
    # @return [Integer]
    attr_accessor :max_process_count

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'end_timestamp': :'endTimestamp',
        'cpu_usage': :'cpuUsage',
        'cpu_utilization': :'cpuUtilization',
        'memory_utilization': :'memoryUtilization',
        'virtual_memory_in_mbs': :'virtualMemoryInMBs',
        'physical_memory_in_mbs': :'physicalMemoryInMBs',
        'max_process_count': :'maxProcessCount'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'end_timestamp': :'DateTime',
        'cpu_usage': :'Float',
        'cpu_utilization': :'Float',
        'memory_utilization': :'Float',
        'virtual_memory_in_mbs': :'Float',
        'physical_memory_in_mbs': :'Float',
        'max_process_count': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [DateTime] :end_timestamp The value to assign to the {#end_timestamp} property
    # @option attributes [Float] :cpu_usage The value to assign to the {#cpu_usage} property
    # @option attributes [Float] :cpu_utilization The value to assign to the {#cpu_utilization} property
    # @option attributes [Float] :memory_utilization The value to assign to the {#memory_utilization} property
    # @option attributes [Float] :virtual_memory_in_mbs The value to assign to the {#virtual_memory_in_mbs} property
    # @option attributes [Float] :physical_memory_in_mbs The value to assign to the {#physical_memory_in_mbs} property
    # @option attributes [Integer] :max_process_count The value to assign to the {#max_process_count} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.end_timestamp = attributes[:'endTimestamp'] if attributes[:'endTimestamp']

      raise 'You cannot provide both :endTimestamp and :end_timestamp' if attributes.key?(:'endTimestamp') && attributes.key?(:'end_timestamp')

      self.end_timestamp = attributes[:'end_timestamp'] if attributes[:'end_timestamp']

      self.cpu_usage = attributes[:'cpuUsage'] if attributes[:'cpuUsage']

      raise 'You cannot provide both :cpuUsage and :cpu_usage' if attributes.key?(:'cpuUsage') && attributes.key?(:'cpu_usage')

      self.cpu_usage = attributes[:'cpu_usage'] if attributes[:'cpu_usage']

      self.cpu_utilization = attributes[:'cpuUtilization'] if attributes[:'cpuUtilization']

      raise 'You cannot provide both :cpuUtilization and :cpu_utilization' if attributes.key?(:'cpuUtilization') && attributes.key?(:'cpu_utilization')

      self.cpu_utilization = attributes[:'cpu_utilization'] if attributes[:'cpu_utilization']

      self.memory_utilization = attributes[:'memoryUtilization'] if attributes[:'memoryUtilization']

      raise 'You cannot provide both :memoryUtilization and :memory_utilization' if attributes.key?(:'memoryUtilization') && attributes.key?(:'memory_utilization')

      self.memory_utilization = attributes[:'memory_utilization'] if attributes[:'memory_utilization']

      self.virtual_memory_in_mbs = attributes[:'virtualMemoryInMBs'] if attributes[:'virtualMemoryInMBs']

      raise 'You cannot provide both :virtualMemoryInMBs and :virtual_memory_in_mbs' if attributes.key?(:'virtualMemoryInMBs') && attributes.key?(:'virtual_memory_in_mbs')

      self.virtual_memory_in_mbs = attributes[:'virtual_memory_in_mbs'] if attributes[:'virtual_memory_in_mbs']

      self.physical_memory_in_mbs = attributes[:'physicalMemoryInMBs'] if attributes[:'physicalMemoryInMBs']

      raise 'You cannot provide both :physicalMemoryInMBs and :physical_memory_in_mbs' if attributes.key?(:'physicalMemoryInMBs') && attributes.key?(:'physical_memory_in_mbs')

      self.physical_memory_in_mbs = attributes[:'physical_memory_in_mbs'] if attributes[:'physical_memory_in_mbs']

      self.max_process_count = attributes[:'maxProcessCount'] if attributes[:'maxProcessCount']

      raise 'You cannot provide both :maxProcessCount and :max_process_count' if attributes.key?(:'maxProcessCount') && attributes.key?(:'max_process_count')

      self.max_process_count = attributes[:'max_process_count'] if attributes[:'max_process_count']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        end_timestamp == other.end_timestamp &&
        cpu_usage == other.cpu_usage &&
        cpu_utilization == other.cpu_utilization &&
        memory_utilization == other.memory_utilization &&
        virtual_memory_in_mbs == other.virtual_memory_in_mbs &&
        physical_memory_in_mbs == other.physical_memory_in_mbs &&
        max_process_count == other.max_process_count
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
      [end_timestamp, cpu_usage, cpu_utilization, memory_utilization, virtual_memory_in_mbs, physical_memory_in_mbs, max_process_count].hash
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
