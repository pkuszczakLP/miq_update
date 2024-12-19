# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A load balancer IP address.
  class NetworkLoadBalancer::Models::IpAddress
    IP_VERSION_ENUM = [
      IP_VERSION_IPV4 = 'IPV4'.freeze,
      IP_VERSION_IPV6 = 'IPV6'.freeze,
      IP_VERSION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** An IP address.
    #
    # Example: `192.168.0.3`
    #
    # @return [String]
    attr_accessor :ip_address

    # Whether the IP address is public or private.
    #
    # If \"true\", then the IP address is public and accessible from the internet.
    #
    # If \"false\", then the IP address is private and accessible only from within the associated virtual cloud network.
    #
    # @return [BOOLEAN]
    attr_accessor :is_public

    # IP version associated with this IP address.
    # @return [String]
    attr_reader :ip_version

    # @return [OCI::NetworkLoadBalancer::Models::ReservedIP]
    attr_accessor :reserved_ip

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'ip_address': :'ipAddress',
        'is_public': :'isPublic',
        'ip_version': :'ipVersion',
        'reserved_ip': :'reservedIp'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'ip_address': :'String',
        'is_public': :'BOOLEAN',
        'ip_version': :'String',
        'reserved_ip': :'OCI::NetworkLoadBalancer::Models::ReservedIP'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :ip_address The value to assign to the {#ip_address} property
    # @option attributes [BOOLEAN] :is_public The value to assign to the {#is_public} property
    # @option attributes [String] :ip_version The value to assign to the {#ip_version} property
    # @option attributes [OCI::NetworkLoadBalancer::Models::ReservedIP] :reserved_ip The value to assign to the {#reserved_ip} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.ip_address = attributes[:'ipAddress'] if attributes[:'ipAddress']

      raise 'You cannot provide both :ipAddress and :ip_address' if attributes.key?(:'ipAddress') && attributes.key?(:'ip_address')

      self.ip_address = attributes[:'ip_address'] if attributes[:'ip_address']

      self.is_public = attributes[:'isPublic'] unless attributes[:'isPublic'].nil?

      raise 'You cannot provide both :isPublic and :is_public' if attributes.key?(:'isPublic') && attributes.key?(:'is_public')

      self.is_public = attributes[:'is_public'] unless attributes[:'is_public'].nil?

      self.ip_version = attributes[:'ipVersion'] if attributes[:'ipVersion']
      self.ip_version = "IPV4" if ip_version.nil? && !attributes.key?(:'ipVersion') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :ipVersion and :ip_version' if attributes.key?(:'ipVersion') && attributes.key?(:'ip_version')

      self.ip_version = attributes[:'ip_version'] if attributes[:'ip_version']
      self.ip_version = "IPV4" if ip_version.nil? && !attributes.key?(:'ipVersion') && !attributes.key?(:'ip_version') # rubocop:disable Style/StringLiterals

      self.reserved_ip = attributes[:'reservedIp'] if attributes[:'reservedIp']

      raise 'You cannot provide both :reservedIp and :reserved_ip' if attributes.key?(:'reservedIp') && attributes.key?(:'reserved_ip')

      self.reserved_ip = attributes[:'reserved_ip'] if attributes[:'reserved_ip']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] ip_version Object to be assigned
    def ip_version=(ip_version)
      # rubocop:disable Style/ConditionalAssignment
      if ip_version && !IP_VERSION_ENUM.include?(ip_version)
        OCI.logger.debug("Unknown value for 'ip_version' [" + ip_version + "]. Mapping to 'IP_VERSION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @ip_version = IP_VERSION_UNKNOWN_ENUM_VALUE
      else
        @ip_version = ip_version
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        ip_address == other.ip_address &&
        is_public == other.is_public &&
        ip_version == other.ip_version &&
        reserved_ip == other.reserved_ip
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
      [ip_address, is_public, ip_version, reserved_ip].hash
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
