# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The SDDC information to be updated.
  #
  # **Important:** Only the `displayName`, `freeFormTags`, and `definedTags` attributes
  # affect the existing SDDC. Changing the other attributes affects the `Sddc` object, but not
  # the VMware environment currently running on that SDDC. Those other attributes are used
  # by the Oracle Cloud VMware Solution *only* for new ESXi hosts that you add to this
  # SDDC in the future with {#create_esxi_host create_esxi_host}.
  #
  class Ocvp::Models::UpdateSddcDetails
    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the SDDC.
    # SDDC name requirements are 1-16 character length limit, Must start with a letter, Must be English letters, numbers, - only, No repeating hyphens, Must be unique within the region.
    #
    # @return [String]
    attr_accessor :display_name

    # The version of bundled VMware software that the Oracle Cloud VMware Solution will
    # install on any new ESXi hosts that you add to this SDDC in the future.
    #
    # For the list of versions supported by the Oracle Cloud VMware Solution, see
    # {#list_supported_vmware_software_versions list_supported_vmware_software_versions}).
    #
    # @return [String]
    attr_accessor :vmware_software_version

    # One or more public SSH keys to be included in the `~/.ssh/authorized_keys` file for
    # the default user on each ESXi host, only when adding new ESXi hosts to this SDDC.
    # Use a newline character to separate multiple keys.
    # The SSH keys must be in the format required for the `authorized_keys` file.
    #
    # @return [String]
    attr_accessor :ssh_authorized_keys

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the VLAN to use for
    # the vSphere component of the VMware environment when adding new ESXi hosts to the SDDC.
    #
    # @return [String]
    attr_accessor :vsphere_vlan_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the VLAN to use for
    # the vMotion component of the VMware environment when adding new ESXi hosts to the SDDC.
    #
    # @return [String]
    attr_accessor :vmotion_vlan_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the VLAN to use for
    # the vSAN component of the VMware environment when adding new ESXi hosts to the SDDC.
    #
    # @return [String]
    attr_accessor :vsan_vlan_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the VLAN to use for
    # the NSX VTEP component of the VMware environment when adding new ESXi hosts to the SDDC.
    #
    # @return [String]
    attr_accessor :nsx_v_tep_vlan_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the VLAN to use for
    # the NSX Edge VTEP component of the VMware environment when adding new ESXi hosts to the SDDC.
    #
    # @return [String]
    attr_accessor :nsx_edge_v_tep_vlan_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the VLAN to use for
    # the NSX Edge Uplink 1 component of the VMware environment when adding new ESXi hosts to the SDDC.
    #
    # @return [String]
    attr_accessor :nsx_edge_uplink1_vlan_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the VLAN to use for
    # the NSX Edge Uplink 2 component of the VMware environment when adding new ESXi hosts to the SDDC.
    #
    # **Note:** This VLAN is reserved for future use to deploy public-facing applications on the VMware SDDC.
    #
    # @return [String]
    attr_accessor :nsx_edge_uplink2_vlan_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the VLAN used by the SDDC
    # for the vSphere Replication component of the VMware environment.
    #
    # @return [String]
    attr_accessor :replication_vlan_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the VLAN used by the SDDC
    # for the Provisioning component of the VMware environment.
    #
    # @return [String]
    attr_accessor :provisioning_vlan_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the VLAN to use for the HCX
    # component of the VMware environment when adding new ESXi hosts to the SDDC. This value can be updated only when `isHcxEnabled` is true.
    #
    # @return [String]
    attr_accessor :hcx_vlan_id

    # Free-form tags for this resource. Each tag is a simple key-value pair with no
    # predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a
    # namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'displayName',
        'vmware_software_version': :'vmwareSoftwareVersion',
        'ssh_authorized_keys': :'sshAuthorizedKeys',
        'vsphere_vlan_id': :'vsphereVlanId',
        'vmotion_vlan_id': :'vmotionVlanId',
        'vsan_vlan_id': :'vsanVlanId',
        'nsx_v_tep_vlan_id': :'nsxVTepVlanId',
        'nsx_edge_v_tep_vlan_id': :'nsxEdgeVTepVlanId',
        'nsx_edge_uplink1_vlan_id': :'nsxEdgeUplink1VlanId',
        'nsx_edge_uplink2_vlan_id': :'nsxEdgeUplink2VlanId',
        'replication_vlan_id': :'replicationVlanId',
        'provisioning_vlan_id': :'provisioningVlanId',
        'hcx_vlan_id': :'hcxVlanId',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'String',
        'vmware_software_version': :'String',
        'ssh_authorized_keys': :'String',
        'vsphere_vlan_id': :'String',
        'vmotion_vlan_id': :'String',
        'vsan_vlan_id': :'String',
        'nsx_v_tep_vlan_id': :'String',
        'nsx_edge_v_tep_vlan_id': :'String',
        'nsx_edge_uplink1_vlan_id': :'String',
        'nsx_edge_uplink2_vlan_id': :'String',
        'replication_vlan_id': :'String',
        'provisioning_vlan_id': :'String',
        'hcx_vlan_id': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :vmware_software_version The value to assign to the {#vmware_software_version} property
    # @option attributes [String] :ssh_authorized_keys The value to assign to the {#ssh_authorized_keys} property
    # @option attributes [String] :vsphere_vlan_id The value to assign to the {#vsphere_vlan_id} property
    # @option attributes [String] :vmotion_vlan_id The value to assign to the {#vmotion_vlan_id} property
    # @option attributes [String] :vsan_vlan_id The value to assign to the {#vsan_vlan_id} property
    # @option attributes [String] :nsx_v_tep_vlan_id The value to assign to the {#nsx_v_tep_vlan_id} property
    # @option attributes [String] :nsx_edge_v_tep_vlan_id The value to assign to the {#nsx_edge_v_tep_vlan_id} property
    # @option attributes [String] :nsx_edge_uplink1_vlan_id The value to assign to the {#nsx_edge_uplink1_vlan_id} property
    # @option attributes [String] :nsx_edge_uplink2_vlan_id The value to assign to the {#nsx_edge_uplink2_vlan_id} property
    # @option attributes [String] :replication_vlan_id The value to assign to the {#replication_vlan_id} property
    # @option attributes [String] :provisioning_vlan_id The value to assign to the {#provisioning_vlan_id} property
    # @option attributes [String] :hcx_vlan_id The value to assign to the {#hcx_vlan_id} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.vmware_software_version = attributes[:'vmwareSoftwareVersion'] if attributes[:'vmwareSoftwareVersion']

      raise 'You cannot provide both :vmwareSoftwareVersion and :vmware_software_version' if attributes.key?(:'vmwareSoftwareVersion') && attributes.key?(:'vmware_software_version')

      self.vmware_software_version = attributes[:'vmware_software_version'] if attributes[:'vmware_software_version']

      self.ssh_authorized_keys = attributes[:'sshAuthorizedKeys'] if attributes[:'sshAuthorizedKeys']

      raise 'You cannot provide both :sshAuthorizedKeys and :ssh_authorized_keys' if attributes.key?(:'sshAuthorizedKeys') && attributes.key?(:'ssh_authorized_keys')

      self.ssh_authorized_keys = attributes[:'ssh_authorized_keys'] if attributes[:'ssh_authorized_keys']

      self.vsphere_vlan_id = attributes[:'vsphereVlanId'] if attributes[:'vsphereVlanId']

      raise 'You cannot provide both :vsphereVlanId and :vsphere_vlan_id' if attributes.key?(:'vsphereVlanId') && attributes.key?(:'vsphere_vlan_id')

      self.vsphere_vlan_id = attributes[:'vsphere_vlan_id'] if attributes[:'vsphere_vlan_id']

      self.vmotion_vlan_id = attributes[:'vmotionVlanId'] if attributes[:'vmotionVlanId']

      raise 'You cannot provide both :vmotionVlanId and :vmotion_vlan_id' if attributes.key?(:'vmotionVlanId') && attributes.key?(:'vmotion_vlan_id')

      self.vmotion_vlan_id = attributes[:'vmotion_vlan_id'] if attributes[:'vmotion_vlan_id']

      self.vsan_vlan_id = attributes[:'vsanVlanId'] if attributes[:'vsanVlanId']

      raise 'You cannot provide both :vsanVlanId and :vsan_vlan_id' if attributes.key?(:'vsanVlanId') && attributes.key?(:'vsan_vlan_id')

      self.vsan_vlan_id = attributes[:'vsan_vlan_id'] if attributes[:'vsan_vlan_id']

      self.nsx_v_tep_vlan_id = attributes[:'nsxVTepVlanId'] if attributes[:'nsxVTepVlanId']

      raise 'You cannot provide both :nsxVTepVlanId and :nsx_v_tep_vlan_id' if attributes.key?(:'nsxVTepVlanId') && attributes.key?(:'nsx_v_tep_vlan_id')

      self.nsx_v_tep_vlan_id = attributes[:'nsx_v_tep_vlan_id'] if attributes[:'nsx_v_tep_vlan_id']

      self.nsx_edge_v_tep_vlan_id = attributes[:'nsxEdgeVTepVlanId'] if attributes[:'nsxEdgeVTepVlanId']

      raise 'You cannot provide both :nsxEdgeVTepVlanId and :nsx_edge_v_tep_vlan_id' if attributes.key?(:'nsxEdgeVTepVlanId') && attributes.key?(:'nsx_edge_v_tep_vlan_id')

      self.nsx_edge_v_tep_vlan_id = attributes[:'nsx_edge_v_tep_vlan_id'] if attributes[:'nsx_edge_v_tep_vlan_id']

      self.nsx_edge_uplink1_vlan_id = attributes[:'nsxEdgeUplink1VlanId'] if attributes[:'nsxEdgeUplink1VlanId']

      raise 'You cannot provide both :nsxEdgeUplink1VlanId and :nsx_edge_uplink1_vlan_id' if attributes.key?(:'nsxEdgeUplink1VlanId') && attributes.key?(:'nsx_edge_uplink1_vlan_id')

      self.nsx_edge_uplink1_vlan_id = attributes[:'nsx_edge_uplink1_vlan_id'] if attributes[:'nsx_edge_uplink1_vlan_id']

      self.nsx_edge_uplink2_vlan_id = attributes[:'nsxEdgeUplink2VlanId'] if attributes[:'nsxEdgeUplink2VlanId']

      raise 'You cannot provide both :nsxEdgeUplink2VlanId and :nsx_edge_uplink2_vlan_id' if attributes.key?(:'nsxEdgeUplink2VlanId') && attributes.key?(:'nsx_edge_uplink2_vlan_id')

      self.nsx_edge_uplink2_vlan_id = attributes[:'nsx_edge_uplink2_vlan_id'] if attributes[:'nsx_edge_uplink2_vlan_id']

      self.replication_vlan_id = attributes[:'replicationVlanId'] if attributes[:'replicationVlanId']

      raise 'You cannot provide both :replicationVlanId and :replication_vlan_id' if attributes.key?(:'replicationVlanId') && attributes.key?(:'replication_vlan_id')

      self.replication_vlan_id = attributes[:'replication_vlan_id'] if attributes[:'replication_vlan_id']

      self.provisioning_vlan_id = attributes[:'provisioningVlanId'] if attributes[:'provisioningVlanId']

      raise 'You cannot provide both :provisioningVlanId and :provisioning_vlan_id' if attributes.key?(:'provisioningVlanId') && attributes.key?(:'provisioning_vlan_id')

      self.provisioning_vlan_id = attributes[:'provisioning_vlan_id'] if attributes[:'provisioning_vlan_id']

      self.hcx_vlan_id = attributes[:'hcxVlanId'] if attributes[:'hcxVlanId']

      raise 'You cannot provide both :hcxVlanId and :hcx_vlan_id' if attributes.key?(:'hcxVlanId') && attributes.key?(:'hcx_vlan_id')

      self.hcx_vlan_id = attributes[:'hcx_vlan_id'] if attributes[:'hcx_vlan_id']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        display_name == other.display_name &&
        vmware_software_version == other.vmware_software_version &&
        ssh_authorized_keys == other.ssh_authorized_keys &&
        vsphere_vlan_id == other.vsphere_vlan_id &&
        vmotion_vlan_id == other.vmotion_vlan_id &&
        vsan_vlan_id == other.vsan_vlan_id &&
        nsx_v_tep_vlan_id == other.nsx_v_tep_vlan_id &&
        nsx_edge_v_tep_vlan_id == other.nsx_edge_v_tep_vlan_id &&
        nsx_edge_uplink1_vlan_id == other.nsx_edge_uplink1_vlan_id &&
        nsx_edge_uplink2_vlan_id == other.nsx_edge_uplink2_vlan_id &&
        replication_vlan_id == other.replication_vlan_id &&
        provisioning_vlan_id == other.provisioning_vlan_id &&
        hcx_vlan_id == other.hcx_vlan_id &&
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
      [display_name, vmware_software_version, ssh_authorized_keys, vsphere_vlan_id, vmotion_vlan_id, vsan_vlan_id, nsx_v_tep_vlan_id, nsx_edge_v_tep_vlan_id, nsx_edge_uplink1_vlan_id, nsx_edge_uplink2_vlan_id, replication_vlan_id, provisioning_vlan_id, hcx_vlan_id, freeform_tags, defined_tags].hash
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
