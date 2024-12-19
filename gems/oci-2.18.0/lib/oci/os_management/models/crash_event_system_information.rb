# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Detailed information about system at the time of the crash.
  class OsManagement::Models::CrashEventSystemInformation
    ARCHITECTURE_ENUM = [
      ARCHITECTURE_IA_32 = 'IA_32'.freeze,
      ARCHITECTURE_X86_64 = 'X86_64'.freeze,
      ARCHITECTURE_AARCH64 = 'AARCH64'.freeze,
      ARCHITECTURE_SPARC = 'SPARC'.freeze,
      ARCHITECTURE_AMD64_DEBIAN = 'AMD64_DEBIAN'.freeze,
      ARCHITECTURE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    OS_FAMILY_ENUM = [
      OS_FAMILY_LINUX = 'LINUX'.freeze,
      OS_FAMILY_WINDOWS = 'WINDOWS'.freeze,
      OS_FAMILY_ALL = 'ALL'.freeze,
      OS_FAMILY_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # system architecture
    # @return [String]
    attr_reader :architecture

    # Active ksplice kernel version (uptrack-uname -r)
    # @return [String]
    attr_accessor :ksplice_effective_kernel_version

    # The Operating System type of the managed instance.
    # @return [String]
    attr_reader :os_family

    # Operating System Name (OCA value)
    # @return [String]
    attr_accessor :os_name

    # Operating System Kernel Release (uname -v)
    # @return [String]
    attr_accessor :os_kernel_release

    # Operating System Kernel Version (uname -r)
    # @return [String]
    attr_accessor :os_kernel_version

    # Version of the OS (VERSION from /etc/os-release)
    # @return [String]
    attr_accessor :os_system_version

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'architecture': :'architecture',
        'ksplice_effective_kernel_version': :'kspliceEffectiveKernelVersion',
        'os_family': :'osFamily',
        'os_name': :'osName',
        'os_kernel_release': :'osKernelRelease',
        'os_kernel_version': :'osKernelVersion',
        'os_system_version': :'osSystemVersion'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'architecture': :'String',
        'ksplice_effective_kernel_version': :'String',
        'os_family': :'String',
        'os_name': :'String',
        'os_kernel_release': :'String',
        'os_kernel_version': :'String',
        'os_system_version': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :architecture The value to assign to the {#architecture} property
    # @option attributes [String] :ksplice_effective_kernel_version The value to assign to the {#ksplice_effective_kernel_version} property
    # @option attributes [String] :os_family The value to assign to the {#os_family} property
    # @option attributes [String] :os_name The value to assign to the {#os_name} property
    # @option attributes [String] :os_kernel_release The value to assign to the {#os_kernel_release} property
    # @option attributes [String] :os_kernel_version The value to assign to the {#os_kernel_version} property
    # @option attributes [String] :os_system_version The value to assign to the {#os_system_version} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.architecture = attributes[:'architecture'] if attributes[:'architecture']

      self.ksplice_effective_kernel_version = attributes[:'kspliceEffectiveKernelVersion'] if attributes[:'kspliceEffectiveKernelVersion']

      raise 'You cannot provide both :kspliceEffectiveKernelVersion and :ksplice_effective_kernel_version' if attributes.key?(:'kspliceEffectiveKernelVersion') && attributes.key?(:'ksplice_effective_kernel_version')

      self.ksplice_effective_kernel_version = attributes[:'ksplice_effective_kernel_version'] if attributes[:'ksplice_effective_kernel_version']

      self.os_family = attributes[:'osFamily'] if attributes[:'osFamily']

      raise 'You cannot provide both :osFamily and :os_family' if attributes.key?(:'osFamily') && attributes.key?(:'os_family')

      self.os_family = attributes[:'os_family'] if attributes[:'os_family']

      self.os_name = attributes[:'osName'] if attributes[:'osName']

      raise 'You cannot provide both :osName and :os_name' if attributes.key?(:'osName') && attributes.key?(:'os_name')

      self.os_name = attributes[:'os_name'] if attributes[:'os_name']

      self.os_kernel_release = attributes[:'osKernelRelease'] if attributes[:'osKernelRelease']

      raise 'You cannot provide both :osKernelRelease and :os_kernel_release' if attributes.key?(:'osKernelRelease') && attributes.key?(:'os_kernel_release')

      self.os_kernel_release = attributes[:'os_kernel_release'] if attributes[:'os_kernel_release']

      self.os_kernel_version = attributes[:'osKernelVersion'] if attributes[:'osKernelVersion']

      raise 'You cannot provide both :osKernelVersion and :os_kernel_version' if attributes.key?(:'osKernelVersion') && attributes.key?(:'os_kernel_version')

      self.os_kernel_version = attributes[:'os_kernel_version'] if attributes[:'os_kernel_version']

      self.os_system_version = attributes[:'osSystemVersion'] if attributes[:'osSystemVersion']

      raise 'You cannot provide both :osSystemVersion and :os_system_version' if attributes.key?(:'osSystemVersion') && attributes.key?(:'os_system_version')

      self.os_system_version = attributes[:'os_system_version'] if attributes[:'os_system_version']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] architecture Object to be assigned
    def architecture=(architecture)
      # rubocop:disable Style/ConditionalAssignment
      if architecture && !ARCHITECTURE_ENUM.include?(architecture)
        OCI.logger.debug("Unknown value for 'architecture' [" + architecture + "]. Mapping to 'ARCHITECTURE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @architecture = ARCHITECTURE_UNKNOWN_ENUM_VALUE
      else
        @architecture = architecture
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] os_family Object to be assigned
    def os_family=(os_family)
      # rubocop:disable Style/ConditionalAssignment
      if os_family && !OS_FAMILY_ENUM.include?(os_family)
        OCI.logger.debug("Unknown value for 'os_family' [" + os_family + "]. Mapping to 'OS_FAMILY_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @os_family = OS_FAMILY_UNKNOWN_ENUM_VALUE
      else
        @os_family = os_family
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        architecture == other.architecture &&
        ksplice_effective_kernel_version == other.ksplice_effective_kernel_version &&
        os_family == other.os_family &&
        os_name == other.os_name &&
        os_kernel_release == other.os_kernel_release &&
        os_kernel_version == other.os_kernel_version &&
        os_system_version == other.os_system_version
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
      [architecture, ksplice_effective_kernel_version, os_family, os_name, os_kernel_release, os_kernel_version, os_system_version].hash
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
