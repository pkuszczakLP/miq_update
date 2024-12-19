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
  # Definition of the list of properties defined in 'storage.NetAppEthernetPort', excluding properties defined in parent classes.
  class StorageNetAppEthernetPortAllOf
    # The fully-qualified name of the instantiated, concrete type. This property is used as a discriminator to identify the type of the payload when marshaling and unmarshaling data.
    attr_accessor :class_id

    # The fully-qualified name of the instantiated, concrete type. The value should be the same as the 'ClassId' property.
    attr_accessor :object_type

    # Name of the broadcast domain, scoped to its IPspace.
    attr_accessor :broadcast_domain_name

    # Status of port to determine if its enabled or not.
    attr_accessor :enabled

    # MAC address of the port available in storage array.
    attr_accessor :mac_address

    # Maximum transmission unit of the physical port available in storage array.
    attr_accessor :mtu

    # Name of the port available in storage array.
    attr_accessor :name

    attr_accessor :net_app_ethernet_port_lag

    attr_accessor :net_app_ethernet_port_vlan

    # Operational speed of port measured.
    attr_accessor :speed

    # State of the port available in storage array. * `down` - An inactive port is listed as Down. * `up` - An active port is listed as Up. * `present` - An active port is listed as present.
    attr_accessor :state

    # Type of the port available in storage array. * `LAG` - Storage port of type lag. * `physical` - LIFs can be configured directly on physical ports. * `VLAN` - A logical port that receives and sends VLAN-tagged (IEEE 802.1Q standard) traffic. VLAN port characteristics include the VLAN ID for the port.
    attr_accessor :type

    # Universally unique identifier of the physical port.
    attr_accessor :uuid

    attr_accessor :array_controller

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
        :'broadcast_domain_name' => :'BroadcastDomainName',
        :'enabled' => :'Enabled',
        :'mac_address' => :'MacAddress',
        :'mtu' => :'Mtu',
        :'name' => :'Name',
        :'net_app_ethernet_port_lag' => :'NetAppEthernetPortLag',
        :'net_app_ethernet_port_vlan' => :'NetAppEthernetPortVlan',
        :'speed' => :'Speed',
        :'state' => :'State',
        :'type' => :'Type',
        :'uuid' => :'Uuid',
        :'array_controller' => :'ArrayController'
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
        :'broadcast_domain_name' => :'String',
        :'enabled' => :'String',
        :'mac_address' => :'String',
        :'mtu' => :'String',
        :'name' => :'String',
        :'net_app_ethernet_port_lag' => :'StorageNetAppEthernetPortLag',
        :'net_app_ethernet_port_vlan' => :'StorageNetAppEthernetPortVlan',
        :'speed' => :'Integer',
        :'state' => :'String',
        :'type' => :'String',
        :'uuid' => :'String',
        :'array_controller' => :'StorageNetAppNodeRelationship'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'net_app_ethernet_port_lag',
        :'net_app_ethernet_port_vlan',
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `IntersightClient::StorageNetAppEthernetPortAllOf` initialize method"
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
        self.class_id = 'storage.NetAppEthernetPort'
      end

      if attributes.key?(:'object_type')
        self.object_type = attributes[:'object_type']
      else
        self.object_type = 'storage.NetAppEthernetPort'
      end

      if attributes.key?(:'broadcast_domain_name')
        self.broadcast_domain_name = attributes[:'broadcast_domain_name']
      end

      if attributes.key?(:'enabled')
        self.enabled = attributes[:'enabled']
      end

      if attributes.key?(:'mac_address')
        self.mac_address = attributes[:'mac_address']
      end

      if attributes.key?(:'mtu')
        self.mtu = attributes[:'mtu']
      end

      if attributes.key?(:'name')
        self.name = attributes[:'name']
      end

      if attributes.key?(:'net_app_ethernet_port_lag')
        self.net_app_ethernet_port_lag = attributes[:'net_app_ethernet_port_lag']
      end

      if attributes.key?(:'net_app_ethernet_port_vlan')
        self.net_app_ethernet_port_vlan = attributes[:'net_app_ethernet_port_vlan']
      end

      if attributes.key?(:'speed')
        self.speed = attributes[:'speed']
      end

      if attributes.key?(:'state')
        self.state = attributes[:'state']
      else
        self.state = 'down'
      end

      if attributes.key?(:'type')
        self.type = attributes[:'type']
      else
        self.type = 'LAG'
      end

      if attributes.key?(:'uuid')
        self.uuid = attributes[:'uuid']
      end

      if attributes.key?(:'array_controller')
        self.array_controller = attributes[:'array_controller']
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

      pattern = Regexp.new(/^$|^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$/)
      if !@mac_address.nil? && @mac_address !~ pattern
        invalid_properties.push("invalid value for \"mac_address\", must conform to the pattern #{pattern}.")
      end

      pattern = Regexp.new(/^$|^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$/)
      if !@uuid.nil? && @uuid !~ pattern
        invalid_properties.push("invalid value for \"uuid\", must conform to the pattern #{pattern}.")
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @class_id.nil?
      class_id_validator = EnumAttributeValidator.new('String', ["storage.NetAppEthernetPort"])
      return false unless class_id_validator.valid?(@class_id)
      return false if @object_type.nil?
      object_type_validator = EnumAttributeValidator.new('String', ["storage.NetAppEthernetPort"])
      return false unless object_type_validator.valid?(@object_type)
      return false if !@mac_address.nil? && @mac_address !~ Regexp.new(/^$|^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$/)
      state_validator = EnumAttributeValidator.new('String', ["down", "up", "present"])
      return false unless state_validator.valid?(@state)
      type_validator = EnumAttributeValidator.new('String', ["LAG", "physical", "VLAN"])
      return false unless type_validator.valid?(@type)
      return false if !@uuid.nil? && @uuid !~ Regexp.new(/^$|^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$/)
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] class_id Object to be assigned
    def class_id=(class_id)
      validator = EnumAttributeValidator.new('String', ["storage.NetAppEthernetPort"])
      unless validator.valid?(class_id)
        fail ArgumentError, "invalid value for \"class_id\", must be one of #{validator.allowable_values}."
      end
      @class_id = class_id
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] object_type Object to be assigned
    def object_type=(object_type)
      validator = EnumAttributeValidator.new('String', ["storage.NetAppEthernetPort"])
      unless validator.valid?(object_type)
        fail ArgumentError, "invalid value for \"object_type\", must be one of #{validator.allowable_values}."
      end
      @object_type = object_type
    end

    # Custom attribute writer method with validation
    # @param [Object] mac_address Value to be assigned
    def mac_address=(mac_address)
      pattern = Regexp.new(/^$|^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$/)
      if !mac_address.nil? && mac_address !~ pattern
        fail ArgumentError, "invalid value for \"mac_address\", must conform to the pattern #{pattern}."
      end

      @mac_address = mac_address
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] state Object to be assigned
    def state=(state)
      validator = EnumAttributeValidator.new('String', ["down", "up", "present"])
      unless validator.valid?(state)
        fail ArgumentError, "invalid value for \"state\", must be one of #{validator.allowable_values}."
      end
      @state = state
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] type Object to be assigned
    def type=(type)
      validator = EnumAttributeValidator.new('String', ["LAG", "physical", "VLAN"])
      unless validator.valid?(type)
        fail ArgumentError, "invalid value for \"type\", must be one of #{validator.allowable_values}."
      end
      @type = type
    end

    # Custom attribute writer method with validation
    # @param [Object] uuid Value to be assigned
    def uuid=(uuid)
      pattern = Regexp.new(/^$|^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$/)
      if !uuid.nil? && uuid !~ pattern
        fail ArgumentError, "invalid value for \"uuid\", must conform to the pattern #{pattern}."
      end

      @uuid = uuid
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          class_id == o.class_id &&
          object_type == o.object_type &&
          broadcast_domain_name == o.broadcast_domain_name &&
          enabled == o.enabled &&
          mac_address == o.mac_address &&
          mtu == o.mtu &&
          name == o.name &&
          net_app_ethernet_port_lag == o.net_app_ethernet_port_lag &&
          net_app_ethernet_port_vlan == o.net_app_ethernet_port_vlan &&
          speed == o.speed &&
          state == o.state &&
          type == o.type &&
          uuid == o.uuid &&
          array_controller == o.array_controller
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [class_id, object_type, broadcast_domain_name, enabled, mac_address, mtu, name, net_app_ethernet_port_lag, net_app_ethernet_port_vlan, speed, state, type, uuid, array_controller].hash
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
      StorageNetAppEthernetPortAllOf.openapi_types.each_pair do |key, type|
        if attributes[StorageNetAppEthernetPortAllOf.attribute_map[key]].nil? && StorageNetAppEthernetPortAllOf.openapi_nullable.include?(key)
          self.send("#{key}=", nil)
        elsif type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[StorageNetAppEthernetPortAllOf.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[StorageNetAppEthernetPortAllOf.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[StorageNetAppEthernetPortAllOf.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[StorageNetAppEthernetPortAllOf.attribute_map[key]]))
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
      StorageNetAppEthernetPortAllOf.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        if value.nil?
          is_nullable = StorageNetAppEthernetPortAllOf.openapi_nullable.include?(attr)
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
