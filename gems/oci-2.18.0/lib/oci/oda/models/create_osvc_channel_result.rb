# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'
require_relative 'create_channel_result'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The configuration for an OSVC channel.
  class Oda::Models::CreateOsvcChannelResult < Oda::Models::CreateChannelResult
    CHANNEL_SERVICE_ENUM = [
      CHANNEL_SERVICE_OSVC = 'OSVC'.freeze,
      CHANNEL_SERVICE_FUSION = 'FUSION'.freeze,
      CHANNEL_SERVICE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The host.
    #
    # For OSVC, you can derive these values from the URL that you use to launch the Agent Browser User Interface
    # or the chat launch page. For example, if the URL is https://sitename.exampledomain.com/app/chat/chat_launch,
    # then the host is sitename.exampledomain.com.
    #
    # For FUSION, this is the host portion of your Oracle Applications Cloud (Fusion) instance's URL.
    # For example: sitename.exampledomain.com.
    #
    # @return [String]
    attr_accessor :host

    # **[Required]** The port.
    # @return [String]
    attr_accessor :port

    # **[Required]** The user name for the digital-assistant agent.
    # @return [String]
    attr_accessor :user_name

    # **[Required]** The total session count.
    # @return [Integer]
    attr_accessor :total_session_count

    # **[Required]** The type of OSVC service.
    # @return [String]
    attr_reader :channel_service

    # **[Required]** The name of the Authentication Provider to use to authenticate the user.
    # @return [String]
    attr_accessor :authentication_provider_name

    # The ID of the Skill or Digital Assistant that the Channel is routed to.
    # @return [String]
    attr_accessor :bot_id

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
        'host': :'host',
        'port': :'port',
        'user_name': :'userName',
        'total_session_count': :'totalSessionCount',
        'channel_service': :'channelService',
        'authentication_provider_name': :'authenticationProviderName',
        'bot_id': :'botId'
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
        'host': :'String',
        'port': :'String',
        'user_name': :'String',
        'total_session_count': :'Integer',
        'channel_service': :'String',
        'authentication_provider_name': :'String',
        'bot_id': :'String'
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
    # @option attributes [String] :host The value to assign to the {#host} property
    # @option attributes [String] :port The value to assign to the {#port} property
    # @option attributes [String] :user_name The value to assign to the {#user_name} property
    # @option attributes [Integer] :total_session_count The value to assign to the {#total_session_count} property
    # @option attributes [String] :channel_service The value to assign to the {#channel_service} property
    # @option attributes [String] :authentication_provider_name The value to assign to the {#authentication_provider_name} property
    # @option attributes [String] :bot_id The value to assign to the {#bot_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['type'] = 'OSVC'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.host = attributes[:'host'] if attributes[:'host']

      self.port = attributes[:'port'] if attributes[:'port']

      self.user_name = attributes[:'userName'] if attributes[:'userName']

      raise 'You cannot provide both :userName and :user_name' if attributes.key?(:'userName') && attributes.key?(:'user_name')

      self.user_name = attributes[:'user_name'] if attributes[:'user_name']

      self.total_session_count = attributes[:'totalSessionCount'] if attributes[:'totalSessionCount']

      raise 'You cannot provide both :totalSessionCount and :total_session_count' if attributes.key?(:'totalSessionCount') && attributes.key?(:'total_session_count')

      self.total_session_count = attributes[:'total_session_count'] if attributes[:'total_session_count']

      self.channel_service = attributes[:'channelService'] if attributes[:'channelService']

      raise 'You cannot provide both :channelService and :channel_service' if attributes.key?(:'channelService') && attributes.key?(:'channel_service')

      self.channel_service = attributes[:'channel_service'] if attributes[:'channel_service']

      self.authentication_provider_name = attributes[:'authenticationProviderName'] if attributes[:'authenticationProviderName']

      raise 'You cannot provide both :authenticationProviderName and :authentication_provider_name' if attributes.key?(:'authenticationProviderName') && attributes.key?(:'authentication_provider_name')

      self.authentication_provider_name = attributes[:'authentication_provider_name'] if attributes[:'authentication_provider_name']

      self.bot_id = attributes[:'botId'] if attributes[:'botId']

      raise 'You cannot provide both :botId and :bot_id' if attributes.key?(:'botId') && attributes.key?(:'bot_id')

      self.bot_id = attributes[:'bot_id'] if attributes[:'bot_id']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] channel_service Object to be assigned
    def channel_service=(channel_service)
      # rubocop:disable Style/ConditionalAssignment
      if channel_service && !CHANNEL_SERVICE_ENUM.include?(channel_service)
        OCI.logger.debug("Unknown value for 'channel_service' [" + channel_service + "]. Mapping to 'CHANNEL_SERVICE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @channel_service = CHANNEL_SERVICE_UNKNOWN_ENUM_VALUE
      else
        @channel_service = channel_service
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
        host == other.host &&
        port == other.port &&
        user_name == other.user_name &&
        total_session_count == other.total_session_count &&
        channel_service == other.channel_service &&
        authentication_provider_name == other.authentication_provider_name &&
        bot_id == other.bot_id
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
      [id, name, description, category, type, session_expiry_duration_in_milliseconds, lifecycle_state, time_created, time_updated, freeform_tags, defined_tags, host, port, user_name, total_session_count, channel_service, authentication_provider_name, bot_id].hash
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
