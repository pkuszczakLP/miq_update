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
  # A Virtual Disk Drive or Logical Unit Number.
  class StorageVirtualDrive < EquipmentBase
    # The fully-qualified name of the instantiated, concrete type. This property is used as a discriminator to identify the type of the payload when marshaling and unmarshaling data.
    attr_accessor :class_id

    # The fully-qualified name of the instantiated, concrete type. The value should be the same as the 'ClassId' property.
    attr_accessor :object_type

    # The access policy of the virtual drive.
    attr_accessor :access_policy

    # The current write cache policy of the virtual drive.
    attr_accessor :actual_write_cache_policy

    # Available storage capacity of the virtual drive.
    attr_accessor :available_size

    # Block size of the virtual drive.
    attr_accessor :block_size

    # The virtual drive bootable state.
    attr_accessor :bootable

    # The configuration state of the virtual drive.
    attr_accessor :config_state

    # The requested write cache policy of the virtual drive.
    attr_accessor :configured_write_cache_policy

    # The connection protocol of the virtual drive.
    attr_accessor :connection_protocol

    # The state of the drive cache of the virtual drive.
    attr_accessor :drive_cache

    # The driveSecurity state of the Virtual drive.
    attr_accessor :drive_security

    # The state of the Virtual drive.
    attr_accessor :drive_state

    # The Input/Output Policy defined on the Virtual drive.
    attr_accessor :io_policy

    # The name of the Virtual drive.
    attr_accessor :name

    # Number of Blocks on the Physical Disk.
    attr_accessor :num_blocks

    # The current operational state of Virtual drive.
    attr_accessor :oper_state

    # The current operability state of Virtual drive.
    attr_accessor :operability

    # The block size of the the virtual drive.
    attr_accessor :physical_block_size

    # The read-ahead cache mode of the virtual drive.
    attr_accessor :read_policy

    # The security flags set for this virtual drive.
    attr_accessor :security_flags

    # The size of the virtual drive in MB.
    attr_accessor :size

    # The strip size is the portion of a stripe that resides on a single drive in the drive group, this is measured in KB.
    attr_accessor :strip_size

    # The raid type of the virtual drive.
    attr_accessor :type

    # The uuid of the virtual drive.
    attr_accessor :uuid

    # The UUID value of the vendor.
    attr_accessor :vendor_uuid

    # The identifier for this Virtual drive.
    attr_accessor :virtual_drive_id

    attr_accessor :disk_group

    attr_accessor :inventory_device_info

    # An array of relationships to storagePhysicalDiskUsage resources.
    attr_accessor :physical_disk_usages

    attr_accessor :registered_device

    attr_accessor :storage_controller

    attr_accessor :storage_virtual_drive_container

    # An array of relationships to storageVdMemberEp resources.
    attr_accessor :vd_member_eps

    attr_accessor :virtual_drive_extension

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
        :'access_policy' => :'AccessPolicy',
        :'actual_write_cache_policy' => :'ActualWriteCachePolicy',
        :'available_size' => :'AvailableSize',
        :'block_size' => :'BlockSize',
        :'bootable' => :'Bootable',
        :'config_state' => :'ConfigState',
        :'configured_write_cache_policy' => :'ConfiguredWriteCachePolicy',
        :'connection_protocol' => :'ConnectionProtocol',
        :'drive_cache' => :'DriveCache',
        :'drive_security' => :'DriveSecurity',
        :'drive_state' => :'DriveState',
        :'io_policy' => :'IoPolicy',
        :'name' => :'Name',
        :'num_blocks' => :'NumBlocks',
        :'oper_state' => :'OperState',
        :'operability' => :'Operability',
        :'physical_block_size' => :'PhysicalBlockSize',
        :'read_policy' => :'ReadPolicy',
        :'security_flags' => :'SecurityFlags',
        :'size' => :'Size',
        :'strip_size' => :'StripSize',
        :'type' => :'Type',
        :'uuid' => :'Uuid',
        :'vendor_uuid' => :'VendorUuid',
        :'virtual_drive_id' => :'VirtualDriveId',
        :'disk_group' => :'DiskGroup',
        :'inventory_device_info' => :'InventoryDeviceInfo',
        :'physical_disk_usages' => :'PhysicalDiskUsages',
        :'registered_device' => :'RegisteredDevice',
        :'storage_controller' => :'StorageController',
        :'storage_virtual_drive_container' => :'StorageVirtualDriveContainer',
        :'vd_member_eps' => :'VdMemberEps',
        :'virtual_drive_extension' => :'VirtualDriveExtension'
      }
    end

    # Returns all the JSON keys this model knows about, including the ones defined in its parent(s)
    def self.acceptable_attributes
      attribute_map.values.concat(superclass.acceptable_attributes)
    end

    # Returns the key-value map of all the JSON attributes this model knows about, including the ones defined in its parent(s)
    def self.acceptable_attribute_map
      attribute_map.merge(superclass.acceptable_attribute_map)
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'class_id' => :'String',
        :'object_type' => :'String',
        :'access_policy' => :'String',
        :'actual_write_cache_policy' => :'String',
        :'available_size' => :'String',
        :'block_size' => :'String',
        :'bootable' => :'String',
        :'config_state' => :'String',
        :'configured_write_cache_policy' => :'String',
        :'connection_protocol' => :'String',
        :'drive_cache' => :'String',
        :'drive_security' => :'String',
        :'drive_state' => :'String',
        :'io_policy' => :'String',
        :'name' => :'String',
        :'num_blocks' => :'String',
        :'oper_state' => :'String',
        :'operability' => :'String',
        :'physical_block_size' => :'String',
        :'read_policy' => :'String',
        :'security_flags' => :'String',
        :'size' => :'String',
        :'strip_size' => :'String',
        :'type' => :'String',
        :'uuid' => :'String',
        :'vendor_uuid' => :'String',
        :'virtual_drive_id' => :'String',
        :'disk_group' => :'StorageDiskGroupRelationship',
        :'inventory_device_info' => :'InventoryDeviceInfoRelationship',
        :'physical_disk_usages' => :'Array<StoragePhysicalDiskUsageRelationship>',
        :'registered_device' => :'AssetDeviceRegistrationRelationship',
        :'storage_controller' => :'StorageControllerRelationship',
        :'storage_virtual_drive_container' => :'StorageVirtualDriveContainerRelationship',
        :'vd_member_eps' => :'Array<StorageVdMemberEpRelationship>',
        :'virtual_drive_extension' => :'StorageVirtualDriveExtensionRelationship'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'physical_disk_usages',
        :'vd_member_eps',
      ])
    end

    # List of class defined in allOf (OpenAPI v3)
    def self.openapi_all_of
      [
      :'EquipmentBase',
      :'StorageVirtualDriveAllOf'
      ]
    end

    # discriminator's property name in OpenAPI v3
    def self.openapi_discriminator_name
      :'ClassId'
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `IntersightClient::StorageVirtualDrive` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.acceptable_attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `#{self.class.name}`. Please check the name to make sure it's valid. List of attributes: " + self.class.acceptable_attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      # call parent's initialize
      super(attributes)

      if attributes.key?(:'class_id')
        self.class_id = attributes[:'class_id']
      else
        self.class_id = 'storage.VirtualDrive'
      end

      if attributes.key?(:'object_type')
        self.object_type = attributes[:'object_type']
      else
        self.object_type = 'storage.VirtualDrive'
      end

      if attributes.key?(:'access_policy')
        self.access_policy = attributes[:'access_policy']
      end

      if attributes.key?(:'actual_write_cache_policy')
        self.actual_write_cache_policy = attributes[:'actual_write_cache_policy']
      end

      if attributes.key?(:'available_size')
        self.available_size = attributes[:'available_size']
      end

      if attributes.key?(:'block_size')
        self.block_size = attributes[:'block_size']
      end

      if attributes.key?(:'bootable')
        self.bootable = attributes[:'bootable']
      end

      if attributes.key?(:'config_state')
        self.config_state = attributes[:'config_state']
      end

      if attributes.key?(:'configured_write_cache_policy')
        self.configured_write_cache_policy = attributes[:'configured_write_cache_policy']
      end

      if attributes.key?(:'connection_protocol')
        self.connection_protocol = attributes[:'connection_protocol']
      end

      if attributes.key?(:'drive_cache')
        self.drive_cache = attributes[:'drive_cache']
      end

      if attributes.key?(:'drive_security')
        self.drive_security = attributes[:'drive_security']
      end

      if attributes.key?(:'drive_state')
        self.drive_state = attributes[:'drive_state']
      end

      if attributes.key?(:'io_policy')
        self.io_policy = attributes[:'io_policy']
      end

      if attributes.key?(:'name')
        self.name = attributes[:'name']
      end

      if attributes.key?(:'num_blocks')
        self.num_blocks = attributes[:'num_blocks']
      end

      if attributes.key?(:'oper_state')
        self.oper_state = attributes[:'oper_state']
      end

      if attributes.key?(:'operability')
        self.operability = attributes[:'operability']
      end

      if attributes.key?(:'physical_block_size')
        self.physical_block_size = attributes[:'physical_block_size']
      end

      if attributes.key?(:'read_policy')
        self.read_policy = attributes[:'read_policy']
      end

      if attributes.key?(:'security_flags')
        self.security_flags = attributes[:'security_flags']
      end

      if attributes.key?(:'size')
        self.size = attributes[:'size']
      end

      if attributes.key?(:'strip_size')
        self.strip_size = attributes[:'strip_size']
      end

      if attributes.key?(:'type')
        self.type = attributes[:'type']
      end

      if attributes.key?(:'uuid')
        self.uuid = attributes[:'uuid']
      end

      if attributes.key?(:'vendor_uuid')
        self.vendor_uuid = attributes[:'vendor_uuid']
      end

      if attributes.key?(:'virtual_drive_id')
        self.virtual_drive_id = attributes[:'virtual_drive_id']
      end

      if attributes.key?(:'disk_group')
        self.disk_group = attributes[:'disk_group']
      end

      if attributes.key?(:'inventory_device_info')
        self.inventory_device_info = attributes[:'inventory_device_info']
      end

      if attributes.key?(:'physical_disk_usages')
        if (value = attributes[:'physical_disk_usages']).is_a?(Array)
          self.physical_disk_usages = value
        end
      end

      if attributes.key?(:'registered_device')
        self.registered_device = attributes[:'registered_device']
      end

      if attributes.key?(:'storage_controller')
        self.storage_controller = attributes[:'storage_controller']
      end

      if attributes.key?(:'storage_virtual_drive_container')
        self.storage_virtual_drive_container = attributes[:'storage_virtual_drive_container']
      end

      if attributes.key?(:'vd_member_eps')
        if (value = attributes[:'vd_member_eps']).is_a?(Array)
          self.vd_member_eps = value
        end
      end

      if attributes.key?(:'virtual_drive_extension')
        self.virtual_drive_extension = attributes[:'virtual_drive_extension']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = super
      if @class_id.nil?
        invalid_properties.push('invalid value for "class_id", class_id cannot be nil.')
      end

      if @object_type.nil?
        invalid_properties.push('invalid value for "object_type", object_type cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @class_id.nil?
      class_id_validator = EnumAttributeValidator.new('String', ["storage.VirtualDrive"])
      return false unless class_id_validator.valid?(@class_id)
      return false if @object_type.nil?
      object_type_validator = EnumAttributeValidator.new('String', ["storage.VirtualDrive"])
      return false unless object_type_validator.valid?(@object_type)
      true && super
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] class_id Object to be assigned
    def class_id=(class_id)
      validator = EnumAttributeValidator.new('String', ["storage.VirtualDrive"])
      unless validator.valid?(class_id)
        fail ArgumentError, "invalid value for \"class_id\", must be one of #{validator.allowable_values}."
      end
      @class_id = class_id
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] object_type Object to be assigned
    def object_type=(object_type)
      validator = EnumAttributeValidator.new('String', ["storage.VirtualDrive"])
      unless validator.valid?(object_type)
        fail ArgumentError, "invalid value for \"object_type\", must be one of #{validator.allowable_values}."
      end
      @object_type = object_type
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          class_id == o.class_id &&
          object_type == o.object_type &&
          access_policy == o.access_policy &&
          actual_write_cache_policy == o.actual_write_cache_policy &&
          available_size == o.available_size &&
          block_size == o.block_size &&
          bootable == o.bootable &&
          config_state == o.config_state &&
          configured_write_cache_policy == o.configured_write_cache_policy &&
          connection_protocol == o.connection_protocol &&
          drive_cache == o.drive_cache &&
          drive_security == o.drive_security &&
          drive_state == o.drive_state &&
          io_policy == o.io_policy &&
          name == o.name &&
          num_blocks == o.num_blocks &&
          oper_state == o.oper_state &&
          operability == o.operability &&
          physical_block_size == o.physical_block_size &&
          read_policy == o.read_policy &&
          security_flags == o.security_flags &&
          size == o.size &&
          strip_size == o.strip_size &&
          type == o.type &&
          uuid == o.uuid &&
          vendor_uuid == o.vendor_uuid &&
          virtual_drive_id == o.virtual_drive_id &&
          disk_group == o.disk_group &&
          inventory_device_info == o.inventory_device_info &&
          physical_disk_usages == o.physical_disk_usages &&
          registered_device == o.registered_device &&
          storage_controller == o.storage_controller &&
          storage_virtual_drive_container == o.storage_virtual_drive_container &&
          vd_member_eps == o.vd_member_eps &&
          virtual_drive_extension == o.virtual_drive_extension && super(o)
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [class_id, object_type, access_policy, actual_write_cache_policy, available_size, block_size, bootable, config_state, configured_write_cache_policy, connection_protocol, drive_cache, drive_security, drive_state, io_policy, name, num_blocks, oper_state, operability, physical_block_size, read_policy, security_flags, size, strip_size, type, uuid, vendor_uuid, virtual_drive_id, disk_group, inventory_device_info, physical_disk_usages, registered_device, storage_controller, storage_virtual_drive_container, vd_member_eps, virtual_drive_extension].hash
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
      super(attributes)
      StorageVirtualDrive.openapi_types.each_pair do |key, type|
        if attributes[StorageVirtualDrive.attribute_map[key]].nil? && StorageVirtualDrive.openapi_nullable.include?(key)
          self.send("#{key}=", nil)
        elsif type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[StorageVirtualDrive.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[StorageVirtualDrive.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[StorageVirtualDrive.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[StorageVirtualDrive.attribute_map[key]]))
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
      hash = super
      StorageVirtualDrive.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        if value.nil?
          is_nullable = StorageVirtualDrive.openapi_nullable.include?(attr)
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