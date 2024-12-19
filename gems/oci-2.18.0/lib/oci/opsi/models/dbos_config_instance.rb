# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'database_configuration_metric_group'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Configuration parameters defined for external databases instance level.
  class Opsi::Models::DBOSConfigInstance < Opsi::Models::DatabaseConfigurationMetricGroup
    # **[Required]** Name of the database instance.
    # @return [String]
    attr_accessor :instance_name

    # **[Required]** Host name of the database instance.
    # @return [String]
    attr_accessor :host_name

    # Total number of CPUs available.
    # @return [Integer]
    attr_accessor :num_cp_us

    # Number of CPU cores available (includes subcores of multicore CPUs as well as single-core CPUs).
    # @return [Integer]
    attr_accessor :num_cpu_cores

    # Number of CPU Sockets available.
    # @return [Integer]
    attr_accessor :num_cpu_sockets

    # Total number of bytes of physical memory.
    # @return [Float]
    attr_accessor :physical_memory_bytes

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'metric_name': :'metricName',
        'time_collected': :'timeCollected',
        'instance_name': :'instanceName',
        'host_name': :'hostName',
        'num_cp_us': :'numCPUs',
        'num_cpu_cores': :'numCPUCores',
        'num_cpu_sockets': :'numCPUSockets',
        'physical_memory_bytes': :'physicalMemoryBytes'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'metric_name': :'String',
        'time_collected': :'DateTime',
        'instance_name': :'String',
        'host_name': :'String',
        'num_cp_us': :'Integer',
        'num_cpu_cores': :'Integer',
        'num_cpu_sockets': :'Integer',
        'physical_memory_bytes': :'Float'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [DateTime] :time_collected The value to assign to the {OCI::Opsi::Models::DatabaseConfigurationMetricGroup#time_collected #time_collected} proprety
    # @option attributes [String] :instance_name The value to assign to the {#instance_name} property
    # @option attributes [String] :host_name The value to assign to the {#host_name} property
    # @option attributes [Integer] :num_cp_us The value to assign to the {#num_cp_us} property
    # @option attributes [Integer] :num_cpu_cores The value to assign to the {#num_cpu_cores} property
    # @option attributes [Integer] :num_cpu_sockets The value to assign to the {#num_cpu_sockets} property
    # @option attributes [Float] :physical_memory_bytes The value to assign to the {#physical_memory_bytes} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['metricName'] = 'DB_OS_CONFIG_INSTANCE'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.instance_name = attributes[:'instanceName'] if attributes[:'instanceName']

      raise 'You cannot provide both :instanceName and :instance_name' if attributes.key?(:'instanceName') && attributes.key?(:'instance_name')

      self.instance_name = attributes[:'instance_name'] if attributes[:'instance_name']

      self.host_name = attributes[:'hostName'] if attributes[:'hostName']

      raise 'You cannot provide both :hostName and :host_name' if attributes.key?(:'hostName') && attributes.key?(:'host_name')

      self.host_name = attributes[:'host_name'] if attributes[:'host_name']

      self.num_cp_us = attributes[:'numCPUs'] if attributes[:'numCPUs']

      raise 'You cannot provide both :numCPUs and :num_cp_us' if attributes.key?(:'numCPUs') && attributes.key?(:'num_cp_us')

      self.num_cp_us = attributes[:'num_cp_us'] if attributes[:'num_cp_us']

      self.num_cpu_cores = attributes[:'numCPUCores'] if attributes[:'numCPUCores']

      raise 'You cannot provide both :numCPUCores and :num_cpu_cores' if attributes.key?(:'numCPUCores') && attributes.key?(:'num_cpu_cores')

      self.num_cpu_cores = attributes[:'num_cpu_cores'] if attributes[:'num_cpu_cores']

      self.num_cpu_sockets = attributes[:'numCPUSockets'] if attributes[:'numCPUSockets']

      raise 'You cannot provide both :numCPUSockets and :num_cpu_sockets' if attributes.key?(:'numCPUSockets') && attributes.key?(:'num_cpu_sockets')

      self.num_cpu_sockets = attributes[:'num_cpu_sockets'] if attributes[:'num_cpu_sockets']

      self.physical_memory_bytes = attributes[:'physicalMemoryBytes'] if attributes[:'physicalMemoryBytes']

      raise 'You cannot provide both :physicalMemoryBytes and :physical_memory_bytes' if attributes.key?(:'physicalMemoryBytes') && attributes.key?(:'physical_memory_bytes')

      self.physical_memory_bytes = attributes[:'physical_memory_bytes'] if attributes[:'physical_memory_bytes']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        metric_name == other.metric_name &&
        time_collected == other.time_collected &&
        instance_name == other.instance_name &&
        host_name == other.host_name &&
        num_cp_us == other.num_cp_us &&
        num_cpu_cores == other.num_cpu_cores &&
        num_cpu_sockets == other.num_cpu_sockets &&
        physical_memory_bytes == other.physical_memory_bytes
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
      [metric_name, time_collected, instance_name, host_name, num_cp_us, num_cpu_cores, num_cpu_sockets, physical_memory_bytes].hash
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
