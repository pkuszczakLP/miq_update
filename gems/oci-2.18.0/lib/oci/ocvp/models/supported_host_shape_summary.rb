# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A specific compute shape supported by the Oracle Cloud VMware Solution.
  #
  class Ocvp::Models::SupportedHostShapeSummary
    SUPPORTED_OPERATIONS_ENUM = [
      SUPPORTED_OPERATIONS_CREATE_SDDC = 'CREATE_SDDC'.freeze,
      SUPPORTED_OPERATIONS_DELETE_SDDC = 'DELETE_SDDC'.freeze,
      SUPPORTED_OPERATIONS_CREATE_ESXI_HOST = 'CREATE_ESXI_HOST'.freeze,
      SUPPORTED_OPERATIONS_DELETE_ESXI_HOST = 'DELETE_ESXI_HOST'.freeze,
      SUPPORTED_OPERATIONS_UPGRADE_HCX = 'UPGRADE_HCX'.freeze,
      SUPPORTED_OPERATIONS_DOWNGRADE_HCX = 'DOWNGRADE_HCX'.freeze,
      SUPPORTED_OPERATIONS_CANCEL_DOWNGRADE_HCX = 'CANCEL_DOWNGRADE_HCX'.freeze,
      SUPPORTED_OPERATIONS_REFRESH_HCX_LICENSE_STATUS = 'REFRESH_HCX_LICENSE_STATUS'.freeze,
      SUPPORTED_OPERATIONS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    SUPPORTED_SDDC_TYPES_ENUM = [
      SUPPORTED_SDDC_TYPES_PRODUCTION = 'PRODUCTION'.freeze,
      SUPPORTED_SDDC_TYPES_NON_PRODUCTION = 'NON_PRODUCTION'.freeze,
      SUPPORTED_SDDC_TYPES_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The name of the supported compute shape.
    #
    # @return [String]
    attr_accessor :name

    # **[Required]** The operations where you can use the shape. The operations can be CREATE_SDDC or CREATE_ESXI_HOST.
    #
    # @return [Array<String>]
    attr_reader :supported_operations

    # **[Required]** The family of the shape. ESXi hosts of one SDDC must have the same shape family.
    #
    # @return [String]
    attr_accessor :shape_family

    # The default OCPU count of the shape.
    #
    # @return [Float]
    attr_accessor :default_ocpu_count

    # Support OCPU count of the shape.
    #
    # @return [Array<Float>]
    attr_accessor :supported_ocpu_count

    # The supported SDDC types for the shape.
    #
    # @return [Array<String>]
    attr_reader :supported_sddc_types

    # The VMware software versions supported by the shape.
    #
    # @return [Array<String>]
    attr_accessor :supported_vmware_software_versions

    # Description of the shape.
    #
    # @return [String]
    attr_accessor :description

    # Indicates whether the shape supports shielded instances.
    # @return [BOOLEAN]
    attr_accessor :is_support_shielded_instances

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'supported_operations': :'supportedOperations',
        'shape_family': :'shapeFamily',
        'default_ocpu_count': :'defaultOcpuCount',
        'supported_ocpu_count': :'supportedOcpuCount',
        'supported_sddc_types': :'supportedSddcTypes',
        'supported_vmware_software_versions': :'supportedVmwareSoftwareVersions',
        'description': :'description',
        'is_support_shielded_instances': :'isSupportShieldedInstances'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'supported_operations': :'Array<String>',
        'shape_family': :'String',
        'default_ocpu_count': :'Float',
        'supported_ocpu_count': :'Array<Float>',
        'supported_sddc_types': :'Array<String>',
        'supported_vmware_software_versions': :'Array<String>',
        'description': :'String',
        'is_support_shielded_instances': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [Array<String>] :supported_operations The value to assign to the {#supported_operations} property
    # @option attributes [String] :shape_family The value to assign to the {#shape_family} property
    # @option attributes [Float] :default_ocpu_count The value to assign to the {#default_ocpu_count} property
    # @option attributes [Array<Float>] :supported_ocpu_count The value to assign to the {#supported_ocpu_count} property
    # @option attributes [Array<String>] :supported_sddc_types The value to assign to the {#supported_sddc_types} property
    # @option attributes [Array<String>] :supported_vmware_software_versions The value to assign to the {#supported_vmware_software_versions} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [BOOLEAN] :is_support_shielded_instances The value to assign to the {#is_support_shielded_instances} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.supported_operations = attributes[:'supportedOperations'] if attributes[:'supportedOperations']

      raise 'You cannot provide both :supportedOperations and :supported_operations' if attributes.key?(:'supportedOperations') && attributes.key?(:'supported_operations')

      self.supported_operations = attributes[:'supported_operations'] if attributes[:'supported_operations']

      self.shape_family = attributes[:'shapeFamily'] if attributes[:'shapeFamily']

      raise 'You cannot provide both :shapeFamily and :shape_family' if attributes.key?(:'shapeFamily') && attributes.key?(:'shape_family')

      self.shape_family = attributes[:'shape_family'] if attributes[:'shape_family']

      self.default_ocpu_count = attributes[:'defaultOcpuCount'] if attributes[:'defaultOcpuCount']

      raise 'You cannot provide both :defaultOcpuCount and :default_ocpu_count' if attributes.key?(:'defaultOcpuCount') && attributes.key?(:'default_ocpu_count')

      self.default_ocpu_count = attributes[:'default_ocpu_count'] if attributes[:'default_ocpu_count']

      self.supported_ocpu_count = attributes[:'supportedOcpuCount'] if attributes[:'supportedOcpuCount']

      raise 'You cannot provide both :supportedOcpuCount and :supported_ocpu_count' if attributes.key?(:'supportedOcpuCount') && attributes.key?(:'supported_ocpu_count')

      self.supported_ocpu_count = attributes[:'supported_ocpu_count'] if attributes[:'supported_ocpu_count']

      self.supported_sddc_types = attributes[:'supportedSddcTypes'] if attributes[:'supportedSddcTypes']

      raise 'You cannot provide both :supportedSddcTypes and :supported_sddc_types' if attributes.key?(:'supportedSddcTypes') && attributes.key?(:'supported_sddc_types')

      self.supported_sddc_types = attributes[:'supported_sddc_types'] if attributes[:'supported_sddc_types']

      self.supported_vmware_software_versions = attributes[:'supportedVmwareSoftwareVersions'] if attributes[:'supportedVmwareSoftwareVersions']

      raise 'You cannot provide both :supportedVmwareSoftwareVersions and :supported_vmware_software_versions' if attributes.key?(:'supportedVmwareSoftwareVersions') && attributes.key?(:'supported_vmware_software_versions')

      self.supported_vmware_software_versions = attributes[:'supported_vmware_software_versions'] if attributes[:'supported_vmware_software_versions']

      self.description = attributes[:'description'] if attributes[:'description']

      self.is_support_shielded_instances = attributes[:'isSupportShieldedInstances'] unless attributes[:'isSupportShieldedInstances'].nil?
      self.is_support_shielded_instances = false if is_support_shielded_instances.nil? && !attributes.key?(:'isSupportShieldedInstances') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isSupportShieldedInstances and :is_support_shielded_instances' if attributes.key?(:'isSupportShieldedInstances') && attributes.key?(:'is_support_shielded_instances')

      self.is_support_shielded_instances = attributes[:'is_support_shielded_instances'] unless attributes[:'is_support_shielded_instances'].nil?
      self.is_support_shielded_instances = false if is_support_shielded_instances.nil? && !attributes.key?(:'isSupportShieldedInstances') && !attributes.key?(:'is_support_shielded_instances') # rubocop:disable Style/StringLiterals
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] supported_operations Object to be assigned
    def supported_operations=(supported_operations)
      # rubocop:disable Style/ConditionalAssignment
      if supported_operations.nil?
        @supported_operations = nil
      else
        @supported_operations =
          supported_operations.collect do |item|
            if SUPPORTED_OPERATIONS_ENUM.include?(item)
              item
            else
              OCI.logger.debug("Unknown value for 'supported_operations' [#{item}]. Mapping to 'SUPPORTED_OPERATIONS_UNKNOWN_ENUM_VALUE'") if OCI.logger
              SUPPORTED_OPERATIONS_UNKNOWN_ENUM_VALUE
            end
          end
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] supported_sddc_types Object to be assigned
    def supported_sddc_types=(supported_sddc_types)
      # rubocop:disable Style/ConditionalAssignment
      if supported_sddc_types.nil?
        @supported_sddc_types = nil
      else
        @supported_sddc_types =
          supported_sddc_types.collect do |item|
            if SUPPORTED_SDDC_TYPES_ENUM.include?(item)
              item
            else
              OCI.logger.debug("Unknown value for 'supported_sddc_types' [#{item}]. Mapping to 'SUPPORTED_SDDC_TYPES_UNKNOWN_ENUM_VALUE'") if OCI.logger
              SUPPORTED_SDDC_TYPES_UNKNOWN_ENUM_VALUE
            end
          end
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        name == other.name &&
        supported_operations == other.supported_operations &&
        shape_family == other.shape_family &&
        default_ocpu_count == other.default_ocpu_count &&
        supported_ocpu_count == other.supported_ocpu_count &&
        supported_sddc_types == other.supported_sddc_types &&
        supported_vmware_software_versions == other.supported_vmware_software_versions &&
        description == other.description &&
        is_support_shielded_instances == other.is_support_shielded_instances
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
      [name, supported_operations, shape_family, default_ocpu_count, supported_ocpu_count, supported_sddc_types, supported_vmware_software_versions, description, is_support_shielded_instances].hash
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
