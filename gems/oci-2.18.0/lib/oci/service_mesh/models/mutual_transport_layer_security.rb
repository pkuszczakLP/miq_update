# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Mutual TLS settings used when communicating with other virtual services or ingress gateways within the mesh.
  #
  class ServiceMesh::Models::MutualTransportLayerSecurity
    MODE_ENUM = [
      MODE_DISABLED = 'DISABLED'.freeze,
      MODE_PERMISSIVE = 'PERMISSIVE'.freeze,
      MODE_STRICT = 'STRICT'.freeze,
      MODE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The OCID of the certificate resource that will be used for mTLS authentication with other virtual services in the mesh.
    #
    # @return [String]
    attr_accessor :certificate_id

    # The number of days the mTLS certificate is valid.  This value should be less than the Maximum Validity Duration
    # for Certificates (Days) setting on the Certificate Authority associated with this Mesh.  The certificate will
    # be automatically renewed after 2/3 of the validity period, so a certificate with a maximum validity of 45 days
    # will be renewed every 30 days.
    #
    # @return [Integer]
    attr_accessor :maximum_validity

    # **[Required]** DISABLED: Connection is not tunneled.
    # PERMISSIVE: Connection can be either plaintext or an mTLS tunnel.
    # STRICT: Connection is an mTLS tunnel.  Clients without a valid certificate will be rejected.
    #
    # @return [String]
    attr_reader :mode

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'certificate_id': :'certificateId',
        'maximum_validity': :'maximumValidity',
        'mode': :'mode'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'certificate_id': :'String',
        'maximum_validity': :'Integer',
        'mode': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :certificate_id The value to assign to the {#certificate_id} property
    # @option attributes [Integer] :maximum_validity The value to assign to the {#maximum_validity} property
    # @option attributes [String] :mode The value to assign to the {#mode} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.certificate_id = attributes[:'certificateId'] if attributes[:'certificateId']

      raise 'You cannot provide both :certificateId and :certificate_id' if attributes.key?(:'certificateId') && attributes.key?(:'certificate_id')

      self.certificate_id = attributes[:'certificate_id'] if attributes[:'certificate_id']

      self.maximum_validity = attributes[:'maximumValidity'] if attributes[:'maximumValidity']
      self.maximum_validity = 45 if maximum_validity.nil? && !attributes.key?(:'maximumValidity') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :maximumValidity and :maximum_validity' if attributes.key?(:'maximumValidity') && attributes.key?(:'maximum_validity')

      self.maximum_validity = attributes[:'maximum_validity'] if attributes[:'maximum_validity']
      self.maximum_validity = 45 if maximum_validity.nil? && !attributes.key?(:'maximumValidity') && !attributes.key?(:'maximum_validity') # rubocop:disable Style/StringLiterals

      self.mode = attributes[:'mode'] if attributes[:'mode']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] mode Object to be assigned
    def mode=(mode)
      # rubocop:disable Style/ConditionalAssignment
      if mode && !MODE_ENUM.include?(mode)
        OCI.logger.debug("Unknown value for 'mode' [" + mode + "]. Mapping to 'MODE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @mode = MODE_UNKNOWN_ENUM_VALUE
      else
        @mode = mode
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        certificate_id == other.certificate_id &&
        maximum_validity == other.maximum_validity &&
        mode == other.mode
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
      [certificate_id, maximum_validity, mode].hash
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
