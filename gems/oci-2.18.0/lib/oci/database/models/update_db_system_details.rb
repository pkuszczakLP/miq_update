# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Describes the parameters for updating the DB system.
  #
  # **Warning:** Oracle recommends that you avoid using any confidential information when you supply string values using the API.
  #
  class Database::Models::UpdateDbSystemDetails
    LICENSE_MODEL_ENUM = [
      LICENSE_MODEL_LICENSE_INCLUDED = 'LICENSE_INCLUDED'.freeze,
      LICENSE_MODEL_BRING_YOUR_OWN_LICENSE = 'BRING_YOUR_OWN_LICENSE'.freeze
    ].freeze

    # The new number of CPU cores to set for the DB system. Not applicable for INTEL based virtual machine DB systems.
    # @return [Integer]
    attr_accessor :cpu_core_count

    # @return [OCI::Database::Models::PatchDetails]
    attr_accessor :version

    # The public key portion of the key pair to use for SSH access to the DB system. Multiple public keys can be provided. The length of the combined keys cannot exceed 40,000 characters.
    # @return [Array<String>]
    attr_accessor :ssh_public_keys

    # The size, in gigabytes, to scale the attached storage up to for this virtual machine DB system. This value must be greater than current storage size. Note that the resulting total storage size attached will be greater than the amount requested to allow for REDO/RECO space and software volume. Applies only to virtual machine DB systems.
    #
    # @return [Integer]
    attr_accessor :data_storage_size_in_gbs

    # The size, in gigabytes, to scale the attached RECO storage up to for this virtual machine DB system. This value must be greater than current storage size. Note that the resulting total storage size attached will be greater than the amount requested to allow for the software volume. Applies only to virtual machine DB systems.
    #
    # @return [Integer]
    attr_accessor :reco_storage_size_in_gbs

    # Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # The shape of the DB system. The shape determines resources allocated to the DB system.
    # - For virtual machine shapes, the number of CPU cores and memory
    #
    # To get a list of shapes, use the {#list_db_system_shapes list_db_system_shapes} operation.
    #
    # @return [String]
    attr_accessor :shape

    # The list of [OCIDs](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) for the network security groups (NSGs) to which this resource belongs. Setting this to an empty list removes all resources from all NSGs. For more information about NSGs, see [Security Rules](https://docs.cloud.oracle.com/Content/Network/Concepts/securityrules.htm).
    # **NsgIds restrictions:**
    # - A network security group (NSG) is optional for Autonomous Databases with private access. The nsgIds list can be empty.
    #
    # @return [Array<String>]
    attr_accessor :nsg_ids

    # A list of the [OCIDs](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network security groups (NSGs) that the backup network of this DB system belongs to. Setting this to an empty array after the list is created removes the resource from all NSGs. For more information about NSGs, see [Security Rules](https://docs.cloud.oracle.com/Content/Network/Concepts/securityrules.htm). Applicable only to Exadata systems.
    #
    # @return [Array<String>]
    attr_accessor :backup_network_nsg_ids

    # The Oracle Database license model that applies to all databases on the DB system. The default is LICENSE_INCLUDED.
    #
    # @return [String]
    attr_reader :license_model

    # @return [OCI::Database::Models::MaintenanceWindow]
    attr_accessor :maintenance_window_details

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'cpu_core_count': :'cpuCoreCount',
        'version': :'version',
        'ssh_public_keys': :'sshPublicKeys',
        'data_storage_size_in_gbs': :'dataStorageSizeInGBs',
        'reco_storage_size_in_gbs': :'recoStorageSizeInGBs',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'shape': :'shape',
        'nsg_ids': :'nsgIds',
        'backup_network_nsg_ids': :'backupNetworkNsgIds',
        'license_model': :'licenseModel',
        'maintenance_window_details': :'maintenanceWindowDetails'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'cpu_core_count': :'Integer',
        'version': :'OCI::Database::Models::PatchDetails',
        'ssh_public_keys': :'Array<String>',
        'data_storage_size_in_gbs': :'Integer',
        'reco_storage_size_in_gbs': :'Integer',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'shape': :'String',
        'nsg_ids': :'Array<String>',
        'backup_network_nsg_ids': :'Array<String>',
        'license_model': :'String',
        'maintenance_window_details': :'OCI::Database::Models::MaintenanceWindow'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :cpu_core_count The value to assign to the {#cpu_core_count} property
    # @option attributes [OCI::Database::Models::PatchDetails] :version The value to assign to the {#version} property
    # @option attributes [Array<String>] :ssh_public_keys The value to assign to the {#ssh_public_keys} property
    # @option attributes [Integer] :data_storage_size_in_gbs The value to assign to the {#data_storage_size_in_gbs} property
    # @option attributes [Integer] :reco_storage_size_in_gbs The value to assign to the {#reco_storage_size_in_gbs} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :shape The value to assign to the {#shape} property
    # @option attributes [Array<String>] :nsg_ids The value to assign to the {#nsg_ids} property
    # @option attributes [Array<String>] :backup_network_nsg_ids The value to assign to the {#backup_network_nsg_ids} property
    # @option attributes [String] :license_model The value to assign to the {#license_model} property
    # @option attributes [OCI::Database::Models::MaintenanceWindow] :maintenance_window_details The value to assign to the {#maintenance_window_details} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.cpu_core_count = attributes[:'cpuCoreCount'] if attributes[:'cpuCoreCount']

      raise 'You cannot provide both :cpuCoreCount and :cpu_core_count' if attributes.key?(:'cpuCoreCount') && attributes.key?(:'cpu_core_count')

      self.cpu_core_count = attributes[:'cpu_core_count'] if attributes[:'cpu_core_count']

      self.version = attributes[:'version'] if attributes[:'version']

      self.ssh_public_keys = attributes[:'sshPublicKeys'] if attributes[:'sshPublicKeys']

      raise 'You cannot provide both :sshPublicKeys and :ssh_public_keys' if attributes.key?(:'sshPublicKeys') && attributes.key?(:'ssh_public_keys')

      self.ssh_public_keys = attributes[:'ssh_public_keys'] if attributes[:'ssh_public_keys']

      self.data_storage_size_in_gbs = attributes[:'dataStorageSizeInGBs'] if attributes[:'dataStorageSizeInGBs']

      raise 'You cannot provide both :dataStorageSizeInGBs and :data_storage_size_in_gbs' if attributes.key?(:'dataStorageSizeInGBs') && attributes.key?(:'data_storage_size_in_gbs')

      self.data_storage_size_in_gbs = attributes[:'data_storage_size_in_gbs'] if attributes[:'data_storage_size_in_gbs']

      self.reco_storage_size_in_gbs = attributes[:'recoStorageSizeInGBs'] if attributes[:'recoStorageSizeInGBs']

      raise 'You cannot provide both :recoStorageSizeInGBs and :reco_storage_size_in_gbs' if attributes.key?(:'recoStorageSizeInGBs') && attributes.key?(:'reco_storage_size_in_gbs')

      self.reco_storage_size_in_gbs = attributes[:'reco_storage_size_in_gbs'] if attributes[:'reco_storage_size_in_gbs']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.shape = attributes[:'shape'] if attributes[:'shape']

      self.nsg_ids = attributes[:'nsgIds'] if attributes[:'nsgIds']

      raise 'You cannot provide both :nsgIds and :nsg_ids' if attributes.key?(:'nsgIds') && attributes.key?(:'nsg_ids')

      self.nsg_ids = attributes[:'nsg_ids'] if attributes[:'nsg_ids']

      self.backup_network_nsg_ids = attributes[:'backupNetworkNsgIds'] if attributes[:'backupNetworkNsgIds']

      raise 'You cannot provide both :backupNetworkNsgIds and :backup_network_nsg_ids' if attributes.key?(:'backupNetworkNsgIds') && attributes.key?(:'backup_network_nsg_ids')

      self.backup_network_nsg_ids = attributes[:'backup_network_nsg_ids'] if attributes[:'backup_network_nsg_ids']

      self.license_model = attributes[:'licenseModel'] if attributes[:'licenseModel']

      raise 'You cannot provide both :licenseModel and :license_model' if attributes.key?(:'licenseModel') && attributes.key?(:'license_model')

      self.license_model = attributes[:'license_model'] if attributes[:'license_model']

      self.maintenance_window_details = attributes[:'maintenanceWindowDetails'] if attributes[:'maintenanceWindowDetails']

      raise 'You cannot provide both :maintenanceWindowDetails and :maintenance_window_details' if attributes.key?(:'maintenanceWindowDetails') && attributes.key?(:'maintenance_window_details')

      self.maintenance_window_details = attributes[:'maintenance_window_details'] if attributes[:'maintenance_window_details']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] license_model Object to be assigned
    def license_model=(license_model)
      raise "Invalid value for 'license_model': this must be one of the values in LICENSE_MODEL_ENUM." if license_model && !LICENSE_MODEL_ENUM.include?(license_model)

      @license_model = license_model
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        cpu_core_count == other.cpu_core_count &&
        version == other.version &&
        ssh_public_keys == other.ssh_public_keys &&
        data_storage_size_in_gbs == other.data_storage_size_in_gbs &&
        reco_storage_size_in_gbs == other.reco_storage_size_in_gbs &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        shape == other.shape &&
        nsg_ids == other.nsg_ids &&
        backup_network_nsg_ids == other.backup_network_nsg_ids &&
        license_model == other.license_model &&
        maintenance_window_details == other.maintenance_window_details
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
      [cpu_core_count, version, ssh_public_keys, data_storage_size_in_gbs, reco_storage_size_in_gbs, freeform_tags, defined_tags, shape, nsg_ids, backup_network_nsg_ids, license_model, maintenance_window_details].hash
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
