# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A base object for creating a publication package.
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class Marketplace::Models::CreatePublicationPackage
    PACKAGE_TYPE_ENUM = [
      PACKAGE_TYPE_ORCHESTRATION = 'ORCHESTRATION'.freeze,
      PACKAGE_TYPE_IMAGE = 'IMAGE'.freeze
    ].freeze

    # **[Required]** The package version.
    # @return [String]
    attr_accessor :package_version

    # **[Required]** The package's type.
    # @return [String]
    attr_reader :package_type

    # This attribute is required.
    # @return [OCI::Marketplace::Models::OperatingSystem]
    attr_accessor :operating_system

    # **[Required]** The end user license agreeement (EULA) that consumers of this listing must accept.
    # @return [Array<OCI::Marketplace::Models::Eula>]
    attr_accessor :eula

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'package_version': :'packageVersion',
        'package_type': :'packageType',
        'operating_system': :'operatingSystem',
        'eula': :'eula'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'package_version': :'String',
        'package_type': :'String',
        'operating_system': :'OCI::Marketplace::Models::OperatingSystem',
        'eula': :'Array<OCI::Marketplace::Models::Eula>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'packageType'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::Marketplace::Models::CreateImagePublicationPackage' if type == 'IMAGE'

      # TODO: Log a warning when the subtype is not found.
      'OCI::Marketplace::Models::CreatePublicationPackage'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :package_version The value to assign to the {#package_version} property
    # @option attributes [String] :package_type The value to assign to the {#package_type} property
    # @option attributes [OCI::Marketplace::Models::OperatingSystem] :operating_system The value to assign to the {#operating_system} property
    # @option attributes [Array<OCI::Marketplace::Models::Eula>] :eula The value to assign to the {#eula} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.package_version = attributes[:'packageVersion'] if attributes[:'packageVersion']

      raise 'You cannot provide both :packageVersion and :package_version' if attributes.key?(:'packageVersion') && attributes.key?(:'package_version')

      self.package_version = attributes[:'package_version'] if attributes[:'package_version']

      self.package_type = attributes[:'packageType'] if attributes[:'packageType']

      raise 'You cannot provide both :packageType and :package_type' if attributes.key?(:'packageType') && attributes.key?(:'package_type')

      self.package_type = attributes[:'package_type'] if attributes[:'package_type']

      self.operating_system = attributes[:'operatingSystem'] if attributes[:'operatingSystem']

      raise 'You cannot provide both :operatingSystem and :operating_system' if attributes.key?(:'operatingSystem') && attributes.key?(:'operating_system')

      self.operating_system = attributes[:'operating_system'] if attributes[:'operating_system']

      self.eula = attributes[:'eula'] if attributes[:'eula']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] package_type Object to be assigned
    def package_type=(package_type)
      raise "Invalid value for 'package_type': this must be one of the values in PACKAGE_TYPE_ENUM." if package_type && !PACKAGE_TYPE_ENUM.include?(package_type)

      @package_type = package_type
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        package_version == other.package_version &&
        package_type == other.package_type &&
        operating_system == other.operating_system &&
        eula == other.eula
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
      [package_version, package_type, operating_system, eula].hash
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
