# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Inventory of JMS resources in a compartment during a specified time period.
  class Jms::Models::ResourceInventory
    # **[Required]** The number of _active_ fleets.
    # @return [Integer]
    attr_accessor :active_fleet_count

    # **[Required]** The number of managed instances.
    # @return [Integer]
    attr_accessor :managed_instance_count

    # **[Required]** The number of Java Runtimes.
    # @return [Integer]
    attr_accessor :jre_count

    # **[Required]** The number of Java installations.
    # @return [Integer]
    attr_accessor :installation_count

    # **[Required]** The number of applications.
    # @return [Integer]
    attr_accessor :application_count

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'active_fleet_count': :'activeFleetCount',
        'managed_instance_count': :'managedInstanceCount',
        'jre_count': :'jreCount',
        'installation_count': :'installationCount',
        'application_count': :'applicationCount'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'active_fleet_count': :'Integer',
        'managed_instance_count': :'Integer',
        'jre_count': :'Integer',
        'installation_count': :'Integer',
        'application_count': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :active_fleet_count The value to assign to the {#active_fleet_count} property
    # @option attributes [Integer] :managed_instance_count The value to assign to the {#managed_instance_count} property
    # @option attributes [Integer] :jre_count The value to assign to the {#jre_count} property
    # @option attributes [Integer] :installation_count The value to assign to the {#installation_count} property
    # @option attributes [Integer] :application_count The value to assign to the {#application_count} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.active_fleet_count = attributes[:'activeFleetCount'] if attributes[:'activeFleetCount']

      raise 'You cannot provide both :activeFleetCount and :active_fleet_count' if attributes.key?(:'activeFleetCount') && attributes.key?(:'active_fleet_count')

      self.active_fleet_count = attributes[:'active_fleet_count'] if attributes[:'active_fleet_count']

      self.managed_instance_count = attributes[:'managedInstanceCount'] if attributes[:'managedInstanceCount']

      raise 'You cannot provide both :managedInstanceCount and :managed_instance_count' if attributes.key?(:'managedInstanceCount') && attributes.key?(:'managed_instance_count')

      self.managed_instance_count = attributes[:'managed_instance_count'] if attributes[:'managed_instance_count']

      self.jre_count = attributes[:'jreCount'] if attributes[:'jreCount']

      raise 'You cannot provide both :jreCount and :jre_count' if attributes.key?(:'jreCount') && attributes.key?(:'jre_count')

      self.jre_count = attributes[:'jre_count'] if attributes[:'jre_count']

      self.installation_count = attributes[:'installationCount'] if attributes[:'installationCount']

      raise 'You cannot provide both :installationCount and :installation_count' if attributes.key?(:'installationCount') && attributes.key?(:'installation_count')

      self.installation_count = attributes[:'installation_count'] if attributes[:'installation_count']

      self.application_count = attributes[:'applicationCount'] if attributes[:'applicationCount']

      raise 'You cannot provide both :applicationCount and :application_count' if attributes.key?(:'applicationCount') && attributes.key?(:'application_count')

      self.application_count = attributes[:'application_count'] if attributes[:'application_count']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        active_fleet_count == other.active_fleet_count &&
        managed_instance_count == other.managed_instance_count &&
        jre_count == other.jre_count &&
        installation_count == other.installation_count &&
        application_count == other.application_count
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
      [active_fleet_count, managed_instance_count, jre_count, installation_count, application_count].hash
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
