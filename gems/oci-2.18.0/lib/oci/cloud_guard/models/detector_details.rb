# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details of a Detector Rule
  class CloudGuard::Models::DetectorDetails
    RISK_LEVEL_ENUM = [
      RISK_LEVEL_CRITICAL = 'CRITICAL'.freeze,
      RISK_LEVEL_HIGH = 'HIGH'.freeze,
      RISK_LEVEL_MEDIUM = 'MEDIUM'.freeze,
      RISK_LEVEL_LOW = 'LOW'.freeze,
      RISK_LEVEL_MINOR = 'MINOR'.freeze,
      RISK_LEVEL_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Enables the control
    # @return [BOOLEAN]
    attr_accessor :is_enabled

    # The Risk Level
    # @return [String]
    attr_reader :risk_level

    # Configuration details
    # @return [Array<OCI::CloudGuard::Models::DetectorConfiguration>]
    attr_accessor :configurations

    # @return [OCI::CloudGuard::Models::Condition]
    attr_accessor :condition

    # user defined labels for a detector rule
    # @return [Array<String>]
    attr_accessor :labels

    # configuration allowed or not
    # @return [BOOLEAN]
    attr_accessor :is_configuration_allowed

    # Cutover point for an elevated resource Risk Score to create a Problem
    # @return [Integer]
    attr_accessor :problem_threshold

    # List of target types for which the detector rule is applicable
    # @return [Array<String>]
    attr_accessor :target_types

    # List of sighting types
    # @return [Array<OCI::CloudGuard::Models::SightingType>]
    attr_accessor :sighting_types

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'is_enabled': :'isEnabled',
        'risk_level': :'riskLevel',
        'configurations': :'configurations',
        'condition': :'condition',
        'labels': :'labels',
        'is_configuration_allowed': :'isConfigurationAllowed',
        'problem_threshold': :'problemThreshold',
        'target_types': :'targetTypes',
        'sighting_types': :'sightingTypes'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'is_enabled': :'BOOLEAN',
        'risk_level': :'String',
        'configurations': :'Array<OCI::CloudGuard::Models::DetectorConfiguration>',
        'condition': :'OCI::CloudGuard::Models::Condition',
        'labels': :'Array<String>',
        'is_configuration_allowed': :'BOOLEAN',
        'problem_threshold': :'Integer',
        'target_types': :'Array<String>',
        'sighting_types': :'Array<OCI::CloudGuard::Models::SightingType>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [BOOLEAN] :is_enabled The value to assign to the {#is_enabled} property
    # @option attributes [String] :risk_level The value to assign to the {#risk_level} property
    # @option attributes [Array<OCI::CloudGuard::Models::DetectorConfiguration>] :configurations The value to assign to the {#configurations} property
    # @option attributes [OCI::CloudGuard::Models::Condition] :condition The value to assign to the {#condition} property
    # @option attributes [Array<String>] :labels The value to assign to the {#labels} property
    # @option attributes [BOOLEAN] :is_configuration_allowed The value to assign to the {#is_configuration_allowed} property
    # @option attributes [Integer] :problem_threshold The value to assign to the {#problem_threshold} property
    # @option attributes [Array<String>] :target_types The value to assign to the {#target_types} property
    # @option attributes [Array<OCI::CloudGuard::Models::SightingType>] :sighting_types The value to assign to the {#sighting_types} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.is_enabled = attributes[:'isEnabled'] unless attributes[:'isEnabled'].nil?

      raise 'You cannot provide both :isEnabled and :is_enabled' if attributes.key?(:'isEnabled') && attributes.key?(:'is_enabled')

      self.is_enabled = attributes[:'is_enabled'] unless attributes[:'is_enabled'].nil?

      self.risk_level = attributes[:'riskLevel'] if attributes[:'riskLevel']

      raise 'You cannot provide both :riskLevel and :risk_level' if attributes.key?(:'riskLevel') && attributes.key?(:'risk_level')

      self.risk_level = attributes[:'risk_level'] if attributes[:'risk_level']

      self.configurations = attributes[:'configurations'] if attributes[:'configurations']

      self.condition = attributes[:'condition'] if attributes[:'condition']

      self.labels = attributes[:'labels'] if attributes[:'labels']

      self.is_configuration_allowed = attributes[:'isConfigurationAllowed'] unless attributes[:'isConfigurationAllowed'].nil?

      raise 'You cannot provide both :isConfigurationAllowed and :is_configuration_allowed' if attributes.key?(:'isConfigurationAllowed') && attributes.key?(:'is_configuration_allowed')

      self.is_configuration_allowed = attributes[:'is_configuration_allowed'] unless attributes[:'is_configuration_allowed'].nil?

      self.problem_threshold = attributes[:'problemThreshold'] if attributes[:'problemThreshold']

      raise 'You cannot provide both :problemThreshold and :problem_threshold' if attributes.key?(:'problemThreshold') && attributes.key?(:'problem_threshold')

      self.problem_threshold = attributes[:'problem_threshold'] if attributes[:'problem_threshold']

      self.target_types = attributes[:'targetTypes'] if attributes[:'targetTypes']

      raise 'You cannot provide both :targetTypes and :target_types' if attributes.key?(:'targetTypes') && attributes.key?(:'target_types')

      self.target_types = attributes[:'target_types'] if attributes[:'target_types']

      self.sighting_types = attributes[:'sightingTypes'] if attributes[:'sightingTypes']

      raise 'You cannot provide both :sightingTypes and :sighting_types' if attributes.key?(:'sightingTypes') && attributes.key?(:'sighting_types')

      self.sighting_types = attributes[:'sighting_types'] if attributes[:'sighting_types']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] risk_level Object to be assigned
    def risk_level=(risk_level)
      # rubocop:disable Style/ConditionalAssignment
      if risk_level && !RISK_LEVEL_ENUM.include?(risk_level)
        OCI.logger.debug("Unknown value for 'risk_level' [" + risk_level + "]. Mapping to 'RISK_LEVEL_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @risk_level = RISK_LEVEL_UNKNOWN_ENUM_VALUE
      else
        @risk_level = risk_level
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        is_enabled == other.is_enabled &&
        risk_level == other.risk_level &&
        configurations == other.configurations &&
        condition == other.condition &&
        labels == other.labels &&
        is_configuration_allowed == other.is_configuration_allowed &&
        problem_threshold == other.problem_threshold &&
        target_types == other.target_types &&
        sighting_types == other.sighting_types
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
      [is_enabled, risk_level, configurations, condition, labels, is_configuration_allowed, problem_threshold, target_types, sighting_types].hash
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
