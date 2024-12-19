# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The platform configuration requested for the instance.
  #
  # If you provide the parameter, the instance is created with the platform configuration that you specify.
  # For any values that you omit, the instance uses the default configuration values for the `shape` that you
  # specify. If you don't provide the parameter, the default values for the `shape` are used.
  #
  # Each shape only supports certain configurable values. If the values that you provide are not valid for the
  # specified `shape`, an error is returned.
  #
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class Core::Models::InstanceConfigurationLaunchInstancePlatformConfig
    TYPE_ENUM = [
      TYPE_AMD_MILAN_BM = 'AMD_MILAN_BM'.freeze,
      TYPE_AMD_ROME_BM = 'AMD_ROME_BM'.freeze,
      TYPE_AMD_ROME_BM_GPU = 'AMD_ROME_BM_GPU'.freeze,
      TYPE_INTEL_ICELAKE_BM = 'INTEL_ICELAKE_BM'.freeze,
      TYPE_INTEL_SKYLAKE_BM = 'INTEL_SKYLAKE_BM'.freeze,
      TYPE_AMD_VM = 'AMD_VM'.freeze,
      TYPE_INTEL_VM = 'INTEL_VM'.freeze,
      TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The type of platform being configured.
    #
    # @return [String]
    attr_reader :type

    # Whether Secure Boot is enabled on the instance.
    #
    # @return [BOOLEAN]
    attr_accessor :is_secure_boot_enabled

    # Whether the Trusted Platform Module (TPM) is enabled on the instance.
    #
    # @return [BOOLEAN]
    attr_accessor :is_trusted_platform_module_enabled

    # Whether the Measured Boot feature is enabled on the instance.
    #
    # @return [BOOLEAN]
    attr_accessor :is_measured_boot_enabled

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'type',
        'is_secure_boot_enabled': :'isSecureBootEnabled',
        'is_trusted_platform_module_enabled': :'isTrustedPlatformModuleEnabled',
        'is_measured_boot_enabled': :'isMeasuredBootEnabled'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'String',
        'is_secure_boot_enabled': :'BOOLEAN',
        'is_trusted_platform_module_enabled': :'BOOLEAN',
        'is_measured_boot_enabled': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'type'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::Core::Models::InstanceConfigurationAmdMilanBmLaunchInstancePlatformConfig' if type == 'AMD_MILAN_BM'
      return 'OCI::Core::Models::InstanceConfigurationIntelVmLaunchInstancePlatformConfig' if type == 'INTEL_VM'
      return 'OCI::Core::Models::InstanceConfigurationIntelIcelakeBmLaunchInstancePlatformConfig' if type == 'INTEL_ICELAKE_BM'
      return 'OCI::Core::Models::InstanceConfigurationAmdRomeBmLaunchInstancePlatformConfig' if type == 'AMD_ROME_BM'
      return 'OCI::Core::Models::InstanceConfigurationIntelSkylakeBmLaunchInstancePlatformConfig' if type == 'INTEL_SKYLAKE_BM'
      return 'OCI::Core::Models::InstanceConfigurationAmdRomeBmGpuLaunchInstancePlatformConfig' if type == 'AMD_ROME_BM_GPU'
      return 'OCI::Core::Models::InstanceConfigurationAmdVmLaunchInstancePlatformConfig' if type == 'AMD_VM'

      # TODO: Log a warning when the subtype is not found.
      'OCI::Core::Models::InstanceConfigurationLaunchInstancePlatformConfig'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :type The value to assign to the {#type} property
    # @option attributes [BOOLEAN] :is_secure_boot_enabled The value to assign to the {#is_secure_boot_enabled} property
    # @option attributes [BOOLEAN] :is_trusted_platform_module_enabled The value to assign to the {#is_trusted_platform_module_enabled} property
    # @option attributes [BOOLEAN] :is_measured_boot_enabled The value to assign to the {#is_measured_boot_enabled} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.type = attributes[:'type'] if attributes[:'type']

      self.is_secure_boot_enabled = attributes[:'isSecureBootEnabled'] unless attributes[:'isSecureBootEnabled'].nil?
      self.is_secure_boot_enabled = false if is_secure_boot_enabled.nil? && !attributes.key?(:'isSecureBootEnabled') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isSecureBootEnabled and :is_secure_boot_enabled' if attributes.key?(:'isSecureBootEnabled') && attributes.key?(:'is_secure_boot_enabled')

      self.is_secure_boot_enabled = attributes[:'is_secure_boot_enabled'] unless attributes[:'is_secure_boot_enabled'].nil?
      self.is_secure_boot_enabled = false if is_secure_boot_enabled.nil? && !attributes.key?(:'isSecureBootEnabled') && !attributes.key?(:'is_secure_boot_enabled') # rubocop:disable Style/StringLiterals

      self.is_trusted_platform_module_enabled = attributes[:'isTrustedPlatformModuleEnabled'] unless attributes[:'isTrustedPlatformModuleEnabled'].nil?
      self.is_trusted_platform_module_enabled = false if is_trusted_platform_module_enabled.nil? && !attributes.key?(:'isTrustedPlatformModuleEnabled') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isTrustedPlatformModuleEnabled and :is_trusted_platform_module_enabled' if attributes.key?(:'isTrustedPlatformModuleEnabled') && attributes.key?(:'is_trusted_platform_module_enabled')

      self.is_trusted_platform_module_enabled = attributes[:'is_trusted_platform_module_enabled'] unless attributes[:'is_trusted_platform_module_enabled'].nil?
      self.is_trusted_platform_module_enabled = false if is_trusted_platform_module_enabled.nil? && !attributes.key?(:'isTrustedPlatformModuleEnabled') && !attributes.key?(:'is_trusted_platform_module_enabled') # rubocop:disable Style/StringLiterals

      self.is_measured_boot_enabled = attributes[:'isMeasuredBootEnabled'] unless attributes[:'isMeasuredBootEnabled'].nil?
      self.is_measured_boot_enabled = false if is_measured_boot_enabled.nil? && !attributes.key?(:'isMeasuredBootEnabled') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isMeasuredBootEnabled and :is_measured_boot_enabled' if attributes.key?(:'isMeasuredBootEnabled') && attributes.key?(:'is_measured_boot_enabled')

      self.is_measured_boot_enabled = attributes[:'is_measured_boot_enabled'] unless attributes[:'is_measured_boot_enabled'].nil?
      self.is_measured_boot_enabled = false if is_measured_boot_enabled.nil? && !attributes.key?(:'isMeasuredBootEnabled') && !attributes.key?(:'is_measured_boot_enabled') # rubocop:disable Style/StringLiterals
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] type Object to be assigned
    def type=(type)
      # rubocop:disable Style/ConditionalAssignment
      if type && !TYPE_ENUM.include?(type)
        OCI.logger.debug("Unknown value for 'type' [" + type + "]. Mapping to 'TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @type = TYPE_UNKNOWN_ENUM_VALUE
      else
        @type = type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        type == other.type &&
        is_secure_boot_enabled == other.is_secure_boot_enabled &&
        is_trusted_platform_module_enabled == other.is_trusted_platform_module_enabled &&
        is_measured_boot_enabled == other.is_measured_boot_enabled
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
      [type, is_secure_boot_enabled, is_trusted_platform_module_enabled, is_measured_boot_enabled].hash
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