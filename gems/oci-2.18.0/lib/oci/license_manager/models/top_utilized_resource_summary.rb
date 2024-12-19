# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A summary of a top utlized resource.
  #
  class LicenseManager::Models::TopUtilizedResourceSummary
    UNIT_TYPE_ENUM = [
      UNIT_TYPE_OCPU = 'OCPU'.freeze,
      UNIT_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the resource.
    # @return [String]
    attr_accessor :resource_id

    # **[Required]** Resource canonical name.
    # @return [String]
    attr_accessor :resource_name

    # **[Required]** The compartment [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) that contains the resource.
    # @return [String]
    attr_accessor :resource_compartment_id

    # **[Required]** The display name of the compartment that contains the resource.
    # @return [String]
    attr_accessor :resource_compartment_name

    # **[Required]** Number of license units consumed by the resource.
    # @return [Float]
    attr_accessor :total_units

    # **[Required]** The resource unit.
    # @return [String]
    attr_reader :unit_type

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'resource_id': :'resourceId',
        'resource_name': :'resourceName',
        'resource_compartment_id': :'resourceCompartmentId',
        'resource_compartment_name': :'resourceCompartmentName',
        'total_units': :'totalUnits',
        'unit_type': :'unitType'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'resource_id': :'String',
        'resource_name': :'String',
        'resource_compartment_id': :'String',
        'resource_compartment_name': :'String',
        'total_units': :'Float',
        'unit_type': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :resource_id The value to assign to the {#resource_id} property
    # @option attributes [String] :resource_name The value to assign to the {#resource_name} property
    # @option attributes [String] :resource_compartment_id The value to assign to the {#resource_compartment_id} property
    # @option attributes [String] :resource_compartment_name The value to assign to the {#resource_compartment_name} property
    # @option attributes [Float] :total_units The value to assign to the {#total_units} property
    # @option attributes [String] :unit_type The value to assign to the {#unit_type} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.resource_id = attributes[:'resourceId'] if attributes[:'resourceId']

      raise 'You cannot provide both :resourceId and :resource_id' if attributes.key?(:'resourceId') && attributes.key?(:'resource_id')

      self.resource_id = attributes[:'resource_id'] if attributes[:'resource_id']

      self.resource_name = attributes[:'resourceName'] if attributes[:'resourceName']

      raise 'You cannot provide both :resourceName and :resource_name' if attributes.key?(:'resourceName') && attributes.key?(:'resource_name')

      self.resource_name = attributes[:'resource_name'] if attributes[:'resource_name']

      self.resource_compartment_id = attributes[:'resourceCompartmentId'] if attributes[:'resourceCompartmentId']

      raise 'You cannot provide both :resourceCompartmentId and :resource_compartment_id' if attributes.key?(:'resourceCompartmentId') && attributes.key?(:'resource_compartment_id')

      self.resource_compartment_id = attributes[:'resource_compartment_id'] if attributes[:'resource_compartment_id']

      self.resource_compartment_name = attributes[:'resourceCompartmentName'] if attributes[:'resourceCompartmentName']

      raise 'You cannot provide both :resourceCompartmentName and :resource_compartment_name' if attributes.key?(:'resourceCompartmentName') && attributes.key?(:'resource_compartment_name')

      self.resource_compartment_name = attributes[:'resource_compartment_name'] if attributes[:'resource_compartment_name']

      self.total_units = attributes[:'totalUnits'] if attributes[:'totalUnits']
      self.total_units = 0.0 if total_units.nil? && !attributes.key?(:'totalUnits') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :totalUnits and :total_units' if attributes.key?(:'totalUnits') && attributes.key?(:'total_units')

      self.total_units = attributes[:'total_units'] if attributes[:'total_units']
      self.total_units = 0.0 if total_units.nil? && !attributes.key?(:'totalUnits') && !attributes.key?(:'total_units') # rubocop:disable Style/StringLiterals

      self.unit_type = attributes[:'unitType'] if attributes[:'unitType']

      raise 'You cannot provide both :unitType and :unit_type' if attributes.key?(:'unitType') && attributes.key?(:'unit_type')

      self.unit_type = attributes[:'unit_type'] if attributes[:'unit_type']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] unit_type Object to be assigned
    def unit_type=(unit_type)
      # rubocop:disable Style/ConditionalAssignment
      if unit_type && !UNIT_TYPE_ENUM.include?(unit_type)
        OCI.logger.debug("Unknown value for 'unit_type' [" + unit_type + "]. Mapping to 'UNIT_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @unit_type = UNIT_TYPE_UNKNOWN_ENUM_VALUE
      else
        @unit_type = unit_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        resource_id == other.resource_id &&
        resource_name == other.resource_name &&
        resource_compartment_id == other.resource_compartment_id &&
        resource_compartment_name == other.resource_compartment_name &&
        total_units == other.total_units &&
        unit_type == other.unit_type
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
      [resource_id, resource_name, resource_compartment_id, resource_compartment_name, total_units, unit_type].hash
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
