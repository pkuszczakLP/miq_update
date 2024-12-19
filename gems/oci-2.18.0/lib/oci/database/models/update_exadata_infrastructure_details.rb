# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Updates the Exadata infrastructure. Applies to Exadata Cloud@Customer instances only.
  # See {#update_cloud_exadata_infrastructure_details update_cloud_exadata_infrastructure_details} for information on updating Exadata Cloud Service cloud Exadata infrastructure resources.
  #
  class Database::Models::UpdateExadataInfrastructureDetails
    # The IP address for the first control plane server.
    # @return [String]
    attr_accessor :cloud_control_plane_server1

    # The IP address for the second control plane server.
    # @return [String]
    attr_accessor :cloud_control_plane_server2

    # The netmask for the control plane network.
    # @return [String]
    attr_accessor :netmask

    # The gateway for the control plane network.
    # @return [String]
    attr_accessor :gateway

    # The CIDR block for the Exadata administration network.
    # @return [String]
    attr_accessor :admin_network_cidr

    # The CIDR block for the Exadata InfiniBand interconnect.
    # @return [String]
    attr_accessor :infini_band_network_cidr

    # The corporate network proxy for access to the control plane network.
    # @return [String]
    attr_accessor :corporate_proxy

    # The list of contacts for the Exadata infrastructure.
    # @return [Array<OCI::Database::Models::ExadataInfrastructureContact>]
    attr_accessor :contacts

    # @return [OCI::Database::Models::MaintenanceWindow]
    attr_accessor :maintenance_window

    # The requested number of additional storage servers for the Exadata infrastructure.
    # @return [Integer]
    attr_accessor :additional_storage_count

    # The list of DNS server IP addresses. Maximum of 3 allowed.
    # @return [Array<String>]
    attr_accessor :dns_server

    # The list of NTP server IP addresses. Maximum of 3 allowed.
    # @return [Array<String>]
    attr_accessor :ntp_server

    # The time zone of the Exadata infrastructure. For details, see [Exadata Infrastructure Time Zones](https://docs.cloud.oracle.com/Content/Database/References/timezones.htm).
    #
    # @return [String]
    attr_accessor :time_zone

    # Indicates whether cps offline diagnostic report is enabled for this Exadata infrastructure. This will allow a customer to quickly check status themselves and fix problems on their end, saving time and frustration
    # for both Oracle and the customer when they find the CPS in a disconnected state.You can enable offline diagnostic report during Exadata infrastructure provisioning. You can also disable or enable it at any time
    # using the UpdateExadatainfrastructure API.
    #
    # @return [BOOLEAN]
    attr_accessor :is_cps_offline_report_enabled

    # Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'cloud_control_plane_server1': :'cloudControlPlaneServer1',
        'cloud_control_plane_server2': :'cloudControlPlaneServer2',
        'netmask': :'netmask',
        'gateway': :'gateway',
        'admin_network_cidr': :'adminNetworkCIDR',
        'infini_band_network_cidr': :'infiniBandNetworkCIDR',
        'corporate_proxy': :'corporateProxy',
        'contacts': :'contacts',
        'maintenance_window': :'maintenanceWindow',
        'additional_storage_count': :'additionalStorageCount',
        'dns_server': :'dnsServer',
        'ntp_server': :'ntpServer',
        'time_zone': :'timeZone',
        'is_cps_offline_report_enabled': :'isCpsOfflineReportEnabled',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'cloud_control_plane_server1': :'String',
        'cloud_control_plane_server2': :'String',
        'netmask': :'String',
        'gateway': :'String',
        'admin_network_cidr': :'String',
        'infini_band_network_cidr': :'String',
        'corporate_proxy': :'String',
        'contacts': :'Array<OCI::Database::Models::ExadataInfrastructureContact>',
        'maintenance_window': :'OCI::Database::Models::MaintenanceWindow',
        'additional_storage_count': :'Integer',
        'dns_server': :'Array<String>',
        'ntp_server': :'Array<String>',
        'time_zone': :'String',
        'is_cps_offline_report_enabled': :'BOOLEAN',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :cloud_control_plane_server1 The value to assign to the {#cloud_control_plane_server1} property
    # @option attributes [String] :cloud_control_plane_server2 The value to assign to the {#cloud_control_plane_server2} property
    # @option attributes [String] :netmask The value to assign to the {#netmask} property
    # @option attributes [String] :gateway The value to assign to the {#gateway} property
    # @option attributes [String] :admin_network_cidr The value to assign to the {#admin_network_cidr} property
    # @option attributes [String] :infini_band_network_cidr The value to assign to the {#infini_band_network_cidr} property
    # @option attributes [String] :corporate_proxy The value to assign to the {#corporate_proxy} property
    # @option attributes [Array<OCI::Database::Models::ExadataInfrastructureContact>] :contacts The value to assign to the {#contacts} property
    # @option attributes [OCI::Database::Models::MaintenanceWindow] :maintenance_window The value to assign to the {#maintenance_window} property
    # @option attributes [Integer] :additional_storage_count The value to assign to the {#additional_storage_count} property
    # @option attributes [Array<String>] :dns_server The value to assign to the {#dns_server} property
    # @option attributes [Array<String>] :ntp_server The value to assign to the {#ntp_server} property
    # @option attributes [String] :time_zone The value to assign to the {#time_zone} property
    # @option attributes [BOOLEAN] :is_cps_offline_report_enabled The value to assign to the {#is_cps_offline_report_enabled} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.cloud_control_plane_server1 = attributes[:'cloudControlPlaneServer1'] if attributes[:'cloudControlPlaneServer1']

      raise 'You cannot provide both :cloudControlPlaneServer1 and :cloud_control_plane_server1' if attributes.key?(:'cloudControlPlaneServer1') && attributes.key?(:'cloud_control_plane_server1')

      self.cloud_control_plane_server1 = attributes[:'cloud_control_plane_server1'] if attributes[:'cloud_control_plane_server1']

      self.cloud_control_plane_server2 = attributes[:'cloudControlPlaneServer2'] if attributes[:'cloudControlPlaneServer2']

      raise 'You cannot provide both :cloudControlPlaneServer2 and :cloud_control_plane_server2' if attributes.key?(:'cloudControlPlaneServer2') && attributes.key?(:'cloud_control_plane_server2')

      self.cloud_control_plane_server2 = attributes[:'cloud_control_plane_server2'] if attributes[:'cloud_control_plane_server2']

      self.netmask = attributes[:'netmask'] if attributes[:'netmask']

      self.gateway = attributes[:'gateway'] if attributes[:'gateway']

      self.admin_network_cidr = attributes[:'adminNetworkCIDR'] if attributes[:'adminNetworkCIDR']

      raise 'You cannot provide both :adminNetworkCIDR and :admin_network_cidr' if attributes.key?(:'adminNetworkCIDR') && attributes.key?(:'admin_network_cidr')

      self.admin_network_cidr = attributes[:'admin_network_cidr'] if attributes[:'admin_network_cidr']

      self.infini_band_network_cidr = attributes[:'infiniBandNetworkCIDR'] if attributes[:'infiniBandNetworkCIDR']

      raise 'You cannot provide both :infiniBandNetworkCIDR and :infini_band_network_cidr' if attributes.key?(:'infiniBandNetworkCIDR') && attributes.key?(:'infini_band_network_cidr')

      self.infini_band_network_cidr = attributes[:'infini_band_network_cidr'] if attributes[:'infini_band_network_cidr']

      self.corporate_proxy = attributes[:'corporateProxy'] if attributes[:'corporateProxy']

      raise 'You cannot provide both :corporateProxy and :corporate_proxy' if attributes.key?(:'corporateProxy') && attributes.key?(:'corporate_proxy')

      self.corporate_proxy = attributes[:'corporate_proxy'] if attributes[:'corporate_proxy']

      self.contacts = attributes[:'contacts'] if attributes[:'contacts']

      self.maintenance_window = attributes[:'maintenanceWindow'] if attributes[:'maintenanceWindow']

      raise 'You cannot provide both :maintenanceWindow and :maintenance_window' if attributes.key?(:'maintenanceWindow') && attributes.key?(:'maintenance_window')

      self.maintenance_window = attributes[:'maintenance_window'] if attributes[:'maintenance_window']

      self.additional_storage_count = attributes[:'additionalStorageCount'] if attributes[:'additionalStorageCount']

      raise 'You cannot provide both :additionalStorageCount and :additional_storage_count' if attributes.key?(:'additionalStorageCount') && attributes.key?(:'additional_storage_count')

      self.additional_storage_count = attributes[:'additional_storage_count'] if attributes[:'additional_storage_count']

      self.dns_server = attributes[:'dnsServer'] if attributes[:'dnsServer']

      raise 'You cannot provide both :dnsServer and :dns_server' if attributes.key?(:'dnsServer') && attributes.key?(:'dns_server')

      self.dns_server = attributes[:'dns_server'] if attributes[:'dns_server']

      self.ntp_server = attributes[:'ntpServer'] if attributes[:'ntpServer']

      raise 'You cannot provide both :ntpServer and :ntp_server' if attributes.key?(:'ntpServer') && attributes.key?(:'ntp_server')

      self.ntp_server = attributes[:'ntp_server'] if attributes[:'ntp_server']

      self.time_zone = attributes[:'timeZone'] if attributes[:'timeZone']

      raise 'You cannot provide both :timeZone and :time_zone' if attributes.key?(:'timeZone') && attributes.key?(:'time_zone')

      self.time_zone = attributes[:'time_zone'] if attributes[:'time_zone']

      self.is_cps_offline_report_enabled = attributes[:'isCpsOfflineReportEnabled'] unless attributes[:'isCpsOfflineReportEnabled'].nil?

      raise 'You cannot provide both :isCpsOfflineReportEnabled and :is_cps_offline_report_enabled' if attributes.key?(:'isCpsOfflineReportEnabled') && attributes.key?(:'is_cps_offline_report_enabled')

      self.is_cps_offline_report_enabled = attributes[:'is_cps_offline_report_enabled'] unless attributes[:'is_cps_offline_report_enabled'].nil?

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
        cloud_control_plane_server1 == other.cloud_control_plane_server1 &&
        cloud_control_plane_server2 == other.cloud_control_plane_server2 &&
        netmask == other.netmask &&
        gateway == other.gateway &&
        admin_network_cidr == other.admin_network_cidr &&
        infini_band_network_cidr == other.infini_band_network_cidr &&
        corporate_proxy == other.corporate_proxy &&
        contacts == other.contacts &&
        maintenance_window == other.maintenance_window &&
        additional_storage_count == other.additional_storage_count &&
        dns_server == other.dns_server &&
        ntp_server == other.ntp_server &&
        time_zone == other.time_zone &&
        is_cps_offline_report_enabled == other.is_cps_offline_report_enabled &&
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
      [cloud_control_plane_server1, cloud_control_plane_server2, netmask, gateway, admin_network_cidr, infini_band_network_cidr, corporate_proxy, contacts, maintenance_window, additional_storage_count, dns_server, ntp_server, time_zone, is_cps_offline_report_enabled, freeform_tags, defined_tags].hash
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
