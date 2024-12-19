# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details of a resource that is consuming a particular product license.
  #
  class LicenseManager::Models::ProductLicenseConsumerSummary
    RESOURCE_UNIT_TYPE_ENUM = [
      RESOURCE_UNIT_TYPE_OCPU = 'OCPU'.freeze,
      RESOURCE_UNIT_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LICENSE_UNIT_TYPE_ENUM = [
      LICENSE_UNIT_TYPE_OCPU = 'OCPU'.freeze,
      LICENSE_UNIT_TYPE_NAMED_USER_PLUS = 'NAMED_USER_PLUS'.freeze,
      LICENSE_UNIT_TYPE_PROCESSORS = 'PROCESSORS'.freeze,
      LICENSE_UNIT_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the resource.
    # @return [String]
    attr_accessor :resource_id

    # **[Required]** The display name of the resource.
    # @return [String]
    attr_accessor :resource_name

    # **[Required]** The resource product name.
    # @return [String]
    attr_accessor :product_name

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment that contains the resource.
    # @return [String]
    attr_accessor :resource_compartment_id

    # **[Required]** The display name of the compartment that contains the resource.
    # @return [String]
    attr_accessor :resource_compartment_name

    # **[Required]** The unit type for the resource.
    # @return [String]
    attr_reader :resource_unit_type

    # **[Required]** Number of units of the resource
    # @return [Float]
    attr_accessor :resource_unit_count

    # **[Required]** The product license unit.
    # @return [String]
    attr_reader :license_unit_type

    # **[Required]** Number of license units consumed by the resource.
    # @return [Float]
    attr_accessor :license_units_consumed

    # **[Required]** Specifies if the base license is available.
    # @return [BOOLEAN]
    attr_accessor :is_base_license_available

    # **[Required]** Specifies if all options are available.
    # @return [BOOLEAN]
    attr_accessor :are_all_options_available

    # **[Required]** Collection of missing product licenses.
    # @return [Array<OCI::LicenseManager::Models::Product>]
    attr_accessor :missing_products

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'resource_id': :'resourceId',
        'resource_name': :'resourceName',
        'product_name': :'productName',
        'resource_compartment_id': :'resourceCompartmentId',
        'resource_compartment_name': :'resourceCompartmentName',
        'resource_unit_type': :'resourceUnitType',
        'resource_unit_count': :'resourceUnitCount',
        'license_unit_type': :'licenseUnitType',
        'license_units_consumed': :'licenseUnitsConsumed',
        'is_base_license_available': :'isBaseLicenseAvailable',
        'are_all_options_available': :'areAllOptionsAvailable',
        'missing_products': :'missingProducts'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'resource_id': :'String',
        'resource_name': :'String',
        'product_name': :'String',
        'resource_compartment_id': :'String',
        'resource_compartment_name': :'String',
        'resource_unit_type': :'String',
        'resource_unit_count': :'Float',
        'license_unit_type': :'String',
        'license_units_consumed': :'Float',
        'is_base_license_available': :'BOOLEAN',
        'are_all_options_available': :'BOOLEAN',
        'missing_products': :'Array<OCI::LicenseManager::Models::Product>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :resource_id The value to assign to the {#resource_id} property
    # @option attributes [String] :resource_name The value to assign to the {#resource_name} property
    # @option attributes [String] :product_name The value to assign to the {#product_name} property
    # @option attributes [String] :resource_compartment_id The value to assign to the {#resource_compartment_id} property
    # @option attributes [String] :resource_compartment_name The value to assign to the {#resource_compartment_name} property
    # @option attributes [String] :resource_unit_type The value to assign to the {#resource_unit_type} property
    # @option attributes [Float] :resource_unit_count The value to assign to the {#resource_unit_count} property
    # @option attributes [String] :license_unit_type The value to assign to the {#license_unit_type} property
    # @option attributes [Float] :license_units_consumed The value to assign to the {#license_units_consumed} property
    # @option attributes [BOOLEAN] :is_base_license_available The value to assign to the {#is_base_license_available} property
    # @option attributes [BOOLEAN] :are_all_options_available The value to assign to the {#are_all_options_available} property
    # @option attributes [Array<OCI::LicenseManager::Models::Product>] :missing_products The value to assign to the {#missing_products} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.resource_id = attributes[:'resourceId'] if attributes[:'resourceId']

      raise 'You cannot provide both :resourceId and :resource_id' if attributes.key?(:'resourceId') && attributes.key?(:'resource_id')

      self.resource_id = attributes[:'resource_id'] if attributes[:'resource_id']

      self.resource_name = attributes[:'resourceName'] if attributes[:'resourceName']

      raise 'You cannot provide both :resourceName and :resource_name' if attributes.key?(:'resourceName') && attributes.key?(:'resource_name')

      self.resource_name = attributes[:'resource_name'] if attributes[:'resource_name']

      self.product_name = attributes[:'productName'] if attributes[:'productName']

      raise 'You cannot provide both :productName and :product_name' if attributes.key?(:'productName') && attributes.key?(:'product_name')

      self.product_name = attributes[:'product_name'] if attributes[:'product_name']

      self.resource_compartment_id = attributes[:'resourceCompartmentId'] if attributes[:'resourceCompartmentId']

      raise 'You cannot provide both :resourceCompartmentId and :resource_compartment_id' if attributes.key?(:'resourceCompartmentId') && attributes.key?(:'resource_compartment_id')

      self.resource_compartment_id = attributes[:'resource_compartment_id'] if attributes[:'resource_compartment_id']

      self.resource_compartment_name = attributes[:'resourceCompartmentName'] if attributes[:'resourceCompartmentName']

      raise 'You cannot provide both :resourceCompartmentName and :resource_compartment_name' if attributes.key?(:'resourceCompartmentName') && attributes.key?(:'resource_compartment_name')

      self.resource_compartment_name = attributes[:'resource_compartment_name'] if attributes[:'resource_compartment_name']

      self.resource_unit_type = attributes[:'resourceUnitType'] if attributes[:'resourceUnitType']

      raise 'You cannot provide both :resourceUnitType and :resource_unit_type' if attributes.key?(:'resourceUnitType') && attributes.key?(:'resource_unit_type')

      self.resource_unit_type = attributes[:'resource_unit_type'] if attributes[:'resource_unit_type']

      self.resource_unit_count = attributes[:'resourceUnitCount'] if attributes[:'resourceUnitCount']
      self.resource_unit_count = 0.0 if resource_unit_count.nil? && !attributes.key?(:'resourceUnitCount') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :resourceUnitCount and :resource_unit_count' if attributes.key?(:'resourceUnitCount') && attributes.key?(:'resource_unit_count')

      self.resource_unit_count = attributes[:'resource_unit_count'] if attributes[:'resource_unit_count']
      self.resource_unit_count = 0.0 if resource_unit_count.nil? && !attributes.key?(:'resourceUnitCount') && !attributes.key?(:'resource_unit_count') # rubocop:disable Style/StringLiterals

      self.license_unit_type = attributes[:'licenseUnitType'] if attributes[:'licenseUnitType']

      raise 'You cannot provide both :licenseUnitType and :license_unit_type' if attributes.key?(:'licenseUnitType') && attributes.key?(:'license_unit_type')

      self.license_unit_type = attributes[:'license_unit_type'] if attributes[:'license_unit_type']

      self.license_units_consumed = attributes[:'licenseUnitsConsumed'] if attributes[:'licenseUnitsConsumed']
      self.license_units_consumed = 0.0 if license_units_consumed.nil? && !attributes.key?(:'licenseUnitsConsumed') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :licenseUnitsConsumed and :license_units_consumed' if attributes.key?(:'licenseUnitsConsumed') && attributes.key?(:'license_units_consumed')

      self.license_units_consumed = attributes[:'license_units_consumed'] if attributes[:'license_units_consumed']
      self.license_units_consumed = 0.0 if license_units_consumed.nil? && !attributes.key?(:'licenseUnitsConsumed') && !attributes.key?(:'license_units_consumed') # rubocop:disable Style/StringLiterals

      self.is_base_license_available = attributes[:'isBaseLicenseAvailable'] unless attributes[:'isBaseLicenseAvailable'].nil?
      self.is_base_license_available = false if is_base_license_available.nil? && !attributes.key?(:'isBaseLicenseAvailable') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isBaseLicenseAvailable and :is_base_license_available' if attributes.key?(:'isBaseLicenseAvailable') && attributes.key?(:'is_base_license_available')

      self.is_base_license_available = attributes[:'is_base_license_available'] unless attributes[:'is_base_license_available'].nil?
      self.is_base_license_available = false if is_base_license_available.nil? && !attributes.key?(:'isBaseLicenseAvailable') && !attributes.key?(:'is_base_license_available') # rubocop:disable Style/StringLiterals

      self.are_all_options_available = attributes[:'areAllOptionsAvailable'] unless attributes[:'areAllOptionsAvailable'].nil?
      self.are_all_options_available = false if are_all_options_available.nil? && !attributes.key?(:'areAllOptionsAvailable') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :areAllOptionsAvailable and :are_all_options_available' if attributes.key?(:'areAllOptionsAvailable') && attributes.key?(:'are_all_options_available')

      self.are_all_options_available = attributes[:'are_all_options_available'] unless attributes[:'are_all_options_available'].nil?
      self.are_all_options_available = false if are_all_options_available.nil? && !attributes.key?(:'areAllOptionsAvailable') && !attributes.key?(:'are_all_options_available') # rubocop:disable Style/StringLiterals

      self.missing_products = attributes[:'missingProducts'] if attributes[:'missingProducts']

      raise 'You cannot provide both :missingProducts and :missing_products' if attributes.key?(:'missingProducts') && attributes.key?(:'missing_products')

      self.missing_products = attributes[:'missing_products'] if attributes[:'missing_products']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] resource_unit_type Object to be assigned
    def resource_unit_type=(resource_unit_type)
      # rubocop:disable Style/ConditionalAssignment
      if resource_unit_type && !RESOURCE_UNIT_TYPE_ENUM.include?(resource_unit_type)
        OCI.logger.debug("Unknown value for 'resource_unit_type' [" + resource_unit_type + "]. Mapping to 'RESOURCE_UNIT_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @resource_unit_type = RESOURCE_UNIT_TYPE_UNKNOWN_ENUM_VALUE
      else
        @resource_unit_type = resource_unit_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] license_unit_type Object to be assigned
    def license_unit_type=(license_unit_type)
      # rubocop:disable Style/ConditionalAssignment
      if license_unit_type && !LICENSE_UNIT_TYPE_ENUM.include?(license_unit_type)
        OCI.logger.debug("Unknown value for 'license_unit_type' [" + license_unit_type + "]. Mapping to 'LICENSE_UNIT_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @license_unit_type = LICENSE_UNIT_TYPE_UNKNOWN_ENUM_VALUE
      else
        @license_unit_type = license_unit_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        resource_id == other.resource_id &&
        resource_name == other.resource_name &&
        product_name == other.product_name &&
        resource_compartment_id == other.resource_compartment_id &&
        resource_compartment_name == other.resource_compartment_name &&
        resource_unit_type == other.resource_unit_type &&
        resource_unit_count == other.resource_unit_count &&
        license_unit_type == other.license_unit_type &&
        license_units_consumed == other.license_units_consumed &&
        is_base_license_available == other.is_base_license_available &&
        are_all_options_available == other.are_all_options_available &&
        missing_products == other.missing_products
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
      [resource_id, resource_name, product_name, resource_compartment_id, resource_compartment_name, resource_unit_type, resource_unit_count, license_unit_type, license_units_consumed, is_base_license_available, are_all_options_available, missing_products].hash
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
