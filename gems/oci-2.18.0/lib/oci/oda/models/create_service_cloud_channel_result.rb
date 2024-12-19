# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'
require_relative 'create_channel_result'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The configuration for a Service Cloud agent channel.
  class Oda::Models::CreateServiceCloudChannelResult < Oda::Models::CreateChannelResult
    CLIENT_TYPE_ENUM = [
      CLIENT_TYPE_WSDL = 'WSDL'.freeze,
      CLIENT_TYPE_REST = 'REST'.freeze,
      CLIENT_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The domain name.
    #
    # If you have access to Oracle B2C Service, you can derive this value from the URL that you use to launch the
    # Agent Browser User Interface. For example, if the URL is sitename.exampledomain.com, then the host name prefix
    # is sitename and the domain name is exampledomain.com.
    #
    # If the channel is connecting to Oracle B2C Service version 19A or later, and you have multiple interfaces,
    # then you must include the interface ID in the host (site) name . For example, for the interface that has an ID of 2, you would use something like sitename-2.exampledomain.com.
    #
    # @return [String]
    attr_accessor :domain_name

    # **[Required]** The host prefix.
    #
    # If you have access to Oracle B2C Service, you can derive this value from the URL that you use to launch the
    # Agent Browser User Interface. For example, if the URL is sitename.exampledomain.com, then the host name prefix
    # is sitename and the domain name is exampledomain.com.
    #
    # If the channel is connecting to Oracle B2C Service version 19A or later, and you have multiple interfaces,
    # then you must include the interface ID in the host (site) name . For example, for the interface that has an ID of 2, you would use something like sitename-2.exampledomain.com.
    #
    # @return [String]
    attr_accessor :host_name_prefix

    # **[Required]** The user name for an Oracle B2C Service staff member who has the necessary profile permissions.
    # @return [String]
    attr_accessor :user_name

    # **[Required]** The type of Service Cloud client.
    # @return [String]
    attr_reader :client_type

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
        'domain_name': :'domainName',
        'host_name_prefix': :'hostNamePrefix',
        'user_name': :'userName',
        'client_type': :'clientType'
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
        'domain_name': :'String',
        'host_name_prefix': :'String',
        'user_name': :'String',
        'client_type': :'String'
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
    # @option attributes [String] :domain_name The value to assign to the {#domain_name} property
    # @option attributes [String] :host_name_prefix The value to assign to the {#host_name_prefix} property
    # @option attributes [String] :user_name The value to assign to the {#user_name} property
    # @option attributes [String] :client_type The value to assign to the {#client_type} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['type'] = 'SERVICECLOUD'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.domain_name = attributes[:'domainName'] if attributes[:'domainName']

      raise 'You cannot provide both :domainName and :domain_name' if attributes.key?(:'domainName') && attributes.key?(:'domain_name')

      self.domain_name = attributes[:'domain_name'] if attributes[:'domain_name']

      self.host_name_prefix = attributes[:'hostNamePrefix'] if attributes[:'hostNamePrefix']

      raise 'You cannot provide both :hostNamePrefix and :host_name_prefix' if attributes.key?(:'hostNamePrefix') && attributes.key?(:'host_name_prefix')

      self.host_name_prefix = attributes[:'host_name_prefix'] if attributes[:'host_name_prefix']

      self.user_name = attributes[:'userName'] if attributes[:'userName']

      raise 'You cannot provide both :userName and :user_name' if attributes.key?(:'userName') && attributes.key?(:'user_name')

      self.user_name = attributes[:'user_name'] if attributes[:'user_name']

      self.client_type = attributes[:'clientType'] if attributes[:'clientType']

      raise 'You cannot provide both :clientType and :client_type' if attributes.key?(:'clientType') && attributes.key?(:'client_type')

      self.client_type = attributes[:'client_type'] if attributes[:'client_type']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] client_type Object to be assigned
    def client_type=(client_type)
      # rubocop:disable Style/ConditionalAssignment
      if client_type && !CLIENT_TYPE_ENUM.include?(client_type)
        OCI.logger.debug("Unknown value for 'client_type' [" + client_type + "]. Mapping to 'CLIENT_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @client_type = CLIENT_TYPE_UNKNOWN_ENUM_VALUE
      else
        @client_type = client_type
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
        domain_name == other.domain_name &&
        host_name_prefix == other.host_name_prefix &&
        user_name == other.user_name &&
        client_type == other.client_type
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
      [id, name, description, category, type, session_expiry_duration_in_milliseconds, lifecycle_state, time_created, time_updated, freeform_tags, defined_tags, domain_name, host_name_prefix, user_name, client_type].hash
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
