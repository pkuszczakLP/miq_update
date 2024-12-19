# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'create_skill_details'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Properties that are required to create a Skill from scratch.
  class Oda::Models::CreateNewSkillDetails < Oda::Models::CreateSkillDetails
    # **[Required]** The reource's name. The name can contain only letters, numbers, periods, and underscores. The name must begin with a letter.
    #
    # @return [String]
    attr_accessor :name

    # **[Required]** The resource's display name.
    #
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The resource's version. The version can only contain numbers, letters, periods, underscores, dashes or spaces.  The version must begin with a letter or a number.
    #
    # @return [String]
    attr_accessor :version

    # A list of native languages supported by this resource.
    # @return [Array<String>]
    attr_accessor :native_language_tags

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
        'defined_tags': :'definedTags',
        'name': :'name',
        'display_name': :'displayName',
        'version': :'version',
        'native_language_tags': :'nativeLanguageTags'
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
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'name': :'String',
        'display_name': :'String',
        'version': :'String',
        'native_language_tags': :'Array<String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :category The value to assign to the {OCI::Oda::Models::CreateSkillDetails#category #category} proprety
    # @option attributes [String] :description The value to assign to the {OCI::Oda::Models::CreateSkillDetails#description #description} proprety
    # @option attributes [String] :platform_version The value to assign to the {OCI::Oda::Models::CreateSkillDetails#platform_version #platform_version} proprety
    # @option attributes [String] :multilingual_mode The value to assign to the {OCI::Oda::Models::CreateSkillDetails#multilingual_mode #multilingual_mode} proprety
    # @option attributes [String] :primary_language_tag The value to assign to the {OCI::Oda::Models::CreateSkillDetails#primary_language_tag #primary_language_tag} proprety
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {OCI::Oda::Models::CreateSkillDetails#freeform_tags #freeform_tags} proprety
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {OCI::Oda::Models::CreateSkillDetails#defined_tags #defined_tags} proprety
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :version The value to assign to the {#version} property
    # @option attributes [Array<String>] :native_language_tags The value to assign to the {#native_language_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['kind'] = 'NEW'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.version = attributes[:'version'] if attributes[:'version']
      self.version = "1.0" if version.nil? && !attributes.key?(:'version') # rubocop:disable Style/StringLiterals

      self.native_language_tags = attributes[:'nativeLanguageTags'] if attributes[:'nativeLanguageTags']

      raise 'You cannot provide both :nativeLanguageTags and :native_language_tags' if attributes.key?(:'nativeLanguageTags') && attributes.key?(:'native_language_tags')

      self.native_language_tags = attributes[:'native_language_tags'] if attributes[:'native_language_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

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
        defined_tags == other.defined_tags &&
        name == other.name &&
        display_name == other.display_name &&
        version == other.version &&
        native_language_tags == other.native_language_tags
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
      [kind, category, description, platform_version, multilingual_mode, primary_language_tag, freeform_tags, defined_tags, name, display_name, version, native_language_tags].hash
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
