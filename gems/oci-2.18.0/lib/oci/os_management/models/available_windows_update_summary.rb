# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # An update available for installation on the Windows managed instance.
  class OsManagement::Models::AvailableWindowsUpdateSummary
    UPDATE_TYPE_ENUM = [
      UPDATE_TYPE_SECURITY = 'SECURITY'.freeze,
      UPDATE_TYPE_BUG = 'BUG'.freeze,
      UPDATE_TYPE_ENHANCEMENT = 'ENHANCEMENT'.freeze,
      UPDATE_TYPE_OTHER = 'OTHER'.freeze,
      UPDATE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    IS_ELIGIBLE_FOR_INSTALLATION_ENUM = [
      IS_ELIGIBLE_FOR_INSTALLATION_INSTALLABLE = 'INSTALLABLE'.freeze,
      IS_ELIGIBLE_FOR_INSTALLATION_NOT_INSTALLABLE = 'NOT_INSTALLABLE'.freeze,
      IS_ELIGIBLE_FOR_INSTALLATION_UNKNOWN = 'UNKNOWN'.freeze,
      IS_ELIGIBLE_FOR_INSTALLATION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Windows Update name
    # @return [String]
    attr_accessor :display_name

    # **[Required]** Unique identifier for the Windows update. NOTE - This is not an OCID,
    # but is a unique identifier assigned by Microsoft.
    # Example: `6981d463-cd91-4a26-b7c4-ea4ded9183ed`
    #
    # @return [String]
    attr_accessor :name

    # **[Required]** The purpose of this update.
    # @return [String]
    attr_reader :update_type

    # Indicates whether the update can be installed using OSMS.
    # @return [String]
    attr_reader :is_eligible_for_installation

    # Indicates whether a reboot may be required to complete installation of this update.
    # @return [BOOLEAN]
    attr_accessor :is_reboot_required_for_installation

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'displayName',
        'name': :'name',
        'update_type': :'updateType',
        'is_eligible_for_installation': :'isEligibleForInstallation',
        'is_reboot_required_for_installation': :'isRebootRequiredForInstallation'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'String',
        'name': :'String',
        'update_type': :'String',
        'is_eligible_for_installation': :'String',
        'is_reboot_required_for_installation': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :update_type The value to assign to the {#update_type} property
    # @option attributes [String] :is_eligible_for_installation The value to assign to the {#is_eligible_for_installation} property
    # @option attributes [BOOLEAN] :is_reboot_required_for_installation The value to assign to the {#is_reboot_required_for_installation} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.name = attributes[:'name'] if attributes[:'name']

      self.update_type = attributes[:'updateType'] if attributes[:'updateType']

      raise 'You cannot provide both :updateType and :update_type' if attributes.key?(:'updateType') && attributes.key?(:'update_type')

      self.update_type = attributes[:'update_type'] if attributes[:'update_type']

      self.is_eligible_for_installation = attributes[:'isEligibleForInstallation'] if attributes[:'isEligibleForInstallation']

      raise 'You cannot provide both :isEligibleForInstallation and :is_eligible_for_installation' if attributes.key?(:'isEligibleForInstallation') && attributes.key?(:'is_eligible_for_installation')

      self.is_eligible_for_installation = attributes[:'is_eligible_for_installation'] if attributes[:'is_eligible_for_installation']

      self.is_reboot_required_for_installation = attributes[:'isRebootRequiredForInstallation'] unless attributes[:'isRebootRequiredForInstallation'].nil?

      raise 'You cannot provide both :isRebootRequiredForInstallation and :is_reboot_required_for_installation' if attributes.key?(:'isRebootRequiredForInstallation') && attributes.key?(:'is_reboot_required_for_installation')

      self.is_reboot_required_for_installation = attributes[:'is_reboot_required_for_installation'] unless attributes[:'is_reboot_required_for_installation'].nil?
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] update_type Object to be assigned
    def update_type=(update_type)
      # rubocop:disable Style/ConditionalAssignment
      if update_type && !UPDATE_TYPE_ENUM.include?(update_type)
        OCI.logger.debug("Unknown value for 'update_type' [" + update_type + "]. Mapping to 'UPDATE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @update_type = UPDATE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @update_type = update_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] is_eligible_for_installation Object to be assigned
    def is_eligible_for_installation=(is_eligible_for_installation)
      # rubocop:disable Style/ConditionalAssignment
      if is_eligible_for_installation && !IS_ELIGIBLE_FOR_INSTALLATION_ENUM.include?(is_eligible_for_installation)
        OCI.logger.debug("Unknown value for 'is_eligible_for_installation' [" + is_eligible_for_installation + "]. Mapping to 'IS_ELIGIBLE_FOR_INSTALLATION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @is_eligible_for_installation = IS_ELIGIBLE_FOR_INSTALLATION_UNKNOWN_ENUM_VALUE
      else
        @is_eligible_for_installation = is_eligible_for_installation
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        display_name == other.display_name &&
        name == other.name &&
        update_type == other.update_type &&
        is_eligible_for_installation == other.is_eligible_for_installation &&
        is_reboot_required_for_installation == other.is_reboot_required_for_installation
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
      [display_name, name, update_type, is_eligible_for_installation, is_reboot_required_for_installation].hash
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
