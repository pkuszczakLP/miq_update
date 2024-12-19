# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'host_resource_statistics'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Contains memory statistics.
  #
  class Opsi::Models::HostMemoryStatistics < Opsi::Models::HostResourceStatistics
    # @return [Float]
    attr_accessor :free_memory

    # @return [Float]
    attr_accessor :available_memory

    # Total number of huge pages.
    #
    # @return [Integer]
    attr_accessor :huge_pages_total

    # Size of huge pages in megabytes.
    #
    # @return [Float]
    attr_accessor :huge_page_size_in_mb

    # Total number of available huge pages.
    #
    # @return [Integer]
    attr_accessor :huge_pages_free

    # Total number of huge pages which are used or reserved.
    #
    # @return [Integer]
    attr_accessor :huge_pages_reserved

    # @return [OCI::Opsi::Models::SummaryStatistics]
    attr_accessor :load

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'usage': :'usage',
        'capacity': :'capacity',
        'utilization_percent': :'utilizationPercent',
        'usage_change_percent': :'usageChangePercent',
        'resource_name': :'resourceName',
        'free_memory': :'freeMemory',
        'available_memory': :'availableMemory',
        'huge_pages_total': :'hugePagesTotal',
        'huge_page_size_in_mb': :'hugePageSizeInMB',
        'huge_pages_free': :'hugePagesFree',
        'huge_pages_reserved': :'hugePagesReserved',
        'load': :'load'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'usage': :'Float',
        'capacity': :'Float',
        'utilization_percent': :'Float',
        'usage_change_percent': :'Float',
        'resource_name': :'String',
        'free_memory': :'Float',
        'available_memory': :'Float',
        'huge_pages_total': :'Integer',
        'huge_page_size_in_mb': :'Float',
        'huge_pages_free': :'Integer',
        'huge_pages_reserved': :'Integer',
        'load': :'OCI::Opsi::Models::SummaryStatistics'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Float] :usage The value to assign to the {OCI::Opsi::Models::HostResourceStatistics#usage #usage} proprety
    # @option attributes [Float] :capacity The value to assign to the {OCI::Opsi::Models::HostResourceStatistics#capacity #capacity} proprety
    # @option attributes [Float] :utilization_percent The value to assign to the {OCI::Opsi::Models::HostResourceStatistics#utilization_percent #utilization_percent} proprety
    # @option attributes [Float] :usage_change_percent The value to assign to the {OCI::Opsi::Models::HostResourceStatistics#usage_change_percent #usage_change_percent} proprety
    # @option attributes [Float] :free_memory The value to assign to the {#free_memory} property
    # @option attributes [Float] :available_memory The value to assign to the {#available_memory} property
    # @option attributes [Integer] :huge_pages_total The value to assign to the {#huge_pages_total} property
    # @option attributes [Float] :huge_page_size_in_mb The value to assign to the {#huge_page_size_in_mb} property
    # @option attributes [Integer] :huge_pages_free The value to assign to the {#huge_pages_free} property
    # @option attributes [Integer] :huge_pages_reserved The value to assign to the {#huge_pages_reserved} property
    # @option attributes [OCI::Opsi::Models::SummaryStatistics] :load The value to assign to the {#load} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['resourceName'] = 'HOST_MEMORY_STATISTICS'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.free_memory = attributes[:'freeMemory'] if attributes[:'freeMemory']

      raise 'You cannot provide both :freeMemory and :free_memory' if attributes.key?(:'freeMemory') && attributes.key?(:'free_memory')

      self.free_memory = attributes[:'free_memory'] if attributes[:'free_memory']

      self.available_memory = attributes[:'availableMemory'] if attributes[:'availableMemory']

      raise 'You cannot provide both :availableMemory and :available_memory' if attributes.key?(:'availableMemory') && attributes.key?(:'available_memory')

      self.available_memory = attributes[:'available_memory'] if attributes[:'available_memory']

      self.huge_pages_total = attributes[:'hugePagesTotal'] if attributes[:'hugePagesTotal']

      raise 'You cannot provide both :hugePagesTotal and :huge_pages_total' if attributes.key?(:'hugePagesTotal') && attributes.key?(:'huge_pages_total')

      self.huge_pages_total = attributes[:'huge_pages_total'] if attributes[:'huge_pages_total']

      self.huge_page_size_in_mb = attributes[:'hugePageSizeInMB'] if attributes[:'hugePageSizeInMB']

      raise 'You cannot provide both :hugePageSizeInMB and :huge_page_size_in_mb' if attributes.key?(:'hugePageSizeInMB') && attributes.key?(:'huge_page_size_in_mb')

      self.huge_page_size_in_mb = attributes[:'huge_page_size_in_mb'] if attributes[:'huge_page_size_in_mb']

      self.huge_pages_free = attributes[:'hugePagesFree'] if attributes[:'hugePagesFree']

      raise 'You cannot provide both :hugePagesFree and :huge_pages_free' if attributes.key?(:'hugePagesFree') && attributes.key?(:'huge_pages_free')

      self.huge_pages_free = attributes[:'huge_pages_free'] if attributes[:'huge_pages_free']

      self.huge_pages_reserved = attributes[:'hugePagesReserved'] if attributes[:'hugePagesReserved']

      raise 'You cannot provide both :hugePagesReserved and :huge_pages_reserved' if attributes.key?(:'hugePagesReserved') && attributes.key?(:'huge_pages_reserved')

      self.huge_pages_reserved = attributes[:'huge_pages_reserved'] if attributes[:'huge_pages_reserved']

      self.load = attributes[:'load'] if attributes[:'load']
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
        utilization_percent == other.utilization_percent &&
        usage_change_percent == other.usage_change_percent &&
        resource_name == other.resource_name &&
        free_memory == other.free_memory &&
        available_memory == other.available_memory &&
        huge_pages_total == other.huge_pages_total &&
        huge_page_size_in_mb == other.huge_page_size_in_mb &&
        huge_pages_free == other.huge_pages_free &&
        huge_pages_reserved == other.huge_pages_reserved &&
        load == other.load
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
      [usage, capacity, utilization_percent, usage_change_percent, resource_name, free_memory, available_memory, huge_pages_total, huge_page_size_in_mb, huge_pages_free, huge_pages_reserved, load].hash
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
