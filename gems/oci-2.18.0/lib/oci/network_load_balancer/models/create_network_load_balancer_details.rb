# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The properties that define a network load balancer. For more information, see
  # [Managing a network load balancer](https://docs.cloud.oracle.com/Content/Balance/Tasks/managingloadbalancer.htm).
  #
  # To use any of the API operations, you must be authorized in an IAM policy. If you are not authorized, then
  # contact an administrator. If you are an administrator who writes policies to give users access, then see
  # [Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).
  #
  # For information about endpoints and signing API requests, see
  # [About the API](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm). For information about available SDKs and tools, see
  # [SDKS and Other Tools](https://docs.cloud.oracle.com/Content/API/Concepts/sdks.htm).
  #
  class NetworkLoadBalancer::Models::CreateNetworkLoadBalancerDetails
    NLB_IP_VERSION_ENUM = [
      NLB_IP_VERSION_IPV4 = 'IPV4'.freeze,
      NLB_IP_VERSION_IPV4_AND_IPV6 = 'IPV4_AND_IPV6'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment containing the network load balancer.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** Network load balancer identifier, which can be renamed.
    # @return [String]
    attr_accessor :display_name

    # This parameter can be enabled only if backends are compute OCIDs. When enabled, the skipSourceDestinationCheck parameter is automatically
    # enabled on the load balancer VNIC, and packets are sent to the backend with the entire IP header intact.
    #
    # @return [BOOLEAN]
    attr_accessor :is_preserve_source_destination

    # An array of reserved Ips.
    #
    # @return [Array<OCI::NetworkLoadBalancer::Models::ReservedIP>]
    attr_accessor :reserved_ips

    # Whether the network load balancer has a virtual cloud network-local (private) IP address.
    #
    # If \"true\", then the service assigns a private IP address to the network load balancer.
    #
    # If \"false\", then the service assigns a public IP address to the network load balancer.
    #
    # A public network load balancer is accessible from the internet, depending on the
    # [security list rules](https://docs.cloud.oracle.com/Content/network/Concepts/securitylists.htm) for your virtual cloud network. For more information about public and
    # private network load balancers,
    # see [How Network Load Balancing Works](https://docs.cloud.oracle.com/Content/Balance/Concepts/balanceoverview.htm#how-network-load-balancing-works).
    # This value is true by default.
    #
    # Example: `true`
    #
    # @return [BOOLEAN]
    attr_accessor :is_private

    # **[Required]** The subnet in which the network load balancer is spawned [OCIDs](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @return [String]
    attr_accessor :subnet_id

    # An array of network security groups [OCIDs](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) associated with the network load
    # balancer.
    #
    # During the creation of the network load balancer, the service adds the new load balancer to the specified network security groups.
    #
    # The benefits of associating the network load balancer with network security groups include:
    #
    # *  Network security groups define network security rules to govern ingress and egress traffic for the network load balancer.
    #
    # *  The network security rules of other resources can reference the network security groups associated with the network load balancer
    #    to ensure access.
    #
    # Example: [\"ocid1.nsg.oc1.phx.unique_ID\"]
    #
    # @return [Array<String>]
    attr_accessor :network_security_group_ids

    # IP version associated with the NLB.
    # @return [String]
    attr_reader :nlb_ip_version

    # Listeners associated with the network load balancer.
    # @return [Hash<String, OCI::NetworkLoadBalancer::Models::ListenerDetails>]
    attr_accessor :listeners

    # Backend sets associated with the network load balancer.
    # @return [Hash<String, OCI::NetworkLoadBalancer::Models::BackendSetDetails>]
    attr_accessor :backend_sets

    # Simple key-value pair that is applied without any predefined name, type, or scope. Exists for cross-compatibility only.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'compartmentId',
        'display_name': :'displayName',
        'is_preserve_source_destination': :'isPreserveSourceDestination',
        'reserved_ips': :'reservedIps',
        'is_private': :'isPrivate',
        'subnet_id': :'subnetId',
        'network_security_group_ids': :'networkSecurityGroupIds',
        'nlb_ip_version': :'nlbIpVersion',
        'listeners': :'listeners',
        'backend_sets': :'backendSets',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'String',
        'display_name': :'String',
        'is_preserve_source_destination': :'BOOLEAN',
        'reserved_ips': :'Array<OCI::NetworkLoadBalancer::Models::ReservedIP>',
        'is_private': :'BOOLEAN',
        'subnet_id': :'String',
        'network_security_group_ids': :'Array<String>',
        'nlb_ip_version': :'String',
        'listeners': :'Hash<String, OCI::NetworkLoadBalancer::Models::ListenerDetails>',
        'backend_sets': :'Hash<String, OCI::NetworkLoadBalancer::Models::BackendSetDetails>',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [BOOLEAN] :is_preserve_source_destination The value to assign to the {#is_preserve_source_destination} property
    # @option attributes [Array<OCI::NetworkLoadBalancer::Models::ReservedIP>] :reserved_ips The value to assign to the {#reserved_ips} property
    # @option attributes [BOOLEAN] :is_private The value to assign to the {#is_private} property
    # @option attributes [String] :subnet_id The value to assign to the {#subnet_id} property
    # @option attributes [Array<String>] :network_security_group_ids The value to assign to the {#network_security_group_ids} property
    # @option attributes [String] :nlb_ip_version The value to assign to the {#nlb_ip_version} property
    # @option attributes [Hash<String, OCI::NetworkLoadBalancer::Models::ListenerDetails>] :listeners The value to assign to the {#listeners} property
    # @option attributes [Hash<String, OCI::NetworkLoadBalancer::Models::BackendSetDetails>] :backend_sets The value to assign to the {#backend_sets} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.is_preserve_source_destination = attributes[:'isPreserveSourceDestination'] unless attributes[:'isPreserveSourceDestination'].nil?
      self.is_preserve_source_destination = false if is_preserve_source_destination.nil? && !attributes.key?(:'isPreserveSourceDestination') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isPreserveSourceDestination and :is_preserve_source_destination' if attributes.key?(:'isPreserveSourceDestination') && attributes.key?(:'is_preserve_source_destination')

      self.is_preserve_source_destination = attributes[:'is_preserve_source_destination'] unless attributes[:'is_preserve_source_destination'].nil?
      self.is_preserve_source_destination = false if is_preserve_source_destination.nil? && !attributes.key?(:'isPreserveSourceDestination') && !attributes.key?(:'is_preserve_source_destination') # rubocop:disable Style/StringLiterals

      self.reserved_ips = attributes[:'reservedIps'] if attributes[:'reservedIps']

      raise 'You cannot provide both :reservedIps and :reserved_ips' if attributes.key?(:'reservedIps') && attributes.key?(:'reserved_ips')

      self.reserved_ips = attributes[:'reserved_ips'] if attributes[:'reserved_ips']

      self.is_private = attributes[:'isPrivate'] unless attributes[:'isPrivate'].nil?
      self.is_private = true if is_private.nil? && !attributes.key?(:'isPrivate') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isPrivate and :is_private' if attributes.key?(:'isPrivate') && attributes.key?(:'is_private')

      self.is_private = attributes[:'is_private'] unless attributes[:'is_private'].nil?
      self.is_private = true if is_private.nil? && !attributes.key?(:'isPrivate') && !attributes.key?(:'is_private') # rubocop:disable Style/StringLiterals

      self.subnet_id = attributes[:'subnetId'] if attributes[:'subnetId']

      raise 'You cannot provide both :subnetId and :subnet_id' if attributes.key?(:'subnetId') && attributes.key?(:'subnet_id')

      self.subnet_id = attributes[:'subnet_id'] if attributes[:'subnet_id']

      self.network_security_group_ids = attributes[:'networkSecurityGroupIds'] if attributes[:'networkSecurityGroupIds']

      raise 'You cannot provide both :networkSecurityGroupIds and :network_security_group_ids' if attributes.key?(:'networkSecurityGroupIds') && attributes.key?(:'network_security_group_ids')

      self.network_security_group_ids = attributes[:'network_security_group_ids'] if attributes[:'network_security_group_ids']

      self.nlb_ip_version = attributes[:'nlbIpVersion'] if attributes[:'nlbIpVersion']
      self.nlb_ip_version = "IPV4" if nlb_ip_version.nil? && !attributes.key?(:'nlbIpVersion') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :nlbIpVersion and :nlb_ip_version' if attributes.key?(:'nlbIpVersion') && attributes.key?(:'nlb_ip_version')

      self.nlb_ip_version = attributes[:'nlb_ip_version'] if attributes[:'nlb_ip_version']
      self.nlb_ip_version = "IPV4" if nlb_ip_version.nil? && !attributes.key?(:'nlbIpVersion') && !attributes.key?(:'nlb_ip_version') # rubocop:disable Style/StringLiterals

      self.listeners = attributes[:'listeners'] if attributes[:'listeners']

      self.backend_sets = attributes[:'backendSets'] if attributes[:'backendSets']

      raise 'You cannot provide both :backendSets and :backend_sets' if attributes.key?(:'backendSets') && attributes.key?(:'backend_sets')

      self.backend_sets = attributes[:'backend_sets'] if attributes[:'backend_sets']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] nlb_ip_version Object to be assigned
    def nlb_ip_version=(nlb_ip_version)
      raise "Invalid value for 'nlb_ip_version': this must be one of the values in NLB_IP_VERSION_ENUM." if nlb_ip_version && !NLB_IP_VERSION_ENUM.include?(nlb_ip_version)

      @nlb_ip_version = nlb_ip_version
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        compartment_id == other.compartment_id &&
        display_name == other.display_name &&
        is_preserve_source_destination == other.is_preserve_source_destination &&
        reserved_ips == other.reserved_ips &&
        is_private == other.is_private &&
        subnet_id == other.subnet_id &&
        network_security_group_ids == other.network_security_group_ids &&
        nlb_ip_version == other.nlb_ip_version &&
        listeners == other.listeners &&
        backend_sets == other.backend_sets &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags
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
      [compartment_id, display_name, is_preserve_source_destination, reserved_ips, is_private, subnet_id, network_security_group_ids, nlb_ip_version, listeners, backend_sets, freeform_tags, defined_tags].hash
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
