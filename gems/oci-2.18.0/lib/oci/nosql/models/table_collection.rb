# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Results of ListTables.
  class Nosql::Models::TableCollection
    # A page of TableSummary objects.
    # @return [Array<OCI::Nosql::Models::TableSummary>]
    attr_accessor :items

    # The maximum number of reclaimable tables allowed in the tenancy.
    # @return [Integer]
    attr_accessor :max_auto_reclaimable_tables

    # The current number of reclaimable tables in the tenancy.
    # @return [Integer]
    attr_accessor :auto_reclaimable_tables

    # The current number of on demand capacity tables in the tenancy.
    # @return [Integer]
    attr_accessor :on_demand_capacity_tables

    # The maximum number of on demand capacity tables allowed in the tenancy.
    # @return [Integer]
    attr_accessor :max_on_demand_capacity_tables

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'items': :'items',
        'max_auto_reclaimable_tables': :'maxAutoReclaimableTables',
        'auto_reclaimable_tables': :'autoReclaimableTables',
        'on_demand_capacity_tables': :'onDemandCapacityTables',
        'max_on_demand_capacity_tables': :'maxOnDemandCapacityTables'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'items': :'Array<OCI::Nosql::Models::TableSummary>',
        'max_auto_reclaimable_tables': :'Integer',
        'auto_reclaimable_tables': :'Integer',
        'on_demand_capacity_tables': :'Integer',
        'max_on_demand_capacity_tables': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Array<OCI::Nosql::Models::TableSummary>] :items The value to assign to the {#items} property
    # @option attributes [Integer] :max_auto_reclaimable_tables The value to assign to the {#max_auto_reclaimable_tables} property
    # @option attributes [Integer] :auto_reclaimable_tables The value to assign to the {#auto_reclaimable_tables} property
    # @option attributes [Integer] :on_demand_capacity_tables The value to assign to the {#on_demand_capacity_tables} property
    # @option attributes [Integer] :max_on_demand_capacity_tables The value to assign to the {#max_on_demand_capacity_tables} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.items = attributes[:'items'] if attributes[:'items']

      self.max_auto_reclaimable_tables = attributes[:'maxAutoReclaimableTables'] if attributes[:'maxAutoReclaimableTables']

      raise 'You cannot provide both :maxAutoReclaimableTables and :max_auto_reclaimable_tables' if attributes.key?(:'maxAutoReclaimableTables') && attributes.key?(:'max_auto_reclaimable_tables')

      self.max_auto_reclaimable_tables = attributes[:'max_auto_reclaimable_tables'] if attributes[:'max_auto_reclaimable_tables']

      self.auto_reclaimable_tables = attributes[:'autoReclaimableTables'] if attributes[:'autoReclaimableTables']

      raise 'You cannot provide both :autoReclaimableTables and :auto_reclaimable_tables' if attributes.key?(:'autoReclaimableTables') && attributes.key?(:'auto_reclaimable_tables')

      self.auto_reclaimable_tables = attributes[:'auto_reclaimable_tables'] if attributes[:'auto_reclaimable_tables']

      self.on_demand_capacity_tables = attributes[:'onDemandCapacityTables'] if attributes[:'onDemandCapacityTables']

      raise 'You cannot provide both :onDemandCapacityTables and :on_demand_capacity_tables' if attributes.key?(:'onDemandCapacityTables') && attributes.key?(:'on_demand_capacity_tables')

      self.on_demand_capacity_tables = attributes[:'on_demand_capacity_tables'] if attributes[:'on_demand_capacity_tables']

      self.max_on_demand_capacity_tables = attributes[:'maxOnDemandCapacityTables'] if attributes[:'maxOnDemandCapacityTables']

      raise 'You cannot provide both :maxOnDemandCapacityTables and :max_on_demand_capacity_tables' if attributes.key?(:'maxOnDemandCapacityTables') && attributes.key?(:'max_on_demand_capacity_tables')

      self.max_on_demand_capacity_tables = attributes[:'max_on_demand_capacity_tables'] if attributes[:'max_on_demand_capacity_tables']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        items == other.items &&
        max_auto_reclaimable_tables == other.max_auto_reclaimable_tables &&
        auto_reclaimable_tables == other.auto_reclaimable_tables &&
        on_demand_capacity_tables == other.on_demand_capacity_tables &&
        max_on_demand_capacity_tables == other.max_on_demand_capacity_tables
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
      [items, max_auto_reclaimable_tables, auto_reclaimable_tables, on_demand_capacity_tables, max_on_demand_capacity_tables].hash
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
