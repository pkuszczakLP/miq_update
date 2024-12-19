# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The properties that define endpoints for a cluster.
  class ContainerEngine::Models::ClusterEndpoints
    # The non-native networking Kubernetes API server endpoint.
    # @return [String]
    attr_accessor :kubernetes

    # The public native networking Kubernetes API server endpoint, if one was requested.
    # @return [String]
    attr_accessor :public_endpoint

    # The private native networking Kubernetes API server endpoint.
    # @return [String]
    attr_accessor :private_endpoint

    # The FQDN assigned to the Kubernetes API private endpoint.
    # Example: 'https://yourVcnHostnameEndpoint'
    #
    # @return [String]
    attr_accessor :vcn_hostname_endpoint

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'kubernetes': :'kubernetes',
        'public_endpoint': :'publicEndpoint',
        'private_endpoint': :'privateEndpoint',
        'vcn_hostname_endpoint': :'vcnHostnameEndpoint'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'kubernetes': :'String',
        'public_endpoint': :'String',
        'private_endpoint': :'String',
        'vcn_hostname_endpoint': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :kubernetes The value to assign to the {#kubernetes} property
    # @option attributes [String] :public_endpoint The value to assign to the {#public_endpoint} property
    # @option attributes [String] :private_endpoint The value to assign to the {#private_endpoint} property
    # @option attributes [String] :vcn_hostname_endpoint The value to assign to the {#vcn_hostname_endpoint} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.kubernetes = attributes[:'kubernetes'] if attributes[:'kubernetes']

      self.public_endpoint = attributes[:'publicEndpoint'] if attributes[:'publicEndpoint']

      raise 'You cannot provide both :publicEndpoint and :public_endpoint' if attributes.key?(:'publicEndpoint') && attributes.key?(:'public_endpoint')

      self.public_endpoint = attributes[:'public_endpoint'] if attributes[:'public_endpoint']

      self.private_endpoint = attributes[:'privateEndpoint'] if attributes[:'privateEndpoint']

      raise 'You cannot provide both :privateEndpoint and :private_endpoint' if attributes.key?(:'privateEndpoint') && attributes.key?(:'private_endpoint')

      self.private_endpoint = attributes[:'private_endpoint'] if attributes[:'private_endpoint']

      self.vcn_hostname_endpoint = attributes[:'vcnHostnameEndpoint'] if attributes[:'vcnHostnameEndpoint']

      raise 'You cannot provide both :vcnHostnameEndpoint and :vcn_hostname_endpoint' if attributes.key?(:'vcnHostnameEndpoint') && attributes.key?(:'vcn_hostname_endpoint')

      self.vcn_hostname_endpoint = attributes[:'vcn_hostname_endpoint'] if attributes[:'vcn_hostname_endpoint']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        kubernetes == other.kubernetes &&
        public_endpoint == other.public_endpoint &&
        private_endpoint == other.private_endpoint &&
        vcn_hostname_endpoint == other.vcn_hostname_endpoint
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
      [kubernetes, public_endpoint, private_endpoint, vcn_hostname_endpoint].hash
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
