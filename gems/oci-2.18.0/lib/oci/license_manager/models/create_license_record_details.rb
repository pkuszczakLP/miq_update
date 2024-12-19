# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The details about the new license record.
  class LicenseManager::Models::CreateLicenseRecordDetails
    # **[Required]** License record name.
    #
    # @return [String]
    attr_accessor :display_name

    # **[Required]** Specifies if the license record term is perpertual.
    # @return [BOOLEAN]
    attr_accessor :is_perpetual

    # The license record end date in [RFC 3339](https://tools.ietf.org/html/rfc3339)
    # date format.
    # Example: `2018-09-12`
    #
    # @return [DateTime]
    attr_accessor :expiration_date

    # The license record support end date in [RFC 3339](https://tools.ietf.org/html/rfc3339)
    # date format.
    # Example: `2018-09-12`
    #
    # @return [DateTime]
    attr_accessor :support_end_date

    # **[Required]** Specifies if the license count is unlimited.
    # @return [BOOLEAN]
    attr_accessor :is_unlimited

    # The number of license units added by a user in a license record.
    # Default 1
    #
    # @return [Integer]
    attr_accessor :license_count

    # The license record product ID.
    # @return [String]
    attr_accessor :product_id

    # Simple key-value pair that is applied without any predefined name, type, or scope. Exists for cross-compatibility only.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'displayName',
        'is_perpetual': :'isPerpetual',
        'expiration_date': :'expirationDate',
        'support_end_date': :'supportEndDate',
        'is_unlimited': :'isUnlimited',
        'license_count': :'licenseCount',
        'product_id': :'productId',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'String',
        'is_perpetual': :'BOOLEAN',
        'expiration_date': :'DateTime',
        'support_end_date': :'DateTime',
        'is_unlimited': :'BOOLEAN',
        'license_count': :'Integer',
        'product_id': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [BOOLEAN] :is_perpetual The value to assign to the {#is_perpetual} property
    # @option attributes [DateTime] :expiration_date The value to assign to the {#expiration_date} property
    # @option attributes [DateTime] :support_end_date The value to assign to the {#support_end_date} property
    # @option attributes [BOOLEAN] :is_unlimited The value to assign to the {#is_unlimited} property
    # @option attributes [Integer] :license_count The value to assign to the {#license_count} property
    # @option attributes [String] :product_id The value to assign to the {#product_id} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.is_perpetual = attributes[:'isPerpetual'] unless attributes[:'isPerpetual'].nil?
      self.is_perpetual = false if is_perpetual.nil? && !attributes.key?(:'isPerpetual') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isPerpetual and :is_perpetual' if attributes.key?(:'isPerpetual') && attributes.key?(:'is_perpetual')

      self.is_perpetual = attributes[:'is_perpetual'] unless attributes[:'is_perpetual'].nil?
      self.is_perpetual = false if is_perpetual.nil? && !attributes.key?(:'isPerpetual') && !attributes.key?(:'is_perpetual') # rubocop:disable Style/StringLiterals

      self.expiration_date = attributes[:'expirationDate'] if attributes[:'expirationDate']

      raise 'You cannot provide both :expirationDate and :expiration_date' if attributes.key?(:'expirationDate') && attributes.key?(:'expiration_date')

      self.expiration_date = attributes[:'expiration_date'] if attributes[:'expiration_date']

      self.support_end_date = attributes[:'supportEndDate'] if attributes[:'supportEndDate']

      raise 'You cannot provide both :supportEndDate and :support_end_date' if attributes.key?(:'supportEndDate') && attributes.key?(:'support_end_date')

      self.support_end_date = attributes[:'support_end_date'] if attributes[:'support_end_date']

      self.is_unlimited = attributes[:'isUnlimited'] unless attributes[:'isUnlimited'].nil?
      self.is_unlimited = false if is_unlimited.nil? && !attributes.key?(:'isUnlimited') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isUnlimited and :is_unlimited' if attributes.key?(:'isUnlimited') && attributes.key?(:'is_unlimited')

      self.is_unlimited = attributes[:'is_unlimited'] unless attributes[:'is_unlimited'].nil?
      self.is_unlimited = false if is_unlimited.nil? && !attributes.key?(:'isUnlimited') && !attributes.key?(:'is_unlimited') # rubocop:disable Style/StringLiterals

      self.license_count = attributes[:'licenseCount'] if attributes[:'licenseCount']

      raise 'You cannot provide both :licenseCount and :license_count' if attributes.key?(:'licenseCount') && attributes.key?(:'license_count')

      self.license_count = attributes[:'license_count'] if attributes[:'license_count']

      self.product_id = attributes[:'productId'] if attributes[:'productId']

      raise 'You cannot provide both :productId and :product_id' if attributes.key?(:'productId') && attributes.key?(:'product_id')

      self.product_id = attributes[:'product_id'] if attributes[:'product_id']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        display_name == other.display_name &&
        is_perpetual == other.is_perpetual &&
        expiration_date == other.expiration_date &&
        support_end_date == other.support_end_date &&
        is_unlimited == other.is_unlimited &&
        license_count == other.license_count &&
        product_id == other.product_id &&
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
      [display_name, is_perpetual, expiration_date, support_end_date, is_unlimited, license_count, product_id, freeform_tags, defined_tags].hash
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
