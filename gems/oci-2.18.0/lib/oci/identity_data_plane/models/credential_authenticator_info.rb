# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # CredentialAuthenticatorInfo model.
  class IdentityDataPlane::Models::CredentialAuthenticatorInfo
    # **[Required]** The raw credential.
    # @return [String]
    attr_accessor :raw_credential

    # **[Required]** The id of the user.
    # @return [String]
    attr_accessor :user_id

    # **[Required]** The id of the tenant.
    # @return [String]
    attr_accessor :tenant_id

    # **[Required]** The name of the user.
    # @return [String]
    attr_accessor :user_name

    # **[Required]** The name of the tenant.
    # @return [String]
    attr_accessor :tenant_name

    # **[Required]** The credential identifier.
    # @return [String]
    attr_accessor :credential_identifier

    # **[Required]** The credential list.
    # @return [Array<String>]
    attr_accessor :credential_list

    # **[Required]** The name of the service that is making this authorization request.
    # @return [String]
    attr_accessor :service

    # **[Required]** The id of the client.
    # @return [String]
    attr_accessor :client_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'raw_credential': :'rawCredential',
        'user_id': :'userId',
        'tenant_id': :'tenantId',
        'user_name': :'userName',
        'tenant_name': :'tenantName',
        'credential_identifier': :'credentialIdentifier',
        'credential_list': :'credentialList',
        'service': :'service',
        'client_id': :'clientId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'raw_credential': :'String',
        'user_id': :'String',
        'tenant_id': :'String',
        'user_name': :'String',
        'tenant_name': :'String',
        'credential_identifier': :'String',
        'credential_list': :'Array<String>',
        'service': :'String',
        'client_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :raw_credential The value to assign to the {#raw_credential} property
    # @option attributes [String] :user_id The value to assign to the {#user_id} property
    # @option attributes [String] :tenant_id The value to assign to the {#tenant_id} property
    # @option attributes [String] :user_name The value to assign to the {#user_name} property
    # @option attributes [String] :tenant_name The value to assign to the {#tenant_name} property
    # @option attributes [String] :credential_identifier The value to assign to the {#credential_identifier} property
    # @option attributes [Array<String>] :credential_list The value to assign to the {#credential_list} property
    # @option attributes [String] :service The value to assign to the {#service} property
    # @option attributes [String] :client_id The value to assign to the {#client_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.raw_credential = attributes[:'rawCredential'] if attributes[:'rawCredential']

      raise 'You cannot provide both :rawCredential and :raw_credential' if attributes.key?(:'rawCredential') && attributes.key?(:'raw_credential')

      self.raw_credential = attributes[:'raw_credential'] if attributes[:'raw_credential']

      self.user_id = attributes[:'userId'] if attributes[:'userId']

      raise 'You cannot provide both :userId and :user_id' if attributes.key?(:'userId') && attributes.key?(:'user_id')

      self.user_id = attributes[:'user_id'] if attributes[:'user_id']

      self.tenant_id = attributes[:'tenantId'] if attributes[:'tenantId']

      raise 'You cannot provide both :tenantId and :tenant_id' if attributes.key?(:'tenantId') && attributes.key?(:'tenant_id')

      self.tenant_id = attributes[:'tenant_id'] if attributes[:'tenant_id']

      self.user_name = attributes[:'userName'] if attributes[:'userName']

      raise 'You cannot provide both :userName and :user_name' if attributes.key?(:'userName') && attributes.key?(:'user_name')

      self.user_name = attributes[:'user_name'] if attributes[:'user_name']

      self.tenant_name = attributes[:'tenantName'] if attributes[:'tenantName']

      raise 'You cannot provide both :tenantName and :tenant_name' if attributes.key?(:'tenantName') && attributes.key?(:'tenant_name')

      self.tenant_name = attributes[:'tenant_name'] if attributes[:'tenant_name']

      self.credential_identifier = attributes[:'credentialIdentifier'] if attributes[:'credentialIdentifier']

      raise 'You cannot provide both :credentialIdentifier and :credential_identifier' if attributes.key?(:'credentialIdentifier') && attributes.key?(:'credential_identifier')

      self.credential_identifier = attributes[:'credential_identifier'] if attributes[:'credential_identifier']

      self.credential_list = attributes[:'credentialList'] if attributes[:'credentialList']

      raise 'You cannot provide both :credentialList and :credential_list' if attributes.key?(:'credentialList') && attributes.key?(:'credential_list')

      self.credential_list = attributes[:'credential_list'] if attributes[:'credential_list']

      self.service = attributes[:'service'] if attributes[:'service']

      self.client_id = attributes[:'clientId'] if attributes[:'clientId']

      raise 'You cannot provide both :clientId and :client_id' if attributes.key?(:'clientId') && attributes.key?(:'client_id')

      self.client_id = attributes[:'client_id'] if attributes[:'client_id']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        raw_credential == other.raw_credential &&
        user_id == other.user_id &&
        tenant_id == other.tenant_id &&
        user_name == other.user_name &&
        tenant_name == other.tenant_name &&
        credential_identifier == other.credential_identifier &&
        credential_list == other.credential_list &&
        service == other.service &&
        client_id == other.client_id
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
      [raw_credential, user_id, tenant_id, user_name, tenant_name, credential_identifier, credential_list, service, client_id].hash
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
