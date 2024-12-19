# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Country details model
  class OspGateway::Models::Country
    # Indentifier of the country. This is a DB side unique id which was generated when the entity was created in the table
    # @return [Float]
    attr_accessor :country_id

    # Country code in ISO-3166-1 2-letter format
    # @return [String]
    attr_accessor :country_code

    # Name of the country
    # @return [String]
    attr_accessor :country_name

    # Language identifier
    # @return [Float]
    attr_accessor :language_id

    # Country code in ISO-3166-1 3-letter format
    # @return [String]
    attr_accessor :ascii3_country_code

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'country_id': :'countryId',
        'country_code': :'countryCode',
        'country_name': :'countryName',
        'language_id': :'languageId',
        'ascii3_country_code': :'ascii3CountryCode'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'country_id': :'Float',
        'country_code': :'String',
        'country_name': :'String',
        'language_id': :'Float',
        'ascii3_country_code': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Float] :country_id The value to assign to the {#country_id} property
    # @option attributes [String] :country_code The value to assign to the {#country_code} property
    # @option attributes [String] :country_name The value to assign to the {#country_name} property
    # @option attributes [Float] :language_id The value to assign to the {#language_id} property
    # @option attributes [String] :ascii3_country_code The value to assign to the {#ascii3_country_code} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.country_id = attributes[:'countryId'] if attributes[:'countryId']

      raise 'You cannot provide both :countryId and :country_id' if attributes.key?(:'countryId') && attributes.key?(:'country_id')

      self.country_id = attributes[:'country_id'] if attributes[:'country_id']

      self.country_code = attributes[:'countryCode'] if attributes[:'countryCode']

      raise 'You cannot provide both :countryCode and :country_code' if attributes.key?(:'countryCode') && attributes.key?(:'country_code')

      self.country_code = attributes[:'country_code'] if attributes[:'country_code']

      self.country_name = attributes[:'countryName'] if attributes[:'countryName']

      raise 'You cannot provide both :countryName and :country_name' if attributes.key?(:'countryName') && attributes.key?(:'country_name')

      self.country_name = attributes[:'country_name'] if attributes[:'country_name']

      self.language_id = attributes[:'languageId'] if attributes[:'languageId']

      raise 'You cannot provide both :languageId and :language_id' if attributes.key?(:'languageId') && attributes.key?(:'language_id')

      self.language_id = attributes[:'language_id'] if attributes[:'language_id']

      self.ascii3_country_code = attributes[:'ascii3CountryCode'] if attributes[:'ascii3CountryCode']

      raise 'You cannot provide both :ascii3CountryCode and :ascii3_country_code' if attributes.key?(:'ascii3CountryCode') && attributes.key?(:'ascii3_country_code')

      self.ascii3_country_code = attributes[:'ascii3_country_code'] if attributes[:'ascii3_country_code']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        country_id == other.country_id &&
        country_code == other.country_code &&
        country_name == other.country_name &&
        language_id == other.language_id &&
        ascii3_country_code == other.ascii3_country_code
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
      [country_id, country_code, country_name, language_id, ascii3_country_code].hash
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
