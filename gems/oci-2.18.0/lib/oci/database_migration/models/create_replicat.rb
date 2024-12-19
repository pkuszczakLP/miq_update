# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Parameters for GoldenGate Replicat processes.
  #
  class DatabaseMigration::Models::CreateReplicat
    # Number of threads used to read trail files (valid for Parallel Replicat)
    #
    # @return [Integer]
    attr_accessor :map_parallelism

    # Defines the range in which the Replicat automatically adjusts its apply parallelism (valid for Parallel Replicat)
    #
    # @return [Integer]
    attr_accessor :min_apply_parallelism

    # Defines the range in which the Replicat automatically adjusts its apply parallelism (valid for Parallel Replicat)
    #
    # @return [Integer]
    attr_accessor :max_apply_parallelism

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'map_parallelism': :'mapParallelism',
        'min_apply_parallelism': :'minApplyParallelism',
        'max_apply_parallelism': :'maxApplyParallelism'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'map_parallelism': :'Integer',
        'min_apply_parallelism': :'Integer',
        'max_apply_parallelism': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :map_parallelism The value to assign to the {#map_parallelism} property
    # @option attributes [Integer] :min_apply_parallelism The value to assign to the {#min_apply_parallelism} property
    # @option attributes [Integer] :max_apply_parallelism The value to assign to the {#max_apply_parallelism} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.map_parallelism = attributes[:'mapParallelism'] if attributes[:'mapParallelism']

      raise 'You cannot provide both :mapParallelism and :map_parallelism' if attributes.key?(:'mapParallelism') && attributes.key?(:'map_parallelism')

      self.map_parallelism = attributes[:'map_parallelism'] if attributes[:'map_parallelism']

      self.min_apply_parallelism = attributes[:'minApplyParallelism'] if attributes[:'minApplyParallelism']

      raise 'You cannot provide both :minApplyParallelism and :min_apply_parallelism' if attributes.key?(:'minApplyParallelism') && attributes.key?(:'min_apply_parallelism')

      self.min_apply_parallelism = attributes[:'min_apply_parallelism'] if attributes[:'min_apply_parallelism']

      self.max_apply_parallelism = attributes[:'maxApplyParallelism'] if attributes[:'maxApplyParallelism']

      raise 'You cannot provide both :maxApplyParallelism and :max_apply_parallelism' if attributes.key?(:'maxApplyParallelism') && attributes.key?(:'max_apply_parallelism')

      self.max_apply_parallelism = attributes[:'max_apply_parallelism'] if attributes[:'max_apply_parallelism']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        map_parallelism == other.map_parallelism &&
        min_apply_parallelism == other.min_apply_parallelism &&
        max_apply_parallelism == other.max_apply_parallelism
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
      [map_parallelism, min_apply_parallelism, max_apply_parallelism].hash
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
