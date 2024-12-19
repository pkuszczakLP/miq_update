# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The subscription's configuration summary.
  #
  class Ons::Models::SubscriptionSummary
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_PENDING = 'PENDING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the subscription.
    #
    # @return [String]
    attr_accessor :id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the associated topic.
    #
    # @return [String]
    attr_accessor :topic_id

    # **[Required]** The protocol used for the subscription.
    #
    # Allowed values:
    #   * `CUSTOM_HTTPS`
    #   * `EMAIL`
    #   * `HTTPS` (deprecated; for PagerDuty endpoints, use `PAGERDUTY`)
    #   * `ORACLE_FUNCTIONS`
    #   * `PAGERDUTY`
    #   * `SLACK`
    #   * `SMS`
    #
    # For information about subscription protocols, see
    # [To create a subscription](https://docs.cloud.oracle.com/iaas/Content/Notification/Tasks/managingtopicsandsubscriptions.htm#createSub).
    #
    # @return [String]
    attr_accessor :protocol

    # **[Required]** A locator that corresponds to the subscription protocol.
    # For example, an email address for a subscription that uses the `EMAIL` protocol, or a URL for a subscription that uses an HTTP-based protocol.
    #
    # @return [String]
    attr_accessor :endpoint

    # **[Required]** The lifecycle state of the subscription. The status of a new subscription is PENDING; when confirmed, the subscription status changes to ACTIVE.
    #
    # @return [String]
    attr_reader :lifecycle_state

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment for the subscription.
    #
    # @return [String]
    attr_accessor :compartment_id

    # The time when this suscription was created.
    # @return [Integer]
    attr_accessor :created_time

    # @return [OCI::Ons::Models::DeliveryPolicy]
    attr_accessor :delivery_policy

    # For optimistic concurrency control. See `if-match`.
    #
    # @return [String]
    attr_accessor :etag

    # Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'topic_id': :'topicId',
        'protocol': :'protocol',
        'endpoint': :'endpoint',
        'lifecycle_state': :'lifecycleState',
        'compartment_id': :'compartmentId',
        'created_time': :'createdTime',
        'delivery_policy': :'deliveryPolicy',
        'etag': :'etag',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'topic_id': :'String',
        'protocol': :'String',
        'endpoint': :'String',
        'lifecycle_state': :'String',
        'compartment_id': :'String',
        'created_time': :'Integer',
        'delivery_policy': :'OCI::Ons::Models::DeliveryPolicy',
        'etag': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :topic_id The value to assign to the {#topic_id} property
    # @option attributes [String] :protocol The value to assign to the {#protocol} property
    # @option attributes [String] :endpoint The value to assign to the {#endpoint} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [Integer] :created_time The value to assign to the {#created_time} property
    # @option attributes [OCI::Ons::Models::DeliveryPolicy] :delivery_policy The value to assign to the {#delivery_policy} property
    # @option attributes [String] :etag The value to assign to the {#etag} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.topic_id = attributes[:'topicId'] if attributes[:'topicId']

      raise 'You cannot provide both :topicId and :topic_id' if attributes.key?(:'topicId') && attributes.key?(:'topic_id')

      self.topic_id = attributes[:'topic_id'] if attributes[:'topic_id']

      self.protocol = attributes[:'protocol'] if attributes[:'protocol']

      self.endpoint = attributes[:'endpoint'] if attributes[:'endpoint']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']
      self.lifecycle_state = "PENDING" if lifecycle_state.nil? && !attributes.key?(:'lifecycleState') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']
      self.lifecycle_state = "PENDING" if lifecycle_state.nil? && !attributes.key?(:'lifecycleState') && !attributes.key?(:'lifecycle_state') # rubocop:disable Style/StringLiterals

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.created_time = attributes[:'createdTime'] if attributes[:'createdTime']

      raise 'You cannot provide both :createdTime and :created_time' if attributes.key?(:'createdTime') && attributes.key?(:'created_time')

      self.created_time = attributes[:'created_time'] if attributes[:'created_time']

      self.delivery_policy = attributes[:'deliveryPolicy'] if attributes[:'deliveryPolicy']

      raise 'You cannot provide both :deliveryPolicy and :delivery_policy' if attributes.key?(:'deliveryPolicy') && attributes.key?(:'delivery_policy')

      self.delivery_policy = attributes[:'delivery_policy'] if attributes[:'delivery_policy']

      self.etag = attributes[:'etag'] if attributes[:'etag']

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
        topic_id == other.topic_id &&
        protocol == other.protocol &&
        endpoint == other.endpoint &&
        lifecycle_state == other.lifecycle_state &&
        compartment_id == other.compartment_id &&
        created_time == other.created_time &&
        delivery_policy == other.delivery_policy &&
        etag == other.etag &&
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
      [id, topic_id, protocol, endpoint, lifecycle_state, compartment_id, created_time, delivery_policy, etag, freeform_tags, defined_tags].hash
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
