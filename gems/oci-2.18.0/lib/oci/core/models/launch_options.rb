# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Options for tuning the compatibility and performance of VM shapes. The values that you specify override any
  # default values.
  #
  class Core::Models::LaunchOptions
    BOOT_VOLUME_TYPE_ENUM = [
      BOOT_VOLUME_TYPE_ISCSI = 'ISCSI'.freeze,
      BOOT_VOLUME_TYPE_SCSI = 'SCSI'.freeze,
      BOOT_VOLUME_TYPE_IDE = 'IDE'.freeze,
      BOOT_VOLUME_TYPE_VFIO = 'VFIO'.freeze,
      BOOT_VOLUME_TYPE_PARAVIRTUALIZED = 'PARAVIRTUALIZED'.freeze,
      BOOT_VOLUME_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    FIRMWARE_ENUM = [
      FIRMWARE_BIOS = 'BIOS'.freeze,
      FIRMWARE_UEFI_64 = 'UEFI_64'.freeze,
      FIRMWARE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    NETWORK_TYPE_ENUM = [
      NETWORK_TYPE_E1000 = 'E1000'.freeze,
      NETWORK_TYPE_VFIO = 'VFIO'.freeze,
      NETWORK_TYPE_PARAVIRTUALIZED = 'PARAVIRTUALIZED'.freeze,
      NETWORK_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    REMOTE_DATA_VOLUME_TYPE_ENUM = [
      REMOTE_DATA_VOLUME_TYPE_ISCSI = 'ISCSI'.freeze,
      REMOTE_DATA_VOLUME_TYPE_SCSI = 'SCSI'.freeze,
      REMOTE_DATA_VOLUME_TYPE_IDE = 'IDE'.freeze,
      REMOTE_DATA_VOLUME_TYPE_VFIO = 'VFIO'.freeze,
      REMOTE_DATA_VOLUME_TYPE_PARAVIRTUALIZED = 'PARAVIRTUALIZED'.freeze,
      REMOTE_DATA_VOLUME_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # Emulation type for the boot volume.
    # * `ISCSI` - ISCSI attached block storage device.
    # * `SCSI` - Emulated SCSI disk.
    # * `IDE` - Emulated IDE disk.
    # * `VFIO` - Direct attached Virtual Function storage. This is the default option for local data
    # volumes on platform images.
    # * `PARAVIRTUALIZED` - Paravirtualized disk. This is the default for boot volumes and remote block
    # storage volumes on platform images.
    #
    # @return [String]
    attr_reader :boot_volume_type

    # Firmware used to boot VM. Select the option that matches your operating system.
    # * `BIOS` - Boot VM using BIOS style firmware. This is compatible with both 32 bit and 64 bit operating
    # systems that boot using MBR style bootloaders.
    # * `UEFI_64` - Boot VM using UEFI style firmware compatible with 64 bit operating systems. This is the
    # default for platform images.
    #
    # @return [String]
    attr_reader :firmware

    # Emulation type for the physical network interface card (NIC).
    # * `E1000` - Emulated Gigabit ethernet controller. Compatible with Linux e1000 network driver.
    # * `VFIO` - Direct attached Virtual Function network controller. This is the networking type
    # when you launch an instance using hardware-assisted (SR-IOV) networking.
    # * `PARAVIRTUALIZED` - VM instances launch with paravirtualized devices using VirtIO drivers.
    #
    # @return [String]
    attr_reader :network_type

    # Emulation type for volume.
    # * `ISCSI` - ISCSI attached block storage device.
    # * `SCSI` - Emulated SCSI disk.
    # * `IDE` - Emulated IDE disk.
    # * `VFIO` - Direct attached Virtual Function storage. This is the default option for local data
    # volumes on platform images.
    # * `PARAVIRTUALIZED` - Paravirtualized disk. This is the default for boot volumes and remote block
    # storage volumes on platform images.
    #
    # @return [String]
    attr_reader :remote_data_volume_type

    # Deprecated. Instead use `isPvEncryptionInTransitEnabled` in
    # {#launch_instance_details launch_instance_details}.
    #
    # @return [BOOLEAN]
    attr_accessor :is_pv_encryption_in_transit_enabled

    # Whether to enable consistent volume naming feature. Defaults to false.
    # @return [BOOLEAN]
    attr_accessor :is_consistent_volume_naming_enabled

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'boot_volume_type': :'bootVolumeType',
        'firmware': :'firmware',
        'network_type': :'networkType',
        'remote_data_volume_type': :'remoteDataVolumeType',
        'is_pv_encryption_in_transit_enabled': :'isPvEncryptionInTransitEnabled',
        'is_consistent_volume_naming_enabled': :'isConsistentVolumeNamingEnabled'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'boot_volume_type': :'String',
        'firmware': :'String',
        'network_type': :'String',
        'remote_data_volume_type': :'String',
        'is_pv_encryption_in_transit_enabled': :'BOOLEAN',
        'is_consistent_volume_naming_enabled': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :boot_volume_type The value to assign to the {#boot_volume_type} property
    # @option attributes [String] :firmware The value to assign to the {#firmware} property
    # @option attributes [String] :network_type The value to assign to the {#network_type} property
    # @option attributes [String] :remote_data_volume_type The value to assign to the {#remote_data_volume_type} property
    # @option attributes [BOOLEAN] :is_pv_encryption_in_transit_enabled The value to assign to the {#is_pv_encryption_in_transit_enabled} property
    # @option attributes [BOOLEAN] :is_consistent_volume_naming_enabled The value to assign to the {#is_consistent_volume_naming_enabled} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.boot_volume_type = attributes[:'bootVolumeType'] if attributes[:'bootVolumeType']

      raise 'You cannot provide both :bootVolumeType and :boot_volume_type' if attributes.key?(:'bootVolumeType') && attributes.key?(:'boot_volume_type')

      self.boot_volume_type = attributes[:'boot_volume_type'] if attributes[:'boot_volume_type']

      self.firmware = attributes[:'firmware'] if attributes[:'firmware']

      self.network_type = attributes[:'networkType'] if attributes[:'networkType']

      raise 'You cannot provide both :networkType and :network_type' if attributes.key?(:'networkType') && attributes.key?(:'network_type')

      self.network_type = attributes[:'network_type'] if attributes[:'network_type']

      self.remote_data_volume_type = attributes[:'remoteDataVolumeType'] if attributes[:'remoteDataVolumeType']

      raise 'You cannot provide both :remoteDataVolumeType and :remote_data_volume_type' if attributes.key?(:'remoteDataVolumeType') && attributes.key?(:'remote_data_volume_type')

      self.remote_data_volume_type = attributes[:'remote_data_volume_type'] if attributes[:'remote_data_volume_type']

      self.is_pv_encryption_in_transit_enabled = attributes[:'isPvEncryptionInTransitEnabled'] unless attributes[:'isPvEncryptionInTransitEnabled'].nil?

      raise 'You cannot provide both :isPvEncryptionInTransitEnabled and :is_pv_encryption_in_transit_enabled' if attributes.key?(:'isPvEncryptionInTransitEnabled') && attributes.key?(:'is_pv_encryption_in_transit_enabled')

      self.is_pv_encryption_in_transit_enabled = attributes[:'is_pv_encryption_in_transit_enabled'] unless attributes[:'is_pv_encryption_in_transit_enabled'].nil?

      self.is_consistent_volume_naming_enabled = attributes[:'isConsistentVolumeNamingEnabled'] unless attributes[:'isConsistentVolumeNamingEnabled'].nil?

      raise 'You cannot provide both :isConsistentVolumeNamingEnabled and :is_consistent_volume_naming_enabled' if attributes.key?(:'isConsistentVolumeNamingEnabled') && attributes.key?(:'is_consistent_volume_naming_enabled')

      self.is_consistent_volume_naming_enabled = attributes[:'is_consistent_volume_naming_enabled'] unless attributes[:'is_consistent_volume_naming_enabled'].nil?
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] boot_volume_type Object to be assigned
    def boot_volume_type=(boot_volume_type)
      # rubocop:disable Style/ConditionalAssignment
      if boot_volume_type && !BOOT_VOLUME_TYPE_ENUM.include?(boot_volume_type)
        OCI.logger.debug("Unknown value for 'boot_volume_type' [" + boot_volume_type + "]. Mapping to 'BOOT_VOLUME_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @boot_volume_type = BOOT_VOLUME_TYPE_UNKNOWN_ENUM_VALUE
      else
        @boot_volume_type = boot_volume_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] firmware Object to be assigned
    def firmware=(firmware)
      # rubocop:disable Style/ConditionalAssignment
      if firmware && !FIRMWARE_ENUM.include?(firmware)
        OCI.logger.debug("Unknown value for 'firmware' [" + firmware + "]. Mapping to 'FIRMWARE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @firmware = FIRMWARE_UNKNOWN_ENUM_VALUE
      else
        @firmware = firmware
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] network_type Object to be assigned
    def network_type=(network_type)
      # rubocop:disable Style/ConditionalAssignment
      if network_type && !NETWORK_TYPE_ENUM.include?(network_type)
        OCI.logger.debug("Unknown value for 'network_type' [" + network_type + "]. Mapping to 'NETWORK_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @network_type = NETWORK_TYPE_UNKNOWN_ENUM_VALUE
      else
        @network_type = network_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] remote_data_volume_type Object to be assigned
    def remote_data_volume_type=(remote_data_volume_type)
      # rubocop:disable Style/ConditionalAssignment
      if remote_data_volume_type && !REMOTE_DATA_VOLUME_TYPE_ENUM.include?(remote_data_volume_type)
        OCI.logger.debug("Unknown value for 'remote_data_volume_type' [" + remote_data_volume_type + "]. Mapping to 'REMOTE_DATA_VOLUME_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @remote_data_volume_type = REMOTE_DATA_VOLUME_TYPE_UNKNOWN_ENUM_VALUE
      else
        @remote_data_volume_type = remote_data_volume_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        boot_volume_type == other.boot_volume_type &&
        firmware == other.firmware &&
        network_type == other.network_type &&
        remote_data_volume_type == other.remote_data_volume_type &&
        is_pv_encryption_in_transit_enabled == other.is_pv_encryption_in_transit_enabled &&
        is_consistent_volume_naming_enabled == other.is_consistent_volume_naming_enabled
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
      [boot_volume_type, firmware, network_type, remote_data_volume_type, is_pv_encryption_in_transit_enabled, is_consistent_volume_naming_enabled].hash
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
