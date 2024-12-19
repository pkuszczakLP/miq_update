# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Defines the routing action taken on traffic flow with no route found.
  #
  class VnMonitoring::Models::NoRouteRoutingActionDetails
    # **[Required]** If true, the evaluated route table details are incomplete.
    # @return [BOOLEAN]
    attr_accessor :is_restricted_or_partial

    # [OCIDs](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the evaluated VCN route table.
    #
    # @return [String]
    attr_accessor :evaluated_vcn_route_table_id

    # [OCIDs](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of evaluated DRG route table.
    #
    # @return [String]
    attr_accessor :evaluated_drg_route_table_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'is_restricted_or_partial': :'isRestrictedOrPartial',
        'evaluated_vcn_route_table_id': :'evaluatedVcnRouteTableId',
        'evaluated_drg_route_table_id': :'evaluatedDrgRouteTableId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'is_restricted_or_partial': :'BOOLEAN',
        'evaluated_vcn_route_table_id': :'String',
        'evaluated_drg_route_table_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [BOOLEAN] :is_restricted_or_partial The value to assign to the {#is_restricted_or_partial} property
    # @option attributes [String] :evaluated_vcn_route_table_id The value to assign to the {#evaluated_vcn_route_table_id} property
    # @option attributes [String] :evaluated_drg_route_table_id The value to assign to the {#evaluated_drg_route_table_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.is_restricted_or_partial = attributes[:'isRestrictedOrPartial'] unless attributes[:'isRestrictedOrPartial'].nil?
      self.is_restricted_or_partial = false if is_restricted_or_partial.nil? && !attributes.key?(:'isRestrictedOrPartial') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isRestrictedOrPartial and :is_restricted_or_partial' if attributes.key?(:'isRestrictedOrPartial') && attributes.key?(:'is_restricted_or_partial')

      self.is_restricted_or_partial = attributes[:'is_restricted_or_partial'] unless attributes[:'is_restricted_or_partial'].nil?
      self.is_restricted_or_partial = false if is_restricted_or_partial.nil? && !attributes.key?(:'isRestrictedOrPartial') && !attributes.key?(:'is_restricted_or_partial') # rubocop:disable Style/StringLiterals

      self.evaluated_vcn_route_table_id = attributes[:'evaluatedVcnRouteTableId'] if attributes[:'evaluatedVcnRouteTableId']

      raise 'You cannot provide both :evaluatedVcnRouteTableId and :evaluated_vcn_route_table_id' if attributes.key?(:'evaluatedVcnRouteTableId') && attributes.key?(:'evaluated_vcn_route_table_id')

      self.evaluated_vcn_route_table_id = attributes[:'evaluated_vcn_route_table_id'] if attributes[:'evaluated_vcn_route_table_id']

      self.evaluated_drg_route_table_id = attributes[:'evaluatedDrgRouteTableId'] if attributes[:'evaluatedDrgRouteTableId']

      raise 'You cannot provide both :evaluatedDrgRouteTableId and :evaluated_drg_route_table_id' if attributes.key?(:'evaluatedDrgRouteTableId') && attributes.key?(:'evaluated_drg_route_table_id')

      self.evaluated_drg_route_table_id = attributes[:'evaluated_drg_route_table_id'] if attributes[:'evaluated_drg_route_table_id']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        is_restricted_or_partial == other.is_restricted_or_partial &&
        evaluated_vcn_route_table_id == other.evaluated_vcn_route_table_id &&
        evaluated_drg_route_table_id == other.evaluated_drg_route_table_id
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
      [is_restricted_or_partial, evaluated_vcn_route_table_id, evaluated_drg_route_table_id].hash
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
