# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details of `Package` object.
  class Oda::Models::Package
    # **[Required]** Unique immutable identifier that was assigned when the Package was registered.
    # @return [String]
    attr_accessor :id

    # **[Required]** ID of the publisher providing the package.
    #
    # @return [String]
    attr_accessor :publisher_id

    # **[Required]** Name of package.
    # @return [String]
    attr_accessor :name

    # **[Required]** Display name for the package (displayed in UI and user-facing applications).
    # @return [String]
    attr_accessor :display_name

    # **[Required]** Version of the package.
    # @return [String]
    attr_accessor :version

    # **[Required]** When the package was uploaded. A date-time string as described in [RFC 3339](https://tools.ietf.org/rfc/rfc3339), section 14.29.
    # @return [DateTime]
    attr_accessor :time_uploaded

    # **[Required]** When the package was last published. A date-time string as described in [RFC 3339](https://tools.ietf.org/rfc/rfc3339), section 14.29.
    # @return [DateTime]
    attr_accessor :time_published

    # **[Required]** Description of the package.
    # @return [String]
    attr_accessor :description

    # **[Required]** A list of resource types describing the content of the package.
    # @return [Array<String>]
    attr_accessor :resource_types

    # **[Required]** A map of resource type to metadata key/value map that further describes the content for the resource types in this package.. Keys are resource type names, values are a map of name/value pairs per resource type.
    # @return [Array<OCI::Oda::Models::ResourceTypeMetadata>]
    attr_accessor :resource_types_metadata

    # **[Required]** A map of metadata key/value pairs that further describes the publisher and the platform in which the package might be used.
    # @return [Array<OCI::Oda::Models::MetadataProperty>]
    attr_accessor :publisher_metadata

    # Simple key-value pair that is applied without any predefined name, type, or scope.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Usage of predefined tag keys. These predefined keys are scoped to namespaces.
    # Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # This attribute is required.
    # @return [OCI::Oda::Models::ImportContract]
    attr_accessor :import_contract

    # This attribute is required.
    # @return [OCI::Oda::Models::DefaultParameterValues]
    attr_accessor :default_parameter_values

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'publisher_id': :'publisherId',
        'name': :'name',
        'display_name': :'displayName',
        'version': :'version',
        'time_uploaded': :'timeUploaded',
        'time_published': :'timePublished',
        'description': :'description',
        'resource_types': :'resourceTypes',
        'resource_types_metadata': :'resourceTypesMetadata',
        'publisher_metadata': :'publisherMetadata',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'import_contract': :'importContract',
        'default_parameter_values': :'defaultParameterValues'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'publisher_id': :'String',
        'name': :'String',
        'display_name': :'String',
        'version': :'String',
        'time_uploaded': :'DateTime',
        'time_published': :'DateTime',
        'description': :'String',
        'resource_types': :'Array<String>',
        'resource_types_metadata': :'Array<OCI::Oda::Models::ResourceTypeMetadata>',
        'publisher_metadata': :'Array<OCI::Oda::Models::MetadataProperty>',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'import_contract': :'OCI::Oda::Models::ImportContract',
        'default_parameter_values': :'OCI::Oda::Models::DefaultParameterValues'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :publisher_id The value to assign to the {#publisher_id} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :version The value to assign to the {#version} property
    # @option attributes [DateTime] :time_uploaded The value to assign to the {#time_uploaded} property
    # @option attributes [DateTime] :time_published The value to assign to the {#time_published} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [Array<String>] :resource_types The value to assign to the {#resource_types} property
    # @option attributes [Array<OCI::Oda::Models::ResourceTypeMetadata>] :resource_types_metadata The value to assign to the {#resource_types_metadata} property
    # @option attributes [Array<OCI::Oda::Models::MetadataProperty>] :publisher_metadata The value to assign to the {#publisher_metadata} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [OCI::Oda::Models::ImportContract] :import_contract The value to assign to the {#import_contract} property
    # @option attributes [OCI::Oda::Models::DefaultParameterValues] :default_parameter_values The value to assign to the {#default_parameter_values} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.publisher_id = attributes[:'publisherId'] if attributes[:'publisherId']

      raise 'You cannot provide both :publisherId and :publisher_id' if attributes.key?(:'publisherId') && attributes.key?(:'publisher_id')

      self.publisher_id = attributes[:'publisher_id'] if attributes[:'publisher_id']

      self.name = attributes[:'name'] if attributes[:'name']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.version = attributes[:'version'] if attributes[:'version']

      self.time_uploaded = attributes[:'timeUploaded'] if attributes[:'timeUploaded']

      raise 'You cannot provide both :timeUploaded and :time_uploaded' if attributes.key?(:'timeUploaded') && attributes.key?(:'time_uploaded')

      self.time_uploaded = attributes[:'time_uploaded'] if attributes[:'time_uploaded']

      self.time_published = attributes[:'timePublished'] if attributes[:'timePublished']

      raise 'You cannot provide both :timePublished and :time_published' if attributes.key?(:'timePublished') && attributes.key?(:'time_published')

      self.time_published = attributes[:'time_published'] if attributes[:'time_published']

      self.description = attributes[:'description'] if attributes[:'description']

      self.resource_types = attributes[:'resourceTypes'] if attributes[:'resourceTypes']

      raise 'You cannot provide both :resourceTypes and :resource_types' if attributes.key?(:'resourceTypes') && attributes.key?(:'resource_types')

      self.resource_types = attributes[:'resource_types'] if attributes[:'resource_types']

      self.resource_types_metadata = attributes[:'resourceTypesMetadata'] if attributes[:'resourceTypesMetadata']

      raise 'You cannot provide both :resourceTypesMetadata and :resource_types_metadata' if attributes.key?(:'resourceTypesMetadata') && attributes.key?(:'resource_types_metadata')

      self.resource_types_metadata = attributes[:'resource_types_metadata'] if attributes[:'resource_types_metadata']

      self.publisher_metadata = attributes[:'publisherMetadata'] if attributes[:'publisherMetadata']

      raise 'You cannot provide both :publisherMetadata and :publisher_metadata' if attributes.key?(:'publisherMetadata') && attributes.key?(:'publisher_metadata')

      self.publisher_metadata = attributes[:'publisher_metadata'] if attributes[:'publisher_metadata']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.import_contract = attributes[:'importContract'] if attributes[:'importContract']

      raise 'You cannot provide both :importContract and :import_contract' if attributes.key?(:'importContract') && attributes.key?(:'import_contract')

      self.import_contract = attributes[:'import_contract'] if attributes[:'import_contract']

      self.default_parameter_values = attributes[:'defaultParameterValues'] if attributes[:'defaultParameterValues']

      raise 'You cannot provide both :defaultParameterValues and :default_parameter_values' if attributes.key?(:'defaultParameterValues') && attributes.key?(:'default_parameter_values')

      self.default_parameter_values = attributes[:'default_parameter_values'] if attributes[:'default_parameter_values']
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
        publisher_id == other.publisher_id &&
        name == other.name &&
        display_name == other.display_name &&
        version == other.version &&
        time_uploaded == other.time_uploaded &&
        time_published == other.time_published &&
        description == other.description &&
        resource_types == other.resource_types &&
        resource_types_metadata == other.resource_types_metadata &&
        publisher_metadata == other.publisher_metadata &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        import_contract == other.import_contract &&
        default_parameter_values == other.default_parameter_values
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
      [id, publisher_id, name, display_name, version, time_uploaded, time_published, description, resource_types, resource_types_metadata, publisher_metadata, freeform_tags, defined_tags, import_contract, default_parameter_values].hash
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
