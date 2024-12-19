# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Sighting Endpoints summary.
  class CloudGuard::Models::SightingEndpointSummary
    # **[Required]** Unique identifier for sighting endpoints
    # @return [String]
    attr_accessor :id

    # **[Required]** Sighitng Id for sighting endpoints
    # @return [String]
    attr_accessor :sighting_id

    # Problem Id for sighting endpoints
    # @return [String]
    attr_accessor :problem_id

    # **[Required]** IP Address
    # @return [String]
    attr_accessor :ip_address

    # **[Required]** IP Address type
    # @return [String]
    attr_accessor :ip_address_type

    # IP Address classification type
    # @return [String]
    attr_accessor :ip_classification_type

    # Country
    # @return [String]
    attr_accessor :country

    # Latitude
    # @return [Float]
    attr_accessor :latitude

    # Longitude
    # @return [Float]
    attr_accessor :longitude

    # ASN number
    # @return [String]
    attr_accessor :asn_number

    # Regions where activities were performed from this IP
    # @return [Array<String>]
    attr_accessor :regions

    # Services where activities were performed from this IP
    # @return [Array<String>]
    attr_accessor :services

    # **[Required]** Time when activities were created
    # @return [DateTime]
    attr_accessor :time_last_detected

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'sighting_id': :'sightingId',
        'problem_id': :'problemId',
        'ip_address': :'ipAddress',
        'ip_address_type': :'ipAddressType',
        'ip_classification_type': :'ipClassificationType',
        'country': :'country',
        'latitude': :'latitude',
        'longitude': :'longitude',
        'asn_number': :'asnNumber',
        'regions': :'regions',
        'services': :'services',
        'time_last_detected': :'timeLastDetected'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'sighting_id': :'String',
        'problem_id': :'String',
        'ip_address': :'String',
        'ip_address_type': :'String',
        'ip_classification_type': :'String',
        'country': :'String',
        'latitude': :'Float',
        'longitude': :'Float',
        'asn_number': :'String',
        'regions': :'Array<String>',
        'services': :'Array<String>',
        'time_last_detected': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :sighting_id The value to assign to the {#sighting_id} property
    # @option attributes [String] :problem_id The value to assign to the {#problem_id} property
    # @option attributes [String] :ip_address The value to assign to the {#ip_address} property
    # @option attributes [String] :ip_address_type The value to assign to the {#ip_address_type} property
    # @option attributes [String] :ip_classification_type The value to assign to the {#ip_classification_type} property
    # @option attributes [String] :country The value to assign to the {#country} property
    # @option attributes [Float] :latitude The value to assign to the {#latitude} property
    # @option attributes [Float] :longitude The value to assign to the {#longitude} property
    # @option attributes [String] :asn_number The value to assign to the {#asn_number} property
    # @option attributes [Array<String>] :regions The value to assign to the {#regions} property
    # @option attributes [Array<String>] :services The value to assign to the {#services} property
    # @option attributes [DateTime] :time_last_detected The value to assign to the {#time_last_detected} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.sighting_id = attributes[:'sightingId'] if attributes[:'sightingId']

      raise 'You cannot provide both :sightingId and :sighting_id' if attributes.key?(:'sightingId') && attributes.key?(:'sighting_id')

      self.sighting_id = attributes[:'sighting_id'] if attributes[:'sighting_id']

      self.problem_id = attributes[:'problemId'] if attributes[:'problemId']

      raise 'You cannot provide both :problemId and :problem_id' if attributes.key?(:'problemId') && attributes.key?(:'problem_id')

      self.problem_id = attributes[:'problem_id'] if attributes[:'problem_id']

      self.ip_address = attributes[:'ipAddress'] if attributes[:'ipAddress']

      raise 'You cannot provide both :ipAddress and :ip_address' if attributes.key?(:'ipAddress') && attributes.key?(:'ip_address')

      self.ip_address = attributes[:'ip_address'] if attributes[:'ip_address']

      self.ip_address_type = attributes[:'ipAddressType'] if attributes[:'ipAddressType']

      raise 'You cannot provide both :ipAddressType and :ip_address_type' if attributes.key?(:'ipAddressType') && attributes.key?(:'ip_address_type')

      self.ip_address_type = attributes[:'ip_address_type'] if attributes[:'ip_address_type']

      self.ip_classification_type = attributes[:'ipClassificationType'] if attributes[:'ipClassificationType']

      raise 'You cannot provide both :ipClassificationType and :ip_classification_type' if attributes.key?(:'ipClassificationType') && attributes.key?(:'ip_classification_type')

      self.ip_classification_type = attributes[:'ip_classification_type'] if attributes[:'ip_classification_type']

      self.country = attributes[:'country'] if attributes[:'country']

      self.latitude = attributes[:'latitude'] if attributes[:'latitude']

      self.longitude = attributes[:'longitude'] if attributes[:'longitude']

      self.asn_number = attributes[:'asnNumber'] if attributes[:'asnNumber']

      raise 'You cannot provide both :asnNumber and :asn_number' if attributes.key?(:'asnNumber') && attributes.key?(:'asn_number')

      self.asn_number = attributes[:'asn_number'] if attributes[:'asn_number']

      self.regions = attributes[:'regions'] if attributes[:'regions']

      self.services = attributes[:'services'] if attributes[:'services']

      self.time_last_detected = attributes[:'timeLastDetected'] if attributes[:'timeLastDetected']

      raise 'You cannot provide both :timeLastDetected and :time_last_detected' if attributes.key?(:'timeLastDetected') && attributes.key?(:'time_last_detected')

      self.time_last_detected = attributes[:'time_last_detected'] if attributes[:'time_last_detected']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        sighting_id == other.sighting_id &&
        problem_id == other.problem_id &&
        ip_address == other.ip_address &&
        ip_address_type == other.ip_address_type &&
        ip_classification_type == other.ip_classification_type &&
        country == other.country &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        asn_number == other.asn_number &&
        regions == other.regions &&
        services == other.services &&
        time_last_detected == other.time_last_detected
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
      [id, sighting_id, problem_id, ip_address, ip_address_type, ip_classification_type, country, latitude, longitude, asn_number, regions, services, time_last_detected].hash
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