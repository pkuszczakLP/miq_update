=begin
#Cisco Intersight

#Cisco Intersight is a management platform delivered as a service with embedded analytics for your Cisco and 3rd party IT infrastructure. This platform offers an intelligent level of management that enables IT organizations to analyze, simplify, and automate their environments in more advanced ways than the prior generations of tools. Cisco Intersight provides an integrated and intuitive management experience for resources in the traditional data center as well as at the edge. With flexible deployment options to address complex security needs, getting started with Intersight is quick and easy. Cisco Intersight has deep integration with Cisco UCS and HyperFlex systems allowing for remote deployment, configuration, and ongoing maintenance. The model-based deployment works for a single system in a remote location or hundreds of systems in a data center and enables rapid, standardized configuration and deployment. It also streamlines maintaining those systems whether you are working with small or very large configurations. The Intersight OpenAPI document defines the complete set of properties that are returned in the HTTP response. From that perspective, a client can expect that no additional properties are returned, unless these properties are explicitly defined in the OpenAPI document. However, when a client uses an older version of the Intersight OpenAPI document, the server may send additional properties because the software is more recent than the client. In that case, the client may receive properties that it does not know about. Some generated SDKs perform a strict validation of the HTTP response body against the OpenAPI document. This document was created on 2021-10-20T11:22:53Z.

The version of the OpenAPI document: 1.0.9-4870
Contact: intersight@cisco.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.3.1

=end

require 'date'
require 'time'

