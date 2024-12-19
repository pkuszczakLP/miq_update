# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A server where Oracle Database software is running.
  #
  # To use any of the API operations, you must be authorized in an IAM policy. If you're not authorized, talk to an administrator. If you're an administrator who needs to write policies to give users access, see [Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).
  #
  # **Warning:** Oracle recommends that you avoid using any confidential information when you supply string values using the API.
  #
  class Database::Models::DbNodeSummary
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_PROVISIONING = 'PROVISIONING'.freeze,
      LIFECYCLE_STATE_AVAILABLE = 'AVAILABLE'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_STOPPING = 'STOPPING'.freeze,
      LIFECYCLE_STATE_STOPPED = 'STOPPED'.freeze,
      LIFECYCLE_STATE_STARTING = 'STARTING'.freeze,
      LIFECYCLE_STATE_TERMINATING = 'TERMINATING'.freeze,
      LIFECYCLE_STATE_TERMINATED = 'TERMINATED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    MAINTENANCE_TYPE_ENUM = [
      MAINTENANCE_TYPE_VMDB_REBOOT_MIGRATION = 'VMDB_REBOOT_MIGRATION'.freeze,
      MAINTENANCE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the database node.
    # @return [String]
    attr_accessor :id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the DB system.
    # @return [String]
    attr_accessor :db_system_id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the VNIC.
    # @return [String]
    attr_accessor :vnic_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the backup VNIC.
    # @return [String]
    attr_accessor :backup_vnic_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the host IP address associated with the database node. Use this OCID with either the
    # {#get_private_ip get_private_ip} or the {#get_public_ip_by_private_ip_id get_public_ip_by_private_ip_id} API to get the IP address
    # needed to make a database connection.
    #
    # **Note:** Applies only to Exadata Cloud Service.
    #
    # @return [String]
    attr_accessor :host_ip_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the backup IP address associated with the database node. Use this OCID with either the
    # {#get_private_ip get_private_ip} or the {#get_public_ip_by_private_ip_id get_public_ip_by_private_ip_id} API to get the IP address
    # needed to make a database connection.
    #
    # **Note:** Applies only to Exadata Cloud Service.
    #
    # @return [String]
    attr_accessor :backup_ip_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the second VNIC.
    #
    # **Note:** Applies only to Exadata Cloud Service.
    #
    # @return [String]
    attr_accessor :vnic2_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the second backup VNIC.
    #
    # **Note:** Applies only to Exadata Cloud Service.
    #
    # @return [String]
    attr_accessor :backup_vnic2_id

    # **[Required]** The current state of the database node.
    # @return [String]
    attr_reader :lifecycle_state

    # The host name for the database node.
    # @return [String]
    attr_accessor :hostname

    # The name of the Fault Domain the instance is contained in.
    # @return [String]
    attr_accessor :fault_domain

    # **[Required]** The date and time that the database node was created.
    # @return [DateTime]
    attr_accessor :time_created

    # The size (in GB) of the block storage volume allocation for the DB system. This attribute applies only for virtual machine DB systems.
    #
    # @return [Integer]
    attr_accessor :software_storage_size_in_gb

    # The type of database node maintenance.
    # @return [String]
    attr_reader :maintenance_type

    # Start date and time of maintenance window.
    # @return [DateTime]
    attr_accessor :time_maintenance_window_start

    # End date and time of maintenance window.
    # @return [DateTime]
    attr_accessor :time_maintenance_window_end

    # Additional information about the planned maintenance.
    # @return [String]
    attr_accessor :additional_details

    # The number of CPU cores enabled on the Db node.
    # @return [Integer]
    attr_accessor :cpu_core_count

    # The allocated memory in GBs on the Db node.
    # @return [Integer]
    attr_accessor :memory_size_in_gbs

    # The allocated local node storage in GBs on the Db node.
    # @return [Integer]
    attr_accessor :db_node_storage_size_in_gbs

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Exacc Db server associated with the database node.
    # @return [String]
    attr_accessor :db_server_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'db_system_id': :'dbSystemId',
        'vnic_id': :'vnicId',
        'backup_vnic_id': :'backupVnicId',
        'host_ip_id': :'hostIpId',
        'backup_ip_id': :'backupIpId',
        'vnic2_id': :'vnic2Id',
        'backup_vnic2_id': :'backupVnic2Id',
        'lifecycle_state': :'lifecycleState',
        'hostname': :'hostname',
        'fault_domain': :'faultDomain',
        'time_created': :'timeCreated',
        'software_storage_size_in_gb': :'softwareStorageSizeInGB',
        'maintenance_type': :'maintenanceType',
        'time_maintenance_window_start': :'timeMaintenanceWindowStart',
        'time_maintenance_window_end': :'timeMaintenanceWindowEnd',
        'additional_details': :'additionalDetails',
        'cpu_core_count': :'cpuCoreCount',
        'memory_size_in_gbs': :'memorySizeInGBs',
        'db_node_storage_size_in_gbs': :'dbNodeStorageSizeInGBs',
        'db_server_id': :'dbServerId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'db_system_id': :'String',
        'vnic_id': :'String',
        'backup_vnic_id': :'String',
        'host_ip_id': :'String',
        'backup_ip_id': :'String',
        'vnic2_id': :'String',
        'backup_vnic2_id': :'String',
        'lifecycle_state': :'String',
        'hostname': :'String',
        'fault_domain': :'String',
        'time_created': :'DateTime',
        'software_storage_size_in_gb': :'Integer',
        'maintenance_type': :'String',
        'time_maintenance_window_start': :'DateTime',
        'time_maintenance_window_end': :'DateTime',
        'additional_details': :'String',
        'cpu_core_count': :'Integer',
        'memory_size_in_gbs': :'Integer',
        'db_node_storage_size_in_gbs': :'Integer',
        'db_server_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :db_system_id The value to assign to the {#db_system_id} property
    # @option attributes [String] :vnic_id The value to assign to the {#vnic_id} property
    # @option attributes [String] :backup_vnic_id The value to assign to the {#backup_vnic_id} property
    # @option attributes [String] :host_ip_id The value to assign to the {#host_ip_id} property
    # @option attributes [String] :backup_ip_id The value to assign to the {#backup_ip_id} property
    # @option attributes [String] :vnic2_id The value to assign to the {#vnic2_id} property
    # @option attributes [String] :backup_vnic2_id The value to assign to the {#backup_vnic2_id} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :hostname The value to assign to the {#hostname} property
    # @option attributes [String] :fault_domain The value to assign to the {#fault_domain} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [Integer] :software_storage_size_in_gb The value to assign to the {#software_storage_size_in_gb} property
    # @option attributes [String] :maintenance_type The value to assign to the {#maintenance_type} property
    # @option attributes [DateTime] :time_maintenance_window_start The value to assign to the {#time_maintenance_window_start} property
    # @option attributes [DateTime] :time_maintenance_window_end The value to assign to the {#time_maintenance_window_end} property
    # @option attributes [String] :additional_details The value to assign to the {#additional_details} property
    # @option attributes [Integer] :cpu_core_count The value to assign to the {#cpu_core_count} property
    # @option attributes [Integer] :memory_size_in_gbs The value to assign to the {#memory_size_in_gbs} property
    # @option attributes [Integer] :db_node_storage_size_in_gbs The value to assign to the {#db_node_storage_size_in_gbs} property
    # @option attributes [String] :db_server_id The value to assign to the {#db_server_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.db_system_id = attributes[:'dbSystemId'] if attributes[:'dbSystemId']

      raise 'You cannot provide both :dbSystemId and :db_system_id' if attributes.key?(:'dbSystemId') && attributes.key?(:'db_system_id')

      self.db_system_id = attributes[:'db_system_id'] if attributes[:'db_system_id']

      self.vnic_id = attributes[:'vnicId'] if attributes[:'vnicId']

      raise 'You cannot provide both :vnicId and :vnic_id' if attributes.key?(:'vnicId') && attributes.key?(:'vnic_id')

      self.vnic_id = attributes[:'vnic_id'] if attributes[:'vnic_id']

      self.backup_vnic_id = attributes[:'backupVnicId'] if attributes[:'backupVnicId']

      raise 'You cannot provide both :backupVnicId and :backup_vnic_id' if attributes.key?(:'backupVnicId') && attributes.key?(:'backup_vnic_id')

      self.backup_vnic_id = attributes[:'backup_vnic_id'] if attributes[:'backup_vnic_id']

      self.host_ip_id = attributes[:'hostIpId'] if attributes[:'hostIpId']

      raise 'You cannot provide both :hostIpId and :host_ip_id' if attributes.key?(:'hostIpId') && attributes.key?(:'host_ip_id')

      self.host_ip_id = attributes[:'host_ip_id'] if attributes[:'host_ip_id']

      self.backup_ip_id = attributes[:'backupIpId'] if attributes[:'backupIpId']

      raise 'You cannot provide both :backupIpId and :backup_ip_id' if attributes.key?(:'backupIpId') && attributes.key?(:'backup_ip_id')

      self.backup_ip_id = attributes[:'backup_ip_id'] if attributes[:'backup_ip_id']

      self.vnic2_id = attributes[:'vnic2Id'] if attributes[:'vnic2Id']

      raise 'You cannot provide both :vnic2Id and :vnic2_id' if attributes.key?(:'vnic2Id') && attributes.key?(:'vnic2_id')

      self.vnic2_id = attributes[:'vnic2_id'] if attributes[:'vnic2_id']

      self.backup_vnic2_id = attributes[:'backupVnic2Id'] if attributes[:'backupVnic2Id']

      raise 'You cannot provide both :backupVnic2Id and :backup_vnic2_id' if attributes.key?(:'backupVnic2Id') && attributes.key?(:'backup_vnic2_id')

      self.backup_vnic2_id = attributes[:'backup_vnic2_id'] if attributes[:'backup_vnic2_id']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.hostname = attributes[:'hostname'] if attributes[:'hostname']

      self.fault_domain = attributes[:'faultDomain'] if attributes[:'faultDomain']

      raise 'You cannot provide both :faultDomain and :fault_domain' if attributes.key?(:'faultDomain') && attributes.key?(:'fault_domain')

      self.fault_domain = attributes[:'fault_domain'] if attributes[:'fault_domain']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.software_storage_size_in_gb = attributes[:'softwareStorageSizeInGB'] if attributes[:'softwareStorageSizeInGB']

      raise 'You cannot provide both :softwareStorageSizeInGB and :software_storage_size_in_gb' if attributes.key?(:'softwareStorageSizeInGB') && attributes.key?(:'software_storage_size_in_gb')

      self.software_storage_size_in_gb = attributes[:'software_storage_size_in_gb'] if attributes[:'software_storage_size_in_gb']

      self.maintenance_type = attributes[:'maintenanceType'] if attributes[:'maintenanceType']

      raise 'You cannot provide both :maintenanceType and :maintenance_type' if attributes.key?(:'maintenanceType') && attributes.key?(:'maintenance_type')

      self.maintenance_type = attributes[:'maintenance_type'] if attributes[:'maintenance_type']

      self.time_maintenance_window_start = attributes[:'timeMaintenanceWindowStart'] if attributes[:'timeMaintenanceWindowStart']

      raise 'You cannot provide both :timeMaintenanceWindowStart and :time_maintenance_window_start' if attributes.key?(:'timeMaintenanceWindowStart') && attributes.key?(:'time_maintenance_window_start')

      self.time_maintenance_window_start = attributes[:'time_maintenance_window_start'] if attributes[:'time_maintenance_window_start']

      self.time_maintenance_window_end = attributes[:'timeMaintenanceWindowEnd'] if attributes[:'timeMaintenanceWindowEnd']

      raise 'You cannot provide both :timeMaintenanceWindowEnd and :time_maintenance_window_end' if attributes.key?(:'timeMaintenanceWindowEnd') && attributes.key?(:'time_maintenance_window_end')

      self.time_maintenance_window_end = attributes[:'time_maintenance_window_end'] if attributes[:'time_maintenance_window_end']

      self.additional_details = attributes[:'additionalDetails'] if attributes[:'additionalDetails']

      raise 'You cannot provide both :additionalDetails and :additional_details' if attributes.key?(:'additionalDetails') && attributes.key?(:'additional_details')

      self.additional_details = attributes[:'additional_details'] if attributes[:'additional_details']

      self.cpu_core_count = attributes[:'cpuCoreCount'] if attributes[:'cpuCoreCount']

      raise 'You cannot provide both :cpuCoreCount and :cpu_core_count' if attributes.key?(:'cpuCoreCount') && attributes.key?(:'cpu_core_count')

      self.cpu_core_count = attributes[:'cpu_core_count'] if attributes[:'cpu_core_count']

      self.memory_size_in_gbs = attributes[:'memorySizeInGBs'] if attributes[:'memorySizeInGBs']

      raise 'You cannot provide both :memorySizeInGBs and :memory_size_in_gbs' if attributes.key?(:'memorySizeInGBs') && attributes.key?(:'memory_size_in_gbs')

      self.memory_size_in_gbs = attributes[:'memory_size_in_gbs'] if attributes[:'memory_size_in_gbs']

      self.db_node_storage_size_in_gbs = attributes[:'dbNodeStorageSizeInGBs'] if attributes[:'dbNodeStorageSizeInGBs']

      raise 'You cannot provide both :dbNodeStorageSizeInGBs and :db_node_storage_size_in_gbs' if attributes.key?(:'dbNodeStorageSizeInGBs') && attributes.key?(:'db_node_storage_size_in_gbs')

      self.db_node_storage_size_in_gbs = attributes[:'db_node_storage_size_in_gbs'] if attributes[:'db_node_storage_size_in_gbs']

      self.db_server_id = attributes[:'dbServerId'] if attributes[:'dbServerId']

      raise 'You cannot provide both :dbServerId and :db_server_id' if attributes.key?(:'dbServerId') && attributes.key?(:'db_server_id')

      self.db_server_id = attributes[:'db_server_id'] if attributes[:'db_server_id']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

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

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] maintenance_type Object to be assigned
    def maintenance_type=(maintenance_type)
      # rubocop:disable Style/ConditionalAssignment
      if maintenance_type && !MAINTENANCE_TYPE_ENUM.include?(maintenance_type)
        OCI.logger.debug("Unknown value for 'maintenance_type' [" + maintenance_type + "]. Mapping to 'MAINTENANCE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @maintenance_type = MAINTENANCE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @maintenance_type = maintenance_type
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
        db_system_id == other.db_system_id &&
        vnic_id == other.vnic_id &&
        backup_vnic_id == other.backup_vnic_id &&
        host_ip_id == other.host_ip_id &&
        backup_ip_id == other.backup_ip_id &&
        vnic2_id == other.vnic2_id &&
        backup_vnic2_id == other.backup_vnic2_id &&
        lifecycle_state == other.lifecycle_state &&
        hostname == other.hostname &&
        fault_domain == other.fault_domain &&
        time_created == other.time_created &&
        software_storage_size_in_gb == other.software_storage_size_in_gb &&
        maintenance_type == other.maintenance_type &&
        time_maintenance_window_start == other.time_maintenance_window_start &&
        time_maintenance_window_end == other.time_maintenance_window_end &&
        additional_details == other.additional_details &&
        cpu_core_count == other.cpu_core_count &&
        memory_size_in_gbs == other.memory_size_in_gbs &&
        db_node_storage_size_in_gbs == other.db_node_storage_size_in_gbs &&
        db_server_id == other.db_server_id
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
      [id, db_system_id, vnic_id, backup_vnic_id, host_ip_id, backup_ip_id, vnic2_id, backup_vnic2_id, lifecycle_state, hostname, fault_domain, time_created, software_storage_size_in_gb, maintenance_type, time_maintenance_window_start, time_maintenance_window_end, additional_details, cpu_core_count, memory_size_in_gbs, db_node_storage_size_in_gbs, db_server_id].hash
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
