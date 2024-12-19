# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Properties that are required to create a Skill.
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class Oda::Models::CreateSkillDetails
    KIND_ENUM = [
      KIND_NEW = 'NEW'.freeze,
      KIND_CLONE = 'CLONE'.freeze,
      KIND_VERSION = 'VERSION'.freeze,
      KIND_EXTEND = 'EXTEND'.freeze
    ].freeze

    MULTILINGUAL_MODE_ENUM = [
      MULTILINGUAL_MODE_NATIVE = 'NATIVE'.freeze,
      MULTILINGUAL_MODE_TRANSLATION = 'TRANSLATION'.freeze
    ].freeze

    # **[Required]** How to create the Skill.
    # @return [String]
    attr_reader :kind

    # The resource's category.  This is used to group resource's together.
    # @return [String]
    attr_accessor :category

    # A short description of the resource.
    # @return [String]
    attr_accessor :description

    # The ODA Platform Version for this resource.
    # @return [String]
    attr_accessor :platform_version

    # The multilingual mode for the resource.
    # @return [String]
    attr_reader :multilingual_mode

    # The primary language for the resource.
    # @return [String]
    attr_accessor :primary_language_tag

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

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'kind': :'kind',
        'category': :'category',
        'description': :'description',
        'platform_version': :'platformVersion',
        'multilingual_mode': :'multilingualMode',
        'primary_language_tag': :'primaryLanguageTag',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'kind': :'String',
        'category': :'String',
        'description': :'String',
        'platform_version': :'String',
        'multilingual_mode': :'String',
        'primary_language_tag': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'kind'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::Oda::Models::CloneSkillDetails' if type == 'CLONE'
      return 'OCI::Oda::Models::CreateNewSkillDetails' if type == 'NEW'
      return 'OCI::Oda::Models::CreateSkillVersionDetails' if type == 'VERSION'
      return 'OCI::Oda::Models::ExtendSkillDetails' if type == 'EXTEND'

      # TODO: Log a warning when the subtype is not found.
      'OCI::Oda::Models::CreateSkillDetails'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :kind The value to assign to the {#kind} property
    # @option attributes [String] :category The value to assign to the {#category} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :platform_version The value to assign to the {#platform_version} property
    # @option attributes [String] :multilingual_mode The value to assign to the {#multilingual_mode} property
    # @option attributes [String] :primary_language_tag The value to assign to the {#primary_language_tag} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.kind = attributes[:'kind'] if attributes[:'kind']

      self.category = attributes[:'category'] if attributes[:'category']

      self.description = attributes[:'description'] if attributes[:'description']

      self.platform_version = attributes[:'platformVersion'] if attributes[:'platformVersion']

      raise 'You cannot provide both :platformVersion and :platform_version' if attributes.key?(:'platformVersion') && attributes.key?(:'platform_version')

      self.platform_version = attributes[:'platform_version'] if attributes[:'platform_version']

      self.multilingual_mode = attributes[:'multilingualMode'] if attributes[:'multilingualMode']

      raise 'You cannot provide both :multilingualMode and :multilingual_mode' if attributes.key?(:'multilingualMode') && attributes.key?(:'multilingual_mode')

      self.multilingual_mode = attributes[:'multilingual_mode'] if attributes[:'multilingual_mode']

      self.primary_language_tag = attributes[:'primaryLanguageTag'] if attributes[:'primaryLanguageTag']

      raise 'You cannot provide both :primaryLanguageTag and :primary_language_tag' if attributes.key?(:'primaryLanguageTag') && attributes.key?(:'primary_language_tag')

      self.primary_language_tag = attributes[:'primary_language_tag'] if attributes[:'primary_language_tag']

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
    # @param [Object] kind Object to be assigned
    def kind=(kind)
      raise "Invalid value for 'kind': this must be one of the values in KIND_ENUM." if kind && !KIND_ENUM.include?(kind)

      @kind = kind
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] multilingual_mode Object to be assigned
    def multilingual_mode=(multilingual_mode)
      raise "Invalid value for 'multilingual_mode': this must be one of the values in MULTILINGUAL_MODE_ENUM." if multilingual_mode && !MULTILINGUAL_MODE_ENUM.include?(multilingual_mode)

      @multilingual_mode = multilingual_mode
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        kind == other.kind &&
        category == other.category &&
        description == other.description &&
        platform_version == other.platform_version &&
        multilingual_mode == other.multilingual_mode &&
        primary_language_tag == other.primary_language_tag &&
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
      [kind, category, description, platform_version, multilingual_mode, primary_language_tag, freeform_tags, defined_tags].hash
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
