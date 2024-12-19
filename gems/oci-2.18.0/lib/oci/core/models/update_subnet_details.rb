# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # UpdateSubnetDetails model.
  class Core::Models::UpdateSubnetDetails
    # Defined tags for this resource. Each key is predefined and scoped to a
    # namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the set of DHCP options the subnet will use.
    #
    # @return [String]
    attr_accessor :dhcp_options_id

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

    # The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the route table the subnet will use.
    #
    # @return [String]
    attr_accessor :route_table_id

    # The OCIDs of the security list or lists the subnet will use. This
    # replaces the entire current set of security lists. Remember that
    # security lists are associated *with the subnet*, but the rules are
    # applied to the individual VNICs in the subnet.
    #
    # @return [Array<String>]
    attr_accessor :security_list_ids

    # The CIDR block of the subnet. The new CIDR block must meet the following criteria:
    #
    # - Must be valid.
    # - The CIDR block's IP range must be completely within one of the VCN's CIDR block ranges.
    # - The old and new CIDR block ranges must use the same network address. Example: `10.0.0.0/25` and `10.0.0.0/24`.
    # - Must contain all IP addresses in use in the old CIDR range.
    # - The new CIDR range's broadcast address (last IP address of CIDR range) must not be an IP address in use in the old CIDR range.
    #
    # **Note:** If you are changing the CIDR block, you cannot create VNICs or private IPs for this resource while the update is in progress.
    #
    # Example: `172.16.0.0/16`
    #
    # @return [String]
    attr_accessor :cidr_block

    # This is the IPv6 CIDR block for the subnet's IP address space.
    # The subnet size is always /64.
    # See [IPv6 Addresses](https://docs.cloud.oracle.com/iaas/Content/Network/Concepts/ipv6.htm).
    # The provided CIDR must maintain the following rules -
    #
    # a. The IPv6 CIDR block is valid and correctly formatted.
    # b. The IPv6 CIDR is within the parent VCN IPv6 range.
    #
    # Example: `2001:0db8:0123:1111::/64`
    #
    # @return [String]
    attr_accessor :ipv6_cidr_block

    # The list of all IPv6 CIDR blocks (Oracle allocated IPv6 GUA, ULA or private IPv6 CIDR blocks, BYOIPv6 CIDR blocks) for the subnet that meets the following criteria:
    # - The CIDR blocks must be valid.
    # - Multiple CIDR blocks must not overlap each other or the on-premises network CIDR block.
    # - The number of CIDR blocks must not exceed the limit of IPv6 CIDR blocks allowed to a subnet.
    #
    # @return [Array<String>]
    attr_accessor :ipv6_cidr_blocks

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'defined_tags': :'definedTags',
        'dhcp_options_id': :'dhcpOptionsId',
        'display_name': :'displayName',
        'freeform_tags': :'freeformTags',
        'route_table_id': :'routeTableId',
        'security_list_ids': :'securityListIds',
        'cidr_block': :'cidrBlock',
        'ipv6_cidr_block': :'ipv6CidrBlock',
        'ipv6_cidr_blocks': :'ipv6CidrBlocks'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'dhcp_options_id': :'String',
        'display_name': :'String',
        'freeform_tags': :'Hash<String, String>',
        'route_table_id': :'String',
        'security_list_ids': :'Array<String>',
        'cidr_block': :'String',
        'ipv6_cidr_block': :'String',
        'ipv6_cidr_blocks': :'Array<String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :dhcp_options_id The value to assign to the {#dhcp_options_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [String] :route_table_id The value to assign to the {#route_table_id} property
    # @option attributes [Array<String>] :security_list_ids The value to assign to the {#security_list_ids} property
    # @option attributes [String] :cidr_block The value to assign to the {#cidr_block} property
    # @option attributes [String] :ipv6_cidr_block The value to assign to the {#ipv6_cidr_block} property
    # @option attributes [Array<String>] :ipv6_cidr_blocks The value to assign to the {#ipv6_cidr_blocks} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.dhcp_options_id = attributes[:'dhcpOptionsId'] if attributes[:'dhcpOptionsId']

      raise 'You cannot provide both :dhcpOptionsId and :dhcp_options_id' if attributes.key?(:'dhcpOptionsId') && attributes.key?(:'dhcp_options_id')

      self.dhcp_options_id = attributes[:'dhcp_options_id'] if attributes[:'dhcp_options_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.route_table_id = attributes[:'routeTableId'] if attributes[:'routeTableId']

      raise 'You cannot provide both :routeTableId and :route_table_id' if attributes.key?(:'routeTableId') && attributes.key?(:'route_table_id')

      self.route_table_id = attributes[:'route_table_id'] if attributes[:'route_table_id']

      self.security_list_ids = attributes[:'securityListIds'] if attributes[:'securityListIds']

      raise 'You cannot provide both :securityListIds and :security_list_ids' if attributes.key?(:'securityListIds') && attributes.key?(:'security_list_ids')

      self.security_list_ids = attributes[:'security_list_ids'] if attributes[:'security_list_ids']

      self.cidr_block = attributes[:'cidrBlock'] if attributes[:'cidrBlock']

      raise 'You cannot provide both :cidrBlock and :cidr_block' if attributes.key?(:'cidrBlock') && attributes.key?(:'cidr_block')

      self.cidr_block = attributes[:'cidr_block'] if attributes[:'cidr_block']

      self.ipv6_cidr_block = attributes[:'ipv6CidrBlock'] if attributes[:'ipv6CidrBlock']

      raise 'You cannot provide both :ipv6CidrBlock and :ipv6_cidr_block' if attributes.key?(:'ipv6CidrBlock') && attributes.key?(:'ipv6_cidr_block')

      self.ipv6_cidr_block = attributes[:'ipv6_cidr_block'] if attributes[:'ipv6_cidr_block']

      self.ipv6_cidr_blocks = attributes[:'ipv6CidrBlocks'] if attributes[:'ipv6CidrBlocks']

      raise 'You cannot provide both :ipv6CidrBlocks and :ipv6_cidr_blocks' if attributes.key?(:'ipv6CidrBlocks') && attributes.key?(:'ipv6_cidr_blocks')

      self.ipv6_cidr_blocks = attributes[:'ipv6_cidr_blocks'] if attributes[:'ipv6_cidr_blocks']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        defined_tags == other.defined_tags &&
        dhcp_options_id == other.dhcp_options_id &&
        display_name == other.display_name &&
        freeform_tags == other.freeform_tags &&
        route_table_id == other.route_table_id &&
        security_list_ids == other.security_list_ids &&
        cidr_block == other.cidr_block &&
        ipv6_cidr_block == other.ipv6_cidr_block &&
        ipv6_cidr_blocks == other.ipv6_cidr_blocks
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
      [defined_tags, dhcp_options_id, display_name, freeform_tags, route_table_id, security_list_ids, cidr_block, ipv6_cidr_block, ipv6_cidr_blocks].hash
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