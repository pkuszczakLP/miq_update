# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Instance launch details.
  # Use the `sourceDetails` parameter to specify whether a boot volume or an image should be used to launch a new instance.
  #
  class Core::Models::LaunchInstanceDetails
    # **[Required]** The availability domain of the instance.
    #
    # Example: `Uocm:PHX-AD-1`
    #
    # @return [String]
    attr_accessor :availability_domain

    # The OCID of the compute capacity reservation this instance is launched under.
    # You can opt out of all default reservations by specifying an empty string as input for this field.
    # For more information, see [Capacity Reservations](https://docs.cloud.oracle.com/iaas/Content/Compute/Tasks/reserve-capacity.htm#default).
    #
    # @return [String]
    attr_accessor :capacity_reservation_id

    # **[Required]** The OCID of the compartment.
    # @return [String]
    attr_accessor :compartment_id

    # @return [OCI::Core::Models::CreateVnicDetails]
    attr_accessor :create_vnic_details

    # The OCID of the dedicated VM host.
    #
    # @return [String]
    attr_accessor :dedicated_vm_host_id

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

    # Free-form tags for this resource. Each tag is a simple key-value pair with no
    # predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Deprecated. Instead use `hostnameLabel` in
    # {CreateVnicDetails}.
    # If you provide both, the values must match.
    #
    # @return [String]
    attr_accessor :hostname_label

    # Deprecated. Use `sourceDetails` with {#instance_source_via_image_details instance_source_via_image_details}
    # source type instead. If you specify values for both, the values must match.
    #
    # @return [String]
    attr_accessor :image_id

    # This is an advanced option.
    #
    # When a bare metal or virtual machine
    # instance boots, the iPXE firmware that runs on the instance is
    # configured to run an iPXE script to continue the boot process.
    #
    # If you want more control over the boot process, you can provide
    # your own custom iPXE script that will run when the instance boots.
    # Be aware that the same iPXE script will run
    # every time an instance boots, not only after the initial
    # LaunchInstance call.
    #
    # The default iPXE script connects to the instance's local boot
    # volume over iSCSI and performs a network boot. If you use a custom iPXE
    # script and want to network-boot from the instance's local boot volume
    # over iSCSI the same way as the default iPXE script, use the
    # following iSCSI IP address: 169.254.0.2, and boot volume IQN:
    # iqn.2015-02.oracle.boot.
    #
    # If your instance boot volume type is paravirtualized,
    # the boot volume is attached to the instance through virtio-scsi and no iPXE script is used.
    # If your instance boot volume type is paravirtualized
    # and you use custom iPXE to network boot into your instance,
    # the primary boot volume is attached as a data volume through virtio-scsi drive.
    #
    # For more information about the Bring Your Own Image feature of
    # Oracle Cloud Infrastructure, see
    # [Bring Your Own Image](https://docs.cloud.oracle.com/iaas/Content/Compute/References/bringyourownimage.htm).
    #
    # For more information about iPXE, see http://ipxe.org.
    #
    # @return [String]
    attr_accessor :ipxe_script

    # @return [OCI::Core::Models::LaunchOptions]
    attr_accessor :launch_options

    # @return [OCI::Core::Models::InstanceOptions]
    attr_accessor :instance_options

    # @return [OCI::Core::Models::LaunchInstanceAvailabilityConfigDetails]
    attr_accessor :availability_config

    # @return [OCI::Core::Models::PreemptibleInstanceConfigDetails]
    attr_accessor :preemptible_instance_config

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

    # @return [OCI::Core::Models::LaunchInstanceAgentConfigDetails]
    attr_accessor :agent_config

    # **[Required]** The shape of an instance. The shape determines the number of CPUs, amount of memory,
    # and other resources allocated to the instance.
    #
    # You can enumerate all available shapes by calling {#list_shapes list_shapes}.
    #
    # @return [String]
    attr_accessor :shape

    # @return [OCI::Core::Models::LaunchInstanceShapeConfigDetails]
    attr_accessor :shape_config

    # @return [OCI::Core::Models::InstanceSourceDetails]
    attr_accessor :source_details

    # Deprecated. Instead use `subnetId` in
    # {CreateVnicDetails}.
    # At least one of them is required; if you provide both, the values must match.
    #
    # @return [String]
    attr_accessor :subnet_id

    # Whether to enable in-transit encryption for the data volume's paravirtualized attachment. This field applies to both block volumes and boot volumes. The default value is false.
    # @return [BOOLEAN]
    attr_accessor :is_pv_encryption_in_transit_enabled

    # @return [OCI::Core::Models::LaunchInstancePlatformConfig]
    attr_accessor :platform_config

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'availability_domain': :'availabilityDomain',
        'capacity_reservation_id': :'capacityReservationId',
        'compartment_id': :'compartmentId',
        'create_vnic_details': :'createVnicDetails',
        'dedicated_vm_host_id': :'dedicatedVmHostId',
        'defined_tags': :'definedTags',
        'display_name': :'displayName',
        'extended_metadata': :'extendedMetadata',
        'fault_domain': :'faultDomain',
        'freeform_tags': :'freeformTags',
        'hostname_label': :'hostnameLabel',
        'image_id': :'imageId',
        'ipxe_script': :'ipxeScript',
        'launch_options': :'launchOptions',
        'instance_options': :'instanceOptions',
        'availability_config': :'availabilityConfig',
        'preemptible_instance_config': :'preemptibleInstanceConfig',
        'metadata': :'metadata',
        'agent_config': :'agentConfig',
        'shape': :'shape',
        'shape_config': :'shapeConfig',
        'source_details': :'sourceDetails',
        'subnet_id': :'subnetId',
        'is_pv_encryption_in_transit_enabled': :'isPvEncryptionInTransitEnabled',
        'platform_config': :'platformConfig'
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
        'create_vnic_details': :'OCI::Core::Models::CreateVnicDetails',
        'dedicated_vm_host_id': :'String',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'display_name': :'String',
        'extended_metadata': :'Hash<String, Object>',
        'fault_domain': :'String',
        'freeform_tags': :'Hash<String, String>',
        'hostname_label': :'String',
        'image_id': :'String',
        'ipxe_script': :'String',
        'launch_options': :'OCI::Core::Models::LaunchOptions',
        'instance_options': :'OCI::Core::Models::InstanceOptions',
        'availability_config': :'OCI::Core::Models::LaunchInstanceAvailabilityConfigDetails',
        'preemptible_instance_config': :'OCI::Core::Models::PreemptibleInstanceConfigDetails',
        'metadata': :'Hash<String, String>',
        'agent_config': :'OCI::Core::Models::LaunchInstanceAgentConfigDetails',
        'shape': :'String',
        'shape_config': :'OCI::Core::Models::LaunchInstanceShapeConfigDetails',
        'source_details': :'OCI::Core::Models::InstanceSourceDetails',
        'subnet_id': :'String',
        'is_pv_encryption_in_transit_enabled': :'BOOLEAN',
        'platform_config': :'OCI::Core::Models::LaunchInstancePlatformConfig'
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
    # @option attributes [OCI::Core::Models::CreateVnicDetails] :create_vnic_details The value to assign to the {#create_vnic_details} property
    # @option attributes [String] :dedicated_vm_host_id The value to assign to the {#dedicated_vm_host_id} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [Hash<String, Object>] :extended_metadata The value to assign to the {#extended_metadata} property
    # @option attributes [String] :fault_domain The value to assign to the {#fault_domain} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [String] :hostname_label The value to assign to the {#hostname_label} property
    # @option attributes [String] :image_id The value to assign to the {#image_id} property
    # @option attributes [String] :ipxe_script The value to assign to the {#ipxe_script} property
    # @option attributes [OCI::Core::Models::LaunchOptions] :launch_options The value to assign to the {#launch_options} property
    # @option attributes [OCI::Core::Models::InstanceOptions] :instance_options The value to assign to the {#instance_options} property
    # @option attributes [OCI::Core::Models::LaunchInstanceAvailabilityConfigDetails] :availability_config The value to assign to the {#availability_config} property
    # @option attributes [OCI::Core::Models::PreemptibleInstanceConfigDetails] :preemptible_instance_config The value to assign to the {#preemptible_instance_config} property
    # @option attributes [Hash<String, String>] :metadata The value to assign to the {#metadata} property
    # @option attributes [OCI::Core::Models::LaunchInstanceAgentConfigDetails] :agent_config The value to assign to the {#agent_config} property
    # @option attributes [String] :shape The value to assign to the {#shape} property
    # @option attributes [OCI::Core::Models::LaunchInstanceShapeConfigDetails] :shape_config The value to assign to the {#shape_config} property
    # @option attributes [OCI::Core::Models::InstanceSourceDetails] :source_details The value to assign to the {#source_details} property
    # @option attributes [String] :subnet_id The value to assign to the {#subnet_id} property
    # @option attributes [BOOLEAN] :is_pv_encryption_in_transit_enabled The value to assign to the {#is_pv_encryption_in_transit_enabled} property
    # @option attributes [OCI::Core::Models::LaunchInstancePlatformConfig] :platform_config The value to assign to the {#platform_config} property
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

      self.dedicated_vm_host_id = attributes[:'dedicatedVmHostId'] if attributes[:'dedicatedVmHostId']

      raise 'You cannot provide both :dedicatedVmHostId and :dedicated_vm_host_id' if attributes.key?(:'dedicatedVmHostId') && attributes.key?(:'dedicated_vm_host_id')

      self.dedicated_vm_host_id = attributes[:'dedicated_vm_host_id'] if attributes[:'dedicated_vm_host_id']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.extended_metadata = attributes[:'extendedMetadata'] if attributes[:'extendedMetadata']

      raise 'You cannot provide both :extendedMetadata and :extended_metadata' if attributes.key?(:'extendedMetadata') && attributes.key?(:'extended_metadata')

      self.extended_metadata = attributes[:'extended_metadata'] if attributes[:'extended_metadata']

      self.fault_domain = attributes[:'faultDomain'] if attributes[:'faultDomain']

      raise 'You cannot provide both :faultDomain and :fault_domain' if attributes.key?(:'faultDomain') && attributes.key?(:'fault_domain')

      self.fault_domain = attributes[:'fault_domain'] if attributes[:'fault_domain']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.hostname_label = attributes[:'hostnameLabel'] if attributes[:'hostnameLabel']

      raise 'You cannot provide both :hostnameLabel and :hostname_label' if attributes.key?(:'hostnameLabel') && attributes.key?(:'hostname_label')

      self.hostname_label = attributes[:'hostname_label'] if attributes[:'hostname_label']

      self.image_id = attributes[:'imageId'] if attributes[:'imageId']

      raise 'You cannot provide both :imageId and :image_id' if attributes.key?(:'imageId') && attributes.key?(:'image_id')

      self.image_id = attributes[:'image_id'] if attributes[:'image_id']

      self.ipxe_script = attributes[:'ipxeScript'] if attributes[:'ipxeScript']

      raise 'You cannot provide both :ipxeScript and :ipxe_script' if attributes.key?(:'ipxeScript') && attributes.key?(:'ipxe_script')

      self.ipxe_script = attributes[:'ipxe_script'] if attributes[:'ipxe_script']

      self.launch_options = attributes[:'launchOptions'] if attributes[:'launchOptions']

      raise 'You cannot provide both :launchOptions and :launch_options' if attributes.key?(:'launchOptions') && attributes.key?(:'launch_options')

      self.launch_options = attributes[:'launch_options'] if attributes[:'launch_options']

      self.instance_options = attributes[:'instanceOptions'] if attributes[:'instanceOptions']

      raise 'You cannot provide both :instanceOptions and :instance_options' if attributes.key?(:'instanceOptions') && attributes.key?(:'instance_options')

      self.instance_options = attributes[:'instance_options'] if attributes[:'instance_options']

      self.availability_config = attributes[:'availabilityConfig'] if attributes[:'availabilityConfig']

      raise 'You cannot provide both :availabilityConfig and :availability_config' if attributes.key?(:'availabilityConfig') && attributes.key?(:'availability_config')

      self.availability_config = attributes[:'availability_config'] if attributes[:'availability_config']

      self.preemptible_instance_config = attributes[:'preemptibleInstanceConfig'] if attributes[:'preemptibleInstanceConfig']

      raise 'You cannot provide both :preemptibleInstanceConfig and :preemptible_instance_config' if attributes.key?(:'preemptibleInstanceConfig') && attributes.key?(:'preemptible_instance_config')

      self.preemptible_instance_config = attributes[:'preemptible_instance_config'] if attributes[:'preemptible_instance_config']

      self.metadata = attributes[:'metadata'] if attributes[:'metadata']

      self.agent_config = attributes[:'agentConfig'] if attributes[:'agentConfig']

      raise 'You cannot provide both :agentConfig and :agent_config' if attributes.key?(:'agentConfig') && attributes.key?(:'agent_config')

      self.agent_config = attributes[:'agent_config'] if attributes[:'agent_config']

      self.shape = attributes[:'shape'] if attributes[:'shape']

      self.shape_config = attributes[:'shapeConfig'] if attributes[:'shapeConfig']

      raise 'You cannot provide both :shapeConfig and :shape_config' if attributes.key?(:'shapeConfig') && attributes.key?(:'shape_config')

      self.shape_config = attributes[:'shape_config'] if attributes[:'shape_config']

      self.source_details = attributes[:'sourceDetails'] if attributes[:'sourceDetails']

      raise 'You cannot provide both :sourceDetails and :source_details' if attributes.key?(:'sourceDetails') && attributes.key?(:'source_details')

      self.source_details = attributes[:'source_details'] if attributes[:'source_details']

      self.subnet_id = attributes[:'subnetId'] if attributes[:'subnetId']

      raise 'You cannot provide both :subnetId and :subnet_id' if attributes.key?(:'subnetId') && attributes.key?(:'subnet_id')

      self.subnet_id = attributes[:'subnet_id'] if attributes[:'subnet_id']

      self.is_pv_encryption_in_transit_enabled = attributes[:'isPvEncryptionInTransitEnabled'] unless attributes[:'isPvEncryptionInTransitEnabled'].nil?

      raise 'You cannot provide both :isPvEncryptionInTransitEnabled and :is_pv_encryption_in_transit_enabled' if attributes.key?(:'isPvEncryptionInTransitEnabled') && attributes.key?(:'is_pv_encryption_in_transit_enabled')

      self.is_pv_encryption_in_transit_enabled = attributes[:'is_pv_encryption_in_transit_enabled'] unless attributes[:'is_pv_encryption_in_transit_enabled'].nil?

      self.platform_config = attributes[:'platformConfig'] if attributes[:'platformConfig']

      raise 'You cannot provide both :platformConfig and :platform_config' if attributes.key?(:'platformConfig') && attributes.key?(:'platform_config')

      self.platform_config = attributes[:'platform_config'] if attributes[:'platform_config']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

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
        dedicated_vm_host_id == other.dedicated_vm_host_id &&
        defined_tags == other.defined_tags &&
        display_name == other.display_name &&
        extended_metadata == other.extended_metadata &&
        fault_domain == other.fault_domain &&
        freeform_tags == other.freeform_tags &&
        hostname_label == other.hostname_label &&
        image_id == other.image_id &&
        ipxe_script == other.ipxe_script &&
        launch_options == other.launch_options &&
        instance_options == other.instance_options &&
        availability_config == other.availability_config &&
        preemptible_instance_config == other.preemptible_instance_config &&
        metadata == other.metadata &&
        agent_config == other.agent_config &&
        shape == other.shape &&
        shape_config == other.shape_config &&
        source_details == other.source_details &&
        subnet_id == other.subnet_id &&
        is_pv_encryption_in_transit_enabled == other.is_pv_encryption_in_transit_enabled &&
        platform_config == other.platform_config
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
      [availability_domain, capacity_reservation_id, compartment_id, create_vnic_details, dedicated_vm_host_id, defined_tags, display_name, extended_metadata, fault_domain, freeform_tags, hostname_label, image_id, ipxe_script, launch_options, instance_options, availability_config, preemptible_instance_config, metadata, agent_config, shape, shape_config, source_details, subnet_id, is_pv_encryption_in_transit_enabled, platform_config].hash
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