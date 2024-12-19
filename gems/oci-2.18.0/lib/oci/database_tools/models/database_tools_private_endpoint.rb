# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Description of Database Tools private endpoint.
  class DatabaseTools::Models::DatabaseToolsPrivateEndpoint
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment containing the Database Tools private endpoint.
    # @return [String]
    attr_accessor :compartment_id

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Usage of system tag keys. These predefined keys are scoped to namespaces.
    # Example: `{\"orcl-cloud\": {\"free-tier-retained\": \"true\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :system_tags

    # A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information.
    # @return [String]
    attr_accessor :display_name

    # A description of the Database Tools private endpoint.
    # @return [String]
    attr_accessor :description

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Database Tools private endpoint.
    # @return [String]
    attr_accessor :id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Database Tools Endpoint Service.
    # @return [String]
    attr_accessor :endpoint_service_id

    # **[Required]** The time the Database Tools private endpoint was created. An RFC3339 formatted datetime string
    # @return [DateTime]
    attr_accessor :time_created

    # **[Required]** The time the Database Tools private endpoint was updated. An RFC3339 formatted datetime string
    # @return [DateTime]
    attr_accessor :time_updated

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the VCN that the private endpoint belongs to.
    # @return [String]
    attr_accessor :vcn_id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the subnet that the private endpoint belongs to.
    # @return [String]
    attr_accessor :subnet_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the private endpoint's VNIC.
    # @return [String]
    attr_accessor :private_endpoint_vnic_id

    # The private IP address that represents the access point for the associated endpoint service.
    # @return [String]
    attr_accessor :private_endpoint_ip

    # Then FQDN to use for the private endpoint.
    # @return [String]
    attr_accessor :endpoint_fqdn

    # A list of additional FQDNs that can be also be used for the private endpoint.
    # @return [Array<String>]
    attr_accessor :additional_fqdns

    # **[Required]** The current state of the Database Tools private endpoint.
    # @return [String]
    attr_reader :lifecycle_state

    # A message describing the current state in more detail. For example, can be used to provide actionable information for a resource in Failed state.
    # @return [String]
    attr_accessor :lifecycle_details

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network security groups
    # that the private endpoint's VNIC belongs to.  For more information about NSGs, see
    # {NetworkSecurityGroup}.
    #
    # @return [Array<String>]
    attr_accessor :nsg_ids

    # @return [OCI::DatabaseTools::Models::DatabaseToolsPrivateEndpointReverseConnectionConfiguration]
    attr_accessor :reverse_connection_configuration

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'compartmentId',
        'defined_tags': :'definedTags',
        'freeform_tags': :'freeformTags',
        'system_tags': :'systemTags',
        'display_name': :'displayName',
        'description': :'description',
        'id': :'id',
        'endpoint_service_id': :'endpointServiceId',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'vcn_id': :'vcnId',
        'subnet_id': :'subnetId',
        'private_endpoint_vnic_id': :'privateEndpointVnicId',
        'private_endpoint_ip': :'privateEndpointIp',
        'endpoint_fqdn': :'endpointFqdn',
        'additional_fqdns': :'additionalFqdns',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'nsg_ids': :'nsgIds',
        'reverse_connection_configuration': :'reverseConnectionConfiguration'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'String',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'freeform_tags': :'Hash<String, String>',
        'system_tags': :'Hash<String, Hash<String, Object>>',
        'display_name': :'String',
        'description': :'String',
        'id': :'String',
        'endpoint_service_id': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'vcn_id': :'String',
        'subnet_id': :'String',
        'private_endpoint_vnic_id': :'String',
        'private_endpoint_ip': :'String',
        'endpoint_fqdn': :'String',
        'additional_fqdns': :'Array<String>',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'nsg_ids': :'Array<String>',
        'reverse_connection_configuration': :'OCI::DatabaseTools::Models::DatabaseToolsPrivateEndpointReverseConnectionConfiguration'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {#system_tags} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :endpoint_service_id The value to assign to the {#endpoint_service_id} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :vcn_id The value to assign to the {#vcn_id} property
    # @option attributes [String] :subnet_id The value to assign to the {#subnet_id} property
    # @option attributes [String] :private_endpoint_vnic_id The value to assign to the {#private_endpoint_vnic_id} property
    # @option attributes [String] :private_endpoint_ip The value to assign to the {#private_endpoint_ip} property
    # @option attributes [String] :endpoint_fqdn The value to assign to the {#endpoint_fqdn} property
    # @option attributes [Array<String>] :additional_fqdns The value to assign to the {#additional_fqdns} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [Array<String>] :nsg_ids The value to assign to the {#nsg_ids} property
    # @option attributes [OCI::DatabaseTools::Models::DatabaseToolsPrivateEndpointReverseConnectionConfiguration] :reverse_connection_configuration The value to assign to the {#reverse_connection_configuration} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.system_tags = attributes[:'systemTags'] if attributes[:'systemTags']

      raise 'You cannot provide both :systemTags and :system_tags' if attributes.key?(:'systemTags') && attributes.key?(:'system_tags')

      self.system_tags = attributes[:'system_tags'] if attributes[:'system_tags']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.id = attributes[:'id'] if attributes[:'id']

      self.endpoint_service_id = attributes[:'endpointServiceId'] if attributes[:'endpointServiceId']

      raise 'You cannot provide both :endpointServiceId and :endpoint_service_id' if attributes.key?(:'endpointServiceId') && attributes.key?(:'endpoint_service_id')

      self.endpoint_service_id = attributes[:'endpoint_service_id'] if attributes[:'endpoint_service_id']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.vcn_id = attributes[:'vcnId'] if attributes[:'vcnId']

      raise 'You cannot provide both :vcnId and :vcn_id' if attributes.key?(:'vcnId') && attributes.key?(:'vcn_id')

      self.vcn_id = attributes[:'vcn_id'] if attributes[:'vcn_id']

      self.subnet_id = attributes[:'subnetId'] if attributes[:'subnetId']

      raise 'You cannot provide both :subnetId and :subnet_id' if attributes.key?(:'subnetId') && attributes.key?(:'subnet_id')

      self.subnet_id = attributes[:'subnet_id'] if attributes[:'subnet_id']

      self.private_endpoint_vnic_id = attributes[:'privateEndpointVnicId'] if attributes[:'privateEndpointVnicId']

      raise 'You cannot provide both :privateEndpointVnicId and :private_endpoint_vnic_id' if attributes.key?(:'privateEndpointVnicId') && attributes.key?(:'private_endpoint_vnic_id')

      self.private_endpoint_vnic_id = attributes[:'private_endpoint_vnic_id'] if attributes[:'private_endpoint_vnic_id']

      self.private_endpoint_ip = attributes[:'privateEndpointIp'] if attributes[:'privateEndpointIp']

      raise 'You cannot provide both :privateEndpointIp and :private_endpoint_ip' if attributes.key?(:'privateEndpointIp') && attributes.key?(:'private_endpoint_ip')

      self.private_endpoint_ip = attributes[:'private_endpoint_ip'] if attributes[:'private_endpoint_ip']

      self.endpoint_fqdn = attributes[:'endpointFqdn'] if attributes[:'endpointFqdn']

      raise 'You cannot provide both :endpointFqdn and :endpoint_fqdn' if attributes.key?(:'endpointFqdn') && attributes.key?(:'endpoint_fqdn')

      self.endpoint_fqdn = attributes[:'endpoint_fqdn'] if attributes[:'endpoint_fqdn']

      self.additional_fqdns = attributes[:'additionalFqdns'] if attributes[:'additionalFqdns']

      raise 'You cannot provide both :additionalFqdns and :additional_fqdns' if attributes.key?(:'additionalFqdns') && attributes.key?(:'additional_fqdns')

      self.additional_fqdns = attributes[:'additional_fqdns'] if attributes[:'additional_fqdns']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.nsg_ids = attributes[:'nsgIds'] if attributes[:'nsgIds']

      raise 'You cannot provide both :nsgIds and :nsg_ids' if attributes.key?(:'nsgIds') && attributes.key?(:'nsg_ids')

      self.nsg_ids = attributes[:'nsg_ids'] if attributes[:'nsg_ids']

      self.reverse_connection_configuration = attributes[:'reverseConnectionConfiguration'] if attributes[:'reverseConnectionConfiguration']

      raise 'You cannot provide both :reverseConnectionConfiguration and :reverse_connection_configuration' if attributes.key?(:'reverseConnectionConfiguration') && attributes.key?(:'reverse_connection_configuration')

      self.reverse_connection_configuration = attributes[:'reverse_connection_configuration'] if attributes[:'reverse_connection_configuration']
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
        compartment_id == other.compartment_id &&
        defined_tags == other.defined_tags &&
        freeform_tags == other.freeform_tags &&
        system_tags == other.system_tags &&
        display_name == other.display_name &&
        description == other.description &&
        id == other.id &&
        endpoint_service_id == other.endpoint_service_id &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        vcn_id == other.vcn_id &&
        subnet_id == other.subnet_id &&
        private_endpoint_vnic_id == other.private_endpoint_vnic_id &&
        private_endpoint_ip == other.private_endpoint_ip &&
        endpoint_fqdn == other.endpoint_fqdn &&
        additional_fqdns == other.additional_fqdns &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        nsg_ids == other.nsg_ids &&
        reverse_connection_configuration == other.reverse_connection_configuration
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
      [compartment_id, defined_tags, freeform_tags, system_tags, display_name, description, id, endpoint_service_id, time_created, time_updated, vcn_id, subnet_id, private_endpoint_vnic_id, private_endpoint_ip, endpoint_fqdn, additional_fqdns, lifecycle_state, lifecycle_details, nsg_ids, reverse_connection_configuration].hash
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
