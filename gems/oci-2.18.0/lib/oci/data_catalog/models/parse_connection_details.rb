# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Parse connections from the connection metadata and Oracle wallet file.
  # An error will be returned if more than one of connectionPayload, walletSecretId or walletSecretName are present in the request.
  #
  class DataCatalog::Models::ParseConnectionDetails
    # @return [OCI::DataCatalog::Models::Connection]
    attr_accessor :connection_detail

    # The information used to parse the connection from the wallet file payload.
    # @return [String]
    attr_accessor :connection_payload

    # OCID of the OCI Vault secret holding the Oracle wallet to parse.
    # @return [String]
    attr_accessor :wallet_secret_id

    # Name of the OCI Vault secret holding the Oracle wallet to parse.
    # @return [String]
    attr_accessor :wallet_secret_name

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'connection_detail': :'connectionDetail',
        'connection_payload': :'connectionPayload',
        'wallet_secret_id': :'walletSecretId',
        'wallet_secret_name': :'walletSecretName'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'connection_detail': :'OCI::DataCatalog::Models::Connection',
        'connection_payload': :'String',
        'wallet_secret_id': :'String',
        'wallet_secret_name': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [OCI::DataCatalog::Models::Connection] :connection_detail The value to assign to the {#connection_detail} property
    # @option attributes [String] :connection_payload The value to assign to the {#connection_payload} property
    # @option attributes [String] :wallet_secret_id The value to assign to the {#wallet_secret_id} property
    # @option attributes [String] :wallet_secret_name The value to assign to the {#wallet_secret_name} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.connection_detail = attributes[:'connectionDetail'] if attributes[:'connectionDetail']

      raise 'You cannot provide both :connectionDetail and :connection_detail' if attributes.key?(:'connectionDetail') && attributes.key?(:'connection_detail')

      self.connection_detail = attributes[:'connection_detail'] if attributes[:'connection_detail']

      self.connection_payload = attributes[:'connectionPayload'] if attributes[:'connectionPayload']

      raise 'You cannot provide both :connectionPayload and :connection_payload' if attributes.key?(:'connectionPayload') && attributes.key?(:'connection_payload')

      self.connection_payload = attributes[:'connection_payload'] if attributes[:'connection_payload']

      self.wallet_secret_id = attributes[:'walletSecretId'] if attributes[:'walletSecretId']

      raise 'You cannot provide both :walletSecretId and :wallet_secret_id' if attributes.key?(:'walletSecretId') && attributes.key?(:'wallet_secret_id')

      self.wallet_secret_id = attributes[:'wallet_secret_id'] if attributes[:'wallet_secret_id']

      self.wallet_secret_name = attributes[:'walletSecretName'] if attributes[:'walletSecretName']

      raise 'You cannot provide both :walletSecretName and :wallet_secret_name' if attributes.key?(:'walletSecretName') && attributes.key?(:'wallet_secret_name')

      self.wallet_secret_name = attributes[:'wallet_secret_name'] if attributes[:'wallet_secret_name']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        connection_detail == other.connection_detail &&
        connection_payload == other.connection_payload &&
        wallet_secret_id == other.wallet_secret_id &&
        wallet_secret_name == other.wallet_secret_name
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
      [connection_detail, connection_payload, wallet_secret_id, wallet_secret_name].hash
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