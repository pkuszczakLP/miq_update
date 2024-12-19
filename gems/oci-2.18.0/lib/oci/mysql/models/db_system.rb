# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A DB System is the core logical unit of MySQL Database Service.
  #
  class Mysql::Models::DbSystem
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    CRASH_RECOVERY_ENUM = [
      CRASH_RECOVERY_ENABLED = 'ENABLED'.freeze,
      CRASH_RECOVERY_DISABLED = 'DISABLED'.freeze,
      CRASH_RECOVERY_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The OCID of the DB System.
    # @return [String]
    attr_accessor :id

    # **[Required]** The user-friendly name for the DB System. It does not have to be unique.
    # @return [String]
    attr_accessor :display_name

    # User-provided data about the DB System.
    # @return [String]
    attr_accessor :description

    # **[Required]** The OCID of the compartment the DB System belongs in.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The OCID of the subnet the DB System is associated with.
    #
    # @return [String]
    attr_accessor :subnet_id

    # Specifies if the DB System is highly available.
    #
    # @return [BOOLEAN]
    attr_accessor :is_highly_available

    # @return [OCI::Mysql::Models::DbSystemPlacement]
    attr_accessor :current_placement

    # DEPRECATED -- please use `isHeatWaveClusterAttached` instead.
    # If the DB System has an Analytics Cluster attached.
    #
    # @return [BOOLEAN]
    attr_accessor :is_analytics_cluster_attached

    # @return [OCI::Mysql::Models::AnalyticsClusterSummary]
    attr_accessor :analytics_cluster

    # If the DB System has a HeatWave Cluster attached.
    #
    # @return [BOOLEAN]
    attr_accessor :is_heat_wave_cluster_attached

    # @return [OCI::Mysql::Models::HeatWaveClusterSummary]
    attr_accessor :heat_wave_cluster

    # The availability domain on which to deploy the Read/Write endpoint. This defines the preferred primary instance.
    #
    # In a failover scenario, the Read/Write endpoint is redirected to one of the other availability domains
    # and the MySQL instance in that domain is promoted to the primary instance.
    # This redirection does not affect the IP address of the DB System in any way.
    #
    # For a standalone DB System, this defines the availability domain in which the DB System is placed.
    #
    # @return [String]
    attr_accessor :availability_domain

    # The fault domain on which to deploy the Read/Write endpoint. This defines the preferred primary instance.
    #
    # In a failover scenario, the Read/Write endpoint is redirected to one of the other fault domains
    # and the MySQL instance in that domain is promoted to the primary instance.
    # This redirection does not affect the IP address of the DB System in any way.
    #
    # For a standalone DB System, this defines the fault domain in which the DB System is placed.
    #
    # @return [String]
    attr_accessor :fault_domain

    # The shape of the primary instances of the DB System. The shape
    # determines resources allocated to a DB System - CPU cores
    # and memory for VM shapes; CPU cores, memory and storage for non-VM
    # (or bare metal) shapes. To get a list of shapes, use (the
    # {#list_shapes list_shapes} operation.
    #
    # @return [String]
    attr_accessor :shape_name

    # **[Required]** Name of the MySQL Version in use for the DB System.
    # @return [String]
    attr_accessor :mysql_version

    # @return [OCI::Mysql::Models::BackupPolicy]
    attr_accessor :backup_policy

    # @return [OCI::Mysql::Models::DbSystemSource]
    attr_accessor :source

    # The OCID of the Configuration to be used for Instances in this DB System.
    # @return [String]
    attr_accessor :configuration_id

    # **[Required]** Initial size of the data volume in GiBs that will be created and attached.
    #
    # @return [Integer]
    attr_accessor :data_storage_size_in_gbs

    # The hostname for the primary endpoint of the DB System. Used for DNS.
    # The value is the hostname portion of the primary private IP's fully qualified domain name (FQDN)
    # (for example, \"dbsystem-1\" in FQDN \"dbsystem-1.subnet123.vcn1.oraclevcn.com\").
    # Must be unique across all VNICs in the subnet and comply with RFC 952 and RFC 1123.
    #
    # @return [String]
    attr_accessor :hostname_label

    # The IP address the DB System is configured to listen on. A private
    # IP address of the primary endpoint of the DB System. Must be an
    # available IP address within the subnet's CIDR. This will be a
    # \"dotted-quad\" style IPv4 address.
    #
    # @return [String]
    attr_accessor :ip_address

    # The port for primary endpoint of the DB System to listen on.
    # @return [Integer]
    attr_accessor :port

    # The network port on which X Plugin listens for TCP/IP connections. This is the X Plugin equivalent of port.
    #
    # @return [Integer]
    attr_accessor :port_x

    # The network endpoints available for this DB System.
    #
    # @return [Array<OCI::Mysql::Models::DbSystemEndpoint>]
    attr_accessor :endpoints

    # A list with a summary of all the Channels attached to the DB System.
    # @return [Array<OCI::Mysql::Models::ChannelSummary>]
    attr_accessor :channels

    # **[Required]** The current state of the DB System.
    # @return [String]
    attr_reader :lifecycle_state

    # Additional information about the current lifecycleState.
    # @return [String]
    attr_accessor :lifecycle_details

    # This attribute is required.
    # @return [OCI::Mysql::Models::MaintenanceDetails]
    attr_accessor :maintenance

    # This attribute is required.
    # @return [OCI::Mysql::Models::DeletionPolicyDetails]
    attr_accessor :deletion_policy

    # **[Required]** The date and time the DB System was created.
    # @return [DateTime]
    attr_accessor :time_created

    # **[Required]** The time the DB System was last updated.
    # @return [DateTime]
    attr_accessor :time_updated

    # Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Whether to run the DB System with InnoDB Redo Logs and the Double Write Buffer enabled or disabled,
    # and whether to enable or disable syncing of the Binary Logs.
    #
    # @return [String]
    attr_reader :crash_recovery

    # @return [OCI::Mysql::Models::PointInTimeRecoveryDetails]
    attr_accessor :point_in_time_recovery_details

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'display_name': :'displayName',
        'description': :'description',
        'compartment_id': :'compartmentId',
        'subnet_id': :'subnetId',
        'is_highly_available': :'isHighlyAvailable',
        'current_placement': :'currentPlacement',
        'is_analytics_cluster_attached': :'isAnalyticsClusterAttached',
        'analytics_cluster': :'analyticsCluster',
        'is_heat_wave_cluster_attached': :'isHeatWaveClusterAttached',
        'heat_wave_cluster': :'heatWaveCluster',
        'availability_domain': :'availabilityDomain',
        'fault_domain': :'faultDomain',
        'shape_name': :'shapeName',
        'mysql_version': :'mysqlVersion',
        'backup_policy': :'backupPolicy',
        'source': :'source',
        'configuration_id': :'configurationId',
        'data_storage_size_in_gbs': :'dataStorageSizeInGBs',
        'hostname_label': :'hostnameLabel',
        'ip_address': :'ipAddress',
        'port': :'port',
        'port_x': :'portX',
        'endpoints': :'endpoints',
        'channels': :'channels',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'maintenance': :'maintenance',
        'deletion_policy': :'deletionPolicy',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'crash_recovery': :'crashRecovery',
        'point_in_time_recovery_details': :'pointInTimeRecoveryDetails'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'display_name': :'String',
        'description': :'String',
        'compartment_id': :'String',
        'subnet_id': :'String',
        'is_highly_available': :'BOOLEAN',
        'current_placement': :'OCI::Mysql::Models::DbSystemPlacement',
        'is_analytics_cluster_attached': :'BOOLEAN',
        'analytics_cluster': :'OCI::Mysql::Models::AnalyticsClusterSummary',
        'is_heat_wave_cluster_attached': :'BOOLEAN',
        'heat_wave_cluster': :'OCI::Mysql::Models::HeatWaveClusterSummary',
        'availability_domain': :'String',
        'fault_domain': :'String',
        'shape_name': :'String',
        'mysql_version': :'String',
        'backup_policy': :'OCI::Mysql::Models::BackupPolicy',
        'source': :'OCI::Mysql::Models::DbSystemSource',
        'configuration_id': :'String',
        'data_storage_size_in_gbs': :'Integer',
        'hostname_label': :'String',
        'ip_address': :'String',
        'port': :'Integer',
        'port_x': :'Integer',
        'endpoints': :'Array<OCI::Mysql::Models::DbSystemEndpoint>',
        'channels': :'Array<OCI::Mysql::Models::ChannelSummary>',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'maintenance': :'OCI::Mysql::Models::MaintenanceDetails',
        'deletion_policy': :'OCI::Mysql::Models::DeletionPolicyDetails',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'crash_recovery': :'String',
        'point_in_time_recovery_details': :'OCI::Mysql::Models::PointInTimeRecoveryDetails'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :subnet_id The value to assign to the {#subnet_id} property
    # @option attributes [BOOLEAN] :is_highly_available The value to assign to the {#is_highly_available} property
    # @option attributes [OCI::Mysql::Models::DbSystemPlacement] :current_placement The value to assign to the {#current_placement} property
    # @option attributes [BOOLEAN] :is_analytics_cluster_attached The value to assign to the {#is_analytics_cluster_attached} property
    # @option attributes [OCI::Mysql::Models::AnalyticsClusterSummary] :analytics_cluster The value to assign to the {#analytics_cluster} property
    # @option attributes [BOOLEAN] :is_heat_wave_cluster_attached The value to assign to the {#is_heat_wave_cluster_attached} property
    # @option attributes [OCI::Mysql::Models::HeatWaveClusterSummary] :heat_wave_cluster The value to assign to the {#heat_wave_cluster} property
    # @option attributes [String] :availability_domain The value to assign to the {#availability_domain} property
    # @option attributes [String] :fault_domain The value to assign to the {#fault_domain} property
    # @option attributes [String] :shape_name The value to assign to the {#shape_name} property
    # @option attributes [String] :mysql_version The value to assign to the {#mysql_version} property
    # @option attributes [OCI::Mysql::Models::BackupPolicy] :backup_policy The value to assign to the {#backup_policy} property
    # @option attributes [OCI::Mysql::Models::DbSystemSource] :source The value to assign to the {#source} property
    # @option attributes [String] :configuration_id The value to assign to the {#configuration_id} property
    # @option attributes [Integer] :data_storage_size_in_gbs The value to assign to the {#data_storage_size_in_gbs} property
    # @option attributes [String] :hostname_label The value to assign to the {#hostname_label} property
    # @option attributes [String] :ip_address The value to assign to the {#ip_address} property
    # @option attributes [Integer] :port The value to assign to the {#port} property
    # @option attributes [Integer] :port_x The value to assign to the {#port_x} property
    # @option attributes [Array<OCI::Mysql::Models::DbSystemEndpoint>] :endpoints The value to assign to the {#endpoints} property
    # @option attributes [Array<OCI::Mysql::Models::ChannelSummary>] :channels The value to assign to the {#channels} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [OCI::Mysql::Models::MaintenanceDetails] :maintenance The value to assign to the {#maintenance} property
    # @option attributes [OCI::Mysql::Models::DeletionPolicyDetails] :deletion_policy The value to assign to the {#deletion_policy} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :crash_recovery The value to assign to the {#crash_recovery} property
    # @option attributes [OCI::Mysql::Models::PointInTimeRecoveryDetails] :point_in_time_recovery_details The value to assign to the {#point_in_time_recovery_details} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.subnet_id = attributes[:'subnetId'] if attributes[:'subnetId']

      raise 'You cannot provide both :subnetId and :subnet_id' if attributes.key?(:'subnetId') && attributes.key?(:'subnet_id')

      self.subnet_id = attributes[:'subnet_id'] if attributes[:'subnet_id']

      self.is_highly_available = attributes[:'isHighlyAvailable'] unless attributes[:'isHighlyAvailable'].nil?
      self.is_highly_available = true if is_highly_available.nil? && !attributes.key?(:'isHighlyAvailable') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isHighlyAvailable and :is_highly_available' if attributes.key?(:'isHighlyAvailable') && attributes.key?(:'is_highly_available')

      self.is_highly_available = attributes[:'is_highly_available'] unless attributes[:'is_highly_available'].nil?
      self.is_highly_available = true if is_highly_available.nil? && !attributes.key?(:'isHighlyAvailable') && !attributes.key?(:'is_highly_available') # rubocop:disable Style/StringLiterals

      self.current_placement = attributes[:'currentPlacement'] if attributes[:'currentPlacement']

      raise 'You cannot provide both :currentPlacement and :current_placement' if attributes.key?(:'currentPlacement') && attributes.key?(:'current_placement')

      self.current_placement = attributes[:'current_placement'] if attributes[:'current_placement']

      self.is_analytics_cluster_attached = attributes[:'isAnalyticsClusterAttached'] unless attributes[:'isAnalyticsClusterAttached'].nil?
      self.is_analytics_cluster_attached = false if is_analytics_cluster_attached.nil? && !attributes.key?(:'isAnalyticsClusterAttached') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isAnalyticsClusterAttached and :is_analytics_cluster_attached' if attributes.key?(:'isAnalyticsClusterAttached') && attributes.key?(:'is_analytics_cluster_attached')

      self.is_analytics_cluster_attached = attributes[:'is_analytics_cluster_attached'] unless attributes[:'is_analytics_cluster_attached'].nil?
      self.is_analytics_cluster_attached = false if is_analytics_cluster_attached.nil? && !attributes.key?(:'isAnalyticsClusterAttached') && !attributes.key?(:'is_analytics_cluster_attached') # rubocop:disable Style/StringLiterals

      self.analytics_cluster = attributes[:'analyticsCluster'] if attributes[:'analyticsCluster']

      raise 'You cannot provide both :analyticsCluster and :analytics_cluster' if attributes.key?(:'analyticsCluster') && attributes.key?(:'analytics_cluster')

      self.analytics_cluster = attributes[:'analytics_cluster'] if attributes[:'analytics_cluster']

      self.is_heat_wave_cluster_attached = attributes[:'isHeatWaveClusterAttached'] unless attributes[:'isHeatWaveClusterAttached'].nil?
      self.is_heat_wave_cluster_attached = false if is_heat_wave_cluster_attached.nil? && !attributes.key?(:'isHeatWaveClusterAttached') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isHeatWaveClusterAttached and :is_heat_wave_cluster_attached' if attributes.key?(:'isHeatWaveClusterAttached') && attributes.key?(:'is_heat_wave_cluster_attached')

      self.is_heat_wave_cluster_attached = attributes[:'is_heat_wave_cluster_attached'] unless attributes[:'is_heat_wave_cluster_attached'].nil?
      self.is_heat_wave_cluster_attached = false if is_heat_wave_cluster_attached.nil? && !attributes.key?(:'isHeatWaveClusterAttached') && !attributes.key?(:'is_heat_wave_cluster_attached') # rubocop:disable Style/StringLiterals

      self.heat_wave_cluster = attributes[:'heatWaveCluster'] if attributes[:'heatWaveCluster']

      raise 'You cannot provide both :heatWaveCluster and :heat_wave_cluster' if attributes.key?(:'heatWaveCluster') && attributes.key?(:'heat_wave_cluster')

      self.heat_wave_cluster = attributes[:'heat_wave_cluster'] if attributes[:'heat_wave_cluster']

      self.availability_domain = attributes[:'availabilityDomain'] if attributes[:'availabilityDomain']

      raise 'You cannot provide both :availabilityDomain and :availability_domain' if attributes.key?(:'availabilityDomain') && attributes.key?(:'availability_domain')

      self.availability_domain = attributes[:'availability_domain'] if attributes[:'availability_domain']

      self.fault_domain = attributes[:'faultDomain'] if attributes[:'faultDomain']

      raise 'You cannot provide both :faultDomain and :fault_domain' if attributes.key?(:'faultDomain') && attributes.key?(:'fault_domain')

      self.fault_domain = attributes[:'fault_domain'] if attributes[:'fault_domain']

      self.shape_name = attributes[:'shapeName'] if attributes[:'shapeName']

      raise 'You cannot provide both :shapeName and :shape_name' if attributes.key?(:'shapeName') && attributes.key?(:'shape_name')

      self.shape_name = attributes[:'shape_name'] if attributes[:'shape_name']

      self.mysql_version = attributes[:'mysqlVersion'] if attributes[:'mysqlVersion']

      raise 'You cannot provide both :mysqlVersion and :mysql_version' if attributes.key?(:'mysqlVersion') && attributes.key?(:'mysql_version')

      self.mysql_version = attributes[:'mysql_version'] if attributes[:'mysql_version']

      self.backup_policy = attributes[:'backupPolicy'] if attributes[:'backupPolicy']

      raise 'You cannot provide both :backupPolicy and :backup_policy' if attributes.key?(:'backupPolicy') && attributes.key?(:'backup_policy')

      self.backup_policy = attributes[:'backup_policy'] if attributes[:'backup_policy']

      self.source = attributes[:'source'] if attributes[:'source']

      self.configuration_id = attributes[:'configurationId'] if attributes[:'configurationId']

      raise 'You cannot provide both :configurationId and :configuration_id' if attributes.key?(:'configurationId') && attributes.key?(:'configuration_id')

      self.configuration_id = attributes[:'configuration_id'] if attributes[:'configuration_id']

      self.data_storage_size_in_gbs = attributes[:'dataStorageSizeInGBs'] if attributes[:'dataStorageSizeInGBs']

      raise 'You cannot provide both :dataStorageSizeInGBs and :data_storage_size_in_gbs' if attributes.key?(:'dataStorageSizeInGBs') && attributes.key?(:'data_storage_size_in_gbs')

      self.data_storage_size_in_gbs = attributes[:'data_storage_size_in_gbs'] if attributes[:'data_storage_size_in_gbs']

      self.hostname_label = attributes[:'hostnameLabel'] if attributes[:'hostnameLabel']

      raise 'You cannot provide both :hostnameLabel and :hostname_label' if attributes.key?(:'hostnameLabel') && attributes.key?(:'hostname_label')

      self.hostname_label = attributes[:'hostname_label'] if attributes[:'hostname_label']

      self.ip_address = attributes[:'ipAddress'] if attributes[:'ipAddress']

      raise 'You cannot provide both :ipAddress and :ip_address' if attributes.key?(:'ipAddress') && attributes.key?(:'ip_address')

      self.ip_address = attributes[:'ip_address'] if attributes[:'ip_address']

      self.port = attributes[:'port'] if attributes[:'port']

      self.port_x = attributes[:'portX'] if attributes[:'portX']

      raise 'You cannot provide both :portX and :port_x' if attributes.key?(:'portX') && attributes.key?(:'port_x')

      self.port_x = attributes[:'port_x'] if attributes[:'port_x']

      self.endpoints = attributes[:'endpoints'] if attributes[:'endpoints']

      self.channels = attributes[:'channels'] if attributes[:'channels']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.maintenance = attributes[:'maintenance'] if attributes[:'maintenance']

      self.deletion_policy = attributes[:'deletionPolicy'] if attributes[:'deletionPolicy']

      raise 'You cannot provide both :deletionPolicy and :deletion_policy' if attributes.key?(:'deletionPolicy') && attributes.key?(:'deletion_policy')

      self.deletion_policy = attributes[:'deletion_policy'] if attributes[:'deletion_policy']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.crash_recovery = attributes[:'crashRecovery'] if attributes[:'crashRecovery']
      self.crash_recovery = "ENABLED" if crash_recovery.nil? && !attributes.key?(:'crashRecovery') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :crashRecovery and :crash_recovery' if attributes.key?(:'crashRecovery') && attributes.key?(:'crash_recovery')

      self.crash_recovery = attributes[:'crash_recovery'] if attributes[:'crash_recovery']
      self.crash_recovery = "ENABLED" if crash_recovery.nil? && !attributes.key?(:'crashRecovery') && !attributes.key?(:'crash_recovery') # rubocop:disable Style/StringLiterals

      self.point_in_time_recovery_details = attributes[:'pointInTimeRecoveryDetails'] if attributes[:'pointInTimeRecoveryDetails']

      raise 'You cannot provide both :pointInTimeRecoveryDetails and :point_in_time_recovery_details' if attributes.key?(:'pointInTimeRecoveryDetails') && attributes.key?(:'point_in_time_recovery_details')

      self.point_in_time_recovery_details = attributes[:'point_in_time_recovery_details'] if attributes[:'point_in_time_recovery_details']
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
    # @param [Object] crash_recovery Object to be assigned
    def crash_recovery=(crash_recovery)
      # rubocop:disable Style/ConditionalAssignment
      if crash_recovery && !CRASH_RECOVERY_ENUM.include?(crash_recovery)
        OCI.logger.debug("Unknown value for 'crash_recovery' [" + crash_recovery + "]. Mapping to 'CRASH_RECOVERY_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @crash_recovery = CRASH_RECOVERY_UNKNOWN_ENUM_VALUE
      else
        @crash_recovery = crash_recovery
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
        display_name == other.display_name &&
        description == other.description &&
        compartment_id == other.compartment_id &&
        subnet_id == other.subnet_id &&
        is_highly_available == other.is_highly_available &&
        current_placement == other.current_placement &&
        is_analytics_cluster_attached == other.is_analytics_cluster_attached &&
        analytics_cluster == other.analytics_cluster &&
        is_heat_wave_cluster_attached == other.is_heat_wave_cluster_attached &&
        heat_wave_cluster == other.heat_wave_cluster &&
        availability_domain == other.availability_domain &&
        fault_domain == other.fault_domain &&
        shape_name == other.shape_name &&
        mysql_version == other.mysql_version &&
        backup_policy == other.backup_policy &&
        source == other.source &&
        configuration_id == other.configuration_id &&
        data_storage_size_in_gbs == other.data_storage_size_in_gbs &&
        hostname_label == other.hostname_label &&
        ip_address == other.ip_address &&
        port == other.port &&
        port_x == other.port_x &&
        endpoints == other.endpoints &&
        channels == other.channels &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        maintenance == other.maintenance &&
        deletion_policy == other.deletion_policy &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        crash_recovery == other.crash_recovery &&
        point_in_time_recovery_details == other.point_in_time_recovery_details
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
      [id, display_name, description, compartment_id, subnet_id, is_highly_available, current_placement, is_analytics_cluster_attached, analytics_cluster, is_heat_wave_cluster_attached, heat_wave_cluster, availability_domain, fault_domain, shape_name, mysql_version, backup_policy, source, configuration_id, data_storage_size_in_gbs, hostname_label, ip_address, port, port_x, endpoints, channels, lifecycle_state, lifecycle_details, maintenance, deletion_policy, time_created, time_updated, freeform_tags, defined_tags, crash_recovery, point_in_time_recovery_details].hash
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
