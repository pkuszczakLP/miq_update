# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'create_channel_result'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The configuration for a Twilio channel.
  class Oda::Models::CreateTwilioChannelResult < Oda::Models::CreateChannelResult
    # **[Required]** The Account SID for the Twilio number.
    # @return [String]
    attr_accessor :account_sid

    # **[Required]** The Twilio phone number.
    # @return [String]
    attr_accessor :phone_number

    # **[Required]** Whether MMS is enabled for this channel or not.
    # @return [BOOLEAN]
    attr_accessor :is_mms_enabled

    # The original connectors URL (used for backward compatibility).
    # @return [String]
    attr_accessor :original_connectors_url

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
        'account_sid': :'accountSID',
        'phone_number': :'phoneNumber',
        'is_mms_enabled': :'isMmsEnabled',
        'original_connectors_url': :'originalConnectorsUrl',
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
        'account_sid': :'String',
        'phone_number': :'String',
        'is_mms_enabled': :'BOOLEAN',
        'original_connectors_url': :'String',
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
    # @option attributes [String] :account_sid The value to assign to the {#account_sid} property
    # @option attributes [String] :phone_number The value to assign to the {#phone_number} property
    # @option attributes [BOOLEAN] :is_mms_enabled The value to assign to the {#is_mms_enabled} property
    # @option attributes [String] :original_connectors_url The value to assign to the {#original_connectors_url} property
    # @option attributes [String] :bot_id The value to assign to the {#bot_id} property
    # @option attributes [String] :webhook_url The value to assign to the {#webhook_url} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['type'] = 'TWILIO'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.account_sid = attributes[:'accountSID'] if attributes[:'accountSID']

      raise 'You cannot provide both :accountSID and :account_sid' if attributes.key?(:'accountSID') && attributes.key?(:'account_sid')

      self.account_sid = attributes[:'account_sid'] if attributes[:'account_sid']

      self.phone_number = attributes[:'phoneNumber'] if attributes[:'phoneNumber']

      raise 'You cannot provide both :phoneNumber and :phone_number' if attributes.key?(:'phoneNumber') && attributes.key?(:'phone_number')

      self.phone_number = attributes[:'phone_number'] if attributes[:'phone_number']

      self.is_mms_enabled = attributes[:'isMmsEnabled'] unless attributes[:'isMmsEnabled'].nil?

      raise 'You cannot provide both :isMmsEnabled and :is_mms_enabled' if attributes.key?(:'isMmsEnabled') && attributes.key?(:'is_mms_enabled')

      self.is_mms_enabled = attributes[:'is_mms_enabled'] unless attributes[:'is_mms_enabled'].nil?

      self.original_connectors_url = attributes[:'originalConnectorsUrl'] if attributes[:'originalConnectorsUrl']

      raise 'You cannot provide both :originalConnectorsUrl and :original_connectors_url' if attributes.key?(:'originalConnectorsUrl') && attributes.key?(:'original_connectors_url')

      self.original_connectors_url = attributes[:'original_connectors_url'] if attributes[:'original_connectors_url']

      self.bot_id = attributes[:'botId'] if attributes[:'botId']

      raise 'You cannot provide both :botId and :bot_id' if attributes.key?(:'botId') && attributes.key?(:'bot_id')

      self.bot_id = attributes[:'bot_id'] if attributes[:'bot_id']

      self.webhook_url = attributes[:'webhookUrl'] if attributes[:'webhookUrl']

      raise 'You cannot provide both :webhookUrl and :webhook_url' if attributes.key?(:'webhookUrl') && attributes.key?(:'webhook_url')

      self.webhook_url = attributes[:'webhook_url'] if attributes[:'webhook_url']
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
        account_sid == other.account_sid &&
        phone_number == other.phone_number &&
        is_mms_enabled == other.is_mms_enabled &&
        original_connectors_url == other.original_connectors_url &&
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
      [id, name, description, category, type, session_expiry_duration_in_milliseconds, lifecycle_state, time_created, time_updated, freeform_tags, defined_tags, account_sid, phone_number, is_mms_enabled, original_connectors_url, bot_id, webhook_url].hash
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
