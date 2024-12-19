# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'channel'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The configuration for an Oracle Streaming Service (OSS) channel.
  class Oda::Models::OSSChannel < Oda::Models::Channel
    # The IDs of the Skills and Digital Assistants that the Channel is routed to.
    # @return [Array<String>]
    attr_accessor :event_sink_bot_ids

    # **[Required]** The topic inbound messages are received on.
    # @return [String]
    attr_accessor :inbound_message_topic

    # **[Required]** The topic outbound messages are sent on.
    # @return [String]
    attr_accessor :outbound_message_topic

    # **[Required]** The Oracle Streaming Service bootstrap servers.
    # @return [String]
    attr_accessor :bootstrap_servers

    # **[Required]** The security protocol to use when conecting to the Oracle Streaming Service. See Oracle Streaming Service documentation for a list of valid values.
    # @return [String]
    attr_accessor :security_protocol

    # **[Required]** The SASL mechanmism to use when conecting to the Oracle Streaming Service. See Oracle Streaming Service documentation for a list of valid values.
    # @return [String]
    attr_accessor :sasl_mechanism

    # **[Required]** The tenancy to use when connecting to the Oracle Streaming Service.
    # @return [String]
    attr_accessor :tenancy_name

    # **[Required]** The user name to use when connecting to the Oracle Streaming Service.
    # @return [String]
    attr_accessor :user_name

    # **[Required]** The stream pool OCI to use when connecting to the Oracle Streaming Service.
    # @return [String]
    attr_accessor :stream_pool_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'name': :'name',
        'description': :'description',
        'category': :'category',
        'type': :'type',
        'session_expiry_duration_in_milliseconds': :'sessionExpiryDurationInMilliseconds',
        'lifecycle_state': :'lifecycleState',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'event_sink_bot_ids': :'eventSinkBotIds',
        'inbound_message_topic': :'inboundMessageTopic',
        'outbound_message_topic': :'outboundMessageTopic',
        'bootstrap_servers': :'bootstrapServers',
        'security_protocol': :'securityProtocol',
        'sasl_mechanism': :'saslMechanism',
        'tenancy_name': :'tenancyName',
        'user_name': :'userName',
        'stream_pool_id': :'streamPoolId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'name': :'String',
        'description': :'String',
        'category': :'String',
        'type': :'String',
        'session_expiry_duration_in_milliseconds': :'Integer',
        'lifecycle_state': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'event_sink_bot_ids': :'Array<String>',
        'inbound_message_topic': :'String',
        'outbound_message_topic': :'String',
        'bootstrap_servers': :'String',
        'security_protocol': :'String',
        'sasl_mechanism': :'String',
        'tenancy_name': :'String',
        'user_name': :'String',
        'stream_pool_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {OCI::Oda::Models::Channel#id #id} proprety
    # @option attributes [String] :name The value to assign to the {OCI::Oda::Models::Channel#name #name} proprety
    # @option attributes [String] :description The value to assign to the {OCI::Oda::Models::Channel#description #description} proprety
    # @option attributes [String] :category The value to assign to the {OCI::Oda::Models::Channel#category #category} proprety
    # @option attributes [Integer] :session_expiry_duration_in_milliseconds The value to assign to the {OCI::Oda::Models::Channel#session_expiry_duration_in_milliseconds #session_expiry_duration_in_milliseconds} proprety
    # @option attributes [String] :lifecycle_state The value to assign to the {OCI::Oda::Models::Channel#lifecycle_state #lifecycle_state} proprety
    # @option attributes [DateTime] :time_created The value to assign to the {OCI::Oda::Models::Channel#time_created #time_created} proprety
    # @option attributes [DateTime] :time_updated The value to assign to the {OCI::Oda::Models::Channel#time_updated #time_updated} proprety
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {OCI::Oda::Models::Channel#freeform_tags #freeform_tags} proprety
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {OCI::Oda::Models::Channel#defined_tags #defined_tags} proprety
    # @option attributes [Array<String>] :event_sink_bot_ids The value to assign to the {#event_sink_bot_ids} property
    # @option attributes [String] :inbound_message_topic The value to assign to the {#inbound_message_topic} property
    # @option attributes [String] :outbound_message_topic The value to assign to the {#outbound_message_topic} property
    # @option attributes [String] :bootstrap_servers The value to assign to the {#bootstrap_servers} property
    # @option attributes [String] :security_protocol The value to assign to the {#security_protocol} property
    # @option attributes [String] :sasl_mechanism The value to assign to the {#sasl_mechanism} property
    # @option attributes [String] :tenancy_name The value to assign to the {#tenancy_name} property
    # @option attributes [String] :user_name The value to assign to the {#user_name} property
    # @option attributes [String] :stream_pool_id The value to assign to the {#stream_pool_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['type'] = 'OSS'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.event_sink_bot_ids = attributes[:'eventSinkBotIds'] if attributes[:'eventSinkBotIds']

      raise 'You cannot provide both :eventSinkBotIds and :event_sink_bot_ids' if attributes.key?(:'eventSinkBotIds') && attributes.key?(:'event_sink_bot_ids')

      self.event_sink_bot_ids = attributes[:'event_sink_bot_ids'] if attributes[:'event_sink_bot_ids']

      self.inbound_message_topic = attributes[:'inboundMessageTopic'] if attributes[:'inboundMessageTopic']

      raise 'You cannot provide both :inboundMessageTopic and :inbound_message_topic' if attributes.key?(:'inboundMessageTopic') && attributes.key?(:'inbound_message_topic')

      self.inbound_message_topic = attributes[:'inbound_message_topic'] if attributes[:'inbound_message_topic']

      self.outbound_message_topic = attributes[:'outboundMessageTopic'] if attributes[:'outboundMessageTopic']

      raise 'You cannot provide both :outboundMessageTopic and :outbound_message_topic' if attributes.key?(:'outboundMessageTopic') && attributes.key?(:'outbound_message_topic')

      self.outbound_message_topic = attributes[:'outbound_message_topic'] if attributes[:'outbound_message_topic']

      self.bootstrap_servers = attributes[:'bootstrapServers'] if attributes[:'bootstrapServers']

      raise 'You cannot provide both :bootstrapServers and :bootstrap_servers' if attributes.key?(:'bootstrapServers') && attributes.key?(:'bootstrap_servers')

      self.bootstrap_servers = attributes[:'bootstrap_servers'] if attributes[:'bootstrap_servers']

      self.security_protocol = attributes[:'securityProtocol'] if attributes[:'securityProtocol']

      raise 'You cannot provide both :securityProtocol and :security_protocol' if attributes.key?(:'securityProtocol') && attributes.key?(:'security_protocol')

      self.security_protocol = attributes[:'security_protocol'] if attributes[:'security_protocol']

      self.sasl_mechanism = attributes[:'saslMechanism'] if attributes[:'saslMechanism']

      raise 'You cannot provide both :saslMechanism and :sasl_mechanism' if attributes.key?(:'saslMechanism') && attributes.key?(:'sasl_mechanism')

      self.sasl_mechanism = attributes[:'sasl_mechanism'] if attributes[:'sasl_mechanism']

      self.tenancy_name = attributes[:'tenancyName'] if attributes[:'tenancyName']

      raise 'You cannot provide both :tenancyName and :tenancy_name' if attributes.key?(:'tenancyName') && attributes.key?(:'tenancy_name')

      self.tenancy_name = attributes[:'tenancy_name'] if attributes[:'tenancy_name']

      self.user_name = attributes[:'userName'] if attributes[:'userName']

      raise 'You cannot provide both :userName and :user_name' if attributes.key?(:'userName') && attributes.key?(:'user_name')

      self.user_name = attributes[:'user_name'] if attributes[:'user_name']

      self.stream_pool_id = attributes[:'streamPoolId'] if attributes[:'streamPoolId']

      raise 'You cannot provide both :streamPoolId and :stream_pool_id' if attributes.key?(:'streamPoolId') && attributes.key?(:'stream_pool_id')

      self.stream_pool_id = attributes[:'stream_pool_id'] if attributes[:'stream_pool_id']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        category == other.category &&
        type == other.type &&
        session_expiry_duration_in_milliseconds == other.session_expiry_duration_in_milliseconds &&
        lifecycle_state == other.lifecycle_state &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        event_sink_bot_ids == other.event_sink_bot_ids &&
        inbound_message_topic == other.inbound_message_topic &&
        outbound_message_topic == other.outbound_message_topic &&
        bootstrap_servers == other.bootstrap_servers &&
        security_protocol == other.security_protocol &&
        sasl_mechanism == other.sasl_mechanism &&
        tenancy_name == other.tenancy_name &&
        user_name == other.user_name &&
        stream_pool_id == other.stream_pool_id
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
      [id, name, description, category, type, session_expiry_duration_in_milliseconds, lifecycle_state, time_created, time_updated, freeform_tags, defined_tags, event_sink_bot_ids, inbound_message_topic, outbound_message_topic, bootstrap_servers, security_protocol, sasl_mechanism, tenancy_name, user_name, stream_pool_id].hash
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
