# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # CreateVirtualCircuitDetails model.
  class Core::Models::CreateVirtualCircuitDetails
    ROUTING_POLICY_ENUM = [
      ROUTING_POLICY_ORACLE_SERVICE_NETWORK = 'ORACLE_SERVICE_NETWORK'.freeze,
      ROUTING_POLICY_REGIONAL = 'REGIONAL'.freeze,
      ROUTING_POLICY_MARKET_LEVEL = 'MARKET_LEVEL'.freeze,
      ROUTING_POLICY_GLOBAL = 'GLOBAL'.freeze
    ].freeze

    BGP_ADMIN_STATE_ENUM = [
      BGP_ADMIN_STATE_ENABLED = 'ENABLED'.freeze,
      BGP_ADMIN_STATE_DISABLED = 'DISABLED'.freeze
    ].freeze

    TYPE_ENUM = [
      TYPE_PUBLIC = 'PUBLIC'.freeze,
      TYPE_PRIVATE = 'PRIVATE'.freeze
    ].freeze

    IP_MTU_ENUM = [
      IP_MTU_MTU_1500 = 'MTU_1500'.freeze,
      IP_MTU_MTU_9000 = 'MTU_9000'.freeze
    ].freeze

    # The provisioned data rate of the connection. To get a list of the
    # available bandwidth levels (that is, shapes), see
    # {#list_fast_connect_provider_virtual_circuit_bandwidth_shapes list_fast_connect_provider_virtual_circuit_bandwidth_shapes}.
    #
    # Example: `10 Gbps`
    #
    # @return [String]
    attr_accessor :bandwidth_shape_name

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment to contain the virtual circuit.
    #
    # @return [String]
    attr_accessor :compartment_id

    # Create a `CrossConnectMapping` for each cross-connect or cross-connect
    # group this virtual circuit will run on.
    #
    # @return [Array<OCI::Core::Models::CrossConnectMapping>]
    attr_accessor :cross_connect_mappings

    # The routing policy sets how routing information about the Oracle cloud is shared over a public virtual circuit.
    # Policies available are: `ORACLE_SERVICE_NETWORK`, `REGIONAL`, `MARKET_LEVEL`, and `GLOBAL`.
    # See [Route Filtering](https://docs.cloud.oracle.com/iaas/Content/Network/Concepts/routingonprem.htm#route_filtering) for details.
    # By default, routing information is shared for all routes in the same market.
    #
    # @return [Array<String>]
    attr_reader :routing_policy

    # Set to `ENABLED` (the default) to activate the BGP session of the virtual circuit, set to `DISABLED` to deactivate the virtual circuit.
    #
    # @return [String]
    attr_reader :bgp_admin_state

    # Set to `true` to enable BFD for IPv4 BGP peering, or set to `false` to disable BFD. If this is not set, the default is `false`.
    #
    # @return [BOOLEAN]
    attr_accessor :is_bfd_enabled

    # Deprecated. Instead use `customerAsn`.
    # If you specify values for both, the request will be rejected.
    #
    # @return [Integer]
    attr_accessor :customer_bgp_asn

    # Your BGP ASN (either public or private). Provide this value only if
    # there's a BGP session that goes from your edge router to Oracle.
    # Otherwise, leave this empty or null.
    # Can be a 2-byte or 4-byte ASN. Uses \"asplain\" format.
    #
    # Example: `12345` (2-byte) or `1587232876` (4-byte)
    #
    # @return [Integer]
    attr_accessor :customer_asn

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

    # Free-form tags for this resource. Each tag is a simple key-value pair with no
    # predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # For private virtual circuits only. The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the {Drg}
    # that this virtual circuit uses.
    #
    # @return [String]
    attr_accessor :gateway_id

    # Deprecated. Instead use `providerServiceId`.
    # To get a list of the provider names, see
    # {#list_fast_connect_provider_services list_fast_connect_provider_services}.
    #
    # @return [String]
    attr_accessor :provider_name

    # The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the service offered by the provider (if you're connecting
    # via a provider). To get a list of the available service offerings, see
    # {#list_fast_connect_provider_services list_fast_connect_provider_services}.
    #
    # @return [String]
    attr_accessor :provider_service_id

    # The service key name offered by the provider (if the customer is connecting via a provider).
    #
    # @return [String]
    attr_accessor :provider_service_key_name

    # Deprecated. Instead use `providerServiceId`.
    # To get a list of the provider names, see
    # {#list_fast_connect_provider_services list_fast_connect_provider_services}.
    #
    # @return [String]
    attr_accessor :provider_service_name

    # For a public virtual circuit. The public IP prefixes (CIDRs) the customer wants to
    # advertise across the connection.
    #
    # @return [Array<OCI::Core::Models::CreateVirtualCircuitPublicPrefixDetails>]
    attr_accessor :public_prefixes

    # The Oracle Cloud Infrastructure region where this virtual
    # circuit is located.
    # Example: `phx`
    #
    # @return [String]
    attr_accessor :region

    # **[Required]** The type of IP addresses used in this virtual circuit. PRIVATE
    # means [RFC 1918](https://tools.ietf.org/html/rfc1918) addresses
    # (10.0.0.0/8, 172.16/12, and 192.168/16).
    #
    # @return [String]
    attr_reader :type

    # The layer 3 IP MTU to use with this virtual circuit.
    # @return [String]
    attr_reader :ip_mtu

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'bandwidth_shape_name': :'bandwidthShapeName',
        'compartment_id': :'compartmentId',
        'cross_connect_mappings': :'crossConnectMappings',
        'routing_policy': :'routingPolicy',
        'bgp_admin_state': :'bgpAdminState',
        'is_bfd_enabled': :'isBfdEnabled',
        'customer_bgp_asn': :'customerBgpAsn',
        'customer_asn': :'customerAsn',
        'defined_tags': :'definedTags',
        'display_name': :'displayName',
        'freeform_tags': :'freeformTags',
        'gateway_id': :'gatewayId',
        'provider_name': :'providerName',
        'provider_service_id': :'providerServiceId',
        'provider_service_key_name': :'providerServiceKeyName',
        'provider_service_name': :'providerServiceName',
        'public_prefixes': :'publicPrefixes',
        'region': :'region',
        'type': :'type',
        'ip_mtu': :'ipMtu'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'bandwidth_shape_name': :'String',
        'compartment_id': :'String',
        'cross_connect_mappings': :'Array<OCI::Core::Models::CrossConnectMapping>',
        'routing_policy': :'Array<String>',
        'bgp_admin_state': :'String',
        'is_bfd_enabled': :'BOOLEAN',
        'customer_bgp_asn': :'Integer',
        'customer_asn': :'Integer',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'display_name': :'String',
        'freeform_tags': :'Hash<String, String>',
        'gateway_id': :'String',
        'provider_name': :'String',
        'provider_service_id': :'String',
        'provider_service_key_name': :'String',
        'provider_service_name': :'String',
        'public_prefixes': :'Array<OCI::Core::Models::CreateVirtualCircuitPublicPrefixDetails>',
        'region': :'String',
        'type': :'String',
        'ip_mtu': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :bandwidth_shape_name The value to assign to the {#bandwidth_shape_name} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [Array<OCI::Core::Models::CrossConnectMapping>] :cross_connect_mappings The value to assign to the {#cross_connect_mappings} property
    # @option attributes [Array<String>] :routing_policy The value to assign to the {#routing_policy} property
    # @option attributes [String] :bgp_admin_state The value to assign to the {#bgp_admin_state} property
    # @option attributes [BOOLEAN] :is_bfd_enabled The value to assign to the {#is_bfd_enabled} property
    # @option attributes [Integer] :customer_bgp_asn The value to assign to the {#customer_bgp_asn} property
    # @option attributes [Integer] :customer_asn The value to assign to the {#customer_asn} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [String] :gateway_id The value to assign to the {#gateway_id} property
    # @option attributes [String] :provider_name The value to assign to the {#provider_name} property
    # @option attributes [String] :provider_service_id The value to assign to the {#provider_service_id} property
    # @option attributes [String] :provider_service_key_name The value to assign to the {#provider_service_key_name} property
    # @option attributes [String] :provider_service_name The value to assign to the {#provider_service_name} property
    # @option attributes [Array<OCI::Core::Models::CreateVirtualCircuitPublicPrefixDetails>] :public_prefixes The value to assign to the {#public_prefixes} property
    # @option attributes [String] :region The value to assign to the {#region} property
    # @option attributes [String] :type The value to assign to the {#type} property
    # @option attributes [String] :ip_mtu The value to assign to the {#ip_mtu} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.bandwidth_shape_name = attributes[:'bandwidthShapeName'] if attributes[:'bandwidthShapeName']

      raise 'You cannot provide both :bandwidthShapeName and :bandwidth_shape_name' if attributes.key?(:'bandwidthShapeName') && attributes.key?(:'bandwidth_shape_name')

      self.bandwidth_shape_name = attributes[:'bandwidth_shape_name'] if attributes[:'bandwidth_shape_name']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.cross_connect_mappings = attributes[:'crossConnectMappings'] if attributes[:'crossConnectMappings']

      raise 'You cannot provide both :crossConnectMappings and :cross_connect_mappings' if attributes.key?(:'crossConnectMappings') && attributes.key?(:'cross_connect_mappings')

      self.cross_connect_mappings = attributes[:'cross_connect_mappings'] if attributes[:'cross_connect_mappings']

      self.routing_policy = attributes[:'routingPolicy'] if attributes[:'routingPolicy']

      raise 'You cannot provide both :routingPolicy and :routing_policy' if attributes.key?(:'routingPolicy') && attributes.key?(:'routing_policy')

      self.routing_policy = attributes[:'routing_policy'] if attributes[:'routing_policy']

      self.bgp_admin_state = attributes[:'bgpAdminState'] if attributes[:'bgpAdminState']

      raise 'You cannot provide both :bgpAdminState and :bgp_admin_state' if attributes.key?(:'bgpAdminState') && attributes.key?(:'bgp_admin_state')

      self.bgp_admin_state = attributes[:'bgp_admin_state'] if attributes[:'bgp_admin_state']

      self.is_bfd_enabled = attributes[:'isBfdEnabled'] unless attributes[:'isBfdEnabled'].nil?
      self.is_bfd_enabled = false if is_bfd_enabled.nil? && !attributes.key?(:'isBfdEnabled') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isBfdEnabled and :is_bfd_enabled' if attributes.key?(:'isBfdEnabled') && attributes.key?(:'is_bfd_enabled')

      self.is_bfd_enabled = attributes[:'is_bfd_enabled'] unless attributes[:'is_bfd_enabled'].nil?
      self.is_bfd_enabled = false if is_bfd_enabled.nil? && !attributes.key?(:'isBfdEnabled') && !attributes.key?(:'is_bfd_enabled') # rubocop:disable Style/StringLiterals

      self.customer_bgp_asn = attributes[:'customerBgpAsn'] if attributes[:'customerBgpAsn']

      raise 'You cannot provide both :customerBgpAsn and :customer_bgp_asn' if attributes.key?(:'customerBgpAsn') && attributes.key?(:'customer_bgp_asn')

      self.customer_bgp_asn = attributes[:'customer_bgp_asn'] if attributes[:'customer_bgp_asn']

      self.customer_asn = attributes[:'customerAsn'] if attributes[:'customerAsn']

      raise 'You cannot provide both :customerAsn and :customer_asn' if attributes.key?(:'customerAsn') && attributes.key?(:'customer_asn')

      self.customer_asn = attributes[:'customer_asn'] if attributes[:'customer_asn']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.gateway_id = attributes[:'gatewayId'] if attributes[:'gatewayId']

      raise 'You cannot provide both :gatewayId and :gateway_id' if attributes.key?(:'gatewayId') && attributes.key?(:'gateway_id')

      self.gateway_id = attributes[:'gateway_id'] if attributes[:'gateway_id']

      self.provider_name = attributes[:'providerName'] if attributes[:'providerName']

      raise 'You cannot provide both :providerName and :provider_name' if attributes.key?(:'providerName') && attributes.key?(:'provider_name')

      self.provider_name = attributes[:'provider_name'] if attributes[:'provider_name']

      self.provider_service_id = attributes[:'providerServiceId'] if attributes[:'providerServiceId']

      raise 'You cannot provide both :providerServiceId and :provider_service_id' if attributes.key?(:'providerServiceId') && attributes.key?(:'provider_service_id')

      self.provider_service_id = attributes[:'provider_service_id'] if attributes[:'provider_service_id']

      self.provider_service_key_name = attributes[:'providerServiceKeyName'] if attributes[:'providerServiceKeyName']

      raise 'You cannot provide both :providerServiceKeyName and :provider_service_key_name' if attributes.key?(:'providerServiceKeyName') && attributes.key?(:'provider_service_key_name')

      self.provider_service_key_name = attributes[:'provider_service_key_name'] if attributes[:'provider_service_key_name']

      self.provider_service_name = attributes[:'providerServiceName'] if attributes[:'providerServiceName']

      raise 'You cannot provide both :providerServiceName and :provider_service_name' if attributes.key?(:'providerServiceName') && attributes.key?(:'provider_service_name')

      self.provider_service_name = attributes[:'provider_service_name'] if attributes[:'provider_service_name']

      self.public_prefixes = attributes[:'publicPrefixes'] if attributes[:'publicPrefixes']

      raise 'You cannot provide both :publicPrefixes and :public_prefixes' if attributes.key?(:'publicPrefixes') && attributes.key?(:'public_prefixes')

      self.public_prefixes = attributes[:'public_prefixes'] if attributes[:'public_prefixes']

      self.region = attributes[:'region'] if attributes[:'region']

      self.type = attributes[:'type'] if attributes[:'type']

      self.ip_mtu = attributes[:'ipMtu'] if attributes[:'ipMtu']

      raise 'You cannot provide both :ipMtu and :ip_mtu' if attributes.key?(:'ipMtu') && attributes.key?(:'ip_mtu')

      self.ip_mtu = attributes[:'ip_mtu'] if attributes[:'ip_mtu']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] routing_policy Object to be assigned
    def routing_policy=(routing_policy)
      # rubocop:disable Style/ConditionalAssignment
      if routing_policy.nil?
        @routing_policy = nil
      else
        routing_policy.each do |item|
          raise "Invalid value for 'routing_policy': this must be one of the values in ROUTING_POLICY_ENUM." unless ROUTING_POLICY_ENUM.include?(item)
        end
        @routing_policy = routing_policy
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] bgp_admin_state Object to be assigned
    def bgp_admin_state=(bgp_admin_state)
      raise "Invalid value for 'bgp_admin_state': this must be one of the values in BGP_ADMIN_STATE_ENUM." if bgp_admin_state && !BGP_ADMIN_STATE_ENUM.include?(bgp_admin_state)

      @bgp_admin_state = bgp_admin_state
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] type Object to be assigned
    def type=(type)
      raise "Invalid value for 'type': this must be one of the values in TYPE_ENUM." if type && !TYPE_ENUM.include?(type)

      @type = type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] ip_mtu Object to be assigned
    def ip_mtu=(ip_mtu)
      raise "Invalid value for 'ip_mtu': this must be one of the values in IP_MTU_ENUM." if ip_mtu && !IP_MTU_ENUM.include?(ip_mtu)

      @ip_mtu = ip_mtu
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        bandwidth_shape_name == other.bandwidth_shape_name &&
        compartment_id == other.compartment_id &&
        cross_connect_mappings == other.cross_connect_mappings &&
        routing_policy == other.routing_policy &&
        bgp_admin_state == other.bgp_admin_state &&
        is_bfd_enabled == other.is_bfd_enabled &&
        customer_bgp_asn == other.customer_bgp_asn &&
        customer_asn == other.customer_asn &&
        defined_tags == other.defined_tags &&
        display_name == other.display_name &&
        freeform_tags == other.freeform_tags &&
        gateway_id == other.gateway_id &&
        provider_name == other.provider_name &&
        provider_service_id == other.provider_service_id &&
        provider_service_key_name == other.provider_service_key_name &&
        provider_service_name == other.provider_service_name &&
        public_prefixes == other.public_prefixes &&
        region == other.region &&
        type == other.type &&
        ip_mtu == other.ip_mtu
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
      [bandwidth_shape_name, compartment_id, cross_connect_mappings, routing_policy, bgp_admin_state, is_bfd_enabled, customer_bgp_asn, customer_asn, defined_tags, display_name, freeform_tags, gateway_id, provider_name, provider_service_id, provider_service_key_name, provider_service_name, public_prefixes, region, type, ip_mtu].hash
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