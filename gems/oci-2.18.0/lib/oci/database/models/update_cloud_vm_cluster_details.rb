# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details for updating the cloud VM cluster. Applies to Exadata Cloud Service instances only.
  #
  class Database::Models::UpdateCloudVmClusterDetails
    LICENSE_MODEL_ENUM = [
      LICENSE_MODEL_LICENSE_INCLUDED = 'LICENSE_INCLUDED'.freeze,
      LICENSE_MODEL_BRING_YOUR_OWN_LICENSE = 'BRING_YOUR_OWN_LICENSE'.freeze
    ].freeze

    # The user-friendly name for the cloud VM cluster. The name does not need to be unique.
    #
    # @return [String]
    attr_accessor :display_name

    # The number of CPU cores to enable for the cloud VM cluster.
    # @return [Integer]
    attr_accessor :cpu_core_count

    # The number of OCPU cores to enable for a cloud VM cluster. Only 1 decimal place is allowed for the fractional part.
    # @return [Float]
    attr_accessor :ocpu_count

    # The Oracle license model that applies to the cloud VM cluster. The default is BRING_YOUR_OWN_LICENSE. Applies to Exadata Cloud Service instances only.
    #
    # @return [String]
    attr_reader :license_model

    # The public key portion of one or more key pairs used for SSH access to the cloud VM cluster.
    # @return [Array<String>]
    attr_accessor :ssh_public_keys

    # @return [OCI::Database::Models::UpdateDetails]
    attr_accessor :update_details

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

    # The list of compute servers to be added to the cloud VM cluster.
    # @return [Array<String>]
    attr_accessor :compute_nodes

    # The disk group size to be allocated in GBs.
    # @return [Integer]
    attr_accessor :storage_size_in_gbs

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

    # @return [OCI::Database::Models::DataCollectionOptions]
    attr_accessor :data_collection_options

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'displayName',
        'cpu_core_count': :'cpuCoreCount',
        'ocpu_count': :'ocpuCount',
        'license_model': :'licenseModel',
        'ssh_public_keys': :'sshPublicKeys',
        'update_details': :'updateDetails',
        'nsg_ids': :'nsgIds',
        'backup_network_nsg_ids': :'backupNetworkNsgIds',
        'compute_nodes': :'computeNodes',
        'storage_size_in_gbs': :'storageSizeInGBs',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'data_collection_options': :'dataCollectionOptions'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'String',
        'cpu_core_count': :'Integer',
        'ocpu_count': :'Float',
        'license_model': :'String',
        'ssh_public_keys': :'Array<String>',
        'update_details': :'OCI::Database::Models::UpdateDetails',
        'nsg_ids': :'Array<String>',
        'backup_network_nsg_ids': :'Array<String>',
        'compute_nodes': :'Array<String>',
        'storage_size_in_gbs': :'Integer',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'data_collection_options': :'OCI::Database::Models::DataCollectionOptions'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [Integer] :cpu_core_count The value to assign to the {#cpu_core_count} property
    # @option attributes [Float] :ocpu_count The value to assign to the {#ocpu_count} property
    # @option attributes [String] :license_model The value to assign to the {#license_model} property
    # @option attributes [Array<String>] :ssh_public_keys The value to assign to the {#ssh_public_keys} property
    # @option attributes [OCI::Database::Models::UpdateDetails] :update_details The value to assign to the {#update_details} property
    # @option attributes [Array<String>] :nsg_ids The value to assign to the {#nsg_ids} property
    # @option attributes [Array<String>] :backup_network_nsg_ids The value to assign to the {#backup_network_nsg_ids} property
    # @option attributes [Array<String>] :compute_nodes The value to assign to the {#compute_nodes} property
    # @option attributes [Integer] :storage_size_in_gbs The value to assign to the {#storage_size_in_gbs} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [OCI::Database::Models::DataCollectionOptions] :data_collection_options The value to assign to the {#data_collection_options} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.cpu_core_count = attributes[:'cpuCoreCount'] if attributes[:'cpuCoreCount']

      raise 'You cannot provide both :cpuCoreCount and :cpu_core_count' if attributes.key?(:'cpuCoreCount') && attributes.key?(:'cpu_core_count')

      self.cpu_core_count = attributes[:'cpu_core_count'] if attributes[:'cpu_core_count']

      self.ocpu_count = attributes[:'ocpuCount'] if attributes[:'ocpuCount']

      raise 'You cannot provide both :ocpuCount and :ocpu_count' if attributes.key?(:'ocpuCount') && attributes.key?(:'ocpu_count')

      self.ocpu_count = attributes[:'ocpu_count'] if attributes[:'ocpu_count']

      self.license_model = attributes[:'licenseModel'] if attributes[:'licenseModel']

      raise 'You cannot provide both :licenseModel and :license_model' if attributes.key?(:'licenseModel') && attributes.key?(:'license_model')

      self.license_model = attributes[:'license_model'] if attributes[:'license_model']

      self.ssh_public_keys = attributes[:'sshPublicKeys'] if attributes[:'sshPublicKeys']

      raise 'You cannot provide both :sshPublicKeys and :ssh_public_keys' if attributes.key?(:'sshPublicKeys') && attributes.key?(:'ssh_public_keys')

      self.ssh_public_keys = attributes[:'ssh_public_keys'] if attributes[:'ssh_public_keys']

      self.update_details = attributes[:'updateDetails'] if attributes[:'updateDetails']

      raise 'You cannot provide both :updateDetails and :update_details' if attributes.key?(:'updateDetails') && attributes.key?(:'update_details')

      self.update_details = attributes[:'update_details'] if attributes[:'update_details']

      self.nsg_ids = attributes[:'nsgIds'] if attributes[:'nsgIds']

      raise 'You cannot provide both :nsgIds and :nsg_ids' if attributes.key?(:'nsgIds') && attributes.key?(:'nsg_ids')

      self.nsg_ids = attributes[:'nsg_ids'] if attributes[:'nsg_ids']

      self.backup_network_nsg_ids = attributes[:'backupNetworkNsgIds'] if attributes[:'backupNetworkNsgIds']

      raise 'You cannot provide both :backupNetworkNsgIds and :backup_network_nsg_ids' if attributes.key?(:'backupNetworkNsgIds') && attributes.key?(:'backup_network_nsg_ids')

      self.backup_network_nsg_ids = attributes[:'backup_network_nsg_ids'] if attributes[:'backup_network_nsg_ids']

      self.compute_nodes = attributes[:'computeNodes'] if attributes[:'computeNodes']

      raise 'You cannot provide both :computeNodes and :compute_nodes' if attributes.key?(:'computeNodes') && attributes.key?(:'compute_nodes')

      self.compute_nodes = attributes[:'compute_nodes'] if attributes[:'compute_nodes']

      self.storage_size_in_gbs = attributes[:'storageSizeInGBs'] if attributes[:'storageSizeInGBs']

      raise 'You cannot provide both :storageSizeInGBs and :storage_size_in_gbs' if attributes.key?(:'storageSizeInGBs') && attributes.key?(:'storage_size_in_gbs')

      self.storage_size_in_gbs = attributes[:'storage_size_in_gbs'] if attributes[:'storage_size_in_gbs']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.data_collection_options = attributes[:'dataCollectionOptions'] if attributes[:'dataCollectionOptions']

      raise 'You cannot provide both :dataCollectionOptions and :data_collection_options' if attributes.key?(:'dataCollectionOptions') && attributes.key?(:'data_collection_options')

      self.data_collection_options = attributes[:'data_collection_options'] if attributes[:'data_collection_options']
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
        display_name == other.display_name &&
        cpu_core_count == other.cpu_core_count &&
        ocpu_count == other.ocpu_count &&
        license_model == other.license_model &&
        ssh_public_keys == other.ssh_public_keys &&
        update_details == other.update_details &&
        nsg_ids == other.nsg_ids &&
        backup_network_nsg_ids == other.backup_network_nsg_ids &&
        compute_nodes == other.compute_nodes &&
        storage_size_in_gbs == other.storage_size_in_gbs &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        data_collection_options == other.data_collection_options
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
      [display_name, cpu_core_count, ocpu_count, license_model, ssh_public_keys, update_details, nsg_ids, backup_network_nsg_ids, compute_nodes, storage_size_in_gbs, freeform_tags, defined_tags, data_collection_options].hash
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
