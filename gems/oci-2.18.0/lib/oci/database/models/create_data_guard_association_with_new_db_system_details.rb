# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'create_data_guard_association_details'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The configuration details for creating a Data Guard association for a virtual machine DB system database. For this type of DB system database, the `creationType` should be `NewDbSystem`. A new DB system will be launched to create the standby database.
  #
  # To create a Data Guard association for a database in a bare metal or Exadata DB system, use the {#create_data_guard_association_to_existing_db_system_details create_data_guard_association_to_existing_db_system_details} subtype instead.
  #
  class Database::Models::CreateDataGuardAssociationWithNewDbSystemDetails < Database::Models::CreateDataGuardAssociationDetails
    STORAGE_VOLUME_PERFORMANCE_MODE_ENUM = [
      STORAGE_VOLUME_PERFORMANCE_MODE_BALANCED = 'BALANCED'.freeze,
      STORAGE_VOLUME_PERFORMANCE_MODE_HIGH_PERFORMANCE = 'HIGH_PERFORMANCE'.freeze
    ].freeze

    LICENSE_MODEL_ENUM = [
      LICENSE_MODEL_LICENSE_INCLUDED = 'LICENSE_INCLUDED'.freeze,
      LICENSE_MODEL_BRING_YOUR_OWN_LICENSE = 'BRING_YOUR_OWN_LICENSE'.freeze
    ].freeze

    # The user-friendly name of the DB system that will contain the the standby database. The display name does not have to be unique.
    # @return [String]
    attr_accessor :display_name

    # The name of the availability domain that the standby database DB system will be located in. For example- \"Uocm:PHX-AD-1\".
    # @return [String]
    attr_accessor :availability_domain

    # The virtual machine DB system shape to launch for the standby database in the Data Guard association. The shape determines the number of CPU cores and the amount of memory available for the DB system.
    # Only virtual machine shapes are valid options. If you do not supply this parameter, the default shape is the shape of the primary DB system.
    #
    # To get a list of all shapes, use the {#list_db_system_shapes list_db_system_shapes} operation.
    #
    # @return [String]
    attr_accessor :shape

    # The number of OCPU cores available for AMD-based virtual machine DB systems.
    # @return [Integer]
    attr_accessor :cpu_core_count

    # The block storage volume performance level. Valid values are `BALANCED` and `HIGH_PERFORMANCE`. See [Block Volume Performance](https://docs.cloud.oracle.com/Content/Block/Concepts/blockvolumeperformance.htm) for more information.
    #
    # @return [String]
    attr_reader :storage_volume_performance_mode

    # The number of nodes to launch for the DB system of the standby in the Data Guard association. For a 2-node RAC virtual machine DB system, specify either 1 or 2. If you do not supply this parameter, the default is the node count of the primary DB system.
    #
    # @return [Integer]
    attr_accessor :node_count

    # The OCID of the subnet the DB system is associated with.
    # **Subnet Restrictions:**
    # - For 1- and 2-node RAC DB systems, do not use a subnet that overlaps with 192.168.16.16/28
    #
    # These subnets are used by the Oracle Clusterware private interconnect on the database instance.
    # Specifying an overlapping subnet will cause the private interconnect to malfunction.
    # This restriction applies to both the client subnet and backup subnet.
    #
    # @return [String]
    attr_accessor :subnet_id

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

    # The hostname for the DB node.
    # @return [String]
    attr_accessor :hostname

    # The time zone of the dataguard standby DB system. For details, see [DB System Time Zones](https://docs.cloud.oracle.com/Content/Database/References/timezones.htm).
    # @return [String]
    attr_accessor :time_zone

    # A Fault Domain is a grouping of hardware and infrastructure within an availability domain.
    # Fault Domains let you distribute your instances so that they are not on the same physical
    # hardware within a single availability domain. A hardware failure or maintenance
    # that affects one Fault Domain does not affect DB systems in other Fault Domains.
    #
    # If you do not specify the Fault Domain, the system selects one for you. To change the Fault
    # Domain for a DB system, terminate it and launch a new DB system in the preferred Fault Domain.
    #
    # If the node count is greater than 1, you can specify which Fault Domains these nodes will be distributed into.
    # The system assigns your nodes automatically to the Fault Domains you specify so that
    # no Fault Domain contains more than one node.
    #
    # To get a list of Fault Domains, use the
    # {#list_fault_domains list_fault_domains} operation in the
    # Identity and Access Management Service API.
    #
    # Example: `FAULT-DOMAIN-1`
    #
    # @return [Array<String>]
    attr_accessor :fault_domains

    # The IPv4 address from the provided OCI subnet which needs to be assigned to the VNIC. If not provided, it will
    # be auto-assigned with an available IPv4 address from the subnet.
    #
    # @return [String]
    attr_accessor :private_ip

    # The Oracle license model that applies to all the databases on the dataguard standby DB system. The default is LICENSE_INCLUDED.
    #
    # @return [String]
    attr_reader :license_model

    # Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :db_system_freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :db_system_defined_tags

    # Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :database_freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :database_defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'database_software_image_id': :'databaseSoftwareImageId',
        'database_admin_password': :'databaseAdminPassword',
        'protection_mode': :'protectionMode',
        'transport_type': :'transportType',
        'creation_type': :'creationType',
        'is_active_data_guard_enabled': :'isActiveDataGuardEnabled',
        'peer_db_unique_name': :'peerDbUniqueName',
        'peer_sid_prefix': :'peerSidPrefix',
        'display_name': :'displayName',
        'availability_domain': :'availabilityDomain',
        'shape': :'shape',
        'cpu_core_count': :'cpuCoreCount',
        'storage_volume_performance_mode': :'storageVolumePerformanceMode',
        'node_count': :'nodeCount',
        'subnet_id': :'subnetId',
        'nsg_ids': :'nsgIds',
        'backup_network_nsg_ids': :'backupNetworkNsgIds',
        'hostname': :'hostname',
        'time_zone': :'timeZone',
        'fault_domains': :'faultDomains',
        'private_ip': :'privateIp',
        'license_model': :'licenseModel',
        'db_system_freeform_tags': :'dbSystemFreeformTags',
        'db_system_defined_tags': :'dbSystemDefinedTags',
        'database_freeform_tags': :'databaseFreeformTags',
        'database_defined_tags': :'databaseDefinedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'database_software_image_id': :'String',
        'database_admin_password': :'String',
        'protection_mode': :'String',
        'transport_type': :'String',
        'creation_type': :'String',
        'is_active_data_guard_enabled': :'BOOLEAN',
        'peer_db_unique_name': :'String',
        'peer_sid_prefix': :'String',
        'display_name': :'String',
        'availability_domain': :'String',
        'shape': :'String',
        'cpu_core_count': :'Integer',
        'storage_volume_performance_mode': :'String',
        'node_count': :'Integer',
        'subnet_id': :'String',
        'nsg_ids': :'Array<String>',
        'backup_network_nsg_ids': :'Array<String>',
        'hostname': :'String',
        'time_zone': :'String',
        'fault_domains': :'Array<String>',
        'private_ip': :'String',
        'license_model': :'String',
        'db_system_freeform_tags': :'Hash<String, String>',
        'db_system_defined_tags': :'Hash<String, Hash<String, Object>>',
        'database_freeform_tags': :'Hash<String, String>',
        'database_defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :database_software_image_id The value to assign to the {OCI::Database::Models::CreateDataGuardAssociationDetails#database_software_image_id #database_software_image_id} proprety
    # @option attributes [String] :database_admin_password The value to assign to the {OCI::Database::Models::CreateDataGuardAssociationDetails#database_admin_password #database_admin_password} proprety
    # @option attributes [String] :protection_mode The value to assign to the {OCI::Database::Models::CreateDataGuardAssociationDetails#protection_mode #protection_mode} proprety
    # @option attributes [String] :transport_type The value to assign to the {OCI::Database::Models::CreateDataGuardAssociationDetails#transport_type #transport_type} proprety
    # @option attributes [BOOLEAN] :is_active_data_guard_enabled The value to assign to the {OCI::Database::Models::CreateDataGuardAssociationDetails#is_active_data_guard_enabled #is_active_data_guard_enabled} proprety
    # @option attributes [String] :peer_db_unique_name The value to assign to the {OCI::Database::Models::CreateDataGuardAssociationDetails#peer_db_unique_name #peer_db_unique_name} proprety
    # @option attributes [String] :peer_sid_prefix The value to assign to the {OCI::Database::Models::CreateDataGuardAssociationDetails#peer_sid_prefix #peer_sid_prefix} proprety
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :availability_domain The value to assign to the {#availability_domain} property
    # @option attributes [String] :shape The value to assign to the {#shape} property
    # @option attributes [Integer] :cpu_core_count The value to assign to the {#cpu_core_count} property
    # @option attributes [String] :storage_volume_performance_mode The value to assign to the {#storage_volume_performance_mode} property
    # @option attributes [Integer] :node_count The value to assign to the {#node_count} property
    # @option attributes [String] :subnet_id The value to assign to the {#subnet_id} property
    # @option attributes [Array<String>] :nsg_ids The value to assign to the {#nsg_ids} property
    # @option attributes [Array<String>] :backup_network_nsg_ids The value to assign to the {#backup_network_nsg_ids} property
    # @option attributes [String] :hostname The value to assign to the {#hostname} property
    # @option attributes [String] :time_zone The value to assign to the {#time_zone} property
    # @option attributes [Array<String>] :fault_domains The value to assign to the {#fault_domains} property
    # @option attributes [String] :private_ip The value to assign to the {#private_ip} property
    # @option attributes [String] :license_model The value to assign to the {#license_model} property
    # @option attributes [Hash<String, String>] :db_system_freeform_tags The value to assign to the {#db_system_freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :db_system_defined_tags The value to assign to the {#db_system_defined_tags} property
    # @option attributes [Hash<String, String>] :database_freeform_tags The value to assign to the {#database_freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :database_defined_tags The value to assign to the {#database_defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['creationType'] = 'NewDbSystem'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.availability_domain = attributes[:'availabilityDomain'] if attributes[:'availabilityDomain']

      raise 'You cannot provide both :availabilityDomain and :availability_domain' if attributes.key?(:'availabilityDomain') && attributes.key?(:'availability_domain')

      self.availability_domain = attributes[:'availability_domain'] if attributes[:'availability_domain']

      self.shape = attributes[:'shape'] if attributes[:'shape']

      self.cpu_core_count = attributes[:'cpuCoreCount'] if attributes[:'cpuCoreCount']

      raise 'You cannot provide both :cpuCoreCount and :cpu_core_count' if attributes.key?(:'cpuCoreCount') && attributes.key?(:'cpu_core_count')

      self.cpu_core_count = attributes[:'cpu_core_count'] if attributes[:'cpu_core_count']

      self.storage_volume_performance_mode = attributes[:'storageVolumePerformanceMode'] if attributes[:'storageVolumePerformanceMode']
      self.storage_volume_performance_mode = "BALANCED" if storage_volume_performance_mode.nil? && !attributes.key?(:'storageVolumePerformanceMode') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :storageVolumePerformanceMode and :storage_volume_performance_mode' if attributes.key?(:'storageVolumePerformanceMode') && attributes.key?(:'storage_volume_performance_mode')

      self.storage_volume_performance_mode = attributes[:'storage_volume_performance_mode'] if attributes[:'storage_volume_performance_mode']
      self.storage_volume_performance_mode = "BALANCED" if storage_volume_performance_mode.nil? && !attributes.key?(:'storageVolumePerformanceMode') && !attributes.key?(:'storage_volume_performance_mode') # rubocop:disable Style/StringLiterals

      self.node_count = attributes[:'nodeCount'] if attributes[:'nodeCount']

      raise 'You cannot provide both :nodeCount and :node_count' if attributes.key?(:'nodeCount') && attributes.key?(:'node_count')

      self.node_count = attributes[:'node_count'] if attributes[:'node_count']

      self.subnet_id = attributes[:'subnetId'] if attributes[:'subnetId']

      raise 'You cannot provide both :subnetId and :subnet_id' if attributes.key?(:'subnetId') && attributes.key?(:'subnet_id')

      self.subnet_id = attributes[:'subnet_id'] if attributes[:'subnet_id']

      self.nsg_ids = attributes[:'nsgIds'] if attributes[:'nsgIds']

      raise 'You cannot provide both :nsgIds and :nsg_ids' if attributes.key?(:'nsgIds') && attributes.key?(:'nsg_ids')

      self.nsg_ids = attributes[:'nsg_ids'] if attributes[:'nsg_ids']

      self.backup_network_nsg_ids = attributes[:'backupNetworkNsgIds'] if attributes[:'backupNetworkNsgIds']

      raise 'You cannot provide both :backupNetworkNsgIds and :backup_network_nsg_ids' if attributes.key?(:'backupNetworkNsgIds') && attributes.key?(:'backup_network_nsg_ids')

      self.backup_network_nsg_ids = attributes[:'backup_network_nsg_ids'] if attributes[:'backup_network_nsg_ids']

      self.hostname = attributes[:'hostname'] if attributes[:'hostname']

      self.time_zone = attributes[:'timeZone'] if attributes[:'timeZone']

      raise 'You cannot provide both :timeZone and :time_zone' if attributes.key?(:'timeZone') && attributes.key?(:'time_zone')

      self.time_zone = attributes[:'time_zone'] if attributes[:'time_zone']

      self.fault_domains = attributes[:'faultDomains'] if attributes[:'faultDomains']

      raise 'You cannot provide both :faultDomains and :fault_domains' if attributes.key?(:'faultDomains') && attributes.key?(:'fault_domains')

      self.fault_domains = attributes[:'fault_domains'] if attributes[:'fault_domains']

      self.private_ip = attributes[:'privateIp'] if attributes[:'privateIp']

      raise 'You cannot provide both :privateIp and :private_ip' if attributes.key?(:'privateIp') && attributes.key?(:'private_ip')

      self.private_ip = attributes[:'private_ip'] if attributes[:'private_ip']

      self.license_model = attributes[:'licenseModel'] if attributes[:'licenseModel']

      raise 'You cannot provide both :licenseModel and :license_model' if attributes.key?(:'licenseModel') && attributes.key?(:'license_model')

      self.license_model = attributes[:'license_model'] if attributes[:'license_model']

      self.db_system_freeform_tags = attributes[:'dbSystemFreeformTags'] if attributes[:'dbSystemFreeformTags']

      raise 'You cannot provide both :dbSystemFreeformTags and :db_system_freeform_tags' if attributes.key?(:'dbSystemFreeformTags') && attributes.key?(:'db_system_freeform_tags')

      self.db_system_freeform_tags = attributes[:'db_system_freeform_tags'] if attributes[:'db_system_freeform_tags']

      self.db_system_defined_tags = attributes[:'dbSystemDefinedTags'] if attributes[:'dbSystemDefinedTags']

      raise 'You cannot provide both :dbSystemDefinedTags and :db_system_defined_tags' if attributes.key?(:'dbSystemDefinedTags') && attributes.key?(:'db_system_defined_tags')

      self.db_system_defined_tags = attributes[:'db_system_defined_tags'] if attributes[:'db_system_defined_tags']

      self.database_freeform_tags = attributes[:'databaseFreeformTags'] if attributes[:'databaseFreeformTags']

      raise 'You cannot provide both :databaseFreeformTags and :database_freeform_tags' if attributes.key?(:'databaseFreeformTags') && attributes.key?(:'database_freeform_tags')

      self.database_freeform_tags = attributes[:'database_freeform_tags'] if attributes[:'database_freeform_tags']

      self.database_defined_tags = attributes[:'databaseDefinedTags'] if attributes[:'databaseDefinedTags']

      raise 'You cannot provide both :databaseDefinedTags and :database_defined_tags' if attributes.key?(:'databaseDefinedTags') && attributes.key?(:'database_defined_tags')

      self.database_defined_tags = attributes[:'database_defined_tags'] if attributes[:'database_defined_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] storage_volume_performance_mode Object to be assigned
    def storage_volume_performance_mode=(storage_volume_performance_mode)
      raise "Invalid value for 'storage_volume_performance_mode': this must be one of the values in STORAGE_VOLUME_PERFORMANCE_MODE_ENUM." if storage_volume_performance_mode && !STORAGE_VOLUME_PERFORMANCE_MODE_ENUM.include?(storage_volume_performance_mode)

      @storage_volume_performance_mode = storage_volume_performance_mode
    end

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
        database_software_image_id == other.database_software_image_id &&
        database_admin_password == other.database_admin_password &&
        protection_mode == other.protection_mode &&
        transport_type == other.transport_type &&
        creation_type == other.creation_type &&
        is_active_data_guard_enabled == other.is_active_data_guard_enabled &&
        peer_db_unique_name == other.peer_db_unique_name &&
        peer_sid_prefix == other.peer_sid_prefix &&
        display_name == other.display_name &&
        availability_domain == other.availability_domain &&
        shape == other.shape &&
        cpu_core_count == other.cpu_core_count &&
        storage_volume_performance_mode == other.storage_volume_performance_mode &&
        node_count == other.node_count &&
        subnet_id == other.subnet_id &&
        nsg_ids == other.nsg_ids &&
        backup_network_nsg_ids == other.backup_network_nsg_ids &&
        hostname == other.hostname &&
        time_zone == other.time_zone &&
        fault_domains == other.fault_domains &&
        private_ip == other.private_ip &&
        license_model == other.license_model &&
        db_system_freeform_tags == other.db_system_freeform_tags &&
        db_system_defined_tags == other.db_system_defined_tags &&
        database_freeform_tags == other.database_freeform_tags &&
        database_defined_tags == other.database_defined_tags
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
      [database_software_image_id, database_admin_password, protection_mode, transport_type, creation_type, is_active_data_guard_enabled, peer_db_unique_name, peer_sid_prefix, display_name, availability_domain, shape, cpu_core_count, storage_volume_performance_mode, node_count, subnet_id, nsg_ids, backup_network_nsg_ids, hostname, time_zone, fault_domains, private_ip, license_model, db_system_freeform_tags, db_system_defined_tags, database_freeform_tags, database_defined_tags].hash
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