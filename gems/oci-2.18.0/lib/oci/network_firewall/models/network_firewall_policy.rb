# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Description of NetworkFirewall Policy.
  class NetworkFirewall::Models::NetworkFirewallPolicy
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the resource - Network Firewall Policy.
    # @return [String]
    attr_accessor :id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment containing the NetworkFirewall Policy.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** A user-friendly optional name for the firewall policy. Avoid entering confidential information.
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The time instant at which the Network Firewall Policy was created in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    # Example: `2016-08-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # **[Required]** The time instant at which the Network Firewall Policy was updated in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    # Example: `2016-08-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_updated

    # **[Required]** The current state of the Network Firewall Policy.
    # @return [String]
    attr_reader :lifecycle_state

    # A message describing the current state in more detail. For example, can be used to provide actionable information for a resource in Failed state.
    # @return [String]
    attr_accessor :lifecycle_details

    # Map defining secrets of the policy.
    # The value of an entry is a \"mapped secret\" consisting of a purpose and source.
    # The associated key is the identifier by which the mapped secret is referenced.
    #
    # @return [Hash<String, OCI::NetworkFirewall::Models::MappedSecret>]
    attr_accessor :mapped_secrets

    # Map defining application lists of the policy.
    # The value of an entry is a list of \"applications\", each consisting of a protocol identifier (such as TCP, UDP, or ICMP) and protocol-specific parameters (such as a port range).
    # The associated key is the identifier by which the application list is referenced.
    #
    # @return [Hash<String, Array<OCI::NetworkFirewall::Models::Application>>]
    attr_accessor :application_lists

    # Map defining URL pattern lists of the policy.
    # The value of an entry is a list of URL patterns.
    # The associated key is the identifier by which the URL pattern list is referenced.
    #
    # @return [Hash<String, Array<OCI::NetworkFirewall::Models::UrlPattern>>]
    attr_accessor :url_lists

    # Map defining IP address lists of the policy.
    # The value of an entry is a list of IP addresses or prefixes in CIDR notation.
    # The associated key is the identifier by which the IP address list is referenced.
    #
    # @return [Hash<String, Array<String>>]
    attr_accessor :ip_address_lists

    # List of Security Rules defining the behavior of the policy.
    # The first rule with a matching condition determines the action taken upon network traffic.
    #
    # @return [Array<OCI::NetworkFirewall::Models::SecurityRule>]
    attr_accessor :security_rules

    # List of Decryption Rules defining the behavior of the policy.
    # The first rule with a matching condition determines the action taken upon network traffic.
    #
    # @return [Array<OCI::NetworkFirewall::Models::DecryptionRule>]
    attr_accessor :decryption_rules

    # Map defining decryption profiles of the policy.
    # The value of an entry is a decryption profile.
    # The associated key is the identifier by which the decryption profile is referenced.
    #
    # @return [Hash<String, OCI::NetworkFirewall::Models::DecryptionProfile>]
    attr_accessor :decryption_profiles

    # **[Required]** To determine if any Network Firewall is associated with this Network Firewall Policy.
    #
    # @return [BOOLEAN]
    attr_accessor :is_firewall_attached

    # **[Required]** Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # **[Required]** Defined tags for this resource. Each key is predefined and scoped to a namespace.
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
        'compartment_id': :'compartmentId',
        'display_name': :'displayName',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'mapped_secrets': :'mappedSecrets',
        'application_lists': :'applicationLists',
        'url_lists': :'urlLists',
        'ip_address_lists': :'ipAddressLists',
        'security_rules': :'securityRules',
        'decryption_rules': :'decryptionRules',
        'decryption_profiles': :'decryptionProfiles',
        'is_firewall_attached': :'isFirewallAttached',
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
        'compartment_id': :'String',
        'display_name': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'mapped_secrets': :'Hash<String, OCI::NetworkFirewall::Models::MappedSecret>',
        'application_lists': :'Hash<String, Array<OCI::NetworkFirewall::Models::Application>>',
        'url_lists': :'Hash<String, Array<OCI::NetworkFirewall::Models::UrlPattern>>',
        'ip_address_lists': :'Hash<String, Array<String>>',
        'security_rules': :'Array<OCI::NetworkFirewall::Models::SecurityRule>',
        'decryption_rules': :'Array<OCI::NetworkFirewall::Models::DecryptionRule>',
        'decryption_profiles': :'Hash<String, OCI::NetworkFirewall::Models::DecryptionProfile>',
        'is_firewall_attached': :'BOOLEAN',
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
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [Hash<String, OCI::NetworkFirewall::Models::MappedSecret>] :mapped_secrets The value to assign to the {#mapped_secrets} property
    # @option attributes [Hash<String, Array<OCI::NetworkFirewall::Models::Application>>] :application_lists The value to assign to the {#application_lists} property
    # @option attributes [Hash<String, Array<OCI::NetworkFirewall::Models::UrlPattern>>] :url_lists The value to assign to the {#url_lists} property
    # @option attributes [Hash<String, Array<String>>] :ip_address_lists The value to assign to the {#ip_address_lists} property
    # @option attributes [Array<OCI::NetworkFirewall::Models::SecurityRule>] :security_rules The value to assign to the {#security_rules} property
    # @option attributes [Array<OCI::NetworkFirewall::Models::DecryptionRule>] :decryption_rules The value to assign to the {#decryption_rules} property
    # @option attributes [Hash<String, OCI::NetworkFirewall::Models::DecryptionProfile>] :decryption_profiles The value to assign to the {#decryption_profiles} property
    # @option attributes [BOOLEAN] :is_firewall_attached The value to assign to the {#is_firewall_attached} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {#system_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.mapped_secrets = attributes[:'mappedSecrets'] if attributes[:'mappedSecrets']

      raise 'You cannot provide both :mappedSecrets and :mapped_secrets' if attributes.key?(:'mappedSecrets') && attributes.key?(:'mapped_secrets')

      self.mapped_secrets = attributes[:'mapped_secrets'] if attributes[:'mapped_secrets']

      self.application_lists = attributes[:'applicationLists'] if attributes[:'applicationLists']

      raise 'You cannot provide both :applicationLists and :application_lists' if attributes.key?(:'applicationLists') && attributes.key?(:'application_lists')

      self.application_lists = attributes[:'application_lists'] if attributes[:'application_lists']

      self.url_lists = attributes[:'urlLists'] if attributes[:'urlLists']

      raise 'You cannot provide both :urlLists and :url_lists' if attributes.key?(:'urlLists') && attributes.key?(:'url_lists')

      self.url_lists = attributes[:'url_lists'] if attributes[:'url_lists']

      self.ip_address_lists = attributes[:'ipAddressLists'] if attributes[:'ipAddressLists']

      raise 'You cannot provide both :ipAddressLists and :ip_address_lists' if attributes.key?(:'ipAddressLists') && attributes.key?(:'ip_address_lists')

      self.ip_address_lists = attributes[:'ip_address_lists'] if attributes[:'ip_address_lists']

      self.security_rules = attributes[:'securityRules'] if attributes[:'securityRules']

      raise 'You cannot provide both :securityRules and :security_rules' if attributes.key?(:'securityRules') && attributes.key?(:'security_rules')

      self.security_rules = attributes[:'security_rules'] if attributes[:'security_rules']

      self.decryption_rules = attributes[:'decryptionRules'] if attributes[:'decryptionRules']

      raise 'You cannot provide both :decryptionRules and :decryption_rules' if attributes.key?(:'decryptionRules') && attributes.key?(:'decryption_rules')

      self.decryption_rules = attributes[:'decryption_rules'] if attributes[:'decryption_rules']

      self.decryption_profiles = attributes[:'decryptionProfiles'] if attributes[:'decryptionProfiles']

      raise 'You cannot provide both :decryptionProfiles and :decryption_profiles' if attributes.key?(:'decryptionProfiles') && attributes.key?(:'decryption_profiles')

      self.decryption_profiles = attributes[:'decryption_profiles'] if attributes[:'decryption_profiles']

      self.is_firewall_attached = attributes[:'isFirewallAttached'] unless attributes[:'isFirewallAttached'].nil?

      raise 'You cannot provide both :isFirewallAttached and :is_firewall_attached' if attributes.key?(:'isFirewallAttached') && attributes.key?(:'is_firewall_attached')

      self.is_firewall_attached = attributes[:'is_firewall_attached'] unless attributes[:'is_firewall_attached'].nil?

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
        compartment_id == other.compartment_id &&
        display_name == other.display_name &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        mapped_secrets == other.mapped_secrets &&
        application_lists == other.application_lists &&
        url_lists == other.url_lists &&
        ip_address_lists == other.ip_address_lists &&
        security_rules == other.security_rules &&
        decryption_rules == other.decryption_rules &&
        decryption_profiles == other.decryption_profiles &&
        is_firewall_attached == other.is_firewall_attached &&
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
      [id, compartment_id, display_name, time_created, time_updated, lifecycle_state, lifecycle_details, mapped_secrets, application_lists, url_lists, ip_address_lists, security_rules, decryption_rules, decryption_profiles, is_firewall_attached, freeform_tags, defined_tags, system_tags].hash
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
