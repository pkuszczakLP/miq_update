# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The model for summary of an application in service catalog.
  class ServiceCatalog::Models::ApplicationSummary
    PRICING_TYPE_ENUM = [
      PRICING_TYPE_FREE = 'FREE'.freeze,
      PRICING_TYPE_BYOL = 'BYOL'.freeze,
      PRICING_TYPE_PAYGO = 'PAYGO'.freeze,
      PRICING_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    PACKAGE_TYPE_ENUM = [
      PACKAGE_TYPE_STACK = 'STACK'.freeze,
      PACKAGE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Identifier of the application from a service catalog.
    # @return [String]
    attr_accessor :entity_id

    # **[Required]** The type of an application in the service catalog.
    # @return [String]
    attr_accessor :entity_type

    # **[Required]** The name that service catalog should use to display this application.
    # @return [String]
    attr_accessor :display_name

    # Indicates whether the application is featured.
    # @return [BOOLEAN]
    attr_accessor :is_featured

    # @return [OCI::ServiceCatalog::Models::PublisherSummary]
    attr_accessor :publisher

    # A short description of the application.
    # @return [String]
    attr_accessor :short_description

    # @return [OCI::ServiceCatalog::Models::UploadData]
    attr_accessor :logo

    # Summary of the pricing types available across all packages in the application.
    # @return [String]
    attr_reader :pricing_type

    # The type of the packages withing the application.
    # @return [String]
    attr_reader :package_type

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'entity_id': :'entityId',
        'entity_type': :'entityType',
        'display_name': :'displayName',
        'is_featured': :'isFeatured',
        'publisher': :'publisher',
        'short_description': :'shortDescription',
        'logo': :'logo',
        'pricing_type': :'pricingType',
        'package_type': :'packageType'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'entity_id': :'String',
        'entity_type': :'String',
        'display_name': :'String',
        'is_featured': :'BOOLEAN',
        'publisher': :'OCI::ServiceCatalog::Models::PublisherSummary',
        'short_description': :'String',
        'logo': :'OCI::ServiceCatalog::Models::UploadData',
        'pricing_type': :'String',
        'package_type': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :entity_id The value to assign to the {#entity_id} property
    # @option attributes [String] :entity_type The value to assign to the {#entity_type} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [BOOLEAN] :is_featured The value to assign to the {#is_featured} property
    # @option attributes [OCI::ServiceCatalog::Models::PublisherSummary] :publisher The value to assign to the {#publisher} property
    # @option attributes [String] :short_description The value to assign to the {#short_description} property
    # @option attributes [OCI::ServiceCatalog::Models::UploadData] :logo The value to assign to the {#logo} property
    # @option attributes [String] :pricing_type The value to assign to the {#pricing_type} property
    # @option attributes [String] :package_type The value to assign to the {#package_type} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.entity_id = attributes[:'entityId'] if attributes[:'entityId']

      raise 'You cannot provide both :entityId and :entity_id' if attributes.key?(:'entityId') && attributes.key?(:'entity_id')

      self.entity_id = attributes[:'entity_id'] if attributes[:'entity_id']

      self.entity_type = attributes[:'entityType'] if attributes[:'entityType']

      raise 'You cannot provide both :entityType and :entity_type' if attributes.key?(:'entityType') && attributes.key?(:'entity_type')

      self.entity_type = attributes[:'entity_type'] if attributes[:'entity_type']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.is_featured = attributes[:'isFeatured'] unless attributes[:'isFeatured'].nil?

      raise 'You cannot provide both :isFeatured and :is_featured' if attributes.key?(:'isFeatured') && attributes.key?(:'is_featured')

      self.is_featured = attributes[:'is_featured'] unless attributes[:'is_featured'].nil?

      self.publisher = attributes[:'publisher'] if attributes[:'publisher']

      self.short_description = attributes[:'shortDescription'] if attributes[:'shortDescription']

      raise 'You cannot provide both :shortDescription and :short_description' if attributes.key?(:'shortDescription') && attributes.key?(:'short_description')

      self.short_description = attributes[:'short_description'] if attributes[:'short_description']

      self.logo = attributes[:'logo'] if attributes[:'logo']

      self.pricing_type = attributes[:'pricingType'] if attributes[:'pricingType']

      raise 'You cannot provide both :pricingType and :pricing_type' if attributes.key?(:'pricingType') && attributes.key?(:'pricing_type')

      self.pricing_type = attributes[:'pricing_type'] if attributes[:'pricing_type']

      self.package_type = attributes[:'packageType'] if attributes[:'packageType']

      raise 'You cannot provide both :packageType and :package_type' if attributes.key?(:'packageType') && attributes.key?(:'package_type')

      self.package_type = attributes[:'package_type'] if attributes[:'package_type']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] pricing_type Object to be assigned
    def pricing_type=(pricing_type)
      # rubocop:disable Style/ConditionalAssignment
      if pricing_type && !PRICING_TYPE_ENUM.include?(pricing_type)
        OCI.logger.debug("Unknown value for 'pricing_type' [" + pricing_type + "]. Mapping to 'PRICING_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @pricing_type = PRICING_TYPE_UNKNOWN_ENUM_VALUE
      else
        @pricing_type = pricing_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

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

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        entity_id == other.entity_id &&
        entity_type == other.entity_type &&
        display_name == other.display_name &&
        is_featured == other.is_featured &&
        publisher == other.publisher &&
        short_description == other.short_description &&
        logo == other.logo &&
        pricing_type == other.pricing_type &&
        package_type == other.package_type
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
      [entity_id, entity_type, display_name, is_featured, publisher, short_description, logo, pricing_type, package_type].hash
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
