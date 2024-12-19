# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The details of a stream pool.
  class Streaming::Models::StreamPool
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The OCID of the stream pool.
    # @return [String]
    attr_accessor :id

    # **[Required]** Compartment OCID that the pool belongs to.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The name of the stream pool.
    # @return [String]
    attr_accessor :name

    # **[Required]** The current state of the stream pool.
    # @return [String]
    attr_reader :lifecycle_state

    # Any additional details about the current state of the stream.
    # @return [String]
    attr_accessor :lifecycle_state_details

    # **[Required]** The date and time the stream pool was created, expressed in in [RFC 3339](https://tools.ietf.org/rfc/rfc3339) timestamp format.
    #
    # Example: `2018-04-20T00:00:07.405Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # This attribute is required.
    # @return [OCI::Streaming::Models::KafkaSettings]
    attr_accessor :kafka_settings

    # This attribute is required.
    # @return [OCI::Streaming::Models::CustomEncryptionKey]
    attr_accessor :custom_encryption_key

    # True if the stream pool is private, false otherwise.
    # If the stream pool is private, the streams inside the stream pool can only be accessed from inside the associated subnetId.
    #
    # @return [BOOLEAN]
    attr_accessor :is_private

    # The FQDN used to access the streams inside the stream pool (same FQDN as the messagesEndpoint attribute of a {Stream} object).
    # If the stream pool is private, the FQDN is customized and can only be accessed from inside the associated subnetId, otherwise the FQDN is publicly resolvable.
    # Depending on which protocol you attempt to use, you need to either prepend https or append the Kafka port.
    #
    # @return [String]
    attr_accessor :endpoint_fqdn

    # @return [OCI::Streaming::Models::PrivateEndpointSettings]
    attr_accessor :private_endpoint_settings

    # Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace. Exists for cross-compatibility only.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}'
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'compartment_id': :'compartmentId',
        'name': :'name',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_state_details': :'lifecycleStateDetails',
        'time_created': :'timeCreated',
        'kafka_settings': :'kafkaSettings',
        'custom_encryption_key': :'customEncryptionKey',
        'is_private': :'isPrivate',
        'endpoint_fqdn': :'endpointFqdn',
        'private_endpoint_settings': :'privateEndpointSettings',
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
        'compartment_id': :'String',
        'name': :'String',
        'lifecycle_state': :'String',
        'lifecycle_state_details': :'String',
        'time_created': :'DateTime',
        'kafka_settings': :'OCI::Streaming::Models::KafkaSettings',
        'custom_encryption_key': :'OCI::Streaming::Models::CustomEncryptionKey',
        'is_private': :'BOOLEAN',
        'endpoint_fqdn': :'String',
        'private_endpoint_settings': :'OCI::Streaming::Models::PrivateEndpointSettings',
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
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_state_details The value to assign to the {#lifecycle_state_details} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [OCI::Streaming::Models::KafkaSettings] :kafka_settings The value to assign to the {#kafka_settings} property
    # @option attributes [OCI::Streaming::Models::CustomEncryptionKey] :custom_encryption_key The value to assign to the {#custom_encryption_key} property
    # @option attributes [BOOLEAN] :is_private The value to assign to the {#is_private} property
    # @option attributes [String] :endpoint_fqdn The value to assign to the {#endpoint_fqdn} property
    # @option attributes [OCI::Streaming::Models::PrivateEndpointSettings] :private_endpoint_settings The value to assign to the {#private_endpoint_settings} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.name = attributes[:'name'] if attributes[:'name']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_state_details = attributes[:'lifecycleStateDetails'] if attributes[:'lifecycleStateDetails']

      raise 'You cannot provide both :lifecycleStateDetails and :lifecycle_state_details' if attributes.key?(:'lifecycleStateDetails') && attributes.key?(:'lifecycle_state_details')

      self.lifecycle_state_details = attributes[:'lifecycle_state_details'] if attributes[:'lifecycle_state_details']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.kafka_settings = attributes[:'kafkaSettings'] if attributes[:'kafkaSettings']

      raise 'You cannot provide both :kafkaSettings and :kafka_settings' if attributes.key?(:'kafkaSettings') && attributes.key?(:'kafka_settings')

      self.kafka_settings = attributes[:'kafka_settings'] if attributes[:'kafka_settings']

      self.custom_encryption_key = attributes[:'customEncryptionKey'] if attributes[:'customEncryptionKey']

      raise 'You cannot provide both :customEncryptionKey and :custom_encryption_key' if attributes.key?(:'customEncryptionKey') && attributes.key?(:'custom_encryption_key')

      self.custom_encryption_key = attributes[:'custom_encryption_key'] if attributes[:'custom_encryption_key']

      self.is_private = attributes[:'isPrivate'] unless attributes[:'isPrivate'].nil?

      raise 'You cannot provide both :isPrivate and :is_private' if attributes.key?(:'isPrivate') && attributes.key?(:'is_private')

      self.is_private = attributes[:'is_private'] unless attributes[:'is_private'].nil?

      self.endpoint_fqdn = attributes[:'endpointFqdn'] if attributes[:'endpointFqdn']

      raise 'You cannot provide both :endpointFqdn and :endpoint_fqdn' if attributes.key?(:'endpointFqdn') && attributes.key?(:'endpoint_fqdn')

      self.endpoint_fqdn = attributes[:'endpoint_fqdn'] if attributes[:'endpoint_fqdn']

      self.private_endpoint_settings = attributes[:'privateEndpointSettings'] if attributes[:'privateEndpointSettings']

      raise 'You cannot provide both :privateEndpointSettings and :private_endpoint_settings' if attributes.key?(:'privateEndpointSettings') && attributes.key?(:'private_endpoint_settings')

      self.private_endpoint_settings = attributes[:'private_endpoint_settings'] if attributes[:'private_endpoint_settings']

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
        compartment_id == other.compartment_id &&
        name == other.name &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_state_details == other.lifecycle_state_details &&
        time_created == other.time_created &&
        kafka_settings == other.kafka_settings &&
        custom_encryption_key == other.custom_encryption_key &&
        is_private == other.is_private &&
        endpoint_fqdn == other.endpoint_fqdn &&
        private_endpoint_settings == other.private_endpoint_settings &&
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
      [id, compartment_id, name, lifecycle_state, lifecycle_state_details, time_created, kafka_settings, custom_encryption_key, is_private, endpoint_fqdn, private_endpoint_settings, freeform_tags, defined_tags].hash
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