module IntersightClient
  # Definition of the list of properties defined in 'virtualization.VirtualMachine', excluding properties defined in parent classes.
  class VirtualizationVirtualMachineAllOf
    # The fully-qualified name of the instantiated, concrete type. This property is used as a discriminator to identify the type of the payload when marshaling and unmarshaling data.
    attr_accessor :class_id

    # The fully-qualified name of the instantiated, concrete type. The value should be the same as the 'ClassId' property.
    attr_accessor :object_type

    # Action to be performed on a virtual machine (Create, PowerState, Migrate, Clone etc). * `None` - A place holder for the default value. * `PowerState` - Power action is performed on the virtual machine. * `Migrate` - The virtual machine will be migrated from existing node to a different node in cluster. The behavior depends on the underlying hypervisor. * `Create` - The virtual machine will be created on the specified hypervisor. This action is also useful if the virtual machine creation failed during first POST operation on VirtualMachine managed object. User can set this action to retry the virtual machine creation. * `Delete` - The virtual machine will be deleted from the specified hypervisor. User can either set this action or can do a DELETE operation on the VirtualMachine managed object.
    attr_accessor :action

    attr_accessor :action_info

    attr_accessor :affinity_selectors

    attr_accessor :anti_affinity_selectors

    attr_accessor :cloud_init_config

    # Cluster where virtual machine is deployed.
    attr_accessor :cluster_esxi

    # Number of vCPUs allocated to virtual machine.
    attr_accessor :cpu

    # Flag to indicate whether the configuration is created from inventory object.
    attr_accessor :discovered

    attr_accessor :disk

    # Normally any virtual machine that is still powered on cannot be deleted. The expected sequence from a user is to first power off the virtual machine and then invoke the delete operation. However, in special circumstances, the owner of the virtual machine may know very well that the virtual machine is no longer needed and just wants to dispose it off. In such situations a delete operation of a virtual machine object is accepted only when this forceDelete attribute is set to true. Under normal circumstances (forceDelete is false), delete operation first confirms that the virtual machine is powered off and then proceeds to delete the virtual machine.
    attr_accessor :force_delete

    # Guest operating system running on virtual machine. * `linux` - A Linux operating system. * `windows` - A Windows operating system.
    attr_accessor :guest_os

    # Host where virtual machine is deployed.
    attr_accessor :host_esxi

    # Identifies the broad product type of the hypervisor but without any version information. It is here to easily identify the type of the virtual machine. There are other entities (Host, Cluster, etc.) that can be indirectly used to determine the hypervisor but a direct attribute makes it easier to work with. * `ESXi` - The hypervisor running on the HyperFlex cluster is a Vmware ESXi hypervisor of any version. * `HyperFlexAp` - The hypervisor of the virtualization platform is Cisco HyperFlex Application Platform. * `IWE` - The hypervisor of the virtualization platform is Cisco Intersight Workload Engine. * `Hyper-V` - The hypervisor running on the HyperFlex cluster is Microsoft Hyper-V. * `Unknown` - The hypervisor running on the HyperFlex cluster is not known.
    attr_accessor :hypervisor_type

    attr_accessor :interfaces

    attr_accessor :labels

    # Virtual machine memory in mebi bytes (one mebibyte, 1MiB, is 1048576 bytes, and 1KiB is 1024 bytes). Input must be a whole number and scientific notation is not acceptable. For example, enter 1730 and not 1.73e03.
    attr_accessor :memory

    # Virtual machine name that is unique. Hypervisors enforce platform specific limits and character sets. The name length limit, both min and max, vary among hypervisors. Therefore, the basic limits are set here and proper enforcement is done elsewhere.
    attr_accessor :name

    # Expected power state of virtual machine (PowerOn, PowerOff, Restart). * `PowerOff` - The virtual machine will be powered off if it is already not in powered off state. If it is already powered off, no side-effects are expected. * `PowerOn` - The virtual machine will be powered on if it is already not in powered on state. If it is already powered on, no side-effects are expected. * `Suspend` - The virtual machine will be put into  a suspended state. * `ShutDownGuestOS` - The guest operating system is shut down gracefully. * `RestartGuestOS` - It can either act as a reset switch and abruptly reset the guest operating system, or it can send a restart signal to the guest operating system so that it shuts down gracefully and restarts. * `Reset` - Resets the virtual machine abruptly, with no consideration for work in progress. * `Restart` - The virtual machine will be restarted only if it is in powered on state. If it is powered off, it will not be started up. * `Unknown` - Power state of the entity is unknown.
    attr_accessor :power_state

    # Identifies the provision type to create a new virtual machine. * `OVA` - Deploy virtual machine using OVA/F file. * `Template` - Provision virtual machine using a template file. * `Discovered` - A virtual machine was 'discovered' and not created from Intersight. No provisioning information is available.
    attr_accessor :provision_type

    attr_accessor :vm_config

    attr_accessor :cluster

    attr_accessor :host

    attr_accessor :inventory

    attr_accessor :registered_device

    attr_accessor :workflow_info

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'class_id' => :'ClassId',
        :'object_type' => :'ObjectType',
        :'action' => :'Action',
        :'action_info' => :'ActionInfo',
        :'affinity_selectors' => :'AffinitySelectors',
        :'anti_affinity_selectors' => :'AntiAffinitySelectors',
        :'cloud_init_config' => :'CloudInitConfig',
        :'cluster_esxi' => :'ClusterEsxi',
        :'cpu' => :'Cpu',
        :'discovered' => :'Discovered',
        :'disk' => :'Disk',
        :'force_delete' => :'ForceDelete',
        :'guest_os' => :'GuestOs',
        :'host_esxi' => :'HostEsxi',
        :'hypervisor_type' => :'HypervisorType',
        :'interfaces' => :'Interfaces',
        :'labels' => :'Labels',
        :'memory' => :'Memory',
        :'name' => :'Name',
        :'power_state' => :'PowerState',
        :'provision_type' => :'ProvisionType',
        :'vm_config' => :'VmConfig',
        :'cluster' => :'Cluster',
        :'host' => :'Host',
        :'inventory' => :'Inventory',
        :'registered_device' => :'RegisteredDevice',
        :'workflow_info' => :'WorkflowInfo'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Returns the key-value map of all the JSON attributes this model knows about
    def self.acceptable_attribute_map
      attribute_map
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'class_id' => :'String',
        :'object_type' => :'String',
        :'action' => :'String',
        :'action_info' => :'VirtualizationActionInfo',
        :'affinity_selectors' => :'Array<InfraMetaData>',
        :'anti_affinity_selectors' => :'Array<InfraMetaData>',
        :'cloud_init_config' => :'VirtualizationCloudInitConfig',
        :'cluster_esxi' => :'String',
        :'cpu' => :'Integer',
        :'discovered' => :'Boolean',
        :'disk' => :'Array<VirtualizationVirtualMachineDisk>',
        :'force_delete' => :'Boolean',
        :'guest_os' => :'String',
        :'host_esxi' => :'String',
        :'hypervisor_type' => :'String',
        :'interfaces' => :'Array<VirtualizationNetworkInterface>',
        :'labels' => :'Array<InfraMetaData>',
        :'memory' => :'Integer',
        :'name' => :'String',
        :'power_state' => :'String',
        :'provision_type' => :'String',
        :'vm_config' => :'VirtualizationBaseVmConfiguration',
        :'cluster' => :'VirtualizationBaseClusterRelationship',
        :'host' => :'VirtualizationBaseHostRelationship',
        :'inventory' => :'VirtualizationBaseVirtualMachineRelationship',
        :'registered_device' => :'AssetDeviceRegistrationRelationship',
        :'workflow_info' => :'WorkflowWorkflowInfoRelationship'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'action_info',
        :'affinity_selectors',
        :'anti_affinity_selectors',
        :'cloud_init_config',
        :'disk',
        :'interfaces',
        :'labels',
        :'vm_config',
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `IntersightClient::VirtualizationVirtualMachineAllOf` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.acceptable_attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `#{self.class.name}`. Please check the name to make sure it's valid. List of attributes: " + self.class.acceptable_attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'class_id')
        self.class_id = attributes[:'class_id']
      else
        self.class_id = 'virtualization.VirtualMachine'
      end

      if attributes.key?(:'object_type')
        self.object_type = attributes[:'object_type']
      else
        self.object_type = 'virtualization.VirtualMachine'
      end

      if attributes.key?(:'action')
        self.action = attributes[:'action']
      else
        self.action = 'None'
      end

      if attributes.key?(:'action_info')
        self.action_info = attributes[:'action_info']
      end

      if attributes.key?(:'affinity_selectors')
        if (value = attributes[:'affinity_selectors']).is_a?(Array)
          self.affinity_selectors = value
        end
      end

      if attributes.key?(:'anti_affinity_selectors')
        if (value = attributes[:'anti_affinity_selectors']).is_a?(Array)
          self.anti_affinity_selectors = value
        end
      end

      if attributes.key?(:'cloud_init_config')
        self.cloud_init_config = attributes[:'cloud_init_config']
      end

      if attributes.key?(:'cluster_esxi')
        self.cluster_esxi = attributes[:'cluster_esxi']
      end

      if attributes.key?(:'cpu')
        self.cpu = attributes[:'cpu']
      end

      if attributes.key?(:'discovered')
        self.discovered = attributes[:'discovered']
      end

      if attributes.key?(:'disk')
        if (value = attributes[:'disk']).is_a?(Array)
          self.disk = value
        end
      end

      if attributes.key?(:'force_delete')
        self.force_delete = attributes[:'force_delete']
      end

      if attributes.key?(:'guest_os')
        self.guest_os = attributes[:'guest_os']
      else
        self.guest_os = 'linux'
      end

      if attributes.key?(:'host_esxi')
        self.host_esxi = attributes[:'host_esxi']
      end

      if attributes.key?(:'hypervisor_type')
        self.hypervisor_type = attributes[:'hypervisor_type']
      else
        self.hypervisor_type = 'ESXi'
      end

      if attributes.key?(:'interfaces')
        if (value = attributes[:'interfaces']).is_a?(Array)
          self.interfaces = value
        end
      end

      if attributes.key?(:'labels')
        if (value = attributes[:'labels']).is_a?(Array)
          self.labels = value
        end
      end

      if attributes.key?(:'memory')
        self.memory = attributes[:'memory']
      end

      if attributes.key?(:'name')
        self.name = attributes[:'name']
      end

      if attributes.key?(:'power_state')
        self.power_state = attributes[:'power_state']
      else
        self.power_state = 'PowerOff'
      end

      if attributes.key?(:'provision_type')
        self.provision_type = attributes[:'provision_type']
      else
        self.provision_type = 'OVA'
      end

      if attributes.key?(:'vm_config')
        self.vm_config = attributes[:'vm_config']
      end

      if attributes.key?(:'cluster')
        self.cluster = attributes[:'cluster']
      end

      if attributes.key?(:'host')
        self.host = attributes[:'host']
      end

      if attributes.key?(:'inventory')
        self.inventory = attributes[:'inventory']
      end

      if attributes.key?(:'registered_device')
        self.registered_device = attributes[:'registered_device']
      end

      if attributes.key?(:'workflow_info')
        self.workflow_info = attributes[:'workflow_info']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @class_id.nil?
        invalid_properties.push('invalid value for "class_id", class_id cannot be nil.')
      end

      if @object_type.nil?
        invalid_properties.push('invalid value for "object_type", object_type cannot be nil.')
      end

      if !@cpu.nil? && @cpu > 40
        invalid_properties.push('invalid value for "cpu", must be smaller than or equal to 40.')
      end

      if !@cpu.nil? && @cpu < 1
        invalid_properties.push('invalid value for "cpu", must be greater than or equal to 1.')
      end

      if !@memory.nil? && @memory > 4177920
        invalid_properties.push('invalid value for "memory", must be smaller than or equal to 4177920.')
      end

      if !@memory.nil? && @memory < 1
        invalid_properties.push('invalid value for "memory", must be greater than or equal to 1.')
      end

      if !@name.nil? && @name.to_s.length > 128
        invalid_properties.push('invalid value for "name", the character length must be smaller than or equal to 128.')
      end

      if !@name.nil? && @name.to_s.length < 1
        invalid_properties.push('invalid value for "name", the character length must be great than or equal to 1.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @class_id.nil?
      class_id_validator = EnumAttributeValidator.new('String', ["virtualization.VirtualMachine"])
      return false unless class_id_validator.valid?(@class_id)
      return false if @object_type.nil?
      object_type_validator = EnumAttributeValidator.new('String', ["virtualization.VirtualMachine"])
      return false unless object_type_validator.valid?(@object_type)
      action_validator = EnumAttributeValidator.new('String', ["None", "PowerState", "Migrate", "Create", "Delete"])
      return false unless action_validator.valid?(@action)
      return false if !@cpu.nil? && @cpu > 40
      return false if !@cpu.nil? && @cpu < 1
      guest_os_validator = EnumAttributeValidator.new('String', ["linux", "windows"])
      return false unless guest_os_validator.valid?(@guest_os)
      hypervisor_type_validator = EnumAttributeValidator.new('String', ["ESXi", "HyperFlexAp", "IWE", "Hyper-V", "Unknown"])
      return false unless hypervisor_type_validator.valid?(@hypervisor_type)
      return false if !@memory.nil? && @memory > 4177920
      return false if !@memory.nil? && @memory < 1
      return false if !@name.nil? && @name.to_s.length > 128
      return false if !@name.nil? && @name.to_s.length < 1
      power_state_validator = EnumAttributeValidator.new('String', ["PowerOff", "PowerOn", "Suspend", "ShutDownGuestOS", "RestartGuestOS", "Reset", "Restart", "Unknown"])
      return false unless power_state_validator.valid?(@power_state)
      provision_type_validator = EnumAttributeValidator.new('String', ["OVA", "Template", "Discovered"])
      return false unless provision_type_validator.valid?(@provision_type)
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] class_id Object to be assigned
    def class_id=(class_id)
      validator = EnumAttributeValidator.new('String', ["virtualization.VirtualMachine"])
      unless validator.valid?(class_id)
        fail ArgumentError, "invalid value for \"class_id\", must be one of #{validator.allowable_values}."
      end
      @class_id = class_id
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] object_type Object to be assigned
    def object_type=(object_type)
      validator = EnumAttributeValidator.new('String', ["virtualization.VirtualMachine"])
      unless validator.valid?(object_type)
        fail ArgumentError, "invalid value for \"object_type\", must be one of #{validator.allowable_values}."
      end
      @object_type = object_type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] action Object to be assigned
    def action=(action)
      validator = EnumAttributeValidator.new('String', ["None", "PowerState", "Migrate", "Create", "Delete"])
      unless validator.valid?(action)
        fail ArgumentError, "invalid value for \"action\", must be one of #{validator.allowable_values}."
      end
      @action = action
    end

    # Custom attribute writer method with validation
    # @param [Object] cpu Value to be assigned
    def cpu=(cpu)
      if !cpu.nil? && cpu > 40
        fail ArgumentError, 'invalid value for "cpu", must be smaller than or equal to 40.'
      end

      if !cpu.nil? && cpu < 1
        fail ArgumentError, 'invalid value for "cpu", must be greater than or equal to 1.'
      end

      @cpu = cpu
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] guest_os Object to be assigned
    def guest_os=(guest_os)
      validator = EnumAttributeValidator.new('String', ["linux", "windows"])
      unless validator.valid?(guest_os)
        fail ArgumentError, "invalid value for \"guest_os\", must be one of #{validator.allowable_values}."
      end
      @guest_os = guest_os
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] hypervisor_type Object to be assigned
    def hypervisor_type=(hypervisor_type)
      validator = EnumAttributeValidator.new('String', ["ESXi", "HyperFlexAp", "IWE", "Hyper-V", "Unknown"])
      unless validator.valid?(hypervisor_type)
        fail ArgumentError, "invalid value for \"hypervisor_type\", must be one of #{validator.allowable_values}."
      end
      @hypervisor_type = hypervisor_type
    end

    # Custom attribute writer method with validation
    # @param [Object] memory Value to be assigned
    def memory=(memory)
      if !memory.nil? && memory > 4177920
        fail ArgumentError, 'invalid value for "memory", must be smaller than or equal to 4177920.'
      end

      if !memory.nil? && memory < 1
        fail ArgumentError, 'invalid value for "memory", must be greater than or equal to 1.'
      end

      @memory = memory
    end

    # Custom attribute writer method with validation
    # @param [Object] name Value to be assigned
    def name=(name)
      if !name.nil? && name.to_s.length > 128
        fail ArgumentError, 'invalid value for "name", the character length must be smaller than or equal to 128.'
      end

      if !name.nil? && name.to_s.length < 1
        fail ArgumentError, 'invalid value for "name", the character length must be great than or equal to 1.'
      end

      @name = name
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] power_state Object to be assigned
    def power_state=(power_state)
      validator = EnumAttributeValidator.new('String', ["PowerOff", "PowerOn", "Suspend", "ShutDownGuestOS", "RestartGuestOS", "Reset", "Restart", "Unknown"])
      unless validator.valid?(power_state)
        fail ArgumentError, "invalid value for \"power_state\", must be one of #{validator.allowable_values}."
      end
      @power_state = power_state
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] provision_type Object to be assigned
    def provision_type=(provision_type)
      validator = EnumAttributeValidator.new('String', ["OVA", "Template", "Discovered"])
      unless validator.valid?(provision_type)
        fail ArgumentError, "invalid value for \"provision_type\", must be one of #{validator.allowable_values}."
      end
      @provision_type = provision_type
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          class_id == o.class_id &&
          object_type == o.object_type &&
          action == o.action &&
          action_info == o.action_info &&
          affinity_selectors == o.affinity_selectors &&
          anti_affinity_selectors == o.anti_affinity_selectors &&
          cloud_init_config == o.cloud_init_config &&
          cluster_esxi == o.cluster_esxi &&
          cpu == o.cpu &&
          discovered == o.discovered &&
          disk == o.disk &&
          force_delete == o.force_delete &&
          guest_os == o.guest_os &&
          host_esxi == o.host_esxi &&
          hypervisor_type == o.hypervisor_type &&
          interfaces == o.interfaces &&
          labels == o.labels &&
          memory == o.memory &&
          name == o.name &&
          power_state == o.power_state &&
          provision_type == o.provision_type &&
          vm_config == o.vm_config &&
          cluster == o.cluster &&
          host == o.host &&
          inventory == o.inventory &&
          registered_device == o.registered_device &&
          workflow_info == o.workflow_info
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [class_id, object_type, action, action_info, affinity_selectors, anti_affinity_selectors, cloud_init_config, cluster_esxi, cpu, discovered, disk, force_delete, guest_os, host_esxi, hypervisor_type, interfaces, labels, memory, name, power_state, provision_type, vm_config, cluster, host, inventory, registered_device, workflow_info].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def self.build_from_hash(attributes)
      new.build_from_hash(attributes)
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      VirtualizationVirtualMachineAllOf.openapi_types.each_pair do |key, type|
        if attributes[VirtualizationVirtualMachineAllOf.attribute_map[key]].nil? && VirtualizationVirtualMachineAllOf.openapi_nullable.include?(key)
          self.send("#{key}=", nil)
        elsif type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[VirtualizationVirtualMachineAllOf.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[VirtualizationVirtualMachineAllOf.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[VirtualizationVirtualMachineAllOf.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[VirtualizationVirtualMachineAllOf.attribute_map[key]]))
        end
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :Time
        Time.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :Boolean
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        # models (e.g. Pet) or oneOf
        klass = IntersightClient.const_get(type)
        klass.respond_to?(:openapi_one_of) ? klass.build(value) : klass.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      VirtualizationVirtualMachineAllOf.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        if value.nil?
          is_nullable = VirtualizationVirtualMachineAllOf.openapi_nullable.include?(attr)
          next if !is_nullable || (is_nullable && !instance_variable_defined?(:"@#{attr}"))
        end

        hash[param] = _to_hash(value)
      end
      hash
    end

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
