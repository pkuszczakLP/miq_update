# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'decryption_profile'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # SSLForwardProxy used on the firewall policy rules.
  class NetworkFirewall::Models::SslForwardProxyProfile < NetworkFirewall::Models::DecryptionProfile
    # **[Required]** Whether to block sessions if server's certificate is expired.
    # @return [BOOLEAN]
    attr_accessor :is_expired_certificate_blocked

    # **[Required]** Whether to block sessions if server's certificate is issued by an untrusted certificate authority (CA).
    # @return [BOOLEAN]
    attr_accessor :is_untrusted_issuer_blocked

    # **[Required]** Whether to block sessions if the revocation status check for server's certificate
    # does not succeed within the maximum allowed time (defaulting to 5 seconds).
    #
    # @return [BOOLEAN]
    attr_accessor :is_revocation_status_timeout_blocked

    # **[Required]** Whether to block sessions if SSL version is not supported.
    # @return [BOOLEAN]
    attr_accessor :is_unsupported_version_blocked

    # **[Required]** Whether to block sessions if SSL cipher suite is not supported.
    # @return [BOOLEAN]
    attr_accessor :is_unsupported_cipher_blocked

    # **[Required]** Whether to block sessions if the revocation status check for server's certificate results in \"unknown\".
    # @return [BOOLEAN]
    attr_accessor :is_unknown_revocation_status_blocked

    # **[Required]** Whether to block sessions if the server's certificate uses extensions other than key usage and/or extended key usage.
    # @return [BOOLEAN]
    attr_accessor :are_certificate_extensions_restricted

    # **[Required]** Whether to automatically append SAN to impersonating certificate if server certificate is missing SAN.
    # @return [BOOLEAN]
    attr_accessor :is_auto_include_alt_name

    # **[Required]** Whether to block sessions if the firewall is temporarily unable to decrypt their traffic.
    # @return [BOOLEAN]
    attr_accessor :is_out_of_capacity_blocked

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'type',
        'is_expired_certificate_blocked': :'isExpiredCertificateBlocked',
        'is_untrusted_issuer_blocked': :'isUntrustedIssuerBlocked',
        'is_revocation_status_timeout_blocked': :'isRevocationStatusTimeoutBlocked',
        'is_unsupported_version_blocked': :'isUnsupportedVersionBlocked',
        'is_unsupported_cipher_blocked': :'isUnsupportedCipherBlocked',
        'is_unknown_revocation_status_blocked': :'isUnknownRevocationStatusBlocked',
        'are_certificate_extensions_restricted': :'areCertificateExtensionsRestricted',
        'is_auto_include_alt_name': :'isAutoIncludeAltName',
        'is_out_of_capacity_blocked': :'isOutOfCapacityBlocked'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'String',
        'is_expired_certificate_blocked': :'BOOLEAN',
        'is_untrusted_issuer_blocked': :'BOOLEAN',
        'is_revocation_status_timeout_blocked': :'BOOLEAN',
        'is_unsupported_version_blocked': :'BOOLEAN',
        'is_unsupported_cipher_blocked': :'BOOLEAN',
        'is_unknown_revocation_status_blocked': :'BOOLEAN',
        'are_certificate_extensions_restricted': :'BOOLEAN',
        'is_auto_include_alt_name': :'BOOLEAN',
        'is_out_of_capacity_blocked': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [BOOLEAN] :is_expired_certificate_blocked The value to assign to the {#is_expired_certificate_blocked} property
    # @option attributes [BOOLEAN] :is_untrusted_issuer_blocked The value to assign to the {#is_untrusted_issuer_blocked} property
    # @option attributes [BOOLEAN] :is_revocation_status_timeout_blocked The value to assign to the {#is_revocation_status_timeout_blocked} property
    # @option attributes [BOOLEAN] :is_unsupported_version_blocked The value to assign to the {#is_unsupported_version_blocked} property
    # @option attributes [BOOLEAN] :is_unsupported_cipher_blocked The value to assign to the {#is_unsupported_cipher_blocked} property
    # @option attributes [BOOLEAN] :is_unknown_revocation_status_blocked The value to assign to the {#is_unknown_revocation_status_blocked} property
    # @option attributes [BOOLEAN] :are_certificate_extensions_restricted The value to assign to the {#are_certificate_extensions_restricted} property
    # @option attributes [BOOLEAN] :is_auto_include_alt_name The value to assign to the {#is_auto_include_alt_name} property
    # @option attributes [BOOLEAN] :is_out_of_capacity_blocked The value to assign to the {#is_out_of_capacity_blocked} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['type'] = 'SSL_FORWARD_PROXY'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.is_expired_certificate_blocked = attributes[:'isExpiredCertificateBlocked'] unless attributes[:'isExpiredCertificateBlocked'].nil?

      raise 'You cannot provide both :isExpiredCertificateBlocked and :is_expired_certificate_blocked' if attributes.key?(:'isExpiredCertificateBlocked') && attributes.key?(:'is_expired_certificate_blocked')

      self.is_expired_certificate_blocked = attributes[:'is_expired_certificate_blocked'] unless attributes[:'is_expired_certificate_blocked'].nil?

      self.is_untrusted_issuer_blocked = attributes[:'isUntrustedIssuerBlocked'] unless attributes[:'isUntrustedIssuerBlocked'].nil?

      raise 'You cannot provide both :isUntrustedIssuerBlocked and :is_untrusted_issuer_blocked' if attributes.key?(:'isUntrustedIssuerBlocked') && attributes.key?(:'is_untrusted_issuer_blocked')

      self.is_untrusted_issuer_blocked = attributes[:'is_untrusted_issuer_blocked'] unless attributes[:'is_untrusted_issuer_blocked'].nil?

      self.is_revocation_status_timeout_blocked = attributes[:'isRevocationStatusTimeoutBlocked'] unless attributes[:'isRevocationStatusTimeoutBlocked'].nil?

      raise 'You cannot provide both :isRevocationStatusTimeoutBlocked and :is_revocation_status_timeout_blocked' if attributes.key?(:'isRevocationStatusTimeoutBlocked') && attributes.key?(:'is_revocation_status_timeout_blocked')

      self.is_revocation_status_timeout_blocked = attributes[:'is_revocation_status_timeout_blocked'] unless attributes[:'is_revocation_status_timeout_blocked'].nil?

      self.is_unsupported_version_blocked = attributes[:'isUnsupportedVersionBlocked'] unless attributes[:'isUnsupportedVersionBlocked'].nil?

      raise 'You cannot provide both :isUnsupportedVersionBlocked and :is_unsupported_version_blocked' if attributes.key?(:'isUnsupportedVersionBlocked') && attributes.key?(:'is_unsupported_version_blocked')

      self.is_unsupported_version_blocked = attributes[:'is_unsupported_version_blocked'] unless attributes[:'is_unsupported_version_blocked'].nil?

      self.is_unsupported_cipher_blocked = attributes[:'isUnsupportedCipherBlocked'] unless attributes[:'isUnsupportedCipherBlocked'].nil?

      raise 'You cannot provide both :isUnsupportedCipherBlocked and :is_unsupported_cipher_blocked' if attributes.key?(:'isUnsupportedCipherBlocked') && attributes.key?(:'is_unsupported_cipher_blocked')

      self.is_unsupported_cipher_blocked = attributes[:'is_unsupported_cipher_blocked'] unless attributes[:'is_unsupported_cipher_blocked'].nil?

      self.is_unknown_revocation_status_blocked = attributes[:'isUnknownRevocationStatusBlocked'] unless attributes[:'isUnknownRevocationStatusBlocked'].nil?

      raise 'You cannot provide both :isUnknownRevocationStatusBlocked and :is_unknown_revocation_status_blocked' if attributes.key?(:'isUnknownRevocationStatusBlocked') && attributes.key?(:'is_unknown_revocation_status_blocked')

      self.is_unknown_revocation_status_blocked = attributes[:'is_unknown_revocation_status_blocked'] unless attributes[:'is_unknown_revocation_status_blocked'].nil?

      self.are_certificate_extensions_restricted = attributes[:'areCertificateExtensionsRestricted'] unless attributes[:'areCertificateExtensionsRestricted'].nil?

      raise 'You cannot provide both :areCertificateExtensionsRestricted and :are_certificate_extensions_restricted' if attributes.key?(:'areCertificateExtensionsRestricted') && attributes.key?(:'are_certificate_extensions_restricted')

      self.are_certificate_extensions_restricted = attributes[:'are_certificate_extensions_restricted'] unless attributes[:'are_certificate_extensions_restricted'].nil?

      self.is_auto_include_alt_name = attributes[:'isAutoIncludeAltName'] unless attributes[:'isAutoIncludeAltName'].nil?

      raise 'You cannot provide both :isAutoIncludeAltName and :is_auto_include_alt_name' if attributes.key?(:'isAutoIncludeAltName') && attributes.key?(:'is_auto_include_alt_name')

      self.is_auto_include_alt_name = attributes[:'is_auto_include_alt_name'] unless attributes[:'is_auto_include_alt_name'].nil?

      self.is_out_of_capacity_blocked = attributes[:'isOutOfCapacityBlocked'] unless attributes[:'isOutOfCapacityBlocked'].nil?

      raise 'You cannot provide both :isOutOfCapacityBlocked and :is_out_of_capacity_blocked' if attributes.key?(:'isOutOfCapacityBlocked') && attributes.key?(:'is_out_of_capacity_blocked')

      self.is_out_of_capacity_blocked = attributes[:'is_out_of_capacity_blocked'] unless attributes[:'is_out_of_capacity_blocked'].nil?
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        type == other.type &&
        is_expired_certificate_blocked == other.is_expired_certificate_blocked &&
        is_untrusted_issuer_blocked == other.is_untrusted_issuer_blocked &&
        is_revocation_status_timeout_blocked == other.is_revocation_status_timeout_blocked &&
        is_unsupported_version_blocked == other.is_unsupported_version_blocked &&
        is_unsupported_cipher_blocked == other.is_unsupported_cipher_blocked &&
        is_unknown_revocation_status_blocked == other.is_unknown_revocation_status_blocked &&
        are_certificate_extensions_restricted == other.are_certificate_extensions_restricted &&
        is_auto_include_alt_name == other.is_auto_include_alt_name &&
        is_out_of_capacity_blocked == other.is_out_of_capacity_blocked
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
      [type, is_expired_certificate_blocked, is_untrusted_issuer_blocked, is_revocation_status_timeout_blocked, is_unsupported_version_blocked, is_unsupported_cipher_blocked, is_unknown_revocation_status_blocked, are_certificate_extensions_restricted, is_auto_include_alt_name, is_out_of_capacity_blocked].hash
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
