# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The model for a summary of an Oracle Cloud Infrastructure Marketplace listing.
  class Marketplace::Models::ListingSummary
    PACKAGE_TYPE_ENUM = [
      PACKAGE_TYPE_ORCHESTRATION = 'ORCHESTRATION'.freeze,
      PACKAGE_TYPE_IMAGE = 'IMAGE'.freeze,
      PACKAGE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    PRICING_TYPES_ENUM = [
      PRICING_TYPES_FREE = 'FREE'.freeze,
      PRICING_TYPES_BYOL = 'BYOL'.freeze,
      PRICING_TYPES_PAYGO = 'PAYGO'.freeze,
      PRICING_TYPES_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    COMPATIBLE_ARCHITECTURES_ENUM = [
      COMPATIBLE_ARCHITECTURES_X86 = 'X86'.freeze,
      COMPATIBLE_ARCHITECTURES_ARM = 'ARM'.freeze,
      COMPATIBLE_ARCHITECTURES_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LISTING_TYPE_ENUM = [
      LISTING_TYPE_COMMUNITY = 'COMMUNITY'.freeze,
      LISTING_TYPE_PARTNER = 'PARTNER'.freeze,
      LISTING_TYPE_PRIVATE = 'PRIVATE'.freeze,
      LISTING_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The unique identifier for the listing in Marketplace.
    # @return [String]
    attr_accessor :id

    # The name of the listing.
    # @return [String]
    attr_accessor :name

    # A short description of the listing.
    # @return [String]
    attr_accessor :short_description

    # True if this application is Rover exportable
    # @return [BOOLEAN]
    attr_accessor :is_rover_exportable

    # The tagline of the listing.
    # @return [String]
    attr_accessor :tagline

    # @return [OCI::Marketplace::Models::UploadData]
    attr_accessor :icon

    # The listing's package type.
    # @return [String]
    attr_reader :package_type

    # Summary of the pricing types available across all packages in the listing.
    # @return [Array<String>]
    attr_reader :pricing_types

    # The list of compatible architectures supported by the listing
    # @return [Array<String>]
    attr_reader :compatible_architectures

    # The regions where you can deploy the listing. (Some listings have restrictions that limit their deployment to United States regions only.)
    #
    # @return [Array<OCI::Marketplace::Models::Region>]
    attr_accessor :regions

    # Indicates whether the listing is featured.
    # @return [BOOLEAN]
    attr_accessor :is_featured

    # Product categories that the listing belongs to.
    # @return [Array<String>]
    attr_accessor :categories

    # @return [OCI::Marketplace::Models::PublisherSummary]
    attr_accessor :publisher

    # The list of operating systems supported by the listing.
    # @return [Array<OCI::Marketplace::Models::OperatingSystem>]
    attr_accessor :supported_operating_systems

    # The publisher category to which the listing belongs. The publisher category informs where the listing appears for use.
    # @return [String]
    attr_reader :listing_type

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'name': :'name',
        'short_description': :'shortDescription',
        'is_rover_exportable': :'isRoverExportable',
        'tagline': :'tagline',
        'icon': :'icon',
        'package_type': :'packageType',
        'pricing_types': :'pricingTypes',
        'compatible_architectures': :'compatibleArchitectures',
        'regions': :'regions',
        'is_featured': :'isFeatured',
        'categories': :'categories',
        'publisher': :'publisher',
        'supported_operating_systems': :'supportedOperatingSystems',
        'listing_type': :'listingType'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'name': :'String',
        'short_description': :'String',
        'is_rover_exportable': :'BOOLEAN',
        'tagline': :'String',
        'icon': :'OCI::Marketplace::Models::UploadData',
        'package_type': :'String',
        'pricing_types': :'Array<String>',
        'compatible_architectures': :'Array<String>',
        'regions': :'Array<OCI::Marketplace::Models::Region>',
        'is_featured': :'BOOLEAN',
        'categories': :'Array<String>',
        'publisher': :'OCI::Marketplace::Models::PublisherSummary',
        'supported_operating_systems': :'Array<OCI::Marketplace::Models::OperatingSystem>',
        'listing_type': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :short_description The value to assign to the {#short_description} property
    # @option attributes [BOOLEAN] :is_rover_exportable The value to assign to the {#is_rover_exportable} property
    # @option attributes [String] :tagline The value to assign to the {#tagline} property
    # @option attributes [OCI::Marketplace::Models::UploadData] :icon The value to assign to the {#icon} property
    # @option attributes [String] :package_type The value to assign to the {#package_type} property
    # @option attributes [Array<String>] :pricing_types The value to assign to the {#pricing_types} property
    # @option attributes [Array<String>] :compatible_architectures The value to assign to the {#compatible_architectures} property
    # @option attributes [Array<OCI::Marketplace::Models::Region>] :regions The value to assign to the {#regions} property
    # @option attributes [BOOLEAN] :is_featured The value to assign to the {#is_featured} property
    # @option attributes [Array<String>] :categories The value to assign to the {#categories} property
    # @option attributes [OCI::Marketplace::Models::PublisherSummary] :publisher The value to assign to the {#publisher} property
    # @option attributes [Array<OCI::Marketplace::Models::OperatingSystem>] :supported_operating_systems The value to assign to the {#supported_operating_systems} property
    # @option attributes [String] :listing_type The value to assign to the {#listing_type} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.name = attributes[:'name'] if attributes[:'name']

      self.short_description = attributes[:'shortDescription'] if attributes[:'shortDescription']

      raise 'You cannot provide both :shortDescription and :short_description' if attributes.key?(:'shortDescription') && attributes.key?(:'short_description')

      self.short_description = attributes[:'short_description'] if attributes[:'short_description']

      self.is_rover_exportable = attributes[:'isRoverExportable'] unless attributes[:'isRoverExportable'].nil?
      self.is_rover_exportable = false if is_rover_exportable.nil? && !attributes.key?(:'isRoverExportable') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isRoverExportable and :is_rover_exportable' if attributes.key?(:'isRoverExportable') && attributes.key?(:'is_rover_exportable')

      self.is_rover_exportable = attributes[:'is_rover_exportable'] unless attributes[:'is_rover_exportable'].nil?
      self.is_rover_exportable = false if is_rover_exportable.nil? && !attributes.key?(:'isRoverExportable') && !attributes.key?(:'is_rover_exportable') # rubocop:disable Style/StringLiterals

      self.tagline = attributes[:'tagline'] if attributes[:'tagline']

      self.icon = attributes[:'icon'] if attributes[:'icon']

      self.package_type = attributes[:'packageType'] if attributes[:'packageType']

      raise 'You cannot provide both :packageType and :package_type' if attributes.key?(:'packageType') && attributes.key?(:'package_type')

      self.package_type = attributes[:'package_type'] if attributes[:'package_type']

      self.pricing_types = attributes[:'pricingTypes'] if attributes[:'pricingTypes']

      raise 'You cannot provide both :pricingTypes and :pricing_types' if attributes.key?(:'pricingTypes') && attributes.key?(:'pricing_types')

      self.pricing_types = attributes[:'pricing_types'] if attributes[:'pricing_types']

      self.compatible_architectures = attributes[:'compatibleArchitectures'] if attributes[:'compatibleArchitectures']

      raise 'You cannot provide both :compatibleArchitectures and :compatible_architectures' if attributes.key?(:'compatibleArchitectures') && attributes.key?(:'compatible_architectures')

      self.compatible_architectures = attributes[:'compatible_architectures'] if attributes[:'compatible_architectures']

      self.regions = attributes[:'regions'] if attributes[:'regions']

      self.is_featured = attributes[:'isFeatured'] unless attributes[:'isFeatured'].nil?

      raise 'You cannot provide both :isFeatured and :is_featured' if attributes.key?(:'isFeatured') && attributes.key?(:'is_featured')

      self.is_featured = attributes[:'is_featured'] unless attributes[:'is_featured'].nil?

      self.categories = attributes[:'categories'] if attributes[:'categories']

      self.publisher = attributes[:'publisher'] if attributes[:'publisher']

      self.supported_operating_systems = attributes[:'supportedOperatingSystems'] if attributes[:'supportedOperatingSystems']

      raise 'You cannot provide both :supportedOperatingSystems and :supported_operating_systems' if attributes.key?(:'supportedOperatingSystems') && attributes.key?(:'supported_operating_systems')

      self.supported_operating_systems = attributes[:'supported_operating_systems'] if attributes[:'supported_operating_systems']

      self.listing_type = attributes[:'listingType'] if attributes[:'listingType']

      raise 'You cannot provide both :listingType and :listing_type' if attributes.key?(:'listingType') && attributes.key?(:'listing_type')

      self.listing_type = attributes[:'listing_type'] if attributes[:'listing_type']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] package_type Object to be assigned
    def package_type=(package_type)
      # rubocop:disable Style/ConditionalAssignment
      if package_type && !PACKAGE_TYPE_ENUM.include?(package_type)
        OCI.logger.debug("Unknown value for 'package_type' [" + package_type + "]. Mapping to 'PACKAGE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @package_type = PACKAGE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @package_type = package_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] pricing_types Object to be assigned
    def pricing_types=(pricing_types)
      # rubocop:disable Style/ConditionalAssignment
      if pricing_types.nil?
        @pricing_types = nil
      else
        @pricing_types =
          pricing_types.collect do |item|
            if PRICING_TYPES_ENUM.include?(item)
              item
            else
              OCI.logger.debug("Unknown value for 'pricing_types' [#{item}]. Mapping to 'PRICING_TYPES_UNKNOWN_ENUM_VALUE'") if OCI.logger
              PRICING_TYPES_UNKNOWN_ENUM_VALUE
            end
          end
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] compatible_architectures Object to be assigned
    def compatible_architectures=(compatible_architectures)
      # rubocop:disable Style/ConditionalAssignment
      if compatible_architectures.nil?
        @compatible_architectures = nil
      else
        @compatible_architectures =
          compatible_architectures.collect do |item|
            if COMPATIBLE_ARCHITECTURES_ENUM.include?(item)
              item
            else
              OCI.logger.debug("Unknown value for 'compatible_architectures' [#{item}]. Mapping to 'COMPATIBLE_ARCHITECTURES_UNKNOWN_ENUM_VALUE'") if OCI.logger
              COMPATIBLE_ARCHITECTURES_UNKNOWN_ENUM_VALUE
            end
          end
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] listing_type Object to be assigned
    def listing_type=(listing_type)
      # rubocop:disable Style/ConditionalAssignment
      if listing_type && !LISTING_TYPE_ENUM.include?(listing_type)
        OCI.logger.debug("Unknown value for 'listing_type' [" + listing_type + "]. Mapping to 'LISTING_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @listing_type = LISTING_TYPE_UNKNOWN_ENUM_VALUE
      else
        @listing_type = listing_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        name == other.name &&
        short_description == other.short_description &&
        is_rover_exportable == other.is_rover_exportable &&
        tagline == other.tagline &&
        icon == other.icon &&
        package_type == other.package_type &&
        pricing_types == other.pricing_types &&
        compatible_architectures == other.compatible_architectures &&
        regions == other.regions &&
        is_featured == other.is_featured &&
        categories == other.categories &&
        publisher == other.publisher &&
        supported_operating_systems == other.supported_operating_systems &&
        listing_type == other.listing_type
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
      [id, name, short_description, is_rover_exportable, tagline, icon, package_type, pricing_types, compatible_architectures, regions, is_featured, categories, publisher, supported_operating_systems, listing_type].hash
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
