# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # An Autonomous Container Database is a container database service that enables the customer to host one or more databases within the container database. A basic container database runs on a single Autonomous Exadata Infrastructure from an availability domain without the Extreme Availability features enabled.
  #
  class Database::Models::AutonomousContainerDatabaseSummary
    SERVICE_LEVEL_AGREEMENT_TYPE_ENUM = [
      SERVICE_LEVEL_AGREEMENT_TYPE_STANDARD = 'STANDARD'.freeze,
      SERVICE_LEVEL_AGREEMENT_TYPE_MISSION_CRITICAL = 'MISSION_CRITICAL'.freeze,
      SERVICE_LEVEL_AGREEMENT_TYPE_AUTONOMOUS_DATAGUARD = 'AUTONOMOUS_DATAGUARD'.freeze,
      SERVICE_LEVEL_AGREEMENT_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    INFRASTRUCTURE_TYPE_ENUM = [
      INFRASTRUCTURE_TYPE_CLOUD = 'CLOUD'.freeze,
      INFRASTRUCTURE_TYPE_CLOUD_AT_CUSTOMER = 'CLOUD_AT_CUSTOMER'.freeze,
      INFRASTRUCTURE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_PROVISIONING = 'PROVISIONING'.freeze,
      LIFECYCLE_STATE_AVAILABLE = 'AVAILABLE'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_TERMINATING = 'TERMINATING'.freeze,
      LIFECYCLE_STATE_TERMINATED = 'TERMINATED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_BACKUP_IN_PROGRESS = 'BACKUP_IN_PROGRESS'.freeze,
      LIFECYCLE_STATE_RESTORING = 'RESTORING'.freeze,
      LIFECYCLE_STATE_RESTORE_FAILED = 'RESTORE_FAILED'.freeze,
      LIFECYCLE_STATE_RESTARTING = 'RESTARTING'.freeze,
      LIFECYCLE_STATE_MAINTENANCE_IN_PROGRESS = 'MAINTENANCE_IN_PROGRESS'.freeze,
      LIFECYCLE_STATE_ROLE_CHANGE_IN_PROGRESS = 'ROLE_CHANGE_IN_PROGRESS'.freeze,
      LIFECYCLE_STATE_UNAVAILABLE = 'UNAVAILABLE'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    PATCH_MODEL_ENUM = [
      PATCH_MODEL_RELEASE_UPDATES = 'RELEASE_UPDATES'.freeze,
      PATCH_MODEL_RELEASE_UPDATE_REVISIONS = 'RELEASE_UPDATE_REVISIONS'.freeze,
      PATCH_MODEL_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    ROLE_ENUM = [
      ROLE_PRIMARY = 'PRIMARY'.freeze,
      ROLE_STANDBY = 'STANDBY'.freeze,
      ROLE_DISABLED_STANDBY = 'DISABLED_STANDBY'.freeze,
      ROLE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The OCID of the Autonomous Container Database.
    # @return [String]
    attr_accessor :id

    # **[Required]** The OCID of the compartment.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The user-provided name for the Autonomous Container Database.
    # @return [String]
    attr_accessor :display_name

    # **Deprecated.** The `DB_UNIQUE_NAME` value is set by Oracle Cloud Infrastructure.  Do not specify a value for this parameter. Specifying a value for this field will cause Terraform operations to fail.
    #
    # @return [String]
    attr_accessor :db_unique_name

    # **[Required]** The service level agreement type of the container database. The default is STANDARD.
    # @return [String]
    attr_reader :service_level_agreement_type

    # **No longer used.** For Autonomous Database on dedicated Exadata infrastructure, the container database is created within a specified `cloudAutonomousVmCluster`.
    #
    # @return [String]
    attr_accessor :autonomous_exadata_infrastructure_id

    # The OCID of the Autonomous VM Cluster.
    # @return [String]
    attr_accessor :autonomous_vm_cluster_id

    # The infrastructure type this resource belongs to.
    # @return [String]
    attr_reader :infrastructure_type

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the cloud Autonomous Exadata VM Cluster.
    # @return [String]
    attr_accessor :cloud_autonomous_vm_cluster_id

    # The OCID of the key container that is used as the master encryption key in database transparent data encryption (TDE) operations.
    # @return [String]
    attr_accessor :kms_key_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Oracle Cloud Infrastructure [vault](https://docs.cloud.oracle.com/Content/KeyManagement/Concepts/keyoverview.htm#concepts).
    # @return [String]
    attr_accessor :vault_id

    # The OCID of the key container version that is used in database transparent data encryption (TDE) operations KMS Key can have multiple key versions. If none is specified, the current key version (latest) of the Key Id is used for the operation.
    #
    # @return [String]
    attr_accessor :kms_key_version_id

    # Key History Entry.
    # @return [Array<OCI::Database::Models::AutonomousDatabaseKeyHistoryEntry>]
    attr_accessor :key_history_entry

    # **[Required]** The current state of the Autonomous Container Database.
    # @return [String]
    attr_reader :lifecycle_state

    # Additional information about the current lifecycle state.
    # @return [String]
    attr_accessor :lifecycle_details

    # The date and time the Autonomous Container Database was created.
    # @return [DateTime]
    attr_accessor :time_created

    # **[Required]** Database patch model preference.
    # @return [String]
    attr_reader :patch_model

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the last patch applied on the system.
    # @return [String]
    attr_accessor :patch_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the last maintenance run.
    # @return [String]
    attr_accessor :last_maintenance_run_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the next maintenance run.
    # @return [String]
    attr_accessor :next_maintenance_run_id

    # @return [OCI::Database::Models::MaintenanceWindow]
    attr_accessor :maintenance_window

    # The scheduling detail for the quarterly maintenance window of the standby Autonomous Container Database.
    # This value represents the number of days before scheduled maintenance of the primary database.
    #
    # @return [Integer]
    attr_accessor :standby_maintenance_buffer_in_days

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

    # The role of the Autonomous Data Guard-enabled Autonomous Container Database.
    # @return [String]
    attr_reader :role

    # The availability domain of the Autonomous Container Database.
    # @return [String]
    attr_accessor :availability_domain

    # Oracle Database version of the Autonomous Container Database.
    # @return [String]
    attr_accessor :db_version

    # @return [OCI::Database::Models::AutonomousContainerDatabaseBackupConfig]
    attr_accessor :backup_config

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the key store.
    # @return [String]
    attr_accessor :key_store_id

    # The wallet name for Oracle Key Vault.
    # @return [String]
    attr_accessor :key_store_wallet_name

    # The amount of memory (in GBs) enabled per each OCPU core in Autonomous VM Cluster.
    # @return [Integer]
    attr_accessor :memory_per_oracle_compute_unit_in_gbs

    # Sum of OCPUs available on the Autonomous VM Cluster + Sum of fractional OCPUs available in the Autonomous Container Database.
    # @return [Float]
    attr_accessor :available_cpus

    # The number of CPU cores allocated to the Autonomous VM cluster.
    # @return [Integer]
    attr_accessor :total_cpus

    # CPU cores that continue to be included in the count of OCPUs available to the Autonomous Container Database even after one of its Autonomous Database is terminated or scaled down. You can release them to the available OCPUs at its parent AVMC level by restarting the Autonomous Container Database.
    # @return [Float]
    attr_accessor :reclaimable_cpus

    # An array of CPU values that can be used to successfully provision a single Autonomous Database.
    # @return [Array<Float>]
    attr_accessor :provisionable_cpus

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'compartment_id': :'compartmentId',
        'display_name': :'displayName',
        'db_unique_name': :'dbUniqueName',
        'service_level_agreement_type': :'serviceLevelAgreementType',
        'autonomous_exadata_infrastructure_id': :'autonomousExadataInfrastructureId',
        'autonomous_vm_cluster_id': :'autonomousVmClusterId',
        'infrastructure_type': :'infrastructureType',
        'cloud_autonomous_vm_cluster_id': :'cloudAutonomousVmClusterId',
        'kms_key_id': :'kmsKeyId',
        'vault_id': :'vaultId',
        'kms_key_version_id': :'kmsKeyVersionId',
        'key_history_entry': :'keyHistoryEntry',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'time_created': :'timeCreated',
        'patch_model': :'patchModel',
        'patch_id': :'patchId',
        'last_maintenance_run_id': :'lastMaintenanceRunId',
        'next_maintenance_run_id': :'nextMaintenanceRunId',
        'maintenance_window': :'maintenanceWindow',
        'standby_maintenance_buffer_in_days': :'standbyMaintenanceBufferInDays',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'role': :'role',
        'availability_domain': :'availabilityDomain',
        'db_version': :'dbVersion',
        'backup_config': :'backupConfig',
        'key_store_id': :'keyStoreId',
        'key_store_wallet_name': :'keyStoreWalletName',
        'memory_per_oracle_compute_unit_in_gbs': :'memoryPerOracleComputeUnitInGBs',
        'available_cpus': :'availableCpus',
        'total_cpus': :'totalCpus',
        'reclaimable_cpus': :'reclaimableCpus',
        'provisionable_cpus': :'provisionableCpus'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'compartment_id': :'String',
        'display_name': :'String',
        'db_unique_name': :'String',
        'service_level_agreement_type': :'String',
        'autonomous_exadata_infrastructure_id': :'String',
        'autonomous_vm_cluster_id': :'String',
        'infrastructure_type': :'String',
        'cloud_autonomous_vm_cluster_id': :'String',
        'kms_key_id': :'String',
        'vault_id': :'String',
        'kms_key_version_id': :'String',
        'key_history_entry': :'Array<OCI::Database::Models::AutonomousDatabaseKeyHistoryEntry>',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'time_created': :'DateTime',
        'patch_model': :'String',
        'patch_id': :'String',
        'last_maintenance_run_id': :'String',
        'next_maintenance_run_id': :'String',
        'maintenance_window': :'OCI::Database::Models::MaintenanceWindow',
        'standby_maintenance_buffer_in_days': :'Integer',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'role': :'String',
        'availability_domain': :'String',
        'db_version': :'String',
        'backup_config': :'OCI::Database::Models::AutonomousContainerDatabaseBackupConfig',
        'key_store_id': :'String',
        'key_store_wallet_name': :'String',
        'memory_per_oracle_compute_unit_in_gbs': :'Integer',
        'available_cpus': :'Float',
        'total_cpus': :'Integer',
        'reclaimable_cpus': :'Float',
        'provisionable_cpus': :'Array<Float>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :db_unique_name The value to assign to the {#db_unique_name} property
    # @option attributes [String] :service_level_agreement_type The value to assign to the {#service_level_agreement_type} property
    # @option attributes [String] :autonomous_exadata_infrastructure_id The value to assign to the {#autonomous_exadata_infrastructure_id} property
    # @option attributes [String] :autonomous_vm_cluster_id The value to assign to the {#autonomous_vm_cluster_id} property
    # @option attributes [String] :infrastructure_type The value to assign to the {#infrastructure_type} property
    # @option attributes [String] :cloud_autonomous_vm_cluster_id The value to assign to the {#cloud_autonomous_vm_cluster_id} property
    # @option attributes [String] :kms_key_id The value to assign to the {#kms_key_id} property
    # @option attributes [String] :vault_id The value to assign to the {#vault_id} property
    # @option attributes [String] :kms_key_version_id The value to assign to the {#kms_key_version_id} property
    # @option attributes [Array<OCI::Database::Models::AutonomousDatabaseKeyHistoryEntry>] :key_history_entry The value to assign to the {#key_history_entry} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [String] :patch_model The value to assign to the {#patch_model} property
    # @option attributes [String] :patch_id The value to assign to the {#patch_id} property
    # @option attributes [String] :last_maintenance_run_id The value to assign to the {#last_maintenance_run_id} property
    # @option attributes [String] :next_maintenance_run_id The value to assign to the {#next_maintenance_run_id} property
    # @option attributes [OCI::Database::Models::MaintenanceWindow] :maintenance_window The value to assign to the {#maintenance_window} property
    # @option attributes [Integer] :standby_maintenance_buffer_in_days The value to assign to the {#standby_maintenance_buffer_in_days} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :role The value to assign to the {#role} property
    # @option attributes [String] :availability_domain The value to assign to the {#availability_domain} property
    # @option attributes [String] :db_version The value to assign to the {#db_version} property
    # @option attributes [OCI::Database::Models::AutonomousContainerDatabaseBackupConfig] :backup_config The value to assign to the {#backup_config} property
    # @option attributes [String] :key_store_id The value to assign to the {#key_store_id} property
    # @option attributes [String] :key_store_wallet_name The value to assign to the {#key_store_wallet_name} property
    # @option attributes [Integer] :memory_per_oracle_compute_unit_in_gbs The value to assign to the {#memory_per_oracle_compute_unit_in_gbs} property
    # @option attributes [Float] :available_cpus The value to assign to the {#available_cpus} property
    # @option attributes [Integer] :total_cpus The value to assign to the {#total_cpus} property
    # @option attributes [Float] :reclaimable_cpus The value to assign to the {#reclaimable_cpus} property
    # @option attributes [Array<Float>] :provisionable_cpus The value to assign to the {#provisionable_cpus} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.db_unique_name = attributes[:'dbUniqueName'] if attributes[:'dbUniqueName']

      raise 'You cannot provide both :dbUniqueName and :db_unique_name' if attributes.key?(:'dbUniqueName') && attributes.key?(:'db_unique_name')

      self.db_unique_name = attributes[:'db_unique_name'] if attributes[:'db_unique_name']

      self.service_level_agreement_type = attributes[:'serviceLevelAgreementType'] if attributes[:'serviceLevelAgreementType']

      raise 'You cannot provide both :serviceLevelAgreementType and :service_level_agreement_type' if attributes.key?(:'serviceLevelAgreementType') && attributes.key?(:'service_level_agreement_type')

      self.service_level_agreement_type = attributes[:'service_level_agreement_type'] if attributes[:'service_level_agreement_type']

      self.autonomous_exadata_infrastructure_id = attributes[:'autonomousExadataInfrastructureId'] if attributes[:'autonomousExadataInfrastructureId']

      raise 'You cannot provide both :autonomousExadataInfrastructureId and :autonomous_exadata_infrastructure_id' if attributes.key?(:'autonomousExadataInfrastructureId') && attributes.key?(:'autonomous_exadata_infrastructure_id')

      self.autonomous_exadata_infrastructure_id = attributes[:'autonomous_exadata_infrastructure_id'] if attributes[:'autonomous_exadata_infrastructure_id']

      self.autonomous_vm_cluster_id = attributes[:'autonomousVmClusterId'] if attributes[:'autonomousVmClusterId']

      raise 'You cannot provide both :autonomousVmClusterId and :autonomous_vm_cluster_id' if attributes.key?(:'autonomousVmClusterId') && attributes.key?(:'autonomous_vm_cluster_id')

      self.autonomous_vm_cluster_id = attributes[:'autonomous_vm_cluster_id'] if attributes[:'autonomous_vm_cluster_id']

      self.infrastructure_type = attributes[:'infrastructureType'] if attributes[:'infrastructureType']

      raise 'You cannot provide both :infrastructureType and :infrastructure_type' if attributes.key?(:'infrastructureType') && attributes.key?(:'infrastructure_type')

      self.infrastructure_type = attributes[:'infrastructure_type'] if attributes[:'infrastructure_type']

      self.cloud_autonomous_vm_cluster_id = attributes[:'cloudAutonomousVmClusterId'] if attributes[:'cloudAutonomousVmClusterId']

      raise 'You cannot provide both :cloudAutonomousVmClusterId and :cloud_autonomous_vm_cluster_id' if attributes.key?(:'cloudAutonomousVmClusterId') && attributes.key?(:'cloud_autonomous_vm_cluster_id')

      self.cloud_autonomous_vm_cluster_id = attributes[:'cloud_autonomous_vm_cluster_id'] if attributes[:'cloud_autonomous_vm_cluster_id']

      self.kms_key_id = attributes[:'kmsKeyId'] if attributes[:'kmsKeyId']

      raise 'You cannot provide both :kmsKeyId and :kms_key_id' if attributes.key?(:'kmsKeyId') && attributes.key?(:'kms_key_id')

      self.kms_key_id = attributes[:'kms_key_id'] if attributes[:'kms_key_id']

      self.vault_id = attributes[:'vaultId'] if attributes[:'vaultId']

      raise 'You cannot provide both :vaultId and :vault_id' if attributes.key?(:'vaultId') && attributes.key?(:'vault_id')

      self.vault_id = attributes[:'vault_id'] if attributes[:'vault_id']

      self.kms_key_version_id = attributes[:'kmsKeyVersionId'] if attributes[:'kmsKeyVersionId']

      raise 'You cannot provide both :kmsKeyVersionId and :kms_key_version_id' if attributes.key?(:'kmsKeyVersionId') && attributes.key?(:'kms_key_version_id')

      self.kms_key_version_id = attributes[:'kms_key_version_id'] if attributes[:'kms_key_version_id']

      self.key_history_entry = attributes[:'keyHistoryEntry'] if attributes[:'keyHistoryEntry']

      raise 'You cannot provide both :keyHistoryEntry and :key_history_entry' if attributes.key?(:'keyHistoryEntry') && attributes.key?(:'key_history_entry')

      self.key_history_entry = attributes[:'key_history_entry'] if attributes[:'key_history_entry']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.patch_model = attributes[:'patchModel'] if attributes[:'patchModel']

      raise 'You cannot provide both :patchModel and :patch_model' if attributes.key?(:'patchModel') && attributes.key?(:'patch_model')

      self.patch_model = attributes[:'patch_model'] if attributes[:'patch_model']

      self.patch_id = attributes[:'patchId'] if attributes[:'patchId']

      raise 'You cannot provide both :patchId and :patch_id' if attributes.key?(:'patchId') && attributes.key?(:'patch_id')

      self.patch_id = attributes[:'patch_id'] if attributes[:'patch_id']

      self.last_maintenance_run_id = attributes[:'lastMaintenanceRunId'] if attributes[:'lastMaintenanceRunId']

      raise 'You cannot provide both :lastMaintenanceRunId and :last_maintenance_run_id' if attributes.key?(:'lastMaintenanceRunId') && attributes.key?(:'last_maintenance_run_id')

      self.last_maintenance_run_id = attributes[:'last_maintenance_run_id'] if attributes[:'last_maintenance_run_id']

      self.next_maintenance_run_id = attributes[:'nextMaintenanceRunId'] if attributes[:'nextMaintenanceRunId']

      raise 'You cannot provide both :nextMaintenanceRunId and :next_maintenance_run_id' if attributes.key?(:'nextMaintenanceRunId') && attributes.key?(:'next_maintenance_run_id')

      self.next_maintenance_run_id = attributes[:'next_maintenance_run_id'] if attributes[:'next_maintenance_run_id']

      self.maintenance_window = attributes[:'maintenanceWindow'] if attributes[:'maintenanceWindow']

      raise 'You cannot provide both :maintenanceWindow and :maintenance_window' if attributes.key?(:'maintenanceWindow') && attributes.key?(:'maintenance_window')

      self.maintenance_window = attributes[:'maintenance_window'] if attributes[:'maintenance_window']

      self.standby_maintenance_buffer_in_days = attributes[:'standbyMaintenanceBufferInDays'] if attributes[:'standbyMaintenanceBufferInDays']

      raise 'You cannot provide both :standbyMaintenanceBufferInDays and :standby_maintenance_buffer_in_days' if attributes.key?(:'standbyMaintenanceBufferInDays') && attributes.key?(:'standby_maintenance_buffer_in_days')

      self.standby_maintenance_buffer_in_days = attributes[:'standby_maintenance_buffer_in_days'] if attributes[:'standby_maintenance_buffer_in_days']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.role = attributes[:'role'] if attributes[:'role']

      self.availability_domain = attributes[:'availabilityDomain'] if attributes[:'availabilityDomain']

      raise 'You cannot provide both :availabilityDomain and :availability_domain' if attributes.key?(:'availabilityDomain') && attributes.key?(:'availability_domain')

      self.availability_domain = attributes[:'availability_domain'] if attributes[:'availability_domain']

      self.db_version = attributes[:'dbVersion'] if attributes[:'dbVersion']

      raise 'You cannot provide both :dbVersion and :db_version' if attributes.key?(:'dbVersion') && attributes.key?(:'db_version')

      self.db_version = attributes[:'db_version'] if attributes[:'db_version']

      self.backup_config = attributes[:'backupConfig'] if attributes[:'backupConfig']

      raise 'You cannot provide both :backupConfig and :backup_config' if attributes.key?(:'backupConfig') && attributes.key?(:'backup_config')

      self.backup_config = attributes[:'backup_config'] if attributes[:'backup_config']

      self.key_store_id = attributes[:'keyStoreId'] if attributes[:'keyStoreId']

      raise 'You cannot provide both :keyStoreId and :key_store_id' if attributes.key?(:'keyStoreId') && attributes.key?(:'key_store_id')

      self.key_store_id = attributes[:'key_store_id'] if attributes[:'key_store_id']

      self.key_store_wallet_name = attributes[:'keyStoreWalletName'] if attributes[:'keyStoreWalletName']

      raise 'You cannot provide both :keyStoreWalletName and :key_store_wallet_name' if attributes.key?(:'keyStoreWalletName') && attributes.key?(:'key_store_wallet_name')

      self.key_store_wallet_name = attributes[:'key_store_wallet_name'] if attributes[:'key_store_wallet_name']

      self.memory_per_oracle_compute_unit_in_gbs = attributes[:'memoryPerOracleComputeUnitInGBs'] if attributes[:'memoryPerOracleComputeUnitInGBs']

      raise 'You cannot provide both :memoryPerOracleComputeUnitInGBs and :memory_per_oracle_compute_unit_in_gbs' if attributes.key?(:'memoryPerOracleComputeUnitInGBs') && attributes.key?(:'memory_per_oracle_compute_unit_in_gbs')

      self.memory_per_oracle_compute_unit_in_gbs = attributes[:'memory_per_oracle_compute_unit_in_gbs'] if attributes[:'memory_per_oracle_compute_unit_in_gbs']

      self.available_cpus = attributes[:'availableCpus'] if attributes[:'availableCpus']

      raise 'You cannot provide both :availableCpus and :available_cpus' if attributes.key?(:'availableCpus') && attributes.key?(:'available_cpus')

      self.available_cpus = attributes[:'available_cpus'] if attributes[:'available_cpus']

      self.total_cpus = attributes[:'totalCpus'] if attributes[:'totalCpus']

      raise 'You cannot provide both :totalCpus and :total_cpus' if attributes.key?(:'totalCpus') && attributes.key?(:'total_cpus')

      self.total_cpus = attributes[:'total_cpus'] if attributes[:'total_cpus']

      self.reclaimable_cpus = attributes[:'reclaimableCpus'] if attributes[:'reclaimableCpus']

      raise 'You cannot provide both :reclaimableCpus and :reclaimable_cpus' if attributes.key?(:'reclaimableCpus') && attributes.key?(:'reclaimable_cpus')

      self.reclaimable_cpus = attributes[:'reclaimable_cpus'] if attributes[:'reclaimable_cpus']

      self.provisionable_cpus = attributes[:'provisionableCpus'] if attributes[:'provisionableCpus']

      raise 'You cannot provide both :provisionableCpus and :provisionable_cpus' if attributes.key?(:'provisionableCpus') && attributes.key?(:'provisionable_cpus')

      self.provisionable_cpus = attributes[:'provisionable_cpus'] if attributes[:'provisionable_cpus']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] service_level_agreement_type Object to be assigned
    def service_level_agreement_type=(service_level_agreement_type)
      # rubocop:disable Style/ConditionalAssignment
      if service_level_agreement_type && !SERVICE_LEVEL_AGREEMENT_TYPE_ENUM.include?(service_level_agreement_type)
        OCI.logger.debug("Unknown value for 'service_level_agreement_type' [" + service_level_agreement_type + "]. Mapping to 'SERVICE_LEVEL_AGREEMENT_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @service_level_agreement_type = SERVICE_LEVEL_AGREEMENT_TYPE_UNKNOWN_ENUM_VALUE
      else
        @service_level_agreement_type = service_level_agreement_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] infrastructure_type Object to be assigned
    def infrastructure_type=(infrastructure_type)
      # rubocop:disable Style/ConditionalAssignment
      if infrastructure_type && !INFRASTRUCTURE_TYPE_ENUM.include?(infrastructure_type)
        OCI.logger.debug("Unknown value for 'infrastructure_type' [" + infrastructure_type + "]. Mapping to 'INFRASTRUCTURE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @infrastructure_type = INFRASTRUCTURE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @infrastructure_type = infrastructure_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

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
    # @param [Object] patch_model Object to be assigned
    def patch_model=(patch_model)
      # rubocop:disable Style/ConditionalAssignment
      if patch_model && !PATCH_MODEL_ENUM.include?(patch_model)
        OCI.logger.debug("Unknown value for 'patch_model' [" + patch_model + "]. Mapping to 'PATCH_MODEL_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @patch_model = PATCH_MODEL_UNKNOWN_ENUM_VALUE
      else
        @patch_model = patch_model
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] role Object to be assigned
    def role=(role)
      # rubocop:disable Style/ConditionalAssignment
      if role && !ROLE_ENUM.include?(role)
        OCI.logger.debug("Unknown value for 'role' [" + role + "]. Mapping to 'ROLE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @role = ROLE_UNKNOWN_ENUM_VALUE
      else
        @role = role
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
        compartment_id == other.compartment_id &&
        display_name == other.display_name &&
        db_unique_name == other.db_unique_name &&
        service_level_agreement_type == other.service_level_agreement_type &&
        autonomous_exadata_infrastructure_id == other.autonomous_exadata_infrastructure_id &&
        autonomous_vm_cluster_id == other.autonomous_vm_cluster_id &&
        infrastructure_type == other.infrastructure_type &&
        cloud_autonomous_vm_cluster_id == other.cloud_autonomous_vm_cluster_id &&
        kms_key_id == other.kms_key_id &&
        vault_id == other.vault_id &&
        kms_key_version_id == other.kms_key_version_id &&
        key_history_entry == other.key_history_entry &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        time_created == other.time_created &&
        patch_model == other.patch_model &&
        patch_id == other.patch_id &&
        last_maintenance_run_id == other.last_maintenance_run_id &&
        next_maintenance_run_id == other.next_maintenance_run_id &&
        maintenance_window == other.maintenance_window &&
        standby_maintenance_buffer_in_days == other.standby_maintenance_buffer_in_days &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        role == other.role &&
        availability_domain == other.availability_domain &&
        db_version == other.db_version &&
        backup_config == other.backup_config &&
        key_store_id == other.key_store_id &&
        key_store_wallet_name == other.key_store_wallet_name &&
        memory_per_oracle_compute_unit_in_gbs == other.memory_per_oracle_compute_unit_in_gbs &&
        available_cpus == other.available_cpus &&
        total_cpus == other.total_cpus &&
        reclaimable_cpus == other.reclaimable_cpus &&
        provisionable_cpus == other.provisionable_cpus
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
      [id, compartment_id, display_name, db_unique_name, service_level_agreement_type, autonomous_exadata_infrastructure_id, autonomous_vm_cluster_id, infrastructure_type, cloud_autonomous_vm_cluster_id, kms_key_id, vault_id, kms_key_version_id, key_history_entry, lifecycle_state, lifecycle_details, time_created, patch_model, patch_id, last_maintenance_run_id, next_maintenance_run_id, maintenance_window, standby_maintenance_buffer_in_days, freeform_tags, defined_tags, role, availability_domain, db_version, backup_config, key_store_id, key_store_wallet_name, memory_per_oracle_compute_unit_in_gbs, available_cpus, total_cpus, reclaimable_cpus, provisionable_cpus].hash
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
