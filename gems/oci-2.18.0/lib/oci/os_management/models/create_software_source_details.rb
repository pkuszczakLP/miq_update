# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Description of a software source to be created on the management system
  class OsManagement::Models::CreateSoftwareSourceDetails
    ARCH_TYPE_ENUM = [
      ARCH_TYPE_IA_32 = 'IA_32'.freeze,
      ARCH_TYPE_X86_64 = 'X86_64'.freeze,
      ARCH_TYPE_AARCH64 = 'AARCH64'.freeze,
      ARCH_TYPE_SPARC = 'SPARC'.freeze,
      ARCH_TYPE_AMD64_DEBIAN = 'AMD64_DEBIAN'.freeze
    ].freeze

    CHECKSUM_TYPE_ENUM = [
      CHECKSUM_TYPE_SHA1 = 'SHA1'.freeze,
      CHECKSUM_TYPE_SHA256 = 'SHA256'.freeze,
      CHECKSUM_TYPE_SHA384 = 'SHA384'.freeze,
      CHECKSUM_TYPE_SHA512 = 'SHA512'.freeze
    ].freeze

    # **[Required]** OCID for the Compartment
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** User friendly name for the software source
    # @return [String]
    attr_accessor :display_name

    # Information specified by the user about the software source
    # @return [String]
    attr_accessor :description

    # **[Required]** The architecture type supported by the Software Source
    # @return [String]
    attr_reader :arch_type

    # Name of the person maintaining this software source
    # @return [String]
    attr_accessor :maintainer_name

    # Email address of the person maintaining this software source
    # @return [String]
    attr_accessor :maintainer_email

    # Phone number of the person maintaining this software source
    # @return [String]
    attr_accessor :maintainer_phone

    # The yum repository checksum type used by this software source
    # @return [String]
    attr_reader :checksum_type

    # OCID for the parent software source, if there is one
    # @return [String]
    attr_accessor :parent_id

    # Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only.
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
        'compartment_id': :'compartmentId',
        'display_name': :'displayName',
        'description': :'description',
        'arch_type': :'archType',
        'maintainer_name': :'maintainerName',
        'maintainer_email': :'maintainerEmail',
        'maintainer_phone': :'maintainerPhone',
        'checksum_type': :'checksumType',
        'parent_id': :'parentId',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'String',
        'display_name': :'String',
        'description': :'String',
        'arch_type': :'String',
        'maintainer_name': :'String',
        'maintainer_email': :'String',
        'maintainer_phone': :'String',
        'checksum_type': :'String',
        'parent_id': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :arch_type The value to assign to the {#arch_type} property
    # @option attributes [String] :maintainer_name The value to assign to the {#maintainer_name} property
    # @option attributes [String] :maintainer_email The value to assign to the {#maintainer_email} property
    # @option attributes [String] :maintainer_phone The value to assign to the {#maintainer_phone} property
    # @option attributes [String] :checksum_type The value to assign to the {#checksum_type} property
    # @option attributes [String] :parent_id The value to assign to the {#parent_id} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.arch_type = attributes[:'archType'] if attributes[:'archType']

      raise 'You cannot provide both :archType and :arch_type' if attributes.key?(:'archType') && attributes.key?(:'arch_type')

      self.arch_type = attributes[:'arch_type'] if attributes[:'arch_type']

      self.maintainer_name = attributes[:'maintainerName'] if attributes[:'maintainerName']

      raise 'You cannot provide both :maintainerName and :maintainer_name' if attributes.key?(:'maintainerName') && attributes.key?(:'maintainer_name')

      self.maintainer_name = attributes[:'maintainer_name'] if attributes[:'maintainer_name']

      self.maintainer_email = attributes[:'maintainerEmail'] if attributes[:'maintainerEmail']

      raise 'You cannot provide both :maintainerEmail and :maintainer_email' if attributes.key?(:'maintainerEmail') && attributes.key?(:'maintainer_email')

      self.maintainer_email = attributes[:'maintainer_email'] if attributes[:'maintainer_email']

      self.maintainer_phone = attributes[:'maintainerPhone'] if attributes[:'maintainerPhone']

      raise 'You cannot provide both :maintainerPhone and :maintainer_phone' if attributes.key?(:'maintainerPhone') && attributes.key?(:'maintainer_phone')

      self.maintainer_phone = attributes[:'maintainer_phone'] if attributes[:'maintainer_phone']

      self.checksum_type = attributes[:'checksumType'] if attributes[:'checksumType']

      raise 'You cannot provide both :checksumType and :checksum_type' if attributes.key?(:'checksumType') && attributes.key?(:'checksum_type')

      self.checksum_type = attributes[:'checksum_type'] if attributes[:'checksum_type']

      self.parent_id = attributes[:'parentId'] if attributes[:'parentId']

      raise 'You cannot provide both :parentId and :parent_id' if attributes.key?(:'parentId') && attributes.key?(:'parent_id')

      self.parent_id = attributes[:'parent_id'] if attributes[:'parent_id']

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
    # @param [Object] arch_type Object to be assigned
    def arch_type=(arch_type)
      raise "Invalid value for 'arch_type': this must be one of the values in ARCH_TYPE_ENUM." if arch_type && !ARCH_TYPE_ENUM.include?(arch_type)

      @arch_type = arch_type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] checksum_type Object to be assigned
    def checksum_type=(checksum_type)
      raise "Invalid value for 'checksum_type': this must be one of the values in CHECKSUM_TYPE_ENUM." if checksum_type && !CHECKSUM_TYPE_ENUM.include?(checksum_type)

      @checksum_type = checksum_type
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        compartment_id == other.compartment_id &&
        display_name == other.display_name &&
        description == other.description &&
        arch_type == other.arch_type &&
        maintainer_name == other.maintainer_name &&
        maintainer_email == other.maintainer_email &&
        maintainer_phone == other.maintainer_phone &&
        checksum_type == other.checksum_type &&
        parent_id == other.parent_id &&
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
      [compartment_id, display_name, description, arch_type, maintainer_name, maintainer_email, maintainer_phone, checksum_type, parent_id, freeform_tags, defined_tags].hash
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
