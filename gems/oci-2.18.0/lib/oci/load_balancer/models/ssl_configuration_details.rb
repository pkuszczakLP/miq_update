# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The load balancer's SSL handling configuration details.
  #
  # **Warning:** Oracle recommends that you avoid using any confidential information when you supply string values using the API.
  #
  class LoadBalancer::Models::SSLConfigurationDetails
    SERVER_ORDER_PREFERENCE_ENUM = [
      SERVER_ORDER_PREFERENCE_ENABLED = 'ENABLED'.freeze,
      SERVER_ORDER_PREFERENCE_DISABLED = 'DISABLED'.freeze
    ].freeze

    # The maximum depth for peer certificate chain verification.
    #
    # Example: `3`
    #
    # @return [Integer]
    attr_accessor :verify_depth

    # Whether the load balancer listener should verify peer certificates.
    #
    # Example: `true`
    #
    # @return [BOOLEAN]
    attr_accessor :verify_peer_certificate

    # Ids for OCI certificates service CA or CA bundles for the load balancer to trust.
    #
    # Example: `[ocid1.cabundle.oc1.us-ashburn-1.amaaaaaaav3bgsaagl4zzyqdop5i2vuwoqewdvauuw34llqa74otq2jdsfyq]`
    #
    # @return [Array<String>]
    attr_accessor :trusted_certificate_authority_ids

    # Ids for OCI certificates service certificates. Currently only a single Id may be passed.
    #
    # Example: `[ocid1.certificate.oc1.us-ashburn-1.amaaaaaaav3bgsaa5o2q7rh5nfmkkukfkogasqhk6af2opufhjlqg7m6jqzq]`
    #
    # @return [Array<String>]
    attr_accessor :certificate_ids

    # A friendly name for the certificate bundle. It must be unique and it cannot be changed.
    # Valid certificate bundle names include only alphanumeric characters, dashes, and underscores.
    # Certificate bundle names cannot contain spaces. Avoid entering confidential information.
    #
    # Example: `example_certificate_bundle`
    #
    # @return [String]
    attr_accessor :certificate_name

    # A list of SSL protocols the load balancer must support for HTTPS or SSL connections.
    #
    # The load balancer uses SSL protocols to establish a secure connection between a client and a server. A secure
    # connection ensures that all data passed between the client and the server is private.
    #
    # The Load Balancing service supports the following protocols:
    #
    # *  TLSv1
    # *  TLSv1.1
    # *  TLSv1.2
    #
    # If this field is not specified, TLSv1.2 is the default.
    #
    # **Warning:** All SSL listeners created on a given port must use the same set of SSL protocols.
    #
    # **Notes:**
    #
    # *  The handshake to establish an SSL connection fails if the client supports none of the specified protocols.
    # *  You must ensure compatibility between the specified SSL protocols and the ciphers configured in the cipher
    #    suite.
    # *  For all existing load balancer listeners and backend sets that predate this feature, the `GET` operation
    #    displays a list of SSL protocols currently used by those resources.
    #
    # example: `[\"TLSv1.1\", \"TLSv1.2\"]`
    #
    # @return [Array<String>]
    attr_accessor :protocols

    # The name of the cipher suite to use for HTTPS or SSL connections.
    #
    # If this field is not specified, the default is `oci-default-ssl-cipher-suite-v1`.
    #
    # **Notes:**
    #
    # *  You must ensure compatibility between the specified SSL protocols and the ciphers configured in the cipher
    #    suite. Clients cannot perform an SSL handshake if there is an incompatible configuration.
    # *  You must ensure compatibility between the ciphers configured in the cipher suite and the configured
    #    certificates. For example, RSA-based ciphers require RSA certificates and ECDSA-based ciphers require ECDSA
    #    certificates.
    # *  If the cipher configuration is not modified after load balancer creation, the `GET` operation returns
    #    `oci-default-ssl-cipher-suite-v1` as the value of this field in the SSL configuration for existing listeners
    #    that predate this feature.
    # *  If the cipher configuration was modified using Oracle operations after load balancer creation, the `GET`
    #    operation returns `oci-customized-ssl-cipher-suite` as the value of this field in the SSL configuration for
    #    existing listeners that predate this feature.
    # *  The `GET` operation returns `oci-wider-compatible-ssl-cipher-suite-v1` as the value of this field in the SSL
    #    configuration for existing backend sets that predate this feature.
    # *  If the `GET` operation on a listener returns `oci-customized-ssl-cipher-suite` as the value of this field,
    #    you must specify an appropriate predefined or custom cipher suite name when updating the resource.
    # *  The `oci-customized-ssl-cipher-suite` Oracle reserved cipher suite name is not accepted as valid input for
    #    this field.
    #
    # example: `example_cipher_suite`
    #
    # @return [String]
    attr_accessor :cipher_suite_name

    # When this attribute is set to ENABLED, the system gives preference to the server ciphers over the client
    # ciphers.
    #
    # **Note:** This configuration is applicable only when the load balancer is acting as an SSL/HTTPS server. This
    #           field is ignored when the `SSLConfiguration` object is associated with a backend set.
    #
    # @return [String]
    attr_reader :server_order_preference

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'verify_depth': :'verifyDepth',
        'verify_peer_certificate': :'verifyPeerCertificate',
        'trusted_certificate_authority_ids': :'trustedCertificateAuthorityIds',
        'certificate_ids': :'certificateIds',
        'certificate_name': :'certificateName',
        'protocols': :'protocols',
        'cipher_suite_name': :'cipherSuiteName',
        'server_order_preference': :'serverOrderPreference'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'verify_depth': :'Integer',
        'verify_peer_certificate': :'BOOLEAN',
        'trusted_certificate_authority_ids': :'Array<String>',
        'certificate_ids': :'Array<String>',
        'certificate_name': :'String',
        'protocols': :'Array<String>',
        'cipher_suite_name': :'String',
        'server_order_preference': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :verify_depth The value to assign to the {#verify_depth} property
    # @option attributes [BOOLEAN] :verify_peer_certificate The value to assign to the {#verify_peer_certificate} property
    # @option attributes [Array<String>] :trusted_certificate_authority_ids The value to assign to the {#trusted_certificate_authority_ids} property
    # @option attributes [Array<String>] :certificate_ids The value to assign to the {#certificate_ids} property
    # @option attributes [String] :certificate_name The value to assign to the {#certificate_name} property
    # @option attributes [Array<String>] :protocols The value to assign to the {#protocols} property
    # @option attributes [String] :cipher_suite_name The value to assign to the {#cipher_suite_name} property
    # @option attributes [String] :server_order_preference The value to assign to the {#server_order_preference} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.verify_depth = attributes[:'verifyDepth'] if attributes[:'verifyDepth']

      raise 'You cannot provide both :verifyDepth and :verify_depth' if attributes.key?(:'verifyDepth') && attributes.key?(:'verify_depth')

      self.verify_depth = attributes[:'verify_depth'] if attributes[:'verify_depth']

      self.verify_peer_certificate = attributes[:'verifyPeerCertificate'] unless attributes[:'verifyPeerCertificate'].nil?
      self.verify_peer_certificate = false if verify_peer_certificate.nil? && !attributes.key?(:'verifyPeerCertificate') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :verifyPeerCertificate and :verify_peer_certificate' if attributes.key?(:'verifyPeerCertificate') && attributes.key?(:'verify_peer_certificate')

      self.verify_peer_certificate = attributes[:'verify_peer_certificate'] unless attributes[:'verify_peer_certificate'].nil?
      self.verify_peer_certificate = false if verify_peer_certificate.nil? && !attributes.key?(:'verifyPeerCertificate') && !attributes.key?(:'verify_peer_certificate') # rubocop:disable Style/StringLiterals

      self.trusted_certificate_authority_ids = attributes[:'trustedCertificateAuthorityIds'] if attributes[:'trustedCertificateAuthorityIds']

      raise 'You cannot provide both :trustedCertificateAuthorityIds and :trusted_certificate_authority_ids' if attributes.key?(:'trustedCertificateAuthorityIds') && attributes.key?(:'trusted_certificate_authority_ids')

      self.trusted_certificate_authority_ids = attributes[:'trusted_certificate_authority_ids'] if attributes[:'trusted_certificate_authority_ids']

      self.certificate_ids = attributes[:'certificateIds'] if attributes[:'certificateIds']

      raise 'You cannot provide both :certificateIds and :certificate_ids' if attributes.key?(:'certificateIds') && attributes.key?(:'certificate_ids')

      self.certificate_ids = attributes[:'certificate_ids'] if attributes[:'certificate_ids']

      self.certificate_name = attributes[:'certificateName'] if attributes[:'certificateName']

      raise 'You cannot provide both :certificateName and :certificate_name' if attributes.key?(:'certificateName') && attributes.key?(:'certificate_name')

      self.certificate_name = attributes[:'certificate_name'] if attributes[:'certificate_name']

      self.protocols = attributes[:'protocols'] if attributes[:'protocols']

      self.cipher_suite_name = attributes[:'cipherSuiteName'] if attributes[:'cipherSuiteName']
      self.cipher_suite_name = "oci-default-ssl-cipher-suite-v1" if cipher_suite_name.nil? && !attributes.key?(:'cipherSuiteName') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :cipherSuiteName and :cipher_suite_name' if attributes.key?(:'cipherSuiteName') && attributes.key?(:'cipher_suite_name')

      self.cipher_suite_name = attributes[:'cipher_suite_name'] if attributes[:'cipher_suite_name']
      self.cipher_suite_name = "oci-default-ssl-cipher-suite-v1" if cipher_suite_name.nil? && !attributes.key?(:'cipherSuiteName') && !attributes.key?(:'cipher_suite_name') # rubocop:disable Style/StringLiterals

      self.server_order_preference = attributes[:'serverOrderPreference'] if attributes[:'serverOrderPreference']
      self.server_order_preference = "ENABLED" if server_order_preference.nil? && !attributes.key?(:'serverOrderPreference') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :serverOrderPreference and :server_order_preference' if attributes.key?(:'serverOrderPreference') && attributes.key?(:'server_order_preference')

      self.server_order_preference = attributes[:'server_order_preference'] if attributes[:'server_order_preference']
      self.server_order_preference = "ENABLED" if server_order_preference.nil? && !attributes.key?(:'serverOrderPreference') && !attributes.key?(:'server_order_preference') # rubocop:disable Style/StringLiterals
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] server_order_preference Object to be assigned
    def server_order_preference=(server_order_preference)
      raise "Invalid value for 'server_order_preference': this must be one of the values in SERVER_ORDER_PREFERENCE_ENUM." if server_order_preference && !SERVER_ORDER_PREFERENCE_ENUM.include?(server_order_preference)

      @server_order_preference = server_order_preference
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        verify_depth == other.verify_depth &&
        verify_peer_certificate == other.verify_peer_certificate &&
        trusted_certificate_authority_ids == other.trusted_certificate_authority_ids &&
        certificate_ids == other.certificate_ids &&
        certificate_name == other.certificate_name &&
        protocols == other.protocols &&
        cipher_suite_name == other.cipher_suite_name &&
        server_order_preference == other.server_order_preference
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
      [verify_depth, verify_peer_certificate, trusted_certificate_authority_ids, certificate_ids, certificate_name, protocols, cipher_suite_name, server_order_preference].hash
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
