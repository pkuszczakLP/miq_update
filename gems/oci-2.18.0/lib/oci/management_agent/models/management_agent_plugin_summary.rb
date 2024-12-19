# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Summary of the ManagementAgentPlugin.
  class ManagementAgent::Models::ManagementAgentPluginSummary
    SUPPORTED_PLATFORM_TYPES_ENUM = [
      SUPPORTED_PLATFORM_TYPES_LINUX = 'LINUX'.freeze,
      SUPPORTED_PLATFORM_TYPES_WINDOWS = 'WINDOWS'.freeze,
      SUPPORTED_PLATFORM_TYPES_SOLARIS = 'SOLARIS'.freeze,
      SUPPORTED_PLATFORM_TYPES_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATE_TERMINATED = 'TERMINATED'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Management Agent Plugin Id
    # @return [String]
    attr_accessor :id

    # **[Required]** Management Agent Plugin Name
    # @return [String]
    attr_accessor :name

    # Management Agent Plugin Version
    # @return [Integer]
    attr_accessor :version

    # Supported Platform Types
    # @return [Array<String>]
    attr_reader :supported_platform_types

    # Management Agent Plugin Display Name
    # @return [String]
    attr_accessor :display_name

    # Management Agent Plugin description
    # @return [String]
    attr_accessor :description

    # A flag to indicate whether a given plugin can be deployed from Agent Console UI or not.
    # @return [BOOLEAN]
    attr_accessor :is_console_deployable

    # **[Required]** The current state of Management Agent Plugin
    # @return [String]
    attr_reader :lifecycle_state

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'name': :'name',
        'version': :'version',
        'supported_platform_types': :'supportedPlatformTypes',
        'display_name': :'displayName',
        'description': :'description',
        'is_console_deployable': :'isConsoleDeployable',
        'lifecycle_state': :'lifecycleState'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'name': :'String',
        'version': :'Integer',
        'supported_platform_types': :'Array<String>',
        'display_name': :'String',
        'description': :'String',
        'is_console_deployable': :'BOOLEAN',
        'lifecycle_state': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [Integer] :version The value to assign to the {#version} property
    # @option attributes [Array<String>] :supported_platform_types The value to assign to the {#supported_platform_types} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [BOOLEAN] :is_console_deployable The value to assign to the {#is_console_deployable} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.name = attributes[:'name'] if attributes[:'name']

      self.version = attributes[:'version'] if attributes[:'version']

      self.supported_platform_types = attributes[:'supportedPlatformTypes'] if attributes[:'supportedPlatformTypes']

      raise 'You cannot provide both :supportedPlatformTypes and :supported_platform_types' if attributes.key?(:'supportedPlatformTypes') && attributes.key?(:'supported_platform_types')

      self.supported_platform_types = attributes[:'supported_platform_types'] if attributes[:'supported_platform_types']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.is_console_deployable = attributes[:'isConsoleDeployable'] unless attributes[:'isConsoleDeployable'].nil?
      self.is_console_deployable = true if is_console_deployable.nil? && !attributes.key?(:'isConsoleDeployable') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isConsoleDeployable and :is_console_deployable' if attributes.key?(:'isConsoleDeployable') && attributes.key?(:'is_console_deployable')

      self.is_console_deployable = attributes[:'is_console_deployable'] unless attributes[:'is_console_deployable'].nil?
      self.is_console_deployable = true if is_console_deployable.nil? && !attributes.key?(:'isConsoleDeployable') && !attributes.key?(:'is_console_deployable') # rubocop:disable Style/StringLiterals

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] supported_platform_types Object to be assigned
    def supported_platform_types=(supported_platform_types)
      # rubocop:disable Style/ConditionalAssignment
      if supported_platform_types.nil?
        @supported_platform_types = nil
      else
        @supported_platform_types =
          supported_platform_types.collect do |item|
            if SUPPORTED_PLATFORM_TYPES_ENUM.include?(item)
              item
            else
              OCI.logger.debug("Unknown value for 'supported_platform_types' [#{item}]. Mapping to 'SUPPORTED_PLATFORM_TYPES_UNKNOWN_ENUM_VALUE'") if OCI.logger
              SUPPORTED_PLATFORM_TYPES_UNKNOWN_ENUM_VALUE
            end
          end
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] lifecycle_state Object to be assigned
    def lifecycle_state=(lifecycle_state)
      # rubocop:disable Style/ConditionalAssignment
      if lifecycle_state && !LIFECYCLE_STATE_ENUM.include?(lifecycle_state)
        OCI.logger.debug("Unknown value for 'lifecycle_state' [" + lifecycle_state + "]. Mapping to 'LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @lifecycle_state = LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE
      else
        @lifecycle_state = lifecycle_state
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        name == other.name &&
        version == other.version &&
        supported_platform_types == other.supported_platform_types &&
        display_name == other.display_name &&
        description == other.description &&
        is_console_deployable == other.is_console_deployable &&
        lifecycle_state == other.lifecycle_state
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
      [id, name, version, supported_platform_types, display_name, description, is_console_deployable, lifecycle_state].hash
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
