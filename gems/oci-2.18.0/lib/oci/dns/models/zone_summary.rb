# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A DNS zone.
  #
  # **Warning:** Oracle recommends that you avoid using any confidential information when you supply string values using the API.
  #
  class Dns::Models::ZoneSummary
    ZONE_TYPE_ENUM = [
      ZONE_TYPE_PRIMARY = 'PRIMARY'.freeze,
      ZONE_TYPE_SECONDARY = 'SECONDARY'.freeze,
      ZONE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    SCOPE_ENUM = [
      SCOPE_GLOBAL = 'GLOBAL'.freeze,
      SCOPE_PRIVATE = 'PRIVATE'.freeze,
      SCOPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The name of the zone.
    # @return [String]
    attr_accessor :name

    # **[Required]** The type of the zone. Must be either `PRIMARY` or `SECONDARY`. `SECONDARY` is only supported for GLOBAL zones.
    #
    # @return [String]
    attr_reader :zone_type

    # **[Required]** The OCID of the compartment containing the zone.
    # @return [String]
    attr_accessor :compartment_id

    # The OCID of the private view containing the zone. This value will
    # be null for zones in the global DNS, which are publicly resolvable and
    # not part of a private view.
    #
    # @return [String]
    attr_accessor :view_id

    # **[Required]** The scope of the zone.
    # @return [String]
    attr_reader :scope

    # **[Required]** Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    #
    # **Example:** `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # **[Required]** Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    #
    # **Example:** `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # **[Required]** The canonical absolute URL of the resource.
    # @return [String]
    attr_accessor :self_uri

    # **[Required]** The OCID of the zone.
    # @return [String]
    attr_accessor :id

    # **[Required]** The date and time the resource was created in \"YYYY-MM-ddThh:mm:ssZ\" format
    # with a Z offset, as defined by RFC 3339.
    #
    # **Example:** `2016-07-22T17:23:59:60Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # **[Required]** Version is the never-repeating, totally-orderable, version of the
    # zone, from which the serial field of the zone's SOA record is
    # derived.
    #
    # @return [String]
    attr_accessor :version

    # **[Required]** The current serial of the zone. As seen in the zone's SOA record.
    #
    # @return [Integer]
    attr_accessor :serial

    # **[Required]** The current state of the zone resource.
    # @return [String]
    attr_reader :lifecycle_state

    # **[Required]** A Boolean flag indicating whether or not parts of the resource are unable to be explicitly managed.
    #
    # @return [BOOLEAN]
    attr_accessor :is_protected

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'zone_type': :'zoneType',
        'compartment_id': :'compartmentId',
        'view_id': :'viewId',
        'scope': :'scope',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'self_uri': :'self',
        'id': :'id',
        'time_created': :'timeCreated',
        'version': :'version',
        'serial': :'serial',
        'lifecycle_state': :'lifecycleState',
        'is_protected': :'isProtected'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'zone_type': :'String',
        'compartment_id': :'String',
        'view_id': :'String',
        'scope': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'self_uri': :'String',
        'id': :'String',
        'time_created': :'DateTime',
        'version': :'String',
        'serial': :'Integer',
        'lifecycle_state': :'String',
        'is_protected': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :zone_type The value to assign to the {#zone_type} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :view_id The value to assign to the {#view_id} property
    # @option attributes [String] :scope The value to assign to the {#scope} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :self_uri The value to assign to the {#self_uri} property
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [String] :version The value to assign to the {#version} property
    # @option attributes [Integer] :serial The value to assign to the {#serial} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [BOOLEAN] :is_protected The value to assign to the {#is_protected} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.zone_type = attributes[:'zoneType'] if attributes[:'zoneType']

      raise 'You cannot provide both :zoneType and :zone_type' if attributes.key?(:'zoneType') && attributes.key?(:'zone_type')

      self.zone_type = attributes[:'zone_type'] if attributes[:'zone_type']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.view_id = attributes[:'viewId'] if attributes[:'viewId']

      raise 'You cannot provide both :viewId and :view_id' if attributes.key?(:'viewId') && attributes.key?(:'view_id')

      self.view_id = attributes[:'view_id'] if attributes[:'view_id']

      self.scope = attributes[:'scope'] if attributes[:'scope']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.self_uri = attributes[:'self'] if attributes[:'self']

      raise 'You cannot provide both :self and :self_uri' if attributes.key?(:'self') && attributes.key?(:'self_uri')

      self.self_uri = attributes[:'self_uri'] if attributes[:'self_uri']

      self.id = attributes[:'id'] if attributes[:'id']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.version = attributes[:'version'] if attributes[:'version']

      self.serial = attributes[:'serial'] if attributes[:'serial']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.is_protected = attributes[:'isProtected'] unless attributes[:'isProtected'].nil?

      raise 'You cannot provide both :isProtected and :is_protected' if attributes.key?(:'isProtected') && attributes.key?(:'is_protected')

      self.is_protected = attributes[:'is_protected'] unless attributes[:'is_protected'].nil?
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] zone_type Object to be assigned
    def zone_type=(zone_type)
      # rubocop:disable Style/ConditionalAssignment
      if zone_type && !ZONE_TYPE_ENUM.include?(zone_type)
        OCI.logger.debug("Unknown value for 'zone_type' [" + zone_type + "]. Mapping to 'ZONE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @zone_type = ZONE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @zone_type = zone_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] scope Object to be assigned
    def scope=(scope)
      # rubocop:disable Style/ConditionalAssignment
      if scope && !SCOPE_ENUM.include?(scope)
        OCI.logger.debug("Unknown value for 'scope' [" + scope + "]. Mapping to 'SCOPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @scope = SCOPE_UNKNOWN_ENUM_VALUE
      else
        @scope = scope
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

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        name == other.name &&
        zone_type == other.zone_type &&
        compartment_id == other.compartment_id &&
        view_id == other.view_id &&
        scope == other.scope &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        self_uri == other.self_uri &&
        id == other.id &&
        time_created == other.time_created &&
        version == other.version &&
        serial == other.serial &&
        lifecycle_state == other.lifecycle_state &&
        is_protected == other.is_protected
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
      [name, zone_type, compartment_id, view_id, scope, freeform_tags, defined_tags, self_uri, id, time_created, version, serial, lifecycle_state, is_protected].hash
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
