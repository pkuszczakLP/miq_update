# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The information to be updated.
  class Oce::Models::UpdateOceInstanceDetails
    INSTANCE_LICENSE_TYPE_ENUM = [
      INSTANCE_LICENSE_TYPE_NEW = 'NEW'.freeze,
      INSTANCE_LICENSE_TYPE_BYOL = 'BYOL'.freeze,
      INSTANCE_LICENSE_TYPE_PREMIUM = 'PREMIUM'.freeze,
      INSTANCE_LICENSE_TYPE_STARTER = 'STARTER'.freeze
    ].freeze

    INSTANCE_USAGE_TYPE_ENUM = [
      INSTANCE_USAGE_TYPE_PRIMARY = 'PRIMARY'.freeze,
      INSTANCE_USAGE_TYPE_NONPRIMARY = 'NONPRIMARY'.freeze
    ].freeze

    # OceInstance description
    # @return [String]
    attr_accessor :description

    # Web Application Firewall(WAF) primary domain
    # @return [String]
    attr_accessor :waf_primary_domain

    # Flag indicating whether the instance license is new cloud or bring your own license
    # @return [String]
    attr_reader :instance_license_type

    # Instance type based on its usage
    # @return [String]
    attr_reader :instance_usage_type

    # a list of add-on features for the ocm instance
    # @return [Array<String>]
    attr_accessor :add_on_features

    # Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Usage of predefined tag keys. These predefined keys are scoped to namespaces.
    # Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'description': :'description',
        'waf_primary_domain': :'wafPrimaryDomain',
        'instance_license_type': :'instanceLicenseType',
        'instance_usage_type': :'instanceUsageType',
        'add_on_features': :'addOnFeatures',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'description': :'String',
        'waf_primary_domain': :'String',
        'instance_license_type': :'String',
        'instance_usage_type': :'String',
        'add_on_features': :'Array<String>',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :waf_primary_domain The value to assign to the {#waf_primary_domain} property
    # @option attributes [String] :instance_license_type The value to assign to the {#instance_license_type} property
    # @option attributes [String] :instance_usage_type The value to assign to the {#instance_usage_type} property
    # @option attributes [Array<String>] :add_on_features The value to assign to the {#add_on_features} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.description = attributes[:'description'] if attributes[:'description']

      self.waf_primary_domain = attributes[:'wafPrimaryDomain'] if attributes[:'wafPrimaryDomain']

      raise 'You cannot provide both :wafPrimaryDomain and :waf_primary_domain' if attributes.key?(:'wafPrimaryDomain') && attributes.key?(:'waf_primary_domain')

      self.waf_primary_domain = attributes[:'waf_primary_domain'] if attributes[:'waf_primary_domain']

      self.instance_license_type = attributes[:'instanceLicenseType'] if attributes[:'instanceLicenseType']

      raise 'You cannot provide both :instanceLicenseType and :instance_license_type' if attributes.key?(:'instanceLicenseType') && attributes.key?(:'instance_license_type')

      self.instance_license_type = attributes[:'instance_license_type'] if attributes[:'instance_license_type']

      self.instance_usage_type = attributes[:'instanceUsageType'] if attributes[:'instanceUsageType']

      raise 'You cannot provide both :instanceUsageType and :instance_usage_type' if attributes.key?(:'instanceUsageType') && attributes.key?(:'instance_usage_type')

      self.instance_usage_type = attributes[:'instance_usage_type'] if attributes[:'instance_usage_type']

      self.add_on_features = attributes[:'addOnFeatures'] if attributes[:'addOnFeatures']

      raise 'You cannot provide both :addOnFeatures and :add_on_features' if attributes.key?(:'addOnFeatures') && attributes.key?(:'add_on_features')

      self.add_on_features = attributes[:'add_on_features'] if attributes[:'add_on_features']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] instance_license_type Object to be assigned
    def instance_license_type=(instance_license_type)
      raise "Invalid value for 'instance_license_type': this must be one of the values in INSTANCE_LICENSE_TYPE_ENUM." if instance_license_type && !INSTANCE_LICENSE_TYPE_ENUM.include?(instance_license_type)

      @instance_license_type = instance_license_type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] instance_usage_type Object to be assigned
    def instance_usage_type=(instance_usage_type)
      raise "Invalid value for 'instance_usage_type': this must be one of the values in INSTANCE_USAGE_TYPE_ENUM." if instance_usage_type && !INSTANCE_USAGE_TYPE_ENUM.include?(instance_usage_type)

      @instance_usage_type = instance_usage_type
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        description == other.description &&
        waf_primary_domain == other.waf_primary_domain &&
        instance_license_type == other.instance_license_type &&
        instance_usage_type == other.instance_usage_type &&
        add_on_features == other.add_on_features &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags
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
      [description, waf_primary_domain, instance_license_type, instance_usage_type, add_on_features, freeform_tags, defined_tags].hash
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
