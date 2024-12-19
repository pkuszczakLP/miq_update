# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Contains resource statistics with usage unit
  class Opsi::Models::ResourceStatistics
    # **[Required]** Total amount used of the resource metric type (CPU, STORAGE).
    #
    # @return [Float]
    attr_accessor :usage

    # **[Required]** The maximum allocated amount of the resource metric type  (CPU, STORAGE).
    #
    # @return [Float]
    attr_accessor :capacity

    # The base allocated amount of the resource metric type  (CPU, STORAGE).
    #
    # @return [Float]
    attr_accessor :base_capacity

    # Indicates if auto scaling feature is enabled or disabled on a database. It will be false for all metrics other than CPU.
    # @return [BOOLEAN]
    attr_accessor :is_auto_scaling_enabled

    # **[Required]** Resource utilization in percentage
    # @return [Float]
    attr_accessor :utilization_percent

    # **[Required]** Change in resource utilization in percentage
    # @return [Float]
    attr_accessor :usage_change_percent

    # Array of instance metrics
    # @return [Array<OCI::Opsi::Models::InstanceMetrics>]
    attr_accessor :instance_metrics

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'usage': :'usage',
        'capacity': :'capacity',
        'base_capacity': :'baseCapacity',
        'is_auto_scaling_enabled': :'isAutoScalingEnabled',
        'utilization_percent': :'utilizationPercent',
        'usage_change_percent': :'usageChangePercent',
        'instance_metrics': :'instanceMetrics'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'usage': :'Float',
        'capacity': :'Float',
        'base_capacity': :'Float',
        'is_auto_scaling_enabled': :'BOOLEAN',
        'utilization_percent': :'Float',
        'usage_change_percent': :'Float',
        'instance_metrics': :'Array<OCI::Opsi::Models::InstanceMetrics>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Float] :usage The value to assign to the {#usage} property
    # @option attributes [Float] :capacity The value to assign to the {#capacity} property
    # @option attributes [Float] :base_capacity The value to assign to the {#base_capacity} property
    # @option attributes [BOOLEAN] :is_auto_scaling_enabled The value to assign to the {#is_auto_scaling_enabled} property
    # @option attributes [Float] :utilization_percent The value to assign to the {#utilization_percent} property
    # @option attributes [Float] :usage_change_percent The value to assign to the {#usage_change_percent} property
    # @option attributes [Array<OCI::Opsi::Models::InstanceMetrics>] :instance_metrics The value to assign to the {#instance_metrics} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.usage = attributes[:'usage'] if attributes[:'usage']

      self.capacity = attributes[:'capacity'] if attributes[:'capacity']

      self.base_capacity = attributes[:'baseCapacity'] if attributes[:'baseCapacity']

      raise 'You cannot provide both :baseCapacity and :base_capacity' if attributes.key?(:'baseCapacity') && attributes.key?(:'base_capacity')

      self.base_capacity = attributes[:'base_capacity'] if attributes[:'base_capacity']

      self.is_auto_scaling_enabled = attributes[:'isAutoScalingEnabled'] unless attributes[:'isAutoScalingEnabled'].nil?

      raise 'You cannot provide both :isAutoScalingEnabled and :is_auto_scaling_enabled' if attributes.key?(:'isAutoScalingEnabled') && attributes.key?(:'is_auto_scaling_enabled')

      self.is_auto_scaling_enabled = attributes[:'is_auto_scaling_enabled'] unless attributes[:'is_auto_scaling_enabled'].nil?

      self.utilization_percent = attributes[:'utilizationPercent'] if attributes[:'utilizationPercent']

      raise 'You cannot provide both :utilizationPercent and :utilization_percent' if attributes.key?(:'utilizationPercent') && attributes.key?(:'utilization_percent')

      self.utilization_percent = attributes[:'utilization_percent'] if attributes[:'utilization_percent']

      self.usage_change_percent = attributes[:'usageChangePercent'] if attributes[:'usageChangePercent']

      raise 'You cannot provide both :usageChangePercent and :usage_change_percent' if attributes.key?(:'usageChangePercent') && attributes.key?(:'usage_change_percent')

      self.usage_change_percent = attributes[:'usage_change_percent'] if attributes[:'usage_change_percent']

      self.instance_metrics = attributes[:'instanceMetrics'] if attributes[:'instanceMetrics']

      raise 'You cannot provide both :instanceMetrics and :instance_metrics' if attributes.key?(:'instanceMetrics') && attributes.key?(:'instance_metrics')

      self.instance_metrics = attributes[:'instance_metrics'] if attributes[:'instance_metrics']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        usage == other.usage &&
        capacity == other.capacity &&
        base_capacity == other.base_capacity &&
        is_auto_scaling_enabled == other.is_auto_scaling_enabled &&
        utilization_percent == other.utilization_percent &&
        usage_change_percent == other.usage_change_percent &&
        instance_metrics == other.instance_metrics
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
      [usage, capacity, base_capacity, is_auto_scaling_enabled, utilization_percent, usage_change_percent, instance_metrics].hash
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
