# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'publication_package'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A publication package for image publications.
  class Marketplace::Models::ImagePublicationPackage < Marketplace::Models::PublicationPackage
    # The ID of the listing resource associated with this publication package. For more information, see [AppCatalogListing](https://docs.cloud.oracle.com/en-us/iaas/api/#/en/iaas/latest/AppCatalogListing/) in the Core Services API.
    #
    # @return [String]
    attr_accessor :app_catalog_listing_id

    # The resource version of the listing resource associated with this publication package.
    # @return [String]
    attr_accessor :app_catalog_listing_resource_version

    # The ID of the image that corresponds to the package.
    # @return [String]
    attr_accessor :image_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'description': :'description',
        'listing_id': :'listingId',
        'version': :'version',
        'package_type': :'packageType',
        'resource_id': :'resourceId',
        'time_created': :'timeCreated',
        'operating_system': :'operatingSystem',
        'app_catalog_listing_id': :'appCatalogListingId',
        'app_catalog_listing_resource_version': :'appCatalogListingResourceVersion',
        'image_id': :'imageId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'description': :'String',
        'listing_id': :'String',
        'version': :'String',
        'package_type': :'String',
        'resource_id': :'String',
        'time_created': :'DateTime',
        'operating_system': :'OCI::Marketplace::Models::OperatingSystem',
        'app_catalog_listing_id': :'String',
        'app_catalog_listing_resource_version': :'String',
        'image_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :description The value to assign to the {OCI::Marketplace::Models::PublicationPackage#description #description} proprety
    # @option attributes [String] :listing_id The value to assign to the {OCI::Marketplace::Models::PublicationPackage#listing_id #listing_id} proprety
    # @option attributes [String] :version The value to assign to the {OCI::Marketplace::Models::PublicationPackage#version #version} proprety
    # @option attributes [String] :resource_id The value to assign to the {OCI::Marketplace::Models::PublicationPackage#resource_id #resource_id} proprety
    # @option attributes [DateTime] :time_created The value to assign to the {OCI::Marketplace::Models::PublicationPackage#time_created #time_created} proprety
    # @option attributes [OCI::Marketplace::Models::OperatingSystem] :operating_system The value to assign to the {OCI::Marketplace::Models::PublicationPackage#operating_system #operating_system} proprety
    # @option attributes [String] :app_catalog_listing_id The value to assign to the {#app_catalog_listing_id} property
    # @option attributes [String] :app_catalog_listing_resource_version The value to assign to the {#app_catalog_listing_resource_version} property
    # @option attributes [String] :image_id The value to assign to the {#image_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['packageType'] = 'IMAGE'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.app_catalog_listing_id = attributes[:'appCatalogListingId'] if attributes[:'appCatalogListingId']

      raise 'You cannot provide both :appCatalogListingId and :app_catalog_listing_id' if attributes.key?(:'appCatalogListingId') && attributes.key?(:'app_catalog_listing_id')

      self.app_catalog_listing_id = attributes[:'app_catalog_listing_id'] if attributes[:'app_catalog_listing_id']

      self.app_catalog_listing_resource_version = attributes[:'appCatalogListingResourceVersion'] if attributes[:'appCatalogListingResourceVersion']

      raise 'You cannot provide both :appCatalogListingResourceVersion and :app_catalog_listing_resource_version' if attributes.key?(:'appCatalogListingResourceVersion') && attributes.key?(:'app_catalog_listing_resource_version')

      self.app_catalog_listing_resource_version = attributes[:'app_catalog_listing_resource_version'] if attributes[:'app_catalog_listing_resource_version']

      self.image_id = attributes[:'imageId'] if attributes[:'imageId']

      raise 'You cannot provide both :imageId and :image_id' if attributes.key?(:'imageId') && attributes.key?(:'image_id')

      self.image_id = attributes[:'image_id'] if attributes[:'image_id']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        description == other.description &&
        listing_id == other.listing_id &&
        version == other.version &&
        package_type == other.package_type &&
        resource_id == other.resource_id &&
        time_created == other.time_created &&
        operating_system == other.operating_system &&
        app_catalog_listing_id == other.app_catalog_listing_id &&
        app_catalog_listing_resource_version == other.app_catalog_listing_resource_version &&
        image_id == other.image_id
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
      [description, listing_id, version, package_type, resource_id, time_created, operating_system, app_catalog_listing_id, app_catalog_listing_resource_version, image_id].hash
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
