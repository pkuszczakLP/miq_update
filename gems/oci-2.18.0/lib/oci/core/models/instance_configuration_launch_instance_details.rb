# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Instance launch details for creating an instance from an instance configuration. Use the `sourceDetails`
  # parameter to specify whether a boot volume or an image should be used to launch a new instance.
  #
  # See {LaunchInstanceDetails} for more information.
  #
  class Core::Models::InstanceConfigurationLaunchInstanceDetails
    LAUNCH_MODE_ENUM = [
      LAUNCH_MODE_NATIVE = 'NATIVE'.freeze,
      LAUNCH_MODE_EMULATED = 'EMULATED'.freeze,
      LAUNCH_MODE_PARAVIRTUALIZED = 'PARAVIRTUALIZED'.freeze,
      LAUNCH_MODE_CUSTOM = 'CUSTOM'.freeze,
      LAUNCH_MODE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    PREFERRED_MAINTENANCE_ACTION_ENUM = [
      PREFERRED_MAINTENANCE_ACTION_LIVE_MIGRATE = 'LIVE_MIGRATE'.freeze,
      PREFERRED_MAINTENANCE_ACTION_REBOOT = 'REBOOT'.freeze,
      PREFERRED_MAINTENANCE_ACTION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The availability domain of the instance.
    #
    # Example: `Uocm:PHX-AD-1`
    #
    # @return [String]
    attr_accessor :availability_domain

    # The OCID of the compute capacity reservation this instance is launched under.
    # @return [String]
    attr_accessor :capacity_reservation_id

    # The OCID of the compartment containing the instance.
    # Instances created from instance configurations are placed in the same compartment
    # as the instance that was used to create the instance configuration.
    #
    # @return [String]
    attr_accessor :compartment_id

    # @return [OCI::Core::Models::InstanceConfigurationCreateVnicDetails]
    attr_accessor :create_vnic_details

    # Defined tags for this resource. Each key is predefined and scoped to a
    # namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # A user-friendly name. Does not have to be unique, and it's changeable.
    # Avoid entering confidential information.
    #
    # @return [String]
    attr_accessor :display_name

    # Additional metadata key/value pairs that you provide. They serve the same purpose and
    # functionality as fields in the `metadata` object.
    #
    # They are distinguished from `metadata` fields in that these can be nested JSON objects
    # (whereas `metadata` fields are string/string maps only).
    #
    # The combined size of the `metadata` and `extendedMetadata` objects can be a maximum of
    # 32,000 bytes.
    #
    # @return [Hash<String, Object>]
    attr_accessor :extended_metadata

    # Free-form tags for this resource. Each tag is a simple key-value pair with no
    # predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # This is an advanced option.
    #
    # When a bare metal or virtual machine
    # instance boots, the iPXE firmware that runs on the instance is
    # configured to run an iPXE script to continue the boot process.
    #
    # If you want more control over the boot process, you can provide
    # your own custom iPXE script that will run when the instance boots;
    # however, you should be aware that the same iPXE script will run
    # every time an instance boots; not only after the initial
    # LaunchInstance call.
    #
    # The default iPXE script connects to the instance's local boot
    # volume over iSCSI and performs a network boot. If you use a custom iPXE
    # script and want to network-boot from the instance's local boot volume
    # over iSCSI the same way as the default iPXE script, you should use the
    # following iSCSI IP address: 169.254.0.2, and boot volume IQN:
    # iqn.2015-02.oracle.boot.
    #
    # For more information about the Bring Your Own Image feature of
    # Oracle Cloud Infrastructure, see
    # [Bring Your Own Image](https://docs.cloud.oracle.com/iaas/Content/Compute/References/bringyourownimage.htm).
    #
    # For more information about iPXE, see http://ipxe.org.
    #
    # @return [String]
    attr_accessor :ipxe_script

    # Custom metadata key/value pairs that you provide, such as the SSH public key
    # required to connect to the instance.
    #
    # A metadata service runs on every launched instance. The service is an HTTP
    # endpoint listening on 169.254.169.254. You can use the service to:
    #
    # * Provide information to [Cloud-Init](https://cloudinit.readthedocs.org/en/latest/)
    #   to be used for various system initialization tasks.
    #
    # * Get information about the instance, including the custom metadata that you
    #   provide when you launch the instance.
    #
    #  **Providing Cloud-Init Metadata**
    #
    #  You can use the following metadata key names to provide information to
    #  Cloud-Init:
    #
    #  **\"ssh_authorized_keys\"** - Provide one or more public SSH keys to be
    #  included in the `~/.ssh/authorized_keys` file for the default user on the
    #  instance. Use a newline character to separate multiple keys. The SSH
    #  keys must be in the format necessary for the `authorized_keys` file, as shown
    #  in the example below.
    #
    #  **\"user_data\"** - Provide your own base64-encoded data to be used by
    #  Cloud-Init to run custom scripts or provide custom Cloud-Init configuration. For
    #  information about how to take advantage of user data, see the
    #  [Cloud-Init Documentation](http://cloudinit.readthedocs.org/en/latest/topics/format.html).
    #
    #  **Metadata Example**
    #
    #       \"metadata\" : {
    #          \"quake_bot_level\" : \"Severe\",
    #          \"ssh_authorized_keys\" : \"ssh-rsa <your_public_SSH_key>== rsa-key-20160227\",
    #          \"user_data\" : \"<your_public_SSH_key>==\"
    #       }
    #  **Getting Metadata on the Instance**
    #
    #  To get information about your instance, connect to the instance using SSH and issue any of the
    #  following GET requests:
    #
    #      curl -H \"Authorization: Bearer Oracle\" http://169.254.169.254/opc/v2/instance/
    #      curl -H \"Authorization: Bearer Oracle\" http://169.254.169.254/opc/v2/instance/metadata/
    #      curl -H \"Authorization: Bearer Oracle\" http://169.254.169.254/opc/v2/instance/metadata/<any-key-name>
    #
    #  You'll get back a response that includes all the instance information; only the metadata information; or
    #  the metadata information for the specified key name, respectively.
    #
    #  The combined size of the `metadata` and `extendedMetadata` objects can be a maximum of 32,000 bytes.
    #
    # @return [Hash<String, String>]
    attr_accessor :metadata

    # The shape of an instance. The shape determines the number of CPUs, amount of memory,
    # and other resources allocated to the instance.
    #
    # You can enumerate all available shapes by calling {#list_shapes list_shapes}.
    #
    # @return [String]
    attr_accessor :shape

    # @return [OCI::Core::Models::InstanceConfigurationLaunchInstanceShapeConfigDetails]
    attr_accessor :shape_config

    # @return [OCI::Core::Models::InstanceConfigurationLaunchInstancePlatformConfig]
    attr_accessor :platform_config

    # @return [OCI::Core::Models::InstanceConfigurationInstanceSourceDetails]
    attr_accessor :source_details

    # A fault domain is a grouping of hardware and infrastructure within an availability domain.
    # Each availability domain contains three fault domains. Fault domains let you distribute your
    # instances so that they are not on the same physical hardware within a single availability domain.
    # A hardware failure or Compute hardware maintenance that affects one fault domain does not affect
    # instances in other fault domains.
    #
    # If you do not specify the fault domain, the system selects one for you.
    #
    #
    # To get a list of fault domains, use the
    # {#list_fault_domains list_fault_domains} operation in the
    # Identity and Access Management Service API.
    #
    # Example: `FAULT-DOMAIN-1`
    #
    # @return [String]
    attr_accessor :fault_domain

    # The OCID of dedicated VM host.
    #
    # Dedicated VM hosts can be used when launching individual instances from an instance configuration. They
    # cannot be used to launch instance pools.
    #
    # @return [String]
    attr_accessor :dedicated_vm_host_id

    # Specifies the configuration mode for launching virtual machine (VM) instances. The configuration modes are:
    # * `NATIVE` - VM instances launch with iSCSI boot and VFIO devices. The default value for platform images.
    # * `EMULATED` - VM instances launch with emulated devices, such as the E1000 network driver and emulated SCSI disk controller.
    # * `PARAVIRTUALIZED` - VM instances launch with paravirtualized devices using VirtIO drivers.
    # * `CUSTOM` - VM instances launch with custom configuration settings specified in the `LaunchOptions` parameter.
    #
    # @return [String]
    attr_reader :launch_mode

    # @return [OCI::Core::Models::InstanceConfigurationLaunchOptions]
    attr_accessor :launch_options

    # @return [OCI::Core::Models::InstanceConfigurationLaunchInstanceAgentConfigDetails]
    attr_accessor :agent_config

    # Whether to enable in-transit encryption for the data volume's paravirtualized attachment. The default value is false.
    # @return [BOOLEAN]
    attr_accessor :is_pv_encryption_in_transit_enabled

    # The preferred maintenance action for an instance. The default is LIVE_MIGRATE, if live migration is supported.
    # * `LIVE_MIGRATE` - Run maintenance using a live migration.
    # * `REBOOT` - Run maintenance using a reboot.
    #
    # @return [String]
    attr_reader :preferred_maintenance_action

    # @return [OCI::Core::Models::InstanceConfigurationInstanceOptions]
    attr_accessor :instance_options

    # @return [OCI::Core::Models::InstanceConfigurationAvailabilityConfig]
    attr_accessor :availability_config

    # @return [OCI::Core::Models::PreemptibleInstanceConfigDetails]
    attr_accessor :preemptible_instance_config

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'availability_domain': :'availabilityDomain',
        'capacity_reservation_id': :'capacityReservationId',
        'compartment_id': :'compartmentId',
        'create_vnic_details': :'createVnicDetails',
        'defined_tags': :'definedTags',
        'display_name': :'displayName',
        'extended_metadata': :'extendedMetadata',
        'freeform_tags': :'freeformTags',
        'ipxe_script': :'ipxeScript',
        'metadata': :'metadata',
        'shape': :'shape',
        'shape_config': :'shapeConfig',
        'platform_config': :'platformConfig',
        'source_details': :'sourceDetails',
        'fault_domain': :'faultDomain',
        'dedicated_vm_host_id': :'dedicatedVmHostId',
        'launch_mode': :'launchMode',
        'launch_options': :'launchOptions',
        'agent_config': :'agentConfig',
        'is_pv_encryption_in_transit_enabled': :'isPvEncryptionInTransitEnabled',
        'preferred_maintenance_action': :'preferredMaintenanceAction',
        'instance_options': :'instanceOptions',
        'availability_config': :'availabilityConfig',
        'preemptible_instance_config': :'preemptibleInstanceConfig'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'availability_domain': :'String',
        'capacity_reservation_id': :'String',
        'compartment_id': :'String',
        'create_vnic_details': :'OCI::Core::Models::InstanceConfigurationCreateVnicDetails',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'display_name': :'String',
        'extended_metadata': :'Hash<String, Object>',
        'freeform_tags': :'Hash<String, String>',
        'ipxe_script': :'String',
        'metadata': :'Hash<String, String>',
        'shape': :'String',
        'shape_config': :'OCI::Core::Models::InstanceConfigurationLaunchInstanceShapeConfigDetails',
        'platform_config': :'OCI::Core::Models::InstanceConfigurationLaunchInstancePlatformConfig',
        'source_details': :'OCI::Core::Models::InstanceConfigurationInstanceSourceDetails',
        'fault_domain': :'String',
        'dedicated_vm_host_id': :'String',
        'launch_mode': :'String',
        'launch_options': :'OCI::Core::Models::InstanceConfigurationLaunchOptions',
        'agent_config': :'OCI::Core::Models::InstanceConfigurationLaunchInstanceAgentConfigDetails',
        'is_pv_encryption_in_transit_enabled': :'BOOLEAN',
        'preferred_maintenance_action': :'String',
        'instance_options': :'OCI::Core::Models::InstanceConfigurationInstanceOptions',
        'availability_config': :'OCI::Core::Models::InstanceConfigurationAvailabilityConfig',
        'preemptible_instance_config': :'OCI::Core::Models::PreemptibleInstanceConfigDetails'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :availability_domain The value to assign to the {#availability_domain} property
    # @option attributes [String] :capacity_reservation_id The value to assign to the {#capacity_reservation_id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [OCI::Core::Models::InstanceConfigurationCreateVnicDetails] :create_vnic_details The value to assign to the {#create_vnic_details} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [Hash<String, Object>] :extended_metadata The value to assign to the {#extended_metadata} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [String] :ipxe_script The value to assign to the {#ipxe_script} property
    # @option attributes [Hash<String, String>] :metadata The value to assign to the {#metadata} property
    # @option attributes [String] :shape The value to assign to the {#shape} property
    # @option attributes [OCI::Core::Models::InstanceConfigurationLaunchInstanceShapeConfigDetails] :shape_config The value to assign to the {#shape_config} property
    # @option attributes [OCI::Core::Models::InstanceConfigurationLaunchInstancePlatformConfig] :platform_config The value to assign to the {#platform_config} property
    # @option attributes [OCI::Core::Models::InstanceConfigurationInstanceSourceDetails] :source_details The value to assign to the {#source_details} property
    # @option attributes [String] :fault_domain The value to assign to the {#fault_domain} property
    # @option attributes [String] :dedicated_vm_host_id The value to assign to the {#dedicated_vm_host_id} property
    # @option attributes [String] :launch_mode The value to assign to the {#launch_mode} property
    # @option attributes [OCI::Core::Models::InstanceConfigurationLaunchOptions] :launch_options The value to assign to the {#launch_options} property
    # @option attributes [OCI::Core::Models::InstanceConfigurationLaunchInstanceAgentConfigDetails] :agent_config The value to assign to the {#agent_config} property
    # @option attributes [BOOLEAN] :is_pv_encryption_in_transit_enabled The value to assign to the {#is_pv_encryption_in_transit_enabled} property
    # @option attributes [String] :preferred_maintenance_action The value to assign to the {#preferred_maintenance_action} property
    # @option attributes [OCI::Core::Models::InstanceConfigurationInstanceOptions] :instance_options The value to assign to the {#instance_options} property
    # @option attributes [OCI::Core::Models::InstanceConfigurationAvailabilityConfig] :availability_config The value to assign to the {#availability_config} property
    # @option attributes [OCI::Core::Models::PreemptibleInstanceConfigDetails] :preemptible_instance_config The value to assign to the {#preemptible_instance_config} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.availability_domain = attributes[:'availabilityDomain'] if attributes[:'availabilityDomain']

      raise 'You cannot provide both :availabilityDomain and :availability_domain' if attributes.key?(:'availabilityDomain') && attributes.key?(:'availability_domain')

      self.availability_domain = attributes[:'availability_domain'] if attributes[:'availability_domain']

      self.capacity_reservation_id = attributes[:'capacityReservationId'] if attributes[:'capacityReservationId']

      raise 'You cannot provide both :capacityReservationId and :capacity_reservation_id' if attributes.key?(:'capacityReservationId') && attributes.key?(:'capacity_reservation_id')

      self.capacity_reservation_id = attributes[:'capacity_reservation_id'] if attributes[:'capacity_reservation_id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.create_vnic_details = attributes[:'createVnicDetails'] if attributes[:'createVnicDetails']

      raise 'You cannot provide both :createVnicDetails and :create_vnic_details' if attributes.key?(:'createVnicDetails') && attributes.key?(:'create_vnic_details')

      self.create_vnic_details = attributes[:'create_vnic_details'] if attributes[:'create_vnic_details']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.extended_metadata = attributes[:'extendedMetadata'] if attributes[:'extendedMetadata']

      raise 'You cannot provide both :extendedMetadata and :extended_metadata' if attributes.key?(:'extendedMetadata') && attributes.key?(:'extended_metadata')

      self.extended_metadata = attributes[:'extended_metadata'] if attributes[:'extended_metadata']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.ipxe_script = attributes[:'ipxeScript'] if attributes[:'ipxeScript']

      raise 'You cannot provide both :ipxeScript and :ipxe_script' if attributes.key?(:'ipxeScript') && attributes.key?(:'ipxe_script')

      self.ipxe_script = attributes[:'ipxe_script'] if attributes[:'ipxe_script']

      self.metadata = attributes[:'metadata'] if attributes[:'metadata']

      self.shape = attributes[:'shape'] if attributes[:'shape']

      self.shape_config = attributes[:'shapeConfig'] if attributes[:'shapeConfig']

      raise 'You cannot provide both :shapeConfig and :shape_config' if attributes.key?(:'shapeConfig') && attributes.key?(:'shape_config')

      self.shape_config = attributes[:'shape_config'] if attributes[:'shape_config']

      self.platform_config = attributes[:'platformConfig'] if attributes[:'platformConfig']

      raise 'You cannot provide both :platformConfig and :platform_config' if attributes.key?(:'platformConfig') && attributes.key?(:'platform_config')

      self.platform_config = attributes[:'platform_config'] if attributes[:'platform_config']

      self.source_details = attributes[:'sourceDetails'] if attributes[:'sourceDetails']

      raise 'You cannot provide both :sourceDetails and :source_details' if attributes.key?(:'sourceDetails') && attributes.key?(:'source_details')

      self.source_details = attributes[:'source_details'] if attributes[:'source_details']

      self.fault_domain = attributes[:'faultDomain'] if attributes[:'faultDomain']

      raise 'You cannot provide both :faultDomain and :fault_domain' if attributes.key?(:'faultDomain') && attributes.key?(:'fault_domain')

      self.fault_domain = attributes[:'fault_domain'] if attributes[:'fault_domain']

      self.dedicated_vm_host_id = attributes[:'dedicatedVmHostId'] if attributes[:'dedicatedVmHostId']

      raise 'You cannot provide both :dedicatedVmHostId and :dedicated_vm_host_id' if attributes.key?(:'dedicatedVmHostId') && attributes.key?(:'dedicated_vm_host_id')

      self.dedicated_vm_host_id = attributes[:'dedicated_vm_host_id'] if attributes[:'dedicated_vm_host_id']

      self.launch_mode = attributes[:'launchMode'] if attributes[:'launchMode']

      raise 'You cannot provide both :launchMode and :launch_mode' if attributes.key?(:'launchMode') && attributes.key?(:'launch_mode')

      self.launch_mode = attributes[:'launch_mode'] if attributes[:'launch_mode']

      self.launch_options = attributes[:'launchOptions'] if attributes[:'launchOptions']

      raise 'You cannot provide both :launchOptions and :launch_options' if attributes.key?(:'launchOptions') && attributes.key?(:'launch_options')

      self.launch_options = attributes[:'launch_options'] if attributes[:'launch_options']

      self.agent_config = attributes[:'agentConfig'] if attributes[:'agentConfig']

      raise 'You cannot provide both :agentConfig and :agent_config' if attributes.key?(:'agentConfig') && attributes.key?(:'agent_config')

      self.agent_config = attributes[:'agent_config'] if attributes[:'agent_config']

      self.is_pv_encryption_in_transit_enabled = attributes[:'isPvEncryptionInTransitEnabled'] unless attributes[:'isPvEncryptionInTransitEnabled'].nil?

      raise 'You cannot provide both :isPvEncryptionInTransitEnabled and :is_pv_encryption_in_transit_enabled' if attributes.key?(:'isPvEncryptionInTransitEnabled') && attributes.key?(:'is_pv_encryption_in_transit_enabled')

      self.is_pv_encryption_in_transit_enabled = attributes[:'is_pv_encryption_in_transit_enabled'] unless attributes[:'is_pv_encryption_in_transit_enabled'].nil?

      self.preferred_maintenance_action = attributes[:'preferredMaintenanceAction'] if attributes[:'preferredMaintenanceAction']

      raise 'You cannot provide both :preferredMaintenanceAction and :preferred_maintenance_action' if attributes.key?(:'preferredMaintenanceAction') && attributes.key?(:'preferred_maintenance_action')

      self.preferred_maintenance_action = attributes[:'preferred_maintenance_action'] if attributes[:'preferred_maintenance_action']

      self.instance_options = attributes[:'instanceOptions'] if attributes[:'instanceOptions']

      raise 'You cannot provide both :instanceOptions and :instance_options' if attributes.key?(:'instanceOptions') && attributes.key?(:'instance_options')

      self.instance_options = attributes[:'instance_options'] if attributes[:'instance_options']

      self.availability_config = attributes[:'availabilityConfig'] if attributes[:'availabilityConfig']

      raise 'You cannot provide both :availabilityConfig and :availability_config' if attributes.key?(:'availabilityConfig') && attributes.key?(:'availability_config')

      self.availability_config = attributes[:'availability_config'] if attributes[:'availability_config']

      self.preemptible_instance_config = attributes[:'preemptibleInstanceConfig'] if attributes[:'preemptibleInstanceConfig']

      raise 'You cannot provide both :preemptibleInstanceConfig and :preemptible_instance_config' if attributes.key?(:'preemptibleInstanceConfig') && attributes.key?(:'preemptible_instance_config')

      self.preemptible_instance_config = attributes[:'preemptible_instance_config'] if attributes[:'preemptible_instance_config']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] launch_mode Object to be assigned
    def launch_mode=(launch_mode)
      # rubocop:disable Style/ConditionalAssignment
      if launch_mode && !LAUNCH_MODE_ENUM.include?(launch_mode)
        OCI.logger.debug("Unknown value for 'launch_mode' [" + launch_mode + "]. Mapping to 'LAUNCH_MODE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @launch_mode = LAUNCH_MODE_UNKNOWN_ENUM_VALUE
      else
        @launch_mode = launch_mode
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] preferred_maintenance_action Object to be assigned
    def preferred_maintenance_action=(preferred_maintenance_action)
      # rubocop:disable Style/ConditionalAssignment
      if preferred_maintenance_action && !PREFERRED_MAINTENANCE_ACTION_ENUM.include?(preferred_maintenance_action)
        OCI.logger.debug("Unknown value for 'preferred_maintenance_action' [" + preferred_maintenance_action + "]. Mapping to 'PREFERRED_MAINTENANCE_ACTION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @preferred_maintenance_action = PREFERRED_MAINTENANCE_ACTION_UNKNOWN_ENUM_VALUE
      else
        @preferred_maintenance_action = preferred_maintenance_action
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        availability_domain == other.availability_domain &&
        capacity_reservation_id == other.capacity_reservation_id &&
        compartment_id == other.compartment_id &&
        create_vnic_details == other.create_vnic_details &&
        defined_tags == other.defined_tags &&
        display_name == other.display_name &&
        extended_metadata == other.extended_metadata &&
        freeform_tags == other.freeform_tags &&
        ipxe_script == other.ipxe_script &&
        metadata == other.metadata &&
        shape == other.shape &&
        shape_config == other.shape_config &&
        platform_config == other.platform_config &&
        source_details == other.source_details &&
        fault_domain == other.fault_domain &&
        dedicated_vm_host_id == other.dedicated_vm_host_id &&
        launch_mode == other.launch_mode &&
        launch_options == other.launch_options &&
        agent_config == other.agent_config &&
        is_pv_encryption_in_transit_enabled == other.is_pv_encryption_in_transit_enabled &&
        preferred_maintenance_action == other.preferred_maintenance_action &&
        instance_options == other.instance_options &&
        availability_config == other.availability_config &&
        preemptible_instance_config == other.preemptible_instance_config
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
      [availability_domain, capacity_reservation_id, compartment_id, create_vnic_details, defined_tags, display_name, extended_metadata, freeform_tags, ipxe_script, metadata, shape, shape_config, platform_config, source_details, fault_domain, dedicated_vm_host_id, launch_mode, launch_options, agent_config, is_pv_encryption_in_transit_enabled, preferred_maintenance_action, instance_options, availability_config, preemptible_instance_config].hash
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