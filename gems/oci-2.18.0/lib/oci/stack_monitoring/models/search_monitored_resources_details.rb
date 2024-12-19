# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The property search criteria for listing monitored resources.
  class StackMonitoring::Models::SearchMonitoredResourcesDetails
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze
    ].freeze

    SORT_ORDER_ENUM = [
      SORT_ORDER_ASC = 'ASC'.freeze,
      SORT_ORDER_DESC = 'DESC'.freeze
    ].freeze

    SORT_BY_ENUM = [
      SORT_BY_TIME_CREATED = 'TIME_CREATED'.freeze,
      SORT_BY_RESOURCE_NAME = 'RESOURCE_NAME'.freeze
    ].freeze

    # **[Required]** Compartment Identifier [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm)
    # @return [String]
    attr_accessor :compartment_id

    # A filter to return resources that match exact resource name
    # @return [String]
    attr_accessor :name

    # A filter to return resources that match resource name pattern given. The match is not case sensitive.
    # @return [String]
    attr_accessor :name_contains

    # A filter to return resources that match resource type
    # @return [String]
    attr_accessor :type

    # A filter to return resources with host name match
    # @return [String]
    attr_accessor :host_name

    # A filter to return resources with host name pattern
    # @return [String]
    attr_accessor :host_name_contains

    # A filter to return resources with matching management agent id.
    # @return [String]
    attr_accessor :management_agent_id

    # A filter to return resources with matching lifecycle state.
    # @return [String]
    attr_reader :lifecycle_state

    # Search for resources that were created within a specific date range,
    # using this parameter to specify the earliest creation date for the
    # returned list (inclusive). Specifying this parameter without the
    # corresponding `timeCreatedLessThan` parameter will retrieve resources created from the
    # given `timeCreatedGreaterThanOrEqualTo` to the current time, in \"YYYY-MM-ddThh:mmZ\" format with a
    # Z offset, as defined by [RFC 3339](https://tools.ietf.org/html/rfc3339).
    #
    # **Example:** 2016-12-19T16:39:57.600Z
    #
    # @return [DateTime]
    attr_accessor :time_created_greater_than_or_equal_to

    # Search for resources that were created within a specific date range,
    # using this parameter to specify the latest creation date for the returned
    # list (exclusive). Specifying this parameter without the corresponding
    # `timeCreatedGreaterThanOrEqualTo` parameter will retrieve all resources created before the
    # specified end date, in \"YYYY-MM-ddThh:mmZ\" format with a Z offset, as
    # defined by [RFC 3339](https://tools.ietf.org/html/rfc3339).
    #
    # **Example:** 2016-12-19T16:39:57.600Z
    #
    # @return [DateTime]
    attr_accessor :time_created_less_than

    # Search for resources that were updated within a specific date range,
    # using this parameter to specify the earliest update date for the
    # returned list (inclusive). Specifying this parameter without the
    # corresponding `timeUpdatedLessThan` parameter will retrieve resources updated from the
    # given `timeUpdatedGreaterThanOrEqualTo` to the current time, in \"YYYY-MM-ddThh:mmZ\" format with a
    # Z offset, as defined by [RFC 3339](https://tools.ietf.org/html/rfc3339).
    #
    # **Example:** 2016-12-19T16:39:57.600Z
    #
    # @return [DateTime]
    attr_accessor :time_updated_greater_than_or_equal_to

    # Search for resources that were updated within a specific date range,
    # using this parameter to specify the latest creation date for the returned
    # list (exclusive). Specifying this parameter without the corresponding
    # `timeUpdatedGreaterThanOrEqualTo` parameter will retrieve all resources updated before the
    # specified end date, in \"YYYY-MM-ddThh:mmZ\" format with a Z offset, as
    # defined by [RFC 3339](https://tools.ietf.org/html/rfc3339).
    #
    # **Example:** 2016-12-19T16:39:57.600Z
    #
    # @return [DateTime]
    attr_accessor :time_updated_less_than

    # Time zone in the form of tz database canonical zone ID.
    # @return [String]
    attr_accessor :resource_time_zone

    # The sort order to use, either 'ASC' or 'DESC'.
    # @return [String]
    attr_reader :sort_order

    # The field to sort by. Only one sort order may be provided.
    # Default order for timeCreated is descending. Default order for resources is ascending.
    #
    # @return [String]
    attr_reader :sort_by

    # Criteria based on resource property.
    # @return [Hash<String, String>]
    attr_accessor :property_equals

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'compartmentId',
        'name': :'name',
        'name_contains': :'nameContains',
        'type': :'type',
        'host_name': :'hostName',
        'host_name_contains': :'hostNameContains',
        'management_agent_id': :'managementAgentId',
        'lifecycle_state': :'lifecycleState',
        'time_created_greater_than_or_equal_to': :'timeCreatedGreaterThanOrEqualTo',
        'time_created_less_than': :'timeCreatedLessThan',
        'time_updated_greater_than_or_equal_to': :'timeUpdatedGreaterThanOrEqualTo',
        'time_updated_less_than': :'timeUpdatedLessThan',
        'resource_time_zone': :'resourceTimeZone',
        'sort_order': :'sortOrder',
        'sort_by': :'sortBy',
        'property_equals': :'propertyEquals'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'String',
        'name': :'String',
        'name_contains': :'String',
        'type': :'String',
        'host_name': :'String',
        'host_name_contains': :'String',
        'management_agent_id': :'String',
        'lifecycle_state': :'String',
        'time_created_greater_than_or_equal_to': :'DateTime',
        'time_created_less_than': :'DateTime',
        'time_updated_greater_than_or_equal_to': :'DateTime',
        'time_updated_less_than': :'DateTime',
        'resource_time_zone': :'String',
        'sort_order': :'String',
        'sort_by': :'String',
        'property_equals': :'Hash<String, String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :name_contains The value to assign to the {#name_contains} property
    # @option attributes [String] :type The value to assign to the {#type} property
    # @option attributes [String] :host_name The value to assign to the {#host_name} property
    # @option attributes [String] :host_name_contains The value to assign to the {#host_name_contains} property
    # @option attributes [String] :management_agent_id The value to assign to the {#management_agent_id} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [DateTime] :time_created_greater_than_or_equal_to The value to assign to the {#time_created_greater_than_or_equal_to} property
    # @option attributes [DateTime] :time_created_less_than The value to assign to the {#time_created_less_than} property
    # @option attributes [DateTime] :time_updated_greater_than_or_equal_to The value to assign to the {#time_updated_greater_than_or_equal_to} property
    # @option attributes [DateTime] :time_updated_less_than The value to assign to the {#time_updated_less_than} property
    # @option attributes [String] :resource_time_zone The value to assign to the {#resource_time_zone} property
    # @option attributes [String] :sort_order The value to assign to the {#sort_order} property
    # @option attributes [String] :sort_by The value to assign to the {#sort_by} property
    # @option attributes [Hash<String, String>] :property_equals The value to assign to the {#property_equals} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.name = attributes[:'name'] if attributes[:'name']

      self.name_contains = attributes[:'nameContains'] if attributes[:'nameContains']

      raise 'You cannot provide both :nameContains and :name_contains' if attributes.key?(:'nameContains') && attributes.key?(:'name_contains')

      self.name_contains = attributes[:'name_contains'] if attributes[:'name_contains']

      self.type = attributes[:'type'] if attributes[:'type']

      self.host_name = attributes[:'hostName'] if attributes[:'hostName']

      raise 'You cannot provide both :hostName and :host_name' if attributes.key?(:'hostName') && attributes.key?(:'host_name')

      self.host_name = attributes[:'host_name'] if attributes[:'host_name']

      self.host_name_contains = attributes[:'hostNameContains'] if attributes[:'hostNameContains']

      raise 'You cannot provide both :hostNameContains and :host_name_contains' if attributes.key?(:'hostNameContains') && attributes.key?(:'host_name_contains')

      self.host_name_contains = attributes[:'host_name_contains'] if attributes[:'host_name_contains']

      self.management_agent_id = attributes[:'managementAgentId'] if attributes[:'managementAgentId']

      raise 'You cannot provide both :managementAgentId and :management_agent_id' if attributes.key?(:'managementAgentId') && attributes.key?(:'management_agent_id')

      self.management_agent_id = attributes[:'management_agent_id'] if attributes[:'management_agent_id']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.time_created_greater_than_or_equal_to = attributes[:'timeCreatedGreaterThanOrEqualTo'] if attributes[:'timeCreatedGreaterThanOrEqualTo']

      raise 'You cannot provide both :timeCreatedGreaterThanOrEqualTo and :time_created_greater_than_or_equal_to' if attributes.key?(:'timeCreatedGreaterThanOrEqualTo') && attributes.key?(:'time_created_greater_than_or_equal_to')

      self.time_created_greater_than_or_equal_to = attributes[:'time_created_greater_than_or_equal_to'] if attributes[:'time_created_greater_than_or_equal_to']

      self.time_created_less_than = attributes[:'timeCreatedLessThan'] if attributes[:'timeCreatedLessThan']

      raise 'You cannot provide both :timeCreatedLessThan and :time_created_less_than' if attributes.key?(:'timeCreatedLessThan') && attributes.key?(:'time_created_less_than')

      self.time_created_less_than = attributes[:'time_created_less_than'] if attributes[:'time_created_less_than']

      self.time_updated_greater_than_or_equal_to = attributes[:'timeUpdatedGreaterThanOrEqualTo'] if attributes[:'timeUpdatedGreaterThanOrEqualTo']

      raise 'You cannot provide both :timeUpdatedGreaterThanOrEqualTo and :time_updated_greater_than_or_equal_to' if attributes.key?(:'timeUpdatedGreaterThanOrEqualTo') && attributes.key?(:'time_updated_greater_than_or_equal_to')

      self.time_updated_greater_than_or_equal_to = attributes[:'time_updated_greater_than_or_equal_to'] if attributes[:'time_updated_greater_than_or_equal_to']

      self.time_updated_less_than = attributes[:'timeUpdatedLessThan'] if attributes[:'timeUpdatedLessThan']

      raise 'You cannot provide both :timeUpdatedLessThan and :time_updated_less_than' if attributes.key?(:'timeUpdatedLessThan') && attributes.key?(:'time_updated_less_than')

      self.time_updated_less_than = attributes[:'time_updated_less_than'] if attributes[:'time_updated_less_than']

      self.resource_time_zone = attributes[:'resourceTimeZone'] if attributes[:'resourceTimeZone']
      self.resource_time_zone = "Etc/UTC" if resource_time_zone.nil? && !attributes.key?(:'resourceTimeZone') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :resourceTimeZone and :resource_time_zone' if attributes.key?(:'resourceTimeZone') && attributes.key?(:'resource_time_zone')

      self.resource_time_zone = attributes[:'resource_time_zone'] if attributes[:'resource_time_zone']
      self.resource_time_zone = "Etc/UTC" if resource_time_zone.nil? && !attributes.key?(:'resourceTimeZone') && !attributes.key?(:'resource_time_zone') # rubocop:disable Style/StringLiterals

      self.sort_order = attributes[:'sortOrder'] if attributes[:'sortOrder']

      raise 'You cannot provide both :sortOrder and :sort_order' if attributes.key?(:'sortOrder') && attributes.key?(:'sort_order')

      self.sort_order = attributes[:'sort_order'] if attributes[:'sort_order']

      self.sort_by = attributes[:'sortBy'] if attributes[:'sortBy']
      self.sort_by = "TIME_CREATED" if sort_by.nil? && !attributes.key?(:'sortBy') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :sortBy and :sort_by' if attributes.key?(:'sortBy') && attributes.key?(:'sort_by')

      self.sort_by = attributes[:'sort_by'] if attributes[:'sort_by']
      self.sort_by = "TIME_CREATED" if sort_by.nil? && !attributes.key?(:'sortBy') && !attributes.key?(:'sort_by') # rubocop:disable Style/StringLiterals

      self.property_equals = attributes[:'propertyEquals'] if attributes[:'propertyEquals']

      raise 'You cannot provide both :propertyEquals and :property_equals' if attributes.key?(:'propertyEquals') && attributes.key?(:'property_equals')

      self.property_equals = attributes[:'property_equals'] if attributes[:'property_equals']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] lifecycle_state Object to be assigned
    def lifecycle_state=(lifecycle_state)
      raise "Invalid value for 'lifecycle_state': this must be one of the values in LIFECYCLE_STATE_ENUM." if lifecycle_state && !LIFECYCLE_STATE_ENUM.include?(lifecycle_state)

      @lifecycle_state = lifecycle_state
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] sort_order Object to be assigned
    def sort_order=(sort_order)
      raise "Invalid value for 'sort_order': this must be one of the values in SORT_ORDER_ENUM." if sort_order && !SORT_ORDER_ENUM.include?(sort_order)

      @sort_order = sort_order
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] sort_by Object to be assigned
    def sort_by=(sort_by)
      raise "Invalid value for 'sort_by': this must be one of the values in SORT_BY_ENUM." if sort_by && !SORT_BY_ENUM.include?(sort_by)

      @sort_by = sort_by
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        compartment_id == other.compartment_id &&
        name == other.name &&
        name_contains == other.name_contains &&
        type == other.type &&
        host_name == other.host_name &&
        host_name_contains == other.host_name_contains &&
        management_agent_id == other.management_agent_id &&
        lifecycle_state == other.lifecycle_state &&
        time_created_greater_than_or_equal_to == other.time_created_greater_than_or_equal_to &&
        time_created_less_than == other.time_created_less_than &&
        time_updated_greater_than_or_equal_to == other.time_updated_greater_than_or_equal_to &&
        time_updated_less_than == other.time_updated_less_than &&
        resource_time_zone == other.resource_time_zone &&
        sort_order == other.sort_order &&
        sort_by == other.sort_by &&
        property_equals == other.property_equals
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
      [compartment_id, name, name_contains, type, host_name, host_name_contains, management_agent_id, lifecycle_state, time_created_greater_than_or_equal_to, time_created_less_than, time_updated_greater_than_or_equal_to, time_updated_less_than, resource_time_zone, sort_order, sort_by, property_equals].hash
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
