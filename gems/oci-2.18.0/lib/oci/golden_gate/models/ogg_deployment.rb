# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Deployment Data for an OggDeployment
  #
  class GoldenGate::Models::OggDeployment
    # **[Required]** The name given to the GoldenGate service deployment. The name must be 1 to 32 characters long, must contain only alphanumeric characters and must start with a letter.
    #
    # @return [String]
    attr_accessor :deployment_name

    # **[Required]** The GoldenGate deployment console username.
    #
    # @return [String]
    attr_accessor :admin_username

    # Version of OGG
    #
    # @return [String]
    attr_accessor :ogg_version

    # A PEM-encoded SSL certificate.
    #
    # @return [String]
    attr_accessor :certificate

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'deployment_name': :'deploymentName',
        'admin_username': :'adminUsername',
        'ogg_version': :'oggVersion',
        'certificate': :'certificate'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'deployment_name': :'String',
        'admin_username': :'String',
        'ogg_version': :'String',
        'certificate': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :deployment_name The value to assign to the {#deployment_name} property
    # @option attributes [String] :admin_username The value to assign to the {#admin_username} property
    # @option attributes [String] :ogg_version The value to assign to the {#ogg_version} property
    # @option attributes [String] :certificate The value to assign to the {#certificate} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.deployment_name = attributes[:'deploymentName'] if attributes[:'deploymentName']

      raise 'You cannot provide both :deploymentName and :deployment_name' if attributes.key?(:'deploymentName') && attributes.key?(:'deployment_name')

      self.deployment_name = attributes[:'deployment_name'] if attributes[:'deployment_name']

      self.admin_username = attributes[:'adminUsername'] if attributes[:'adminUsername']

      raise 'You cannot provide both :adminUsername and :admin_username' if attributes.key?(:'adminUsername') && attributes.key?(:'admin_username')

      self.admin_username = attributes[:'admin_username'] if attributes[:'admin_username']

      self.ogg_version = attributes[:'oggVersion'] if attributes[:'oggVersion']

      raise 'You cannot provide both :oggVersion and :ogg_version' if attributes.key?(:'oggVersion') && attributes.key?(:'ogg_version')

      self.ogg_version = attributes[:'ogg_version'] if attributes[:'ogg_version']

      self.certificate = attributes[:'certificate'] if attributes[:'certificate']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        deployment_name == other.deployment_name &&
        admin_username == other.admin_username &&
        ogg_version == other.ogg_version &&
        certificate == other.certificate
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
      [deployment_name, admin_username, ogg_version, certificate].hash
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
