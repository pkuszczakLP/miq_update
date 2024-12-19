=begin
#Power Cloud API

#IBM Power Cloud API for Power Hardware / Infrastructure

The version of the OpenAPI document: 1.0.0
Contact: kylej@us.ibm.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.2.1

=end

require 'date'
require 'time'

module IbmCloudPower
  class Volume
    # Auxiliary volume name at storage host level
    attr_accessor :aux_volume_name

    # true if volume is auxiliary otherwise false
    attr_accessor :auxiliary

    # Indicates if the volume is the server's boot volume
    attr_accessor :boot_volume

    # Indicates if the volume is boot capable
    attr_accessor :bootable

    # Consistency Group Name if volume is a part of volume group
    attr_accessor :consistency_group_name

    # Creation Date
    attr_accessor :creation_date

    # Indicates if the volume should be deleted when the server terminates
    attr_accessor :delete_on_termination

    # Type of Disk
    attr_accessor :disk_type

    # Volume Group ID
    attr_accessor :group_id

    # Last Update Date
    attr_accessor :last_update_date

    # Master volume name at storage host level
    attr_accessor :master_volume_name

    # Mirroring state for replication enabled volume
    attr_accessor :mirroring_state

    # Volume Name
    attr_accessor :name

    # true if volume does not exist on storage controller, as volume has been deleted by deleting its paired volume from the mapped replication site.
    attr_accessor :out_of_band_deleted

    # indicates whether master/aux volume is playing the primary role
    attr_accessor :primary_role

    # List of PCloud PVM Instance attached to the volume
    attr_accessor :pvm_instance_ids

    # True if volume is replication enabled otherwise false
    attr_accessor :replication_enabled

    # Replication status of a volume
    attr_accessor :replication_status

    # type of replication(metro,global)
    attr_accessor :replication_type

    # Indicates if the volume is shareable between VMs
    attr_accessor :shareable

    # Volume Size
    attr_accessor :size

    # Volume State
    attr_accessor :state

    # Volume ID
    attr_accessor :volume_id

    # Volume pool, name of storage pool where the volume is located
    attr_accessor :volume_pool

    # Volume type, name of storage template used to create the volume
    attr_accessor :volume_type

    # Volume world wide name
    attr_accessor :wwn

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
        :'aux_volume_name' => :'auxVolumeName',
        :'auxiliary' => :'auxiliary',
        :'boot_volume' => :'bootVolume',
        :'bootable' => :'bootable',
        :'consistency_group_name' => :'consistencyGroupName',
        :'creation_date' => :'creationDate',
        :'delete_on_termination' => :'deleteOnTermination',
        :'disk_type' => :'diskType',
        :'group_id' => :'groupID',
        :'last_update_date' => :'lastUpdateDate',
        :'master_volume_name' => :'masterVolumeName',
        :'mirroring_state' => :'mirroringState',
        :'name' => :'name',
        :'out_of_band_deleted' => :'outOfBandDeleted',
        :'primary_role' => :'primaryRole',
        :'pvm_instance_ids' => :'pvmInstanceIDs',
        :'replication_enabled' => :'replicationEnabled',
        :'replication_status' => :'replicationStatus',
        :'replication_type' => :'replicationType',
        :'shareable' => :'shareable',
        :'size' => :'size',
        :'state' => :'state',
        :'volume_id' => :'volumeID',
        :'volume_pool' => :'volumePool',
        :'volume_type' => :'volumeType',
        :'wwn' => :'wwn'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'aux_volume_name' => :'String',
        :'auxiliary' => :'Boolean',
        :'boot_volume' => :'Boolean',
        :'bootable' => :'Boolean',
        :'consistency_group_name' => :'String',
        :'creation_date' => :'Time',
        :'delete_on_termination' => :'Boolean',
        :'disk_type' => :'String',
        :'group_id' => :'String',
        :'last_update_date' => :'Time',
        :'master_volume_name' => :'String',
        :'mirroring_state' => :'String',
        :'name' => :'String',
        :'out_of_band_deleted' => :'Boolean',
        :'primary_role' => :'String',
        :'pvm_instance_ids' => :'Array<String>',
        :'replication_enabled' => :'Boolean',
        :'replication_status' => :'String',
        :'replication_type' => :'String',
        :'shareable' => :'Boolean',
        :'size' => :'Float',
        :'state' => :'String',
        :'volume_id' => :'String',
        :'volume_pool' => :'String',
        :'volume_type' => :'String',
        :'wwn' => :'String'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `IbmCloudPower::Volume` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `IbmCloudPower::Volume`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'aux_volume_name')
        self.aux_volume_name = attributes[:'aux_volume_name']
      end

      if attributes.key?(:'auxiliary')
        self.auxiliary = attributes[:'auxiliary']
      end

      if attributes.key?(:'boot_volume')
        self.boot_volume = attributes[:'boot_volume']
      end

      if attributes.key?(:'bootable')
        self.bootable = attributes[:'bootable']
      end

      if attributes.key?(:'consistency_group_name')
        self.consistency_group_name = attributes[:'consistency_group_name']
      end

      if attributes.key?(:'creation_date')
        self.creation_date = attributes[:'creation_date']
      end

      if attributes.key?(:'delete_on_termination')
        self.delete_on_termination = attributes[:'delete_on_termination']
      end

      if attributes.key?(:'disk_type')
        self.disk_type = attributes[:'disk_type']
      end

      if attributes.key?(:'group_id')
        self.group_id = attributes[:'group_id']
      end

      if attributes.key?(:'last_update_date')
        self.last_update_date = attributes[:'last_update_date']
      end

      if attributes.key?(:'master_volume_name')
        self.master_volume_name = attributes[:'master_volume_name']
      end

      if attributes.key?(:'mirroring_state')
        self.mirroring_state = attributes[:'mirroring_state']
      end

      if attributes.key?(:'name')
        self.name = attributes[:'name']
      end

      if attributes.key?(:'out_of_band_deleted')
        self.out_of_band_deleted = attributes[:'out_of_band_deleted']
      end

      if attributes.key?(:'primary_role')
        self.primary_role = attributes[:'primary_role']
      end

      if attributes.key?(:'pvm_instance_ids')
        if (value = attributes[:'pvm_instance_ids']).is_a?(Array)
          self.pvm_instance_ids = value
        end
      end

      if attributes.key?(:'replication_enabled')
        self.replication_enabled = attributes[:'replication_enabled']
      end

      if attributes.key?(:'replication_status')
        self.replication_status = attributes[:'replication_status']
      end

      if attributes.key?(:'replication_type')
        self.replication_type = attributes[:'replication_type']
      end

      if attributes.key?(:'shareable')
        self.shareable = attributes[:'shareable']
      end

      if attributes.key?(:'size')
        self.size = attributes[:'size']
      end

      if attributes.key?(:'state')
        self.state = attributes[:'state']
      end

      if attributes.key?(:'volume_id')
        self.volume_id = attributes[:'volume_id']
      end

      if attributes.key?(:'volume_pool')
        self.volume_pool = attributes[:'volume_pool']
      end

      if attributes.key?(:'volume_type')
        self.volume_type = attributes[:'volume_type']
      end

      if attributes.key?(:'wwn')
        self.wwn = attributes[:'wwn']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @creation_date.nil?
        invalid_properties.push('invalid value for "creation_date", creation_date cannot be nil.')
      end

      if @last_update_date.nil?
        invalid_properties.push('invalid value for "last_update_date", last_update_date cannot be nil.')
      end

      if @name.nil?
        invalid_properties.push('invalid value for "name", name cannot be nil.')
      end

      if @size.nil?
        invalid_properties.push('invalid value for "size", size cannot be nil.')
      end

      if @volume_id.nil?
        invalid_properties.push('invalid value for "volume_id", volume_id cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @creation_date.nil?
      return false if @last_update_date.nil?
      return false if @name.nil?
      primary_role_validator = EnumAttributeValidator.new('String', ["master", "aux"])
      return false unless primary_role_validator.valid?(@primary_role)
      return false if @size.nil?
      return false if @volume_id.nil?
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] primary_role Object to be assigned
    def primary_role=(primary_role)
      validator = EnumAttributeValidator.new('String', ["master", "aux"])
      unless validator.valid?(primary_role)
        fail ArgumentError, "invalid value for \"primary_role\", must be one of #{validator.allowable_values}."
      end
      @primary_role = primary_role
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          aux_volume_name == o.aux_volume_name &&
          auxiliary == o.auxiliary &&
          boot_volume == o.boot_volume &&
          bootable == o.bootable &&
          consistency_group_name == o.consistency_group_name &&
          creation_date == o.creation_date &&
          delete_on_termination == o.delete_on_termination &&
          disk_type == o.disk_type &&
          group_id == o.group_id &&
          last_update_date == o.last_update_date &&
          master_volume_name == o.master_volume_name &&
          mirroring_state == o.mirroring_state &&
          name == o.name &&
          out_of_band_deleted == o.out_of_band_deleted &&
          primary_role == o.primary_role &&
          pvm_instance_ids == o.pvm_instance_ids &&
          replication_enabled == o.replication_enabled &&
          replication_status == o.replication_status &&
          replication_type == o.replication_type &&
          shareable == o.shareable &&
          size == o.size &&
          state == o.state &&
          volume_id == o.volume_id &&
          volume_pool == o.volume_pool &&
          volume_type == o.volume_type &&
          wwn == o.wwn
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [aux_volume_name, auxiliary, boot_volume, bootable, consistency_group_name, creation_date, delete_on_termination, disk_type, group_id, last_update_date, master_volume_name, mirroring_state, name, out_of_band_deleted, primary_role, pvm_instance_ids, replication_enabled, replication_status, replication_type, shareable, size, state, volume_id, volume_pool, volume_type, wwn].hash
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
      attributes = attributes.transform_keys(&:to_sym)
      self.class.openapi_types.each_pair do |key, type|
        if attributes[self.class.attribute_map[key]].nil? && self.class.openapi_nullable.include?(key)
          self.send("#{key}=", nil)
        elsif type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
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
        klass = IbmCloudPower.const_get(type)
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
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        if value.nil?
          is_nullable = self.class.openapi_nullable.include?(attr)
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
