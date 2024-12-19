# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The Aggregation of Management Agent Dimensions
  class ManagementAgent::Models::ManagementAgentAggregationDimensions
    AVAILABILITY_STATUS_ENUM = [
      AVAILABILITY_STATUS_ACTIVE = 'ACTIVE'.freeze,
      AVAILABILITY_STATUS_SILENT = 'SILENT'.freeze,
      AVAILABILITY_STATUS_NOT_AVAILABLE = 'NOT_AVAILABLE'.freeze,
      AVAILABILITY_STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    PLATFORM_TYPE_ENUM = [
      PLATFORM_TYPE_LINUX = 'LINUX'.freeze,
      PLATFORM_TYPE_WINDOWS = 'WINDOWS'.freeze,
      PLATFORM_TYPE_SOLARIS = 'SOLARIS'.freeze,
      PLATFORM_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    INSTALL_TYPE_ENUM = [
      INSTALL_TYPE_AGENT = 'AGENT'.freeze,
      INSTALL_TYPE_GATEWAY = 'GATEWAY'.freeze,
      INSTALL_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The availability status of managementAgent
    # @return [String]
    attr_reader :availability_status

    # Platform Type
    # @return [String]
    attr_reader :platform_type

    # Agent image version
    # @return [String]
    attr_accessor :version

    # Whether or not a managementAgent has at least one plugin
    # @return [BOOLEAN]
    attr_accessor :has_plugins

    # The install type, either AGENT or GATEWAY
    # @return [String]
    attr_reader :install_type

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'availability_status': :'availabilityStatus',
        'platform_type': :'platformType',
        'version': :'version',
        'has_plugins': :'hasPlugins',
        'install_type': :'installType'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'availability_status': :'String',
        'platform_type': :'String',
        'version': :'String',
        'has_plugins': :'BOOLEAN',
        'install_type': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :availability_status The value to assign to the {#availability_status} property
    # @option attributes [String] :platform_type The value to assign to the {#platform_type} property
    # @option attributes [String] :version The value to assign to the {#version} property
    # @option attributes [BOOLEAN] :has_plugins The value to assign to the {#has_plugins} property
    # @option attributes [String] :install_type The value to assign to the {#install_type} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.availability_status = attributes[:'availabilityStatus'] if attributes[:'availabilityStatus']

      raise 'You cannot provide both :availabilityStatus and :availability_status' if attributes.key?(:'availabilityStatus') && attributes.key?(:'availability_status')

      self.availability_status = attributes[:'availability_status'] if attributes[:'availability_status']

      self.platform_type = attributes[:'platformType'] if attributes[:'platformType']

      raise 'You cannot provide both :platformType and :platform_type' if attributes.key?(:'platformType') && attributes.key?(:'platform_type')

      self.platform_type = attributes[:'platform_type'] if attributes[:'platform_type']

      self.version = attributes[:'version'] if attributes[:'version']

      self.has_plugins = attributes[:'hasPlugins'] unless attributes[:'hasPlugins'].nil?

      raise 'You cannot provide both :hasPlugins and :has_plugins' if attributes.key?(:'hasPlugins') && attributes.key?(:'has_plugins')

      self.has_plugins = attributes[:'has_plugins'] unless attributes[:'has_plugins'].nil?

      self.install_type = attributes[:'installType'] if attributes[:'installType']

      raise 'You cannot provide both :installType and :install_type' if attributes.key?(:'installType') && attributes.key?(:'install_type')

      self.install_type = attributes[:'install_type'] if attributes[:'install_type']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] availability_status Object to be assigned
    def availability_status=(availability_status)
      # rubocop:disable Style/ConditionalAssignment
      if availability_status && !AVAILABILITY_STATUS_ENUM.include?(availability_status)
        OCI.logger.debug("Unknown value for 'availability_status' [" + availability_status + "]. Mapping to 'AVAILABILITY_STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @availability_status = AVAILABILITY_STATUS_UNKNOWN_ENUM_VALUE
      else
        @availability_status = availability_status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] platform_type Object to be assigned
    def platform_type=(platform_type)
      # rubocop:disable Style/ConditionalAssignment
      if platform_type && !PLATFORM_TYPE_ENUM.include?(platform_type)
        OCI.logger.debug("Unknown value for 'platform_type' [" + platform_type + "]. Mapping to 'PLATFORM_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @platform_type = PLATFORM_TYPE_UNKNOWN_ENUM_VALUE
      else
        @platform_type = platform_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] install_type Object to be assigned
    def install_type=(install_type)
      # rubocop:disable Style/ConditionalAssignment
      if install_type && !INSTALL_TYPE_ENUM.include?(install_type)
        OCI.logger.debug("Unknown value for 'install_type' [" + install_type + "]. Mapping to 'INSTALL_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @install_type = INSTALL_TYPE_UNKNOWN_ENUM_VALUE
      else
        @install_type = install_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        availability_status == other.availability_status &&
        platform_type == other.platform_type &&
        version == other.version &&
        has_plugins == other.has_plugins &&
        install_type == other.install_type
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
      [availability_status, platform_type, version, has_plugins, install_type].hash
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
