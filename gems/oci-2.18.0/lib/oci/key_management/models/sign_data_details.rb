# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # SignDataDetails model.
  class KeyManagement::Models::SignDataDetails
    MESSAGE_TYPE_ENUM = [
      MESSAGE_TYPE_RAW = 'RAW'.freeze,
      MESSAGE_TYPE_DIGEST = 'DIGEST'.freeze
    ].freeze

    SIGNING_ALGORITHM_ENUM = [
      SIGNING_ALGORITHM_SHA_224_RSA_PKCS_PSS = 'SHA_224_RSA_PKCS_PSS'.freeze,
      SIGNING_ALGORITHM_SHA_256_RSA_PKCS_PSS = 'SHA_256_RSA_PKCS_PSS'.freeze,
      SIGNING_ALGORITHM_SHA_384_RSA_PKCS_PSS = 'SHA_384_RSA_PKCS_PSS'.freeze,
      SIGNING_ALGORITHM_SHA_512_RSA_PKCS_PSS = 'SHA_512_RSA_PKCS_PSS'.freeze,
      SIGNING_ALGORITHM_SHA_224_RSA_PKCS1_V1_5 = 'SHA_224_RSA_PKCS1_V1_5'.freeze,
      SIGNING_ALGORITHM_SHA_256_RSA_PKCS1_V1_5 = 'SHA_256_RSA_PKCS1_V1_5'.freeze,
      SIGNING_ALGORITHM_SHA_384_RSA_PKCS1_V1_5 = 'SHA_384_RSA_PKCS1_V1_5'.freeze,
      SIGNING_ALGORITHM_SHA_512_RSA_PKCS1_V1_5 = 'SHA_512_RSA_PKCS1_V1_5'.freeze,
      SIGNING_ALGORITHM_ECDSA_SHA_256 = 'ECDSA_SHA_256'.freeze,
      SIGNING_ALGORITHM_ECDSA_SHA_384 = 'ECDSA_SHA_384'.freeze,
      SIGNING_ALGORITHM_ECDSA_SHA_512 = 'ECDSA_SHA_512'.freeze
    ].freeze

    # **[Required]** The base64-encoded binary data object denoting the message or message digest to sign. You can have a message up to 4096 bytes in size. To sign a larger message, provide the message digest.
    # @return [String]
    attr_accessor :message

    # **[Required]** The OCID of the key used to sign the message.
    # @return [String]
    attr_accessor :key_id

    # The OCID of the key version used to sign the message.
    # @return [String]
    attr_accessor :key_version_id

    # Denotes whether the value of the message parameter is a raw message or a message digest.
    # The default value, `RAW`, indicates a message. To indicate a message digest, use `DIGEST`.
    #
    # @return [String]
    attr_reader :message_type

    # **[Required]** The algorithm to use to sign the message or message digest.
    # For RSA keys, supported signature schemes include PKCS #1 and RSASSA-PSS, along with
    # different hashing algorithms.
    # For ECDSA keys, ECDSA is the supported signature scheme with different hashing algorithms.
    # When you pass a message digest for signing, ensure that you specify the same hashing algorithm
    # as used when creating the message digest.
    #
    # @return [String]
    attr_reader :signing_algorithm

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'message': :'message',
        'key_id': :'keyId',
        'key_version_id': :'keyVersionId',
        'message_type': :'messageType',
        'signing_algorithm': :'signingAlgorithm'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'message': :'String',
        'key_id': :'String',
        'key_version_id': :'String',
        'message_type': :'String',
        'signing_algorithm': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :message The value to assign to the {#message} property
    # @option attributes [String] :key_id The value to assign to the {#key_id} property
    # @option attributes [String] :key_version_id The value to assign to the {#key_version_id} property
    # @option attributes [String] :message_type The value to assign to the {#message_type} property
    # @option attributes [String] :signing_algorithm The value to assign to the {#signing_algorithm} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.message = attributes[:'message'] if attributes[:'message']

      self.key_id = attributes[:'keyId'] if attributes[:'keyId']

      raise 'You cannot provide both :keyId and :key_id' if attributes.key?(:'keyId') && attributes.key?(:'key_id')

      self.key_id = attributes[:'key_id'] if attributes[:'key_id']

      self.key_version_id = attributes[:'keyVersionId'] if attributes[:'keyVersionId']

      raise 'You cannot provide both :keyVersionId and :key_version_id' if attributes.key?(:'keyVersionId') && attributes.key?(:'key_version_id')

      self.key_version_id = attributes[:'key_version_id'] if attributes[:'key_version_id']

      self.message_type = attributes[:'messageType'] if attributes[:'messageType']
      self.message_type = "RAW" if message_type.nil? && !attributes.key?(:'messageType') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :messageType and :message_type' if attributes.key?(:'messageType') && attributes.key?(:'message_type')

      self.message_type = attributes[:'message_type'] if attributes[:'message_type']
      self.message_type = "RAW" if message_type.nil? && !attributes.key?(:'messageType') && !attributes.key?(:'message_type') # rubocop:disable Style/StringLiterals

      self.signing_algorithm = attributes[:'signingAlgorithm'] if attributes[:'signingAlgorithm']

      raise 'You cannot provide both :signingAlgorithm and :signing_algorithm' if attributes.key?(:'signingAlgorithm') && attributes.key?(:'signing_algorithm')

      self.signing_algorithm = attributes[:'signing_algorithm'] if attributes[:'signing_algorithm']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] message_type Object to be assigned
    def message_type=(message_type)
      raise "Invalid value for 'message_type': this must be one of the values in MESSAGE_TYPE_ENUM." if message_type && !MESSAGE_TYPE_ENUM.include?(message_type)

      @message_type = message_type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] signing_algorithm Object to be assigned
    def signing_algorithm=(signing_algorithm)
      raise "Invalid value for 'signing_algorithm': this must be one of the values in SIGNING_ALGORITHM_ENUM." if signing_algorithm && !SIGNING_ALGORITHM_ENUM.include?(signing_algorithm)

      @signing_algorithm = signing_algorithm
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        message == other.message &&
        key_id == other.key_id &&
        key_version_id == other.key_version_id &&
        message_type == other.message_type &&
        signing_algorithm == other.signing_algorithm
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
      [message, key_id, key_version_id, message_type, signing_algorithm].hash
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