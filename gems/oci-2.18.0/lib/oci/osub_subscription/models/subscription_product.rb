# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Product description
  #
  class OsubSubscription::Models::SubscriptionProduct
    # **[Required]** Product part numner
    #
    # @return [String]
    attr_accessor :part_number

    # **[Required]** Product name
    #
    # @return [String]
    attr_accessor :name

    # **[Required]** Unit of measure
    #
    # @return [String]
    attr_accessor :unit_of_measure

    # Product provisioning group
    #
    # @return [String]
    attr_accessor :provisioning_group

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'part_number': :'partNumber',
        'name': :'name',
        'unit_of_measure': :'unitOfMeasure',
        'provisioning_group': :'provisioningGroup'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'part_number': :'String',
        'name': :'String',
        'unit_of_measure': :'String',
        'provisioning_group': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :part_number The value to assign to the {#part_number} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :unit_of_measure The value to assign to the {#unit_of_measure} property
    # @option attributes [String] :provisioning_group The value to assign to the {#provisioning_group} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.part_number = attributes[:'partNumber'] if attributes[:'partNumber']

      raise 'You cannot provide both :partNumber and :part_number' if attributes.key?(:'partNumber') && attributes.key?(:'part_number')

      self.part_number = attributes[:'part_number'] if attributes[:'part_number']

      self.name = attributes[:'name'] if attributes[:'name']

      self.unit_of_measure = attributes[:'unitOfMeasure'] if attributes[:'unitOfMeasure']

      raise 'You cannot provide both :unitOfMeasure and :unit_of_measure' if attributes.key?(:'unitOfMeasure') && attributes.key?(:'unit_of_measure')

      self.unit_of_measure = attributes[:'unit_of_measure'] if attributes[:'unit_of_measure']

      self.provisioning_group = attributes[:'provisioningGroup'] if attributes[:'provisioningGroup']

      raise 'You cannot provide both :provisioningGroup and :provisioning_group' if attributes.key?(:'provisioningGroup') && attributes.key?(:'provisioning_group')

      self.provisioning_group = attributes[:'provisioning_group'] if attributes[:'provisioning_group']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        part_number == other.part_number &&
        name == other.name &&
        unit_of_measure == other.unit_of_measure &&
        provisioning_group == other.provisioning_group
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
      [part_number, name, unit_of_measure, provisioning_group].hash
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
