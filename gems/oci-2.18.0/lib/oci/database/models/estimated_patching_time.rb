# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The estimated total time required in minutes for all patching operations (database server, storage server, and network switch patching).
  #
  class Database::Models::EstimatedPatchingTime
    # The estimated total time required in minutes for all patching operations.
    # @return [Integer]
    attr_accessor :total_estimated_patching_time

    # The estimated time required in minutes for database server patching.
    # @return [Integer]
    attr_accessor :estimated_db_server_patching_time

    # The estimated time required in minutes for storage server patching.
    # @return [Integer]
    attr_accessor :estimated_storage_server_patching_time

    # The estimated time required in minutes for network switch patching.
    # @return [Integer]
    attr_accessor :estimated_network_switches_patching_time

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'total_estimated_patching_time': :'totalEstimatedPatchingTime',
        'estimated_db_server_patching_time': :'estimatedDbServerPatchingTime',
        'estimated_storage_server_patching_time': :'estimatedStorageServerPatchingTime',
        'estimated_network_switches_patching_time': :'estimatedNetworkSwitchesPatchingTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'total_estimated_patching_time': :'Integer',
        'estimated_db_server_patching_time': :'Integer',
        'estimated_storage_server_patching_time': :'Integer',
        'estimated_network_switches_patching_time': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :total_estimated_patching_time The value to assign to the {#total_estimated_patching_time} property
    # @option attributes [Integer] :estimated_db_server_patching_time The value to assign to the {#estimated_db_server_patching_time} property
    # @option attributes [Integer] :estimated_storage_server_patching_time The value to assign to the {#estimated_storage_server_patching_time} property
    # @option attributes [Integer] :estimated_network_switches_patching_time The value to assign to the {#estimated_network_switches_patching_time} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.total_estimated_patching_time = attributes[:'totalEstimatedPatchingTime'] if attributes[:'totalEstimatedPatchingTime']

      raise 'You cannot provide both :totalEstimatedPatchingTime and :total_estimated_patching_time' if attributes.key?(:'totalEstimatedPatchingTime') && attributes.key?(:'total_estimated_patching_time')

      self.total_estimated_patching_time = attributes[:'total_estimated_patching_time'] if attributes[:'total_estimated_patching_time']

      self.estimated_db_server_patching_time = attributes[:'estimatedDbServerPatchingTime'] if attributes[:'estimatedDbServerPatchingTime']

      raise 'You cannot provide both :estimatedDbServerPatchingTime and :estimated_db_server_patching_time' if attributes.key?(:'estimatedDbServerPatchingTime') && attributes.key?(:'estimated_db_server_patching_time')

      self.estimated_db_server_patching_time = attributes[:'estimated_db_server_patching_time'] if attributes[:'estimated_db_server_patching_time']

      self.estimated_storage_server_patching_time = attributes[:'estimatedStorageServerPatchingTime'] if attributes[:'estimatedStorageServerPatchingTime']

      raise 'You cannot provide both :estimatedStorageServerPatchingTime and :estimated_storage_server_patching_time' if attributes.key?(:'estimatedStorageServerPatchingTime') && attributes.key?(:'estimated_storage_server_patching_time')

      self.estimated_storage_server_patching_time = attributes[:'estimated_storage_server_patching_time'] if attributes[:'estimated_storage_server_patching_time']

      self.estimated_network_switches_patching_time = attributes[:'estimatedNetworkSwitchesPatchingTime'] if attributes[:'estimatedNetworkSwitchesPatchingTime']

      raise 'You cannot provide both :estimatedNetworkSwitchesPatchingTime and :estimated_network_switches_patching_time' if attributes.key?(:'estimatedNetworkSwitchesPatchingTime') && attributes.key?(:'estimated_network_switches_patching_time')

      self.estimated_network_switches_patching_time = attributes[:'estimated_network_switches_patching_time'] if attributes[:'estimated_network_switches_patching_time']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        total_estimated_patching_time == other.total_estimated_patching_time &&
        estimated_db_server_patching_time == other.estimated_db_server_patching_time &&
        estimated_storage_server_patching_time == other.estimated_storage_server_patching_time &&
        estimated_network_switches_patching_time == other.estimated_network_switches_patching_time
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
      [total_estimated_patching_time, estimated_db_server_patching_time, estimated_storage_server_patching_time, estimated_network_switches_patching_time].hash
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