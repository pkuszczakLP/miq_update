# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details to create an Oracle Autonomous Database.
  #
  # **Notes:**
  # - To specify OCPU core count, you must use either `ocpuCount` or `cpuCoreCount`. You cannot use both parameters at the same time.
  # - To specify a storage allocation, you must use  either `dataStorageSizeInGBs` or `dataStorageSizeInTBs`.
  # - See the individual parameter discriptions for more information on the OCPU and storage value parameters.
  #
  # **Warning:** Oracle recommends that you avoid using any confidential information when you supply string values using the API.
  #
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class Database::Models::CreateAutonomousDatabaseBase
    DB_WORKLOAD_ENUM = [
      DB_WORKLOAD_OLTP = 'OLTP'.freeze,
      DB_WORKLOAD_DW = 'DW'.freeze,
      DB_WORKLOAD_AJD = 'AJD'.freeze,
      DB_WORKLOAD_APEX = 'APEX'.freeze
    ].freeze

    LICENSE_MODEL_ENUM = [
      LICENSE_MODEL_LICENSE_INCLUDED = 'LICENSE_INCLUDED'.freeze,
      LICENSE_MODEL_BRING_YOUR_OWN_LICENSE = 'BRING_YOUR_OWN_LICENSE'.freeze
    ].freeze

    SOURCE_ENUM = [
      SOURCE_NONE = 'NONE'.freeze,
      SOURCE_DATABASE = 'DATABASE'.freeze,
      SOURCE_BACKUP_FROM_ID = 'BACKUP_FROM_ID'.freeze,
      SOURCE_BACKUP_FROM_TIMESTAMP = 'BACKUP_FROM_TIMESTAMP'.freeze,
      SOURCE_CLONE_TO_REFRESHABLE = 'CLONE_TO_REFRESHABLE'.freeze,
      SOURCE_CROSS_REGION_DATAGUARD = 'CROSS_REGION_DATAGUARD'.freeze
    ].freeze

    AUTONOMOUS_MAINTENANCE_SCHEDULE_TYPE_ENUM = [
      AUTONOMOUS_MAINTENANCE_SCHEDULE_TYPE_EARLY = 'EARLY'.freeze,
      AUTONOMOUS_MAINTENANCE_SCHEDULE_TYPE_REGULAR = 'REGULAR'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment of the Autonomous Database.
    # @return [String]
    attr_accessor :compartment_id

    # The character set for the autonomous database.  The default is AL32UTF8. Allowed values for an Autonomous Database on shared infrastructure as as returned by [List Autonomous Database Character Sets](https://docs.cloud.oracle.com/autonomousDatabaseCharacterSets)
    #
    # For an Autonomous Database on dedicated infrastructure, the allowed values are:
    #
    # AL32UTF8, AR8ADOS710, AR8ADOS720, AR8APTEC715, AR8ARABICMACS, AR8ASMO8X, AR8ISO8859P6, AR8MSWIN1256, AR8MUSSAD768, AR8NAFITHA711, AR8NAFITHA721, AR8SAKHR706, AR8SAKHR707, AZ8ISO8859P9E, BG8MSWIN, BG8PC437S, BLT8CP921, BLT8ISO8859P13, BLT8MSWIN1257, BLT8PC775, BN8BSCII, CDN8PC863, CEL8ISO8859P14, CL8ISO8859P5, CL8ISOIR111, CL8KOI8R, CL8KOI8U, CL8MACCYRILLICS, CL8MSWIN1251, EE8ISO8859P2, EE8MACCES, EE8MACCROATIANS, EE8MSWIN1250, EE8PC852, EL8DEC, EL8ISO8859P7, EL8MACGREEKS, EL8MSWIN1253, EL8PC437S, EL8PC851, EL8PC869, ET8MSWIN923, HU8ABMOD, HU8CWI2, IN8ISCII, IS8PC861, IW8ISO8859P8, IW8MACHEBREWS, IW8MSWIN1255, IW8PC1507, JA16EUC, JA16EUCTILDE, JA16SJIS, JA16SJISTILDE, JA16VMS, KO16KSC5601, KO16KSCCS, KO16MSWIN949, LA8ISO6937, LA8PASSPORT, LT8MSWIN921, LT8PC772, LT8PC774, LV8PC1117, LV8PC8LR, LV8RST104090, N8PC865, NE8ISO8859P10, NEE8ISO8859P4, RU8BESTA, RU8PC855, RU8PC866, SE8ISO8859P3, TH8MACTHAIS, TH8TISASCII, TR8DEC, TR8MACTURKISHS, TR8MSWIN1254, TR8PC857, US7ASCII, US8PC437, UTF8, VN8MSWIN1258, VN8VN3, WE8DEC, WE8DG, WE8ISO8859P1, WE8ISO8859P15, WE8ISO8859P9, WE8MACROMAN8S, WE8MSWIN1252, WE8NCR4970, WE8NEXTSTEP, WE8PC850, WE8PC858, WE8PC860, WE8ROMAN8, ZHS16CGB231280, ZHS16GBK, ZHT16BIG5, ZHT16CCDC, ZHT16DBT, ZHT16HKSCS, ZHT16MSWIN950, ZHT32EUC, ZHT32SOPS, ZHT32TRIS
    #
    # @return [String]
    attr_accessor :character_set

    # The character set for the Autonomous Database.  The default is AL32UTF8. Use [List Autonomous Database Character Sets](https://docs.cloud.oracle.com/autonomousDatabaseCharacterSets) to list the allowed values for an Autonomous Database on shared Exadata infrastructure.
    # For an Autonomous Database on dedicated Exadata infrastructure, the allowed values are:
    # AL16UTF16 or UTF8.
    #
    # @return [String]
    attr_accessor :ncharacter_set

    # The database name. The name must begin with an alphabetic character and can contain a maximum of 14 alphanumeric characters. Special characters are not permitted. The database name must be unique in the tenancy.
    # @return [String]
    attr_accessor :db_name

    # The number of OCPU cores to be made available to the database. For Autonomous Databases on dedicated Exadata infrastructure, the maximum number of cores is determined by the infrastructure shape. See [Characteristics of Infrastructure Shapes](https://www.oracle.com/pls/topic/lookup?ctx=en/cloud/paas/autonomous-database&id=ATPFG-GUID-B0F033C1-CC5A-42F0-B2E7-3CECFEDA1FD1) for shape details.
    #
    # **Note:** This parameter cannot be used with the `ocpuCount` parameter.
    #
    # @return [Integer]
    attr_accessor :cpu_core_count

    # The number of OCPU cores to be made available to the database.
    #
    # The following points apply:
    # - For Autonomous Databases on dedicated Exadata infrastructure, to provision less than 1 core, enter a fractional value in an increment of 0.1. For example, you can provision 0.3 or 0.4 cores, but not 0.35 cores. (Note that fractional OCPU values are not supported for Autonomous Databasese on shared Exadata infrastructure.)
    # - To provision 1 or more cores, you must enter an integer between 1 and the maximum number of cores available for the infrastructure shape. For example, you can provision 2 cores or 3 cores, but not 2.5 cores. This applies to Autonomous Databases on both shared and dedicated Exadata infrastructure.
    #
    # For Autonomous Databases on dedicated Exadata infrastructure, the maximum number of cores is determined by the infrastructure shape. See [Characteristics of Infrastructure Shapes](https://www.oracle.com/pls/topic/lookup?ctx=en/cloud/paas/autonomous-database&id=ATPFG-GUID-B0F033C1-CC5A-42F0-B2E7-3CECFEDA1FD1) for shape details.
    #
    # **Note:** This parameter cannot be used with the `cpuCoreCount` parameter.
    #
    # @return [Float]
    attr_accessor :ocpu_count

    # The Autonomous Database workload type. The following values are valid:
    #
    # - OLTP - indicates an Autonomous Transaction Processing database
    # - DW - indicates an Autonomous Data Warehouse database
    # - AJD - indicates an Autonomous JSON Database
    # - APEX - indicates an Autonomous Database with the Oracle APEX Application Development workload type.
    #
    # @return [String]
    attr_reader :db_workload

    # The size, in terabytes, of the data volume that will be created and attached to the database. This storage can later be scaled up if needed. For Autonomous Databases on dedicated Exadata infrastructure, the maximum storage value is determined by the infrastructure shape. See [Characteristics of Infrastructure Shapes](https://www.oracle.com/pls/topic/lookup?ctx=en/cloud/paas/autonomous-database&id=ATPFG-GUID-B0F033C1-CC5A-42F0-B2E7-3CECFEDA1FD1) for shape details.
    #
    # **Note:** This parameter cannot be used with the `dataStorageSizeInGBs` parameter.
    #
    # @return [Integer]
    attr_accessor :data_storage_size_in_tbs

    # The size, in gigabytes, of the data volume that will be created and attached to the database. This storage can later be scaled up if needed. The maximum storage value is determined by the infrastructure shape. See [Characteristics of Infrastructure Shapes](https://www.oracle.com/pls/topic/lookup?ctx=en/cloud/paas/autonomous-database&id=ATPFG-GUID-B0F033C1-CC5A-42F0-B2E7-3CECFEDA1FD1) for shape details.
    #
    # **Notes**
    # - This parameter is only supported for dedicated Exadata infrastructure.
    # - This parameter cannot be used with the `dataStorageSizeInTBs` parameter.
    #
    # @return [Integer]
    attr_accessor :data_storage_size_in_gbs

    # Indicates if this is an Always Free resource. The default value is false. Note that Always Free Autonomous Databases have 1 CPU and 20GB of memory. For Always Free databases, memory and CPU cannot be scaled.
    #
    # @return [BOOLEAN]
    attr_accessor :is_free_tier

    # The OCID of the key container that is used as the master encryption key in database transparent data encryption (TDE) operations.
    # @return [String]
    attr_accessor :kms_key_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Oracle Cloud Infrastructure [vault](https://docs.cloud.oracle.com/Content/KeyManagement/Concepts/keyoverview.htm#concepts).
    # @return [String]
    attr_accessor :vault_id

    # **Important** The `adminPassword` must be specified for all Autonomous Databases except for refreshable clones. The password must be between 12 and 30 characters long, and must contain at least 1 uppercase, 1 lowercase, and 1 numeric character. It cannot contain the double quote symbol (\") or the username \"admin\", regardless of casing.
    #
    # @return [String]
    attr_accessor :admin_password

    # The user-friendly name for the Autonomous Database. The name does not have to be unique.
    # @return [String]
    attr_accessor :display_name

    # The Oracle license model that applies to the Oracle Autonomous Database. Bring your own license (BYOL) allows you to apply your current on-premises Oracle software licenses to equivalent, highly automated Oracle PaaS and IaaS services in the cloud.
    # License Included allows you to subscribe to new Oracle Database software licenses and the Database service.
    # Note that when provisioning an Autonomous Database on [dedicated Exadata infrastructure](https://docs.oracle.com/en/cloud/paas/autonomous-database/index.html), this attribute must be null because the attribute is already set at the
    # Autonomous Exadata Infrastructure level. When using [shared Exadata infrastructure](https://docs.oracle.com/en/cloud/paas/autonomous-database/index.html), if a value is not specified, the system will supply the value of `BRING_YOUR_OWN_LICENSE`.
    #
    # @return [String]
    attr_reader :license_model

    # If set to `TRUE`, indicates that an Autonomous Database preview version is being provisioned, and that the preview version's terms of service have been accepted. Note that preview version software is only available for databases on [shared Exadata infrastructure](https://docs.oracle.com/en/cloud/paas/autonomous-database/index.html).
    #
    # @return [BOOLEAN]
    attr_accessor :is_preview_version_with_service_terms_accepted

    # Indicates if auto scaling is enabled for the Autonomous Database OCPU core count. The default value is `FALSE`.
    #
    # @return [BOOLEAN]
    attr_accessor :is_auto_scaling_enabled

    # True if the database is on [dedicated Exadata infrastructure](https://docs.oracle.com/en/cloud/paas/autonomous-database/index.html).
    #
    # @return [BOOLEAN]
    attr_accessor :is_dedicated

    # The Autonomous Container Database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @return [String]
    attr_accessor :autonomous_container_database_id

    # Indicates if the database-level access control is enabled.
    # If disabled, database access is defined by the network security rules.
    # If enabled, database access is restricted to the IP addresses defined by the rules specified with the `whitelistedIps` property. While specifying `whitelistedIps` rules is optional,
    #  if database-level access control is enabled and no rules are specified, the database will become inaccessible. The rules can be added later using the `UpdateAutonomousDatabase` API operation or edit option in console.
    # When creating a database clone, the desired access control setting should be specified. By default, database-level access control will be disabled for the clone.
    #
    # This property is applicable only to Autonomous Databases on the Exadata Cloud@Customer platform.
    #
    # @return [BOOLEAN]
    attr_accessor :is_access_control_enabled

    # The client IP access control list (ACL). This feature is available for autonomous databases on [shared Exadata infrastructure](https://docs.oracle.com/en/cloud/paas/autonomous-database/index.html) and on Exadata Cloud@Customer.
    # Only clients connecting from an IP address included in the ACL may access the Autonomous Database instance.
    #
    # For shared Exadata infrastructure, this is an array of CIDR (Classless Inter-Domain Routing) notations for a subnet or VCN OCID.
    # Use a semicolon (;) as a deliminator between the VCN-specific subnets or IPs.
    # Example: `[\"1.1.1.1\",\"1.1.1.0/24\",\"ocid1.vcn.oc1.sea.<unique_id>\",\"ocid1.vcn.oc1.sea.<unique_id1>;1.1.1.1\",\"ocid1.vcn.oc1.sea.<unique_id2>;1.1.0.0/16\"]`
    # For Exadata Cloud@Customer, this is an array of IP addresses or CIDR (Classless Inter-Domain Routing) notations.
    # Example: `[\"1.1.1.1\",\"1.1.1.0/24\",\"1.1.2.25\"]`
    #
    # For an update operation, if you want to delete all the IPs in the ACL, use an array with a single empty string entry.
    #
    # @return [Array<String>]
    attr_accessor :whitelisted_ips

    # This field will be null if the Autonomous Database is not Data Guard enabled or Access Control is disabled.
    # It's value would be `TRUE` if Autonomous Database is Data Guard enabled and Access Control is enabled and if the Autonomous Database uses primary IP access control list (ACL) for standby.
    # It's value would be `FALSE` if Autonomous Database is Data Guard enabled and Access Control is enabled and if the Autonomous Database uses different IP access control list (ACL) for standby compared to primary.
    #
    # @return [BOOLEAN]
    attr_accessor :are_primary_whitelisted_ips_used

    # The client IP access control list (ACL). This feature is available for autonomous databases on [shared Exadata infrastructure](https://docs.oracle.com/en/cloud/paas/autonomous-database/index.html) and on Exadata Cloud@Customer.
    # Only clients connecting from an IP address included in the ACL may access the Autonomous Database instance.
    #
    # For shared Exadata infrastructure, this is an array of CIDR (Classless Inter-Domain Routing) notations for a subnet or VCN OCID.
    # Use a semicolon (;) as a deliminator between the VCN-specific subnets or IPs.
    # Example: `[\"1.1.1.1\",\"1.1.1.0/24\",\"ocid1.vcn.oc1.sea.<unique_id>\",\"ocid1.vcn.oc1.sea.<unique_id1>;1.1.1.1\",\"ocid1.vcn.oc1.sea.<unique_id2>;1.1.0.0/16\"]`
    # For Exadata Cloud@Customer, this is an array of IP addresses or CIDR (Classless Inter-Domain Routing) notations.
    # Example: `[\"1.1.1.1\",\"1.1.1.0/24\",\"1.1.2.25\"]`
    #
    # For an update operation, if you want to delete all the IPs in the ACL, use an array with a single empty string entry.
    #
    # @return [Array<String>]
    attr_accessor :standby_whitelisted_ips

    # **Deprecated.** Indicates whether the Autonomous Database has local (in-region) Data Guard enabled. Not applicable to cross-region Autonomous Data Guard associations, or to Autonomous Databases using dedicated Exadata infrastructure or Exadata Cloud@Customer infrastructure.
    #
    # @return [BOOLEAN]
    attr_accessor :is_data_guard_enabled

    # Indicates whether the Autonomous Database has local (in-region) Data Guard enabled. Not applicable to cross-region Autonomous Data Guard associations, or to Autonomous Databases using dedicated Exadata infrastructure or Exadata Cloud@Customer infrastructure.
    # @return [BOOLEAN]
    attr_accessor :is_local_data_guard_enabled

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the subnet the resource is associated with.
    #
    # **Subnet Restrictions:**
    # - For bare metal DB systems and for single node virtual machine DB systems, do not use a subnet that overlaps with 192.168.16.16/28.
    # - For Exadata and virtual machine 2-node RAC systems, do not use a subnet that overlaps with 192.168.128.0/20.
    # - For Autonomous Database, setting this will disable public secure access to the database.
    #
    # These subnets are used by the Oracle Clusterware private interconnect on the database instance.
    # Specifying an overlapping subnet will cause the private interconnect to malfunction.
    # This restriction applies to both the client subnet and the backup subnet.
    #
    # @return [String]
    attr_accessor :subnet_id

    # The list of [OCIDs](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) for the network security groups (NSGs) to which this resource belongs. Setting this to an empty list removes all resources from all NSGs. For more information about NSGs, see [Security Rules](https://docs.cloud.oracle.com/Content/Network/Concepts/securityrules.htm).
    # **NsgIds restrictions:**
    # - A network security group (NSG) is optional for Autonomous Databases with private access. The nsgIds list can be empty.
    #
    # @return [Array<String>]
    attr_accessor :nsg_ids

    # The private endpoint label for the resource. Setting this to an empty string, after the private endpoint database gets created, will change the same private endpoint database to the public endpoint database.
    # @return [String]
    attr_accessor :private_endpoint_label

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

    # A valid Oracle Database version for Autonomous Database.
    # @return [String]
    attr_accessor :db_version

    # The source of the database: Use `NONE` for creating a new Autonomous Database. Use `DATABASE` for creating a new Autonomous Database by cloning an existing Autonomous Database. Use `CROSS_REGION_DATAGUARD` to create a standby Data Guard database in another region.
    #
    # For Autonomous Databases on [shared Exadata infrastructure](https://docs.oracle.com/en/cloud/paas/autonomous-database/index.html), the following cloning options are available: Use `BACKUP_FROM_ID` for creating a new Autonomous Database from a specified backup. Use `BACKUP_FROM_TIMESTAMP` for creating a point-in-time Autonomous Database clone using backups. For more information, see [Cloning and Moving an Autonomous Database](https://docs.oracle.com/en/cloud/paas/autonomous-database/adbsa/clone-autonomous-database.html#GUID-D771796F-5081-4CFB-A7FF-0F893EABD7BC).
    #
    # @return [String]
    attr_reader :source

    # Customer Contacts.
    # @return [Array<OCI::Database::Models::CustomerContact>]
    attr_accessor :customer_contacts

    # Indicates whether the Autonomous Database requires mTLS connections.
    # @return [BOOLEAN]
    attr_accessor :is_mtls_connection_required

    # The maintenance schedule type of the Autonomous Database on shared Exadata infrastructure. The EARLY maintenance schedule of this Autonomous Database
    # follows a schedule that applies patches prior to the REGULAR schedule.The REGULAR maintenance schedule of this Autonomous Database follows the normal cycle.
    #
    # @return [String]
    attr_reader :autonomous_maintenance_schedule_type

    # list of scheduled operations
    # @return [Array<OCI::Database::Models::ScheduledOperationDetails>]
    attr_accessor :scheduled_operations

    # Indicates if auto scaling is enabled for the Autonomous Database storage. The default value is `FALSE`.
    #
    # @return [BOOLEAN]
    attr_accessor :is_auto_scaling_for_storage_enabled

    # The number of Max OCPU cores to be made available to the autonomous database with auto scaling of cpu enabled.
    #
    # @return [Integer]
    attr_accessor :max_cpu_core_count

    # The Oracle Database Edition that applies to the Autonomous databases.
    #
    # @return [String]
    attr_accessor :database_edition

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'compartmentId',
        'character_set': :'characterSet',
        'ncharacter_set': :'ncharacterSet',
        'db_name': :'dbName',
        'cpu_core_count': :'cpuCoreCount',
        'ocpu_count': :'ocpuCount',
        'db_workload': :'dbWorkload',
        'data_storage_size_in_tbs': :'dataStorageSizeInTBs',
        'data_storage_size_in_gbs': :'dataStorageSizeInGBs',
        'is_free_tier': :'isFreeTier',
        'kms_key_id': :'kmsKeyId',
        'vault_id': :'vaultId',
        'admin_password': :'adminPassword',
        'display_name': :'displayName',
        'license_model': :'licenseModel',
        'is_preview_version_with_service_terms_accepted': :'isPreviewVersionWithServiceTermsAccepted',
        'is_auto_scaling_enabled': :'isAutoScalingEnabled',
        'is_dedicated': :'isDedicated',
        'autonomous_container_database_id': :'autonomousContainerDatabaseId',
        'is_access_control_enabled': :'isAccessControlEnabled',
        'whitelisted_ips': :'whitelistedIps',
        'are_primary_whitelisted_ips_used': :'arePrimaryWhitelistedIpsUsed',
        'standby_whitelisted_ips': :'standbyWhitelistedIps',
        'is_data_guard_enabled': :'isDataGuardEnabled',
        'is_local_data_guard_enabled': :'isLocalDataGuardEnabled',
        'subnet_id': :'subnetId',
        'nsg_ids': :'nsgIds',
        'private_endpoint_label': :'privateEndpointLabel',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'db_version': :'dbVersion',
        'source': :'source',
        'customer_contacts': :'customerContacts',
        'is_mtls_connection_required': :'isMtlsConnectionRequired',
        'autonomous_maintenance_schedule_type': :'autonomousMaintenanceScheduleType',
        'scheduled_operations': :'scheduledOperations',
        'is_auto_scaling_for_storage_enabled': :'isAutoScalingForStorageEnabled',
        'max_cpu_core_count': :'maxCpuCoreCount',
        'database_edition': :'databaseEdition'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'String',
        'character_set': :'String',
        'ncharacter_set': :'String',
        'db_name': :'String',
        'cpu_core_count': :'Integer',
        'ocpu_count': :'Float',
        'db_workload': :'String',
        'data_storage_size_in_tbs': :'Integer',
        'data_storage_size_in_gbs': :'Integer',
        'is_free_tier': :'BOOLEAN',
        'kms_key_id': :'String',
        'vault_id': :'String',
        'admin_password': :'String',
        'display_name': :'String',
        'license_model': :'String',
        'is_preview_version_with_service_terms_accepted': :'BOOLEAN',
        'is_auto_scaling_enabled': :'BOOLEAN',
        'is_dedicated': :'BOOLEAN',
        'autonomous_container_database_id': :'String',
        'is_access_control_enabled': :'BOOLEAN',
        'whitelisted_ips': :'Array<String>',
        'are_primary_whitelisted_ips_used': :'BOOLEAN',
        'standby_whitelisted_ips': :'Array<String>',
        'is_data_guard_enabled': :'BOOLEAN',
        'is_local_data_guard_enabled': :'BOOLEAN',
        'subnet_id': :'String',
        'nsg_ids': :'Array<String>',
        'private_endpoint_label': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'db_version': :'String',
        'source': :'String',
        'customer_contacts': :'Array<OCI::Database::Models::CustomerContact>',
        'is_mtls_connection_required': :'BOOLEAN',
        'autonomous_maintenance_schedule_type': :'String',
        'scheduled_operations': :'Array<OCI::Database::Models::ScheduledOperationDetails>',
        'is_auto_scaling_for_storage_enabled': :'BOOLEAN',
        'max_cpu_core_count': :'Integer',
        'database_edition': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'source'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::Database::Models::CreateAutonomousDatabaseCloneDetails' if type == 'DATABASE'
      return 'OCI::Database::Models::CreateRefreshableAutonomousDatabaseCloneDetails' if type == 'CLONE_TO_REFRESHABLE'
      return 'OCI::Database::Models::CreateAutonomousDatabaseFromBackupDetails' if type == 'BACKUP_FROM_ID'
      return 'OCI::Database::Models::CreateAutonomousDatabaseFromBackupTimestampDetails' if type == 'BACKUP_FROM_TIMESTAMP'
      return 'OCI::Database::Models::CreateCrossRegionAutonomousDatabaseDataGuardDetails' if type == 'CROSS_REGION_DATAGUARD'
      return 'OCI::Database::Models::CreateAutonomousDatabaseDetails' if type == 'NONE'

      # TODO: Log a warning when the subtype is not found.
      'OCI::Database::Models::CreateAutonomousDatabaseBase'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :character_set The value to assign to the {#character_set} property
    # @option attributes [String] :ncharacter_set The value to assign to the {#ncharacter_set} property
    # @option attributes [String] :db_name The value to assign to the {#db_name} property
    # @option attributes [Integer] :cpu_core_count The value to assign to the {#cpu_core_count} property
    # @option attributes [Float] :ocpu_count The value to assign to the {#ocpu_count} property
    # @option attributes [String] :db_workload The value to assign to the {#db_workload} property
    # @option attributes [Integer] :data_storage_size_in_tbs The value to assign to the {#data_storage_size_in_tbs} property
    # @option attributes [Integer] :data_storage_size_in_gbs The value to assign to the {#data_storage_size_in_gbs} property
    # @option attributes [BOOLEAN] :is_free_tier The value to assign to the {#is_free_tier} property
    # @option attributes [String] :kms_key_id The value to assign to the {#kms_key_id} property
    # @option attributes [String] :vault_id The value to assign to the {#vault_id} property
    # @option attributes [String] :admin_password The value to assign to the {#admin_password} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :license_model The value to assign to the {#license_model} property
    # @option attributes [BOOLEAN] :is_preview_version_with_service_terms_accepted The value to assign to the {#is_preview_version_with_service_terms_accepted} property
    # @option attributes [BOOLEAN] :is_auto_scaling_enabled The value to assign to the {#is_auto_scaling_enabled} property
    # @option attributes [BOOLEAN] :is_dedicated The value to assign to the {#is_dedicated} property
    # @option attributes [String] :autonomous_container_database_id The value to assign to the {#autonomous_container_database_id} property
    # @option attributes [BOOLEAN] :is_access_control_enabled The value to assign to the {#is_access_control_enabled} property
    # @option attributes [Array<String>] :whitelisted_ips The value to assign to the {#whitelisted_ips} property
    # @option attributes [BOOLEAN] :are_primary_whitelisted_ips_used The value to assign to the {#are_primary_whitelisted_ips_used} property
    # @option attributes [Array<String>] :standby_whitelisted_ips The value to assign to the {#standby_whitelisted_ips} property
    # @option attributes [BOOLEAN] :is_data_guard_enabled The value to assign to the {#is_data_guard_enabled} property
    # @option attributes [BOOLEAN] :is_local_data_guard_enabled The value to assign to the {#is_local_data_guard_enabled} property
    # @option attributes [String] :subnet_id The value to assign to the {#subnet_id} property
    # @option attributes [Array<String>] :nsg_ids The value to assign to the {#nsg_ids} property
    # @option attributes [String] :private_endpoint_label The value to assign to the {#private_endpoint_label} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :db_version The value to assign to the {#db_version} property
    # @option attributes [String] :source The value to assign to the {#source} property
    # @option attributes [Array<OCI::Database::Models::CustomerContact>] :customer_contacts The value to assign to the {#customer_contacts} property
    # @option attributes [BOOLEAN] :is_mtls_connection_required The value to assign to the {#is_mtls_connection_required} property
    # @option attributes [String] :autonomous_maintenance_schedule_type The value to assign to the {#autonomous_maintenance_schedule_type} property
    # @option attributes [Array<OCI::Database::Models::ScheduledOperationDetails>] :scheduled_operations The value to assign to the {#scheduled_operations} property
    # @option attributes [BOOLEAN] :is_auto_scaling_for_storage_enabled The value to assign to the {#is_auto_scaling_for_storage_enabled} property
    # @option attributes [Integer] :max_cpu_core_count The value to assign to the {#max_cpu_core_count} property
    # @option attributes [String] :database_edition The value to assign to the {#database_edition} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.character_set = attributes[:'characterSet'] if attributes[:'characterSet']

      raise 'You cannot provide both :characterSet and :character_set' if attributes.key?(:'characterSet') && attributes.key?(:'character_set')

      self.character_set = attributes[:'character_set'] if attributes[:'character_set']

      self.ncharacter_set = attributes[:'ncharacterSet'] if attributes[:'ncharacterSet']

      raise 'You cannot provide both :ncharacterSet and :ncharacter_set' if attributes.key?(:'ncharacterSet') && attributes.key?(:'ncharacter_set')

      self.ncharacter_set = attributes[:'ncharacter_set'] if attributes[:'ncharacter_set']

      self.db_name = attributes[:'dbName'] if attributes[:'dbName']

      raise 'You cannot provide both :dbName and :db_name' if attributes.key?(:'dbName') && attributes.key?(:'db_name')

      self.db_name = attributes[:'db_name'] if attributes[:'db_name']

      self.cpu_core_count = attributes[:'cpuCoreCount'] if attributes[:'cpuCoreCount']

      raise 'You cannot provide both :cpuCoreCount and :cpu_core_count' if attributes.key?(:'cpuCoreCount') && attributes.key?(:'cpu_core_count')

      self.cpu_core_count = attributes[:'cpu_core_count'] if attributes[:'cpu_core_count']

      self.ocpu_count = attributes[:'ocpuCount'] if attributes[:'ocpuCount']

      raise 'You cannot provide both :ocpuCount and :ocpu_count' if attributes.key?(:'ocpuCount') && attributes.key?(:'ocpu_count')

      self.ocpu_count = attributes[:'ocpu_count'] if attributes[:'ocpu_count']

      self.db_workload = attributes[:'dbWorkload'] if attributes[:'dbWorkload']

      raise 'You cannot provide both :dbWorkload and :db_workload' if attributes.key?(:'dbWorkload') && attributes.key?(:'db_workload')

      self.db_workload = attributes[:'db_workload'] if attributes[:'db_workload']

      self.data_storage_size_in_tbs = attributes[:'dataStorageSizeInTBs'] if attributes[:'dataStorageSizeInTBs']

      raise 'You cannot provide both :dataStorageSizeInTBs and :data_storage_size_in_tbs' if attributes.key?(:'dataStorageSizeInTBs') && attributes.key?(:'data_storage_size_in_tbs')

      self.data_storage_size_in_tbs = attributes[:'data_storage_size_in_tbs'] if attributes[:'data_storage_size_in_tbs']

      self.data_storage_size_in_gbs = attributes[:'dataStorageSizeInGBs'] if attributes[:'dataStorageSizeInGBs']

      raise 'You cannot provide both :dataStorageSizeInGBs and :data_storage_size_in_gbs' if attributes.key?(:'dataStorageSizeInGBs') && attributes.key?(:'data_storage_size_in_gbs')

      self.data_storage_size_in_gbs = attributes[:'data_storage_size_in_gbs'] if attributes[:'data_storage_size_in_gbs']

      self.is_free_tier = attributes[:'isFreeTier'] unless attributes[:'isFreeTier'].nil?
      self.is_free_tier = false if is_free_tier.nil? && !attributes.key?(:'isFreeTier') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isFreeTier and :is_free_tier' if attributes.key?(:'isFreeTier') && attributes.key?(:'is_free_tier')

      self.is_free_tier = attributes[:'is_free_tier'] unless attributes[:'is_free_tier'].nil?
      self.is_free_tier = false if is_free_tier.nil? && !attributes.key?(:'isFreeTier') && !attributes.key?(:'is_free_tier') # rubocop:disable Style/StringLiterals

      self.kms_key_id = attributes[:'kmsKeyId'] if attributes[:'kmsKeyId']

      raise 'You cannot provide both :kmsKeyId and :kms_key_id' if attributes.key?(:'kmsKeyId') && attributes.key?(:'kms_key_id')

      self.kms_key_id = attributes[:'kms_key_id'] if attributes[:'kms_key_id']

      self.vault_id = attributes[:'vaultId'] if attributes[:'vaultId']

      raise 'You cannot provide both :vaultId and :vault_id' if attributes.key?(:'vaultId') && attributes.key?(:'vault_id')

      self.vault_id = attributes[:'vault_id'] if attributes[:'vault_id']

      self.admin_password = attributes[:'adminPassword'] if attributes[:'adminPassword']

      raise 'You cannot provide both :adminPassword and :admin_password' if attributes.key?(:'adminPassword') && attributes.key?(:'admin_password')

      self.admin_password = attributes[:'admin_password'] if attributes[:'admin_password']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.license_model = attributes[:'licenseModel'] if attributes[:'licenseModel']

      raise 'You cannot provide both :licenseModel and :license_model' if attributes.key?(:'licenseModel') && attributes.key?(:'license_model')

      self.license_model = attributes[:'license_model'] if attributes[:'license_model']

      self.is_preview_version_with_service_terms_accepted = attributes[:'isPreviewVersionWithServiceTermsAccepted'] unless attributes[:'isPreviewVersionWithServiceTermsAccepted'].nil?
      self.is_preview_version_with_service_terms_accepted = false if is_preview_version_with_service_terms_accepted.nil? && !attributes.key?(:'isPreviewVersionWithServiceTermsAccepted') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isPreviewVersionWithServiceTermsAccepted and :is_preview_version_with_service_terms_accepted' if attributes.key?(:'isPreviewVersionWithServiceTermsAccepted') && attributes.key?(:'is_preview_version_with_service_terms_accepted')

      self.is_preview_version_with_service_terms_accepted = attributes[:'is_preview_version_with_service_terms_accepted'] unless attributes[:'is_preview_version_with_service_terms_accepted'].nil?
      self.is_preview_version_with_service_terms_accepted = false if is_preview_version_with_service_terms_accepted.nil? && !attributes.key?(:'isPreviewVersionWithServiceTermsAccepted') && !attributes.key?(:'is_preview_version_with_service_terms_accepted') # rubocop:disable Style/StringLiterals

      self.is_auto_scaling_enabled = attributes[:'isAutoScalingEnabled'] unless attributes[:'isAutoScalingEnabled'].nil?
      self.is_auto_scaling_enabled = false if is_auto_scaling_enabled.nil? && !attributes.key?(:'isAutoScalingEnabled') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isAutoScalingEnabled and :is_auto_scaling_enabled' if attributes.key?(:'isAutoScalingEnabled') && attributes.key?(:'is_auto_scaling_enabled')

      self.is_auto_scaling_enabled = attributes[:'is_auto_scaling_enabled'] unless attributes[:'is_auto_scaling_enabled'].nil?
      self.is_auto_scaling_enabled = false if is_auto_scaling_enabled.nil? && !attributes.key?(:'isAutoScalingEnabled') && !attributes.key?(:'is_auto_scaling_enabled') # rubocop:disable Style/StringLiterals

      self.is_dedicated = attributes[:'isDedicated'] unless attributes[:'isDedicated'].nil?

      raise 'You cannot provide both :isDedicated and :is_dedicated' if attributes.key?(:'isDedicated') && attributes.key?(:'is_dedicated')

      self.is_dedicated = attributes[:'is_dedicated'] unless attributes[:'is_dedicated'].nil?

      self.autonomous_container_database_id = attributes[:'autonomousContainerDatabaseId'] if attributes[:'autonomousContainerDatabaseId']

      raise 'You cannot provide both :autonomousContainerDatabaseId and :autonomous_container_database_id' if attributes.key?(:'autonomousContainerDatabaseId') && attributes.key?(:'autonomous_container_database_id')

      self.autonomous_container_database_id = attributes[:'autonomous_container_database_id'] if attributes[:'autonomous_container_database_id']

      self.is_access_control_enabled = attributes[:'isAccessControlEnabled'] unless attributes[:'isAccessControlEnabled'].nil?

      raise 'You cannot provide both :isAccessControlEnabled and :is_access_control_enabled' if attributes.key?(:'isAccessControlEnabled') && attributes.key?(:'is_access_control_enabled')

      self.is_access_control_enabled = attributes[:'is_access_control_enabled'] unless attributes[:'is_access_control_enabled'].nil?

      self.whitelisted_ips = attributes[:'whitelistedIps'] if attributes[:'whitelistedIps']

      raise 'You cannot provide both :whitelistedIps and :whitelisted_ips' if attributes.key?(:'whitelistedIps') && attributes.key?(:'whitelisted_ips')

      self.whitelisted_ips = attributes[:'whitelisted_ips'] if attributes[:'whitelisted_ips']

      self.are_primary_whitelisted_ips_used = attributes[:'arePrimaryWhitelistedIpsUsed'] unless attributes[:'arePrimaryWhitelistedIpsUsed'].nil?

      raise 'You cannot provide both :arePrimaryWhitelistedIpsUsed and :are_primary_whitelisted_ips_used' if attributes.key?(:'arePrimaryWhitelistedIpsUsed') && attributes.key?(:'are_primary_whitelisted_ips_used')

      self.are_primary_whitelisted_ips_used = attributes[:'are_primary_whitelisted_ips_used'] unless attributes[:'are_primary_whitelisted_ips_used'].nil?

      self.standby_whitelisted_ips = attributes[:'standbyWhitelistedIps'] if attributes[:'standbyWhitelistedIps']

      raise 'You cannot provide both :standbyWhitelistedIps and :standby_whitelisted_ips' if attributes.key?(:'standbyWhitelistedIps') && attributes.key?(:'standby_whitelisted_ips')

      self.standby_whitelisted_ips = attributes[:'standby_whitelisted_ips'] if attributes[:'standby_whitelisted_ips']

      self.is_data_guard_enabled = attributes[:'isDataGuardEnabled'] unless attributes[:'isDataGuardEnabled'].nil?

      raise 'You cannot provide both :isDataGuardEnabled and :is_data_guard_enabled' if attributes.key?(:'isDataGuardEnabled') && attributes.key?(:'is_data_guard_enabled')

      self.is_data_guard_enabled = attributes[:'is_data_guard_enabled'] unless attributes[:'is_data_guard_enabled'].nil?

      self.is_local_data_guard_enabled = attributes[:'isLocalDataGuardEnabled'] unless attributes[:'isLocalDataGuardEnabled'].nil?

      raise 'You cannot provide both :isLocalDataGuardEnabled and :is_local_data_guard_enabled' if attributes.key?(:'isLocalDataGuardEnabled') && attributes.key?(:'is_local_data_guard_enabled')

      self.is_local_data_guard_enabled = attributes[:'is_local_data_guard_enabled'] unless attributes[:'is_local_data_guard_enabled'].nil?

      self.subnet_id = attributes[:'subnetId'] if attributes[:'subnetId']

      raise 'You cannot provide both :subnetId and :subnet_id' if attributes.key?(:'subnetId') && attributes.key?(:'subnet_id')

      self.subnet_id = attributes[:'subnet_id'] if attributes[:'subnet_id']

      self.nsg_ids = attributes[:'nsgIds'] if attributes[:'nsgIds']

      raise 'You cannot provide both :nsgIds and :nsg_ids' if attributes.key?(:'nsgIds') && attributes.key?(:'nsg_ids')

      self.nsg_ids = attributes[:'nsg_ids'] if attributes[:'nsg_ids']

      self.private_endpoint_label = attributes[:'privateEndpointLabel'] if attributes[:'privateEndpointLabel']

      raise 'You cannot provide both :privateEndpointLabel and :private_endpoint_label' if attributes.key?(:'privateEndpointLabel') && attributes.key?(:'private_endpoint_label')

      self.private_endpoint_label = attributes[:'private_endpoint_label'] if attributes[:'private_endpoint_label']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.db_version = attributes[:'dbVersion'] if attributes[:'dbVersion']

      raise 'You cannot provide both :dbVersion and :db_version' if attributes.key?(:'dbVersion') && attributes.key?(:'db_version')

      self.db_version = attributes[:'db_version'] if attributes[:'db_version']

      self.source = attributes[:'source'] if attributes[:'source']
      self.source = "NONE" if source.nil? && !attributes.key?(:'source') # rubocop:disable Style/StringLiterals

      self.customer_contacts = attributes[:'customerContacts'] if attributes[:'customerContacts']

      raise 'You cannot provide both :customerContacts and :customer_contacts' if attributes.key?(:'customerContacts') && attributes.key?(:'customer_contacts')

      self.customer_contacts = attributes[:'customer_contacts'] if attributes[:'customer_contacts']

      self.is_mtls_connection_required = attributes[:'isMtlsConnectionRequired'] unless attributes[:'isMtlsConnectionRequired'].nil?
      self.is_mtls_connection_required = true if is_mtls_connection_required.nil? && !attributes.key?(:'isMtlsConnectionRequired') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isMtlsConnectionRequired and :is_mtls_connection_required' if attributes.key?(:'isMtlsConnectionRequired') && attributes.key?(:'is_mtls_connection_required')

      self.is_mtls_connection_required = attributes[:'is_mtls_connection_required'] unless attributes[:'is_mtls_connection_required'].nil?
      self.is_mtls_connection_required = true if is_mtls_connection_required.nil? && !attributes.key?(:'isMtlsConnectionRequired') && !attributes.key?(:'is_mtls_connection_required') # rubocop:disable Style/StringLiterals

      self.autonomous_maintenance_schedule_type = attributes[:'autonomousMaintenanceScheduleType'] if attributes[:'autonomousMaintenanceScheduleType']

      raise 'You cannot provide both :autonomousMaintenanceScheduleType and :autonomous_maintenance_schedule_type' if attributes.key?(:'autonomousMaintenanceScheduleType') && attributes.key?(:'autonomous_maintenance_schedule_type')

      self.autonomous_maintenance_schedule_type = attributes[:'autonomous_maintenance_schedule_type'] if attributes[:'autonomous_maintenance_schedule_type']

      self.scheduled_operations = attributes[:'scheduledOperations'] if attributes[:'scheduledOperations']

      raise 'You cannot provide both :scheduledOperations and :scheduled_operations' if attributes.key?(:'scheduledOperations') && attributes.key?(:'scheduled_operations')

      self.scheduled_operations = attributes[:'scheduled_operations'] if attributes[:'scheduled_operations']

      self.is_auto_scaling_for_storage_enabled = attributes[:'isAutoScalingForStorageEnabled'] unless attributes[:'isAutoScalingForStorageEnabled'].nil?

      raise 'You cannot provide both :isAutoScalingForStorageEnabled and :is_auto_scaling_for_storage_enabled' if attributes.key?(:'isAutoScalingForStorageEnabled') && attributes.key?(:'is_auto_scaling_for_storage_enabled')

      self.is_auto_scaling_for_storage_enabled = attributes[:'is_auto_scaling_for_storage_enabled'] unless attributes[:'is_auto_scaling_for_storage_enabled'].nil?

      self.max_cpu_core_count = attributes[:'maxCpuCoreCount'] if attributes[:'maxCpuCoreCount']

      raise 'You cannot provide both :maxCpuCoreCount and :max_cpu_core_count' if attributes.key?(:'maxCpuCoreCount') && attributes.key?(:'max_cpu_core_count')

      self.max_cpu_core_count = attributes[:'max_cpu_core_count'] if attributes[:'max_cpu_core_count']

      self.database_edition = attributes[:'databaseEdition'] if attributes[:'databaseEdition']

      raise 'You cannot provide both :databaseEdition and :database_edition' if attributes.key?(:'databaseEdition') && attributes.key?(:'database_edition')

      self.database_edition = attributes[:'database_edition'] if attributes[:'database_edition']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] db_workload Object to be assigned
    def db_workload=(db_workload)
      raise "Invalid value for 'db_workload': this must be one of the values in DB_WORKLOAD_ENUM." if db_workload && !DB_WORKLOAD_ENUM.include?(db_workload)

      @db_workload = db_workload
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] license_model Object to be assigned
    def license_model=(license_model)
      raise "Invalid value for 'license_model': this must be one of the values in LICENSE_MODEL_ENUM." if license_model && !LICENSE_MODEL_ENUM.include?(license_model)

      @license_model = license_model
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] source Object to be assigned
    def source=(source)
      raise "Invalid value for 'source': this must be one of the values in SOURCE_ENUM." if source && !SOURCE_ENUM.include?(source)

      @source = source
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] autonomous_maintenance_schedule_type Object to be assigned
    def autonomous_maintenance_schedule_type=(autonomous_maintenance_schedule_type)
      raise "Invalid value for 'autonomous_maintenance_schedule_type': this must be one of the values in AUTONOMOUS_MAINTENANCE_SCHEDULE_TYPE_ENUM." if autonomous_maintenance_schedule_type && !AUTONOMOUS_MAINTENANCE_SCHEDULE_TYPE_ENUM.include?(autonomous_maintenance_schedule_type)

      @autonomous_maintenance_schedule_type = autonomous_maintenance_schedule_type
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        compartment_id == other.compartment_id &&
        character_set == other.character_set &&
        ncharacter_set == other.ncharacter_set &&
        db_name == other.db_name &&
        cpu_core_count == other.cpu_core_count &&
        ocpu_count == other.ocpu_count &&
        db_workload == other.db_workload &&
        data_storage_size_in_tbs == other.data_storage_size_in_tbs &&
        data_storage_size_in_gbs == other.data_storage_size_in_gbs &&
        is_free_tier == other.is_free_tier &&
        kms_key_id == other.kms_key_id &&
        vault_id == other.vault_id &&
        admin_password == other.admin_password &&
        display_name == other.display_name &&
        license_model == other.license_model &&
        is_preview_version_with_service_terms_accepted == other.is_preview_version_with_service_terms_accepted &&
        is_auto_scaling_enabled == other.is_auto_scaling_enabled &&
        is_dedicated == other.is_dedicated &&
        autonomous_container_database_id == other.autonomous_container_database_id &&
        is_access_control_enabled == other.is_access_control_enabled &&
        whitelisted_ips == other.whitelisted_ips &&
        are_primary_whitelisted_ips_used == other.are_primary_whitelisted_ips_used &&
        standby_whitelisted_ips == other.standby_whitelisted_ips &&
        is_data_guard_enabled == other.is_data_guard_enabled &&
        is_local_data_guard_enabled == other.is_local_data_guard_enabled &&
        subnet_id == other.subnet_id &&
        nsg_ids == other.nsg_ids &&
        private_endpoint_label == other.private_endpoint_label &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        db_version == other.db_version &&
        source == other.source &&
        customer_contacts == other.customer_contacts &&
        is_mtls_connection_required == other.is_mtls_connection_required &&
        autonomous_maintenance_schedule_type == other.autonomous_maintenance_schedule_type &&
        scheduled_operations == other.scheduled_operations &&
        is_auto_scaling_for_storage_enabled == other.is_auto_scaling_for_storage_enabled &&
        max_cpu_core_count == other.max_cpu_core_count &&
        database_edition == other.database_edition
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
      [compartment_id, character_set, ncharacter_set, db_name, cpu_core_count, ocpu_count, db_workload, data_storage_size_in_tbs, data_storage_size_in_gbs, is_free_tier, kms_key_id, vault_id, admin_password, display_name, license_model, is_preview_version_with_service_terms_accepted, is_auto_scaling_enabled, is_dedicated, autonomous_container_database_id, is_access_control_enabled, whitelisted_ips, are_primary_whitelisted_ips_used, standby_whitelisted_ips, is_data_guard_enabled, is_local_data_guard_enabled, subnet_id, nsg_ids, private_endpoint_label, freeform_tags, defined_tags, db_version, source, customer_contacts, is_mtls_connection_required, autonomous_maintenance_schedule_type, scheduled_operations, is_auto_scaling_for_storage_enabled, max_cpu_core_count, database_edition].hash
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
