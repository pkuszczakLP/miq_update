# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The properties that define a DKIM.
  #
  class Email::Models::Dkim
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATE_NEEDS_ATTENTION = 'NEEDS_ATTENTION'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The DKIM selector.
    # If the same domain is managed in more than one region, each region must use different selectors.
    #
    # @return [String]
    attr_accessor :name

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the DKIM.
    #
    # @return [String]
    attr_accessor :id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the email domain
    # that this DKIM belongs to.
    #
    # @return [String]
    attr_accessor :email_domain_id

    # The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment that contains this DKIM.
    #
    # @return [String]
    attr_accessor :compartment_id

    # The current state of the DKIM.
    # @return [String]
    attr_reader :lifecycle_state

    # A message describing the current state in more detail.
    # For example, can be used to provide actionable information for a resource.
    #
    # @return [String]
    attr_accessor :lifecycle_details

    # The description of the DKIM. Avoid entering confidential information.
    # @return [String]
    attr_accessor :description

    # The time the DKIM was created.
    # Times are expressed in [RFC 3339](https://tools.ietf.org/html/rfc3339)
    # timestamp format, \"YYYY-MM-ddThh:mmZ\".
    #
    # Example: `2021-02-12T22:47:12.613Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # The time of the last change to the DKIM configuration, due to a state change or
    # an update operation.
    # Times are expressed in [RFC 3339](https://tools.ietf.org/html/rfc3339)
    # timestamp format, \"YYYY-MM-ddThh:mmZ\".
    #
    # @return [DateTime]
    attr_accessor :time_updated

    # The name of the DNS subdomain that must be provisioned to enable email recipients to verify DKIM signatures.
    # It is usually created with a CNAME record set to the cnameRecordValue
    #
    # @return [String]
    attr_accessor :dns_subdomain_name

    # The DNS CNAME record value to provision to the DKIM DNS subdomain, when using the CNAME method for DKIM setup (preferred).
    #
    # @return [String]
    attr_accessor :cname_record_value

    # The DNS TXT record value to provision to the DKIM DNS subdomain in place of using a CNAME record.
    # This is used in cases where a CNAME can not be used, such as when the cnameRecordValue would exceed the maximum length for a DNS entry.
    # This can also be used by customers who have an existing procedure to directly provision TXT records for DKIM.
    # Be aware that many DNS APIs will require you to break this string into segments of less than 255 characters.
    #
    # @return [String]
    attr_accessor :txt_record_value

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
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
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
        'name': :'name',
        'id': :'id',
        'email_domain_id': :'emailDomainId',
        'compartment_id': :'compartmentId',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'description': :'description',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'dns_subdomain_name': :'dnsSubdomainName',
        'cname_record_value': :'cnameRecordValue',
        'txt_record_value': :'txtRecordValue',
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
        'name': :'String',
        'id': :'String',
        'email_domain_id': :'String',
        'compartment_id': :'String',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'description': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'dns_subdomain_name': :'String',
        'cname_record_value': :'String',
        'txt_record_value': :'String',
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
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :email_domain_id The value to assign to the {#email_domain_id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :dns_subdomain_name The value to assign to the {#dns_subdomain_name} property
    # @option attributes [String] :cname_record_value The value to assign to the {#cname_record_value} property
    # @option attributes [String] :txt_record_value The value to assign to the {#txt_record_value} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {#system_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.id = attributes[:'id'] if attributes[:'id']

      self.email_domain_id = attributes[:'emailDomainId'] if attributes[:'emailDomainId']

      raise 'You cannot provide both :emailDomainId and :email_domain_id' if attributes.key?(:'emailDomainId') && attributes.key?(:'email_domain_id')

      self.email_domain_id = attributes[:'email_domain_id'] if attributes[:'email_domain_id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.description = attributes[:'description'] if attributes[:'description']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.dns_subdomain_name = attributes[:'dnsSubdomainName'] if attributes[:'dnsSubdomainName']

      raise 'You cannot provide both :dnsSubdomainName and :dns_subdomain_name' if attributes.key?(:'dnsSubdomainName') && attributes.key?(:'dns_subdomain_name')

      self.dns_subdomain_name = attributes[:'dns_subdomain_name'] if attributes[:'dns_subdomain_name']

      self.cname_record_value = attributes[:'cnameRecordValue'] if attributes[:'cnameRecordValue']

      raise 'You cannot provide both :cnameRecordValue and :cname_record_value' if attributes.key?(:'cnameRecordValue') && attributes.key?(:'cname_record_value')

      self.cname_record_value = attributes[:'cname_record_value'] if attributes[:'cname_record_value']

      self.txt_record_value = attributes[:'txtRecordValue'] if attributes[:'txtRecordValue']

      raise 'You cannot provide both :txtRecordValue and :txt_record_value' if attributes.key?(:'txtRecordValue') && attributes.key?(:'txt_record_value')

      self.txt_record_value = attributes[:'txt_record_value'] if attributes[:'txt_record_value']

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
        name == other.name &&
        id == other.id &&
        email_domain_id == other.email_domain_id &&
        compartment_id == other.compartment_id &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        description == other.description &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        dns_subdomain_name == other.dns_subdomain_name &&
        cname_record_value == other.cname_record_value &&
        txt_record_value == other.txt_record_value &&
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
      [name, id, email_domain_id, compartment_id, lifecycle_state, lifecycle_details, description, time_created, time_updated, dns_subdomain_name, cname_record_value, txt_record_value, freeform_tags, defined_tags, system_tags].hash
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
