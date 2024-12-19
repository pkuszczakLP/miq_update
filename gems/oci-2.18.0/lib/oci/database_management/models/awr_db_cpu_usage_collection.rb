# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'
require_relative 'awr_query_result'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The AWR CPU usage data.
  class DatabaseManagement::Models::AwrDbCpuUsageCollection < DatabaseManagement::Models::AwrQueryResult
    # The number of available CPU cores, which include subcores of multicore and single-core CPUs.
    # @return [Integer]
    attr_accessor :num_cpu_cores

    # The number of CPUs available for the database to use.
    # @return [Integer]
    attr_accessor :cpu_count

    # The number of available CPUs or processors.
    # @return [Float]
    attr_accessor :num_cpus

    # A list of AWR CPU usage summary data.
    # @return [Array<OCI::DatabaseManagement::Models::AwrDbCpuUsageSummary>]
    attr_accessor :items

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'version': :'version',
        'query_key': :'queryKey',
        'db_query_time_in_secs': :'dbQueryTimeInSecs',
        'awr_result_type': :'awrResultType',
        'num_cpu_cores': :'numCpuCores',
        'cpu_count': :'cpuCount',
        'num_cpus': :'numCpus',
        'items': :'items'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'version': :'String',
        'query_key': :'String',
        'db_query_time_in_secs': :'Float',
        'awr_result_type': :'String',
        'num_cpu_cores': :'Integer',
        'cpu_count': :'Integer',
        'num_cpus': :'Float',
        'items': :'Array<OCI::DatabaseManagement::Models::AwrDbCpuUsageSummary>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {OCI::DatabaseManagement::Models::AwrQueryResult#name #name} proprety
    # @option attributes [String] :version The value to assign to the {OCI::DatabaseManagement::Models::AwrQueryResult#version #version} proprety
    # @option attributes [String] :query_key The value to assign to the {OCI::DatabaseManagement::Models::AwrQueryResult#query_key #query_key} proprety
    # @option attributes [Float] :db_query_time_in_secs The value to assign to the {OCI::DatabaseManagement::Models::AwrQueryResult#db_query_time_in_secs #db_query_time_in_secs} proprety
    # @option attributes [Integer] :num_cpu_cores The value to assign to the {#num_cpu_cores} property
    # @option attributes [Integer] :cpu_count The value to assign to the {#cpu_count} property
    # @option attributes [Float] :num_cpus The value to assign to the {#num_cpus} property
    # @option attributes [Array<OCI::DatabaseManagement::Models::AwrDbCpuUsageSummary>] :items The value to assign to the {#items} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['awrResultType'] = 'AWRDB_ASH_CPU_USAGE_SET'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.num_cpu_cores = attributes[:'numCpuCores'] if attributes[:'numCpuCores']

      raise 'You cannot provide both :numCpuCores and :num_cpu_cores' if attributes.key?(:'numCpuCores') && attributes.key?(:'num_cpu_cores')

      self.num_cpu_cores = attributes[:'num_cpu_cores'] if attributes[:'num_cpu_cores']

      self.cpu_count = attributes[:'cpuCount'] if attributes[:'cpuCount']

      raise 'You cannot provide both :cpuCount and :cpu_count' if attributes.key?(:'cpuCount') && attributes.key?(:'cpu_count')

      self.cpu_count = attributes[:'cpu_count'] if attributes[:'cpu_count']

      self.num_cpus = attributes[:'numCpus'] if attributes[:'numCpus']

      raise 'You cannot provide both :numCpus and :num_cpus' if attributes.key?(:'numCpus') && attributes.key?(:'num_cpus')

      self.num_cpus = attributes[:'num_cpus'] if attributes[:'num_cpus']

      self.items = attributes[:'items'] if attributes[:'items']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        name == other.name &&
        version == other.version &&
        query_key == other.query_key &&
        db_query_time_in_secs == other.db_query_time_in_secs &&
        awr_result_type == other.awr_result_type &&
        num_cpu_cores == other.num_cpu_cores &&
        cpu_count == other.cpu_count &&
        num_cpus == other.num_cpus &&
        items == other.items
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
      [name, version, query_key, db_query_time_in_secs, awr_result_type, num_cpu_cores, cpu_count, num_cpus, items].hash
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
