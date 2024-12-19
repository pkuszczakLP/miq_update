# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'database_tools_connection'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Database Tools connection of a MySQL Server.
  class DatabaseTools::Models::DatabaseToolsConnectionMySql < DatabaseTools::Models::DatabaseToolsConnection
    # @return [OCI::DatabaseTools::Models::DatabaseToolsRelatedResourceMySql]
    attr_accessor :related_resource

    # The connection string used to connect to the MySQL Server.
    # @return [String]
    attr_accessor :connection_string

    # The user name.
    # @return [String]
    attr_accessor :user_name

    # @return [OCI::DatabaseTools::Models::DatabaseToolsUserPassword]
    attr_accessor :user_password

    # The advanced connection properties key-value pair (for example, `sslMode`).
    # @return [Hash<String, String>]
    attr_accessor :advanced_properties

    # The CA certificate to verify the server's certificate and
    # the client private key and associated certificate required for client authentication.
    #
    # @return [Array<OCI::DatabaseTools::Models::DatabaseToolsKeyStoreMySql>]
    attr_accessor :key_stores

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Database Tools private endpoint used to access the database in the customer VCN.
    # @return [String]
    attr_accessor :private_endpoint_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'display_name': :'displayName',
        'compartment_id': :'compartmentId',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'defined_tags': :'definedTags',
        'freeform_tags': :'freeformTags',
        'system_tags': :'systemTags',
        'type': :'type',
        'related_resource': :'relatedResource',
        'connection_string': :'connectionString',
        'user_name': :'userName',
        'user_password': :'userPassword',
        'advanced_properties': :'advancedProperties',
        'key_stores': :'keyStores',
        'private_endpoint_id': :'privateEndpointId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'display_name': :'String',
        'compartment_id': :'String',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'freeform_tags': :'Hash<String, String>',
        'system_tags': :'Hash<String, Hash<String, Object>>',
        'type': :'String',
        'related_resource': :'OCI::DatabaseTools::Models::DatabaseToolsRelatedResourceMySql',
        'connection_string': :'String',
        'user_name': :'String',
        'user_password': :'OCI::DatabaseTools::Models::DatabaseToolsUserPassword',
        'advanced_properties': :'Hash<String, String>',
        'key_stores': :'Array<OCI::DatabaseTools::Models::DatabaseToolsKeyStoreMySql>',
        'private_endpoint_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {OCI::DatabaseTools::Models::DatabaseToolsConnection#id #id} proprety
    # @option attributes [String] :display_name The value to assign to the {OCI::DatabaseTools::Models::DatabaseToolsConnection#display_name #display_name} proprety
    # @option attributes [String] :compartment_id The value to assign to the {OCI::DatabaseTools::Models::DatabaseToolsConnection#compartment_id #compartment_id} proprety
    # @option attributes [String] :lifecycle_state The value to assign to the {OCI::DatabaseTools::Models::DatabaseToolsConnection#lifecycle_state #lifecycle_state} proprety
    # @option attributes [String] :lifecycle_details The value to assign to the {OCI::DatabaseTools::Models::DatabaseToolsConnection#lifecycle_details #lifecycle_details} proprety
    # @option attributes [DateTime] :time_created The value to assign to the {OCI::DatabaseTools::Models::DatabaseToolsConnection#time_created #time_created} proprety
    # @option attributes [DateTime] :time_updated The value to assign to the {OCI::DatabaseTools::Models::DatabaseToolsConnection#time_updated #time_updated} proprety
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {OCI::DatabaseTools::Models::DatabaseToolsConnection#defined_tags #defined_tags} proprety
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {OCI::DatabaseTools::Models::DatabaseToolsConnection#freeform_tags #freeform_tags} proprety
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {OCI::DatabaseTools::Models::DatabaseToolsConnection#system_tags #system_tags} proprety
    # @option attributes [OCI::DatabaseTools::Models::DatabaseToolsRelatedResourceMySql] :related_resource The value to assign to the {#related_resource} property
    # @option attributes [String] :connection_string The value to assign to the {#connection_string} property
    # @option attributes [String] :user_name The value to assign to the {#user_name} property
    # @option attributes [OCI::DatabaseTools::Models::DatabaseToolsUserPassword] :user_password The value to assign to the {#user_password} property
    # @option attributes [Hash<String, String>] :advanced_properties The value to assign to the {#advanced_properties} property
    # @option attributes [Array<OCI::DatabaseTools::Models::DatabaseToolsKeyStoreMySql>] :key_stores The value to assign to the {#key_stores} property
    # @option attributes [String] :private_endpoint_id The value to assign to the {#private_endpoint_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['type'] = 'MYSQL'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.related_resource = attributes[:'relatedResource'] if attributes[:'relatedResource']

      raise 'You cannot provide both :relatedResource and :related_resource' if attributes.key?(:'relatedResource') && attributes.key?(:'related_resource')

      self.related_resource = attributes[:'related_resource'] if attributes[:'related_resource']

      self.connection_string = attributes[:'connectionString'] if attributes[:'connectionString']

      raise 'You cannot provide both :connectionString and :connection_string' if attributes.key?(:'connectionString') && attributes.key?(:'connection_string')

      self.connection_string = attributes[:'connection_string'] if attributes[:'connection_string']

      self.user_name = attributes[:'userName'] if attributes[:'userName']

      raise 'You cannot provide both :userName and :user_name' if attributes.key?(:'userName') && attributes.key?(:'user_name')

      self.user_name = attributes[:'user_name'] if attributes[:'user_name']

      self.user_password = attributes[:'userPassword'] if attributes[:'userPassword']

      raise 'You cannot provide both :userPassword and :user_password' if attributes.key?(:'userPassword') && attributes.key?(:'user_password')

      self.user_password = attributes[:'user_password'] if attributes[:'user_password']

      self.advanced_properties = attributes[:'advancedProperties'] if attributes[:'advancedProperties']

      raise 'You cannot provide both :advancedProperties and :advanced_properties' if attributes.key?(:'advancedProperties') && attributes.key?(:'advanced_properties')

      self.advanced_properties = attributes[:'advanced_properties'] if attributes[:'advanced_properties']

      self.key_stores = attributes[:'keyStores'] if attributes[:'keyStores']

      raise 'You cannot provide both :keyStores and :key_stores' if attributes.key?(:'keyStores') && attributes.key?(:'key_stores')

      self.key_stores = attributes[:'key_stores'] if attributes[:'key_stores']

      self.private_endpoint_id = attributes[:'privateEndpointId'] if attributes[:'privateEndpointId']

      raise 'You cannot provide both :privateEndpointId and :private_endpoint_id' if attributes.key?(:'privateEndpointId') && attributes.key?(:'private_endpoint_id')

      self.private_endpoint_id = attributes[:'private_endpoint_id'] if attributes[:'private_endpoint_id']
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
        display_name == other.display_name &&
        compartment_id == other.compartment_id &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        defined_tags == other.defined_tags &&
        freeform_tags == other.freeform_tags &&
        system_tags == other.system_tags &&
        type == other.type &&
        related_resource == other.related_resource &&
        connection_string == other.connection_string &&
        user_name == other.user_name &&
        user_password == other.user_password &&
        advanced_properties == other.advanced_properties &&
        key_stores == other.key_stores &&
        private_endpoint_id == other.private_endpoint_id
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
      [id, display_name, compartment_id, lifecycle_state, lifecycle_details, time_created, time_updated, defined_tags, freeform_tags, system_tags, type, related_resource, connection_string, user_name, user_password, advanced_properties, key_stores, private_endpoint_id].hash
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
