# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'
require_relative 'create_channel_result'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The configuration for a Webhook channel.
  class Oda::Models::CreateWebhookChannelResult < Oda::Models::CreateChannelResult
    PAYLOAD_VERSION_ENUM = [
      PAYLOAD_VERSION_1_0 = '1.0'.freeze,
      PAYLOAD_VERSION_1_1 = '1.1'.freeze,
      PAYLOAD_VERSION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The secret key used to verify the authenticity of received messages.
    # This is only returned this once.  If it is lost the keys will need to be rotated to generate a new key.
    #
    # @return [String]
    attr_accessor :secret_key

    # **[Required]** The URL to send responses to.
    # @return [String]
    attr_accessor :outbound_url

    # **[Required]** The version for payloads.
    # @return [String]
    attr_reader :payload_version

    # The ID of the Skill or Digital Assistant that the Channel is routed to.
    # @return [String]
    attr_accessor :bot_id

    # **[Required]** The URL to use to send messages to this channel.
    # This will be generally be used to configure a webhook in a 3rd party messaging system to send messages to this channel.
    #
    # @return [String]
    attr_accessor :webhook_url

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
        'secret_key': :'secretKey',
        'outbound_url': :'outboundUrl',
        'payload_version': :'payloadVersion',
        'bot_id': :'botId',
        'webhook_url': :'webhookUrl'
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
        'secret_key': :'String',
        'outbound_url': :'String',
        'payload_version': :'String',
        'bot_id': :'String',
        'webhook_url': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {OCI::Oda::Models::CreateChannelResult#id #id} proprety
    # @option attributes [String] :name The value to assign to the {OCI::Oda::Models::CreateChannelResult#name #name} proprety
    # @option attributes [String] :description The value to assign to the {OCI::Oda::Models::CreateChannelResult#description #description} proprety
    # @option attributes [String] :category The value to assign to the {OCI::Oda::Models::CreateChannelResult#category #category} proprety
    # @option attributes [Integer] :session_expiry_duration_in_milliseconds The value to assign to the {OCI::Oda::Models::CreateChannelResult#session_expiry_duration_in_milliseconds #session_expiry_duration_in_milliseconds} proprety
    # @option attributes [String] :lifecycle_state The value to assign to the {OCI::Oda::Models::CreateChannelResult#lifecycle_state #lifecycle_state} proprety
    # @option attributes [DateTime] :time_created The value to assign to the {OCI::Oda::Models::CreateChannelResult#time_created #time_created} proprety
    # @option attributes [DateTime] :time_updated The value to assign to the {OCI::Oda::Models::CreateChannelResult#time_updated #time_updated} proprety
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {OCI::Oda::Models::CreateChannelResult#freeform_tags #freeform_tags} proprety
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {OCI::Oda::Models::CreateChannelResult#defined_tags #defined_tags} proprety
    # @option attributes [String] :secret_key The value to assign to the {#secret_key} property
    # @option attributes [String] :outbound_url The value to assign to the {#outbound_url} property
    # @option attributes [String] :payload_version The value to assign to the {#payload_version} property
    # @option attributes [String] :bot_id The value to assign to the {#bot_id} property
    # @option attributes [String] :webhook_url The value to assign to the {#webhook_url} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['type'] = 'WEBHOOK'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.secret_key = attributes[:'secretKey'] if attributes[:'secretKey']

      raise 'You cannot provide both :secretKey and :secret_key' if attributes.key?(:'secretKey') && attributes.key?(:'secret_key')

      self.secret_key = attributes[:'secret_key'] if attributes[:'secret_key']

      self.outbound_url = attributes[:'outboundUrl'] if attributes[:'outboundUrl']

      raise 'You cannot provide both :outboundUrl and :outbound_url' if attributes.key?(:'outboundUrl') && attributes.key?(:'outbound_url')

      self.outbound_url = attributes[:'outbound_url'] if attributes[:'outbound_url']

      self.payload_version = attributes[:'payloadVersion'] if attributes[:'payloadVersion']

      raise 'You cannot provide both :payloadVersion and :payload_version' if attributes.key?(:'payloadVersion') && attributes.key?(:'payload_version')

      self.payload_version = attributes[:'payload_version'] if attributes[:'payload_version']

      self.bot_id = attributes[:'botId'] if attributes[:'botId']

      raise 'You cannot provide both :botId and :bot_id' if attributes.key?(:'botId') && attributes.key?(:'bot_id')

      self.bot_id = attributes[:'bot_id'] if attributes[:'bot_id']

      self.webhook_url = attributes[:'webhookUrl'] if attributes[:'webhookUrl']

      raise 'You cannot provide both :webhookUrl and :webhook_url' if attributes.key?(:'webhookUrl') && attributes.key?(:'webhook_url')

      self.webhook_url = attributes[:'webhook_url'] if attributes[:'webhook_url']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] payload_version Object to be assigned
    def payload_version=(payload_version)
      # rubocop:disable Style/ConditionalAssignment
      if payload_version && !PAYLOAD_VERSION_ENUM.include?(payload_version)
        OCI.logger.debug("Unknown value for 'payload_version' [" + payload_version + "]. Mapping to 'PAYLOAD_VERSION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @payload_version = PAYLOAD_VERSION_UNKNOWN_ENUM_VALUE
      else
        @payload_version = payload_version
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
        secret_key == other.secret_key &&
        outbound_url == other.outbound_url &&
        payload_version == other.payload_version &&
        bot_id == other.bot_id &&
        webhook_url == other.webhook_url
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
      [id, name, description, category, type, session_expiry_duration_in_milliseconds, lifecycle_state, time_created, time_updated, freeform_tags, defined_tags, secret_key, outbound_url, payload_version, bot_id, webhook_url].hash
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
