# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The model for a domain governance entity.
  class TenantManagerControlPlane::Models::DomainGovernance
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The OCID of the domain governance entity.
    # @return [String]
    attr_accessor :id

    # **[Required]** The OCID of the tenancy that owns this domain governance entity.
    # @return [String]
    attr_accessor :owner_id

    # **[Required]** The OCID of the domain associated with this domain governance entity.
    # @return [String]
    attr_accessor :domain_id

    # **[Required]** Lifecycle state of the domain governance entity.
    # @return [String]
    attr_reader :lifecycle_state

    # Indicates whether governance is enabled for this domain.
    # @return [BOOLEAN]
    attr_accessor :is_governance_enabled

    # The email to notify the user, and that the ONS subscription will be created with.
    # @return [String]
    attr_accessor :subscription_email

    # **[Required]** The ONS topic associated with this domain governance entity.
    # @return [String]
    attr_accessor :ons_topic_id

    # **[Required]** The ONS subscription associated with this domain governance entity.
    # @return [String]
    attr_accessor :ons_subscription_id

    # Date-time when this domain governance was created. An RFC 3339-formatted date and time string.
    # @return [DateTime]
    attr_accessor :time_created

    # Date-time when this domain governance was last updated. An RFC 3339-formatted date and time string.
    # @return [DateTime]
    attr_accessor :time_updated

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
        'owner_id': :'ownerId',
        'domain_id': :'domainId',
        'lifecycle_state': :'lifecycleState',
        'is_governance_enabled': :'isGovernanceEnabled',
        'subscription_email': :'subscriptionEmail',
        'ons_topic_id': :'onsTopicId',
        'ons_subscription_id': :'onsSubscriptionId',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
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
        'owner_id': :'String',
        'domain_id': :'String',
        'lifecycle_state': :'String',
        'is_governance_enabled': :'BOOLEAN',
        'subscription_email': :'String',
        'ons_topic_id': :'String',
        'ons_subscription_id': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
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
    # @option attributes [String] :owner_id The value to assign to the {#owner_id} property
    # @option attributes [String] :domain_id The value to assign to the {#domain_id} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [BOOLEAN] :is_governance_enabled The value to assign to the {#is_governance_enabled} property
    # @option attributes [String] :subscription_email The value to assign to the {#subscription_email} property
    # @option attributes [String] :ons_topic_id The value to assign to the {#ons_topic_id} property
    # @option attributes [String] :ons_subscription_id The value to assign to the {#ons_subscription_id} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {#system_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.owner_id = attributes[:'ownerId'] if attributes[:'ownerId']

      raise 'You cannot provide both :ownerId and :owner_id' if attributes.key?(:'ownerId') && attributes.key?(:'owner_id')

      self.owner_id = attributes[:'owner_id'] if attributes[:'owner_id']

      self.domain_id = attributes[:'domainId'] if attributes[:'domainId']

      raise 'You cannot provide both :domainId and :domain_id' if attributes.key?(:'domainId') && attributes.key?(:'domain_id')

      self.domain_id = attributes[:'domain_id'] if attributes[:'domain_id']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.is_governance_enabled = attributes[:'isGovernanceEnabled'] unless attributes[:'isGovernanceEnabled'].nil?

      raise 'You cannot provide both :isGovernanceEnabled and :is_governance_enabled' if attributes.key?(:'isGovernanceEnabled') && attributes.key?(:'is_governance_enabled')

      self.is_governance_enabled = attributes[:'is_governance_enabled'] unless attributes[:'is_governance_enabled'].nil?

      self.subscription_email = attributes[:'subscriptionEmail'] if attributes[:'subscriptionEmail']

      raise 'You cannot provide both :subscriptionEmail and :subscription_email' if attributes.key?(:'subscriptionEmail') && attributes.key?(:'subscription_email')

      self.subscription_email = attributes[:'subscription_email'] if attributes[:'subscription_email']

      self.ons_topic_id = attributes[:'onsTopicId'] if attributes[:'onsTopicId']

      raise 'You cannot provide both :onsTopicId and :ons_topic_id' if attributes.key?(:'onsTopicId') && attributes.key?(:'ons_topic_id')

      self.ons_topic_id = attributes[:'ons_topic_id'] if attributes[:'ons_topic_id']

      self.ons_subscription_id = attributes[:'onsSubscriptionId'] if attributes[:'onsSubscriptionId']

      raise 'You cannot provide both :onsSubscriptionId and :ons_subscription_id' if attributes.key?(:'onsSubscriptionId') && attributes.key?(:'ons_subscription_id')

      self.ons_subscription_id = attributes[:'ons_subscription_id'] if attributes[:'ons_subscription_id']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

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
        owner_id == other.owner_id &&
        domain_id == other.domain_id &&
        lifecycle_state == other.lifecycle_state &&
        is_governance_enabled == other.is_governance_enabled &&
        subscription_email == other.subscription_email &&
        ons_topic_id == other.ons_topic_id &&
        ons_subscription_id == other.ons_subscription_id &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
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
      [id, owner_id, domain_id, lifecycle_state, is_governance_enabled, subscription_email, ons_topic_id, ons_subscription_id, time_created, time_updated, freeform_tags, defined_tags, system_tags].hash
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
