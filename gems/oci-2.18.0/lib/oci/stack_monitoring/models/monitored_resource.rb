# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The information about monitored resource.
  class StackMonitoring::Models::MonitoredResource
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of monitored resource.
    # @return [String]
    attr_accessor :id

    # **[Required]** Monitored resource name.
    # @return [String]
    attr_accessor :name

    # Monitored resource display name.
    # @return [String]
    attr_accessor :display_name

    # **[Required]** Monitored resource type
    # @return [String]
    attr_accessor :type

    # **[Required]** Compartment Identifier [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm)
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** Tenancy Identifier [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm)
    # @return [String]
    attr_accessor :tenant_id

    # Monitored resource host name.
    # @return [String]
    attr_accessor :host_name

    # Management Agent Identifier [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @return [String]
    attr_accessor :management_agent_id

    # Time zone in the form of tz database canonical zone ID.
    # @return [String]
    attr_accessor :resource_time_zone

    # The time the the resource was created. An RFC3339 formatted datetime string
    # @return [DateTime]
    attr_accessor :time_created

    # The time the the resource was updated. An RFC3339 formatted datetime string
    # @return [DateTime]
    attr_accessor :time_updated

    # Lifecycle state of the monitored resource.
    # @return [String]
    attr_reader :lifecycle_state

    # List of monitored resource properties
    # @return [Array<OCI::StackMonitoring::Models::MonitoredResourceProperty>]
    attr_accessor :properties

    # @return [OCI::StackMonitoring::Models::ConnectionDetails]
    attr_accessor :database_connection_details

    # @return [OCI::StackMonitoring::Models::MonitoredResourceCredential]
    attr_accessor :credentials

    # @return [OCI::StackMonitoring::Models::MonitoredResourceAliasCredential]
    attr_accessor :aliases

    # Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Usage of system tag keys. These predefined keys are scoped to namespaces.
    # Example: `{\"orcl-cloud\": {\"free-tier-retained\": \"true\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :system_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'name': :'name',
        'display_name': :'displayName',
        'type': :'type',
        'compartment_id': :'compartmentId',
        'tenant_id': :'tenantId',
        'host_name': :'hostName',
        'management_agent_id': :'managementAgentId',
        'resource_time_zone': :'resourceTimeZone',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'lifecycle_state': :'lifecycleState',
        'properties': :'properties',
        'database_connection_details': :'databaseConnectionDetails',
        'credentials': :'credentials',
        'aliases': :'aliases',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'system_tags': :'systemTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'name': :'String',
        'display_name': :'String',
        'type': :'String',
        'compartment_id': :'String',
        'tenant_id': :'String',
        'host_name': :'String',
        'management_agent_id': :'String',
        'resource_time_zone': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'lifecycle_state': :'String',
        'properties': :'Array<OCI::StackMonitoring::Models::MonitoredResourceProperty>',
        'database_connection_details': :'OCI::StackMonitoring::Models::ConnectionDetails',
        'credentials': :'OCI::StackMonitoring::Models::MonitoredResourceCredential',
        'aliases': :'OCI::StackMonitoring::Models::MonitoredResourceAliasCredential',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'system_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :type The value to assign to the {#type} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :tenant_id The value to assign to the {#tenant_id} property
    # @option attributes [String] :host_name The value to assign to the {#host_name} property
    # @option attributes [String] :management_agent_id The value to assign to the {#management_agent_id} property
    # @option attributes [String] :resource_time_zone The value to assign to the {#resource_time_zone} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [Array<OCI::StackMonitoring::Models::MonitoredResourceProperty>] :properties The value to assign to the {#properties} property
    # @option attributes [OCI::StackMonitoring::Models::ConnectionDetails] :database_connection_details The value to assign to the {#database_connection_details} property
    # @option attributes [OCI::StackMonitoring::Models::MonitoredResourceCredential] :credentials The value to assign to the {#credentials} property
    # @option attributes [OCI::StackMonitoring::Models::MonitoredResourceAliasCredential] :aliases The value to assign to the {#aliases} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {#system_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.name = attributes[:'name'] if attributes[:'name']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.type = attributes[:'type'] if attributes[:'type']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.tenant_id = attributes[:'tenantId'] if attributes[:'tenantId']

      raise 'You cannot provide both :tenantId and :tenant_id' if attributes.key?(:'tenantId') && attributes.key?(:'tenant_id')

      self.tenant_id = attributes[:'tenant_id'] if attributes[:'tenant_id']

      self.host_name = attributes[:'hostName'] if attributes[:'hostName']

      raise 'You cannot provide both :hostName and :host_name' if attributes.key?(:'hostName') && attributes.key?(:'host_name')

      self.host_name = attributes[:'host_name'] if attributes[:'host_name']

      self.management_agent_id = attributes[:'managementAgentId'] if attributes[:'managementAgentId']

      raise 'You cannot provide both :managementAgentId and :management_agent_id' if attributes.key?(:'managementAgentId') && attributes.key?(:'management_agent_id')

      self.management_agent_id = attributes[:'management_agent_id'] if attributes[:'management_agent_id']

      self.resource_time_zone = attributes[:'resourceTimeZone'] if attributes[:'resourceTimeZone']
      self.resource_time_zone = "Etc/UTC" if resource_time_zone.nil? && !attributes.key?(:'resourceTimeZone') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :resourceTimeZone and :resource_time_zone' if attributes.key?(:'resourceTimeZone') && attributes.key?(:'resource_time_zone')

      self.resource_time_zone = attributes[:'resource_time_zone'] if attributes[:'resource_time_zone']
      self.resource_time_zone = "Etc/UTC" if resource_time_zone.nil? && !attributes.key?(:'resourceTimeZone') && !attributes.key?(:'resource_time_zone') # rubocop:disable Style/StringLiterals

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.properties = attributes[:'properties'] if attributes[:'properties']

      self.database_connection_details = attributes[:'databaseConnectionDetails'] if attributes[:'databaseConnectionDetails']

      raise 'You cannot provide both :databaseConnectionDetails and :database_connection_details' if attributes.key?(:'databaseConnectionDetails') && attributes.key?(:'database_connection_details')

      self.database_connection_details = attributes[:'database_connection_details'] if attributes[:'database_connection_details']

      self.credentials = attributes[:'credentials'] if attributes[:'credentials']

      self.aliases = attributes[:'aliases'] if attributes[:'aliases']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.system_tags = attributes[:'systemTags'] if attributes[:'systemTags']

      raise 'You cannot provide both :systemTags and :system_tags' if attributes.key?(:'systemTags') && attributes.key?(:'system_tags')

      self.system_tags = attributes[:'system_tags'] if attributes[:'system_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

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
        id == other.id &&
        name == other.name &&
        display_name == other.display_name &&
        type == other.type &&
        compartment_id == other.compartment_id &&
        tenant_id == other.tenant_id &&
        host_name == other.host_name &&
        management_agent_id == other.management_agent_id &&
        resource_time_zone == other.resource_time_zone &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        lifecycle_state == other.lifecycle_state &&
        properties == other.properties &&
        database_connection_details == other.database_connection_details &&
        credentials == other.credentials &&
        aliases == other.aliases &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        system_tags == other.system_tags
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
      [id, name, display_name, type, compartment_id, tenant_id, host_name, management_agent_id, resource_time_zone, time_created, time_updated, lifecycle_state, properties, database_connection_details, credentials, aliases, freeform_tags, defined_tags, system_tags].hash
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
