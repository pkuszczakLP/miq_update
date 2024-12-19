# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Skill metadata.
  class Oda::Models::Skill
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_DETAILS_ENUM = [
      LIFECYCLE_DETAILS_PUBLISHED = 'PUBLISHED'.freeze,
      LIFECYCLE_DETAILS_DRAFT = 'DRAFT'.freeze,
      LIFECYCLE_DETAILS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    MULTILINGUAL_MODE_ENUM = [
      MULTILINGUAL_MODE_NATIVE = 'NATIVE'.freeze,
      MULTILINGUAL_MODE_TRANSLATION = 'TRANSLATION'.freeze,
      MULTILINGUAL_MODE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Unique immutable identifier that was assigned when the resource was created.
    # @return [String]
    attr_accessor :id

    # **[Required]** The reource's name. The name can contain only letters, numbers, periods, and underscores. The name must begin with a letter.
    #
    # @return [String]
    attr_accessor :name

    # **[Required]** The resource's version. The version can only contain numbers, letters, periods, underscores, dashes or spaces.  The version must begin with a letter or a number.
    #
    # @return [String]
    attr_accessor :version

    # **[Required]** The resource's display name.
    #
    # @return [String]
    attr_accessor :display_name

    # The resource's category.  This is used to group resource's together.
    # @return [String]
    attr_accessor :category

    # A short description of the resource.
    # @return [String]
    attr_accessor :description

    # The resource's namespace.
    # @return [String]
    attr_accessor :namespace

    # **[Required]** The resource's current state.
    # @return [String]
    attr_reader :lifecycle_state

    # **[Required]** The resource's publish state.
    # @return [String]
    attr_reader :lifecycle_details

    # **[Required]** The ODA Platform Version for this resource.
    # @return [String]
    attr_accessor :platform_version

    # The unique identifier for the base reource (when this resource extends another).
    # @return [String]
    attr_accessor :base_id

    # The multilingual mode for the resource.
    # @return [String]
    attr_reader :multilingual_mode

    # The primary language for the resource.
    # @return [String]
    attr_accessor :primary_language_tag

    # A list of native languages supported by this resource.
    # @return [Array<String>]
    attr_accessor :native_language_tags

    # **[Required]** When the resource was created. A date-time string as described in [RFC 3339](https://tools.ietf.org/rfc/rfc3339), section 14.29.
    # @return [DateTime]
    attr_accessor :time_created

    # **[Required]** When the resource was last updated. A date-time string as described in [RFC 3339](https://tools.ietf.org/rfc/rfc3339), section 14.29.
    # @return [DateTime]
    attr_accessor :time_updated

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
        'id': :'id',
        'name': :'name',
        'version': :'version',
        'display_name': :'displayName',
        'category': :'category',
        'description': :'description',
        'namespace': :'namespace',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'platform_version': :'platformVersion',
        'base_id': :'baseId',
        'multilingual_mode': :'multilingualMode',
        'primary_language_tag': :'primaryLanguageTag',
        'native_language_tags': :'nativeLanguageTags',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'name': :'String',
        'version': :'String',
        'display_name': :'String',
        'category': :'String',
        'description': :'String',
        'namespace': :'String',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'platform_version': :'String',
        'base_id': :'String',
        'multilingual_mode': :'String',
        'primary_language_tag': :'String',
        'native_language_tags': :'Array<String>',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :version The value to assign to the {#version} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :category The value to assign to the {#category} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :namespace The value to assign to the {#namespace} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [String] :platform_version The value to assign to the {#platform_version} property
    # @option attributes [String] :base_id The value to assign to the {#base_id} property
    # @option attributes [String] :multilingual_mode The value to assign to the {#multilingual_mode} property
    # @option attributes [String] :primary_language_tag The value to assign to the {#primary_language_tag} property
    # @option attributes [Array<String>] :native_language_tags The value to assign to the {#native_language_tags} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      self.id = attributes[:'id'] if attributes[:'id']

      self.name = attributes[:'name'] if attributes[:'name']

      self.version = attributes[:'version'] if attributes[:'version']
      self.version = "1.0" if version.nil? && !attributes.key?(:'version') # rubocop:disable Style/StringLiterals

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.category = attributes[:'category'] if attributes[:'category']

      self.description = attributes[:'description'] if attributes[:'description']

      self.namespace = attributes[:'namespace'] if attributes[:'namespace']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.platform_version = attributes[:'platformVersion'] if attributes[:'platformVersion']

      raise 'You cannot provide both :platformVersion and :platform_version' if attributes.key?(:'platformVersion') && attributes.key?(:'platform_version')

      self.platform_version = attributes[:'platform_version'] if attributes[:'platform_version']

      self.base_id = attributes[:'baseId'] if attributes[:'baseId']

      raise 'You cannot provide both :baseId and :base_id' if attributes.key?(:'baseId') && attributes.key?(:'base_id')

      self.base_id = attributes[:'base_id'] if attributes[:'base_id']

      self.multilingual_mode = attributes[:'multilingualMode'] if attributes[:'multilingualMode']

      raise 'You cannot provide both :multilingualMode and :multilingual_mode' if attributes.key?(:'multilingualMode') && attributes.key?(:'multilingual_mode')

      self.multilingual_mode = attributes[:'multilingual_mode'] if attributes[:'multilingual_mode']

      self.primary_language_tag = attributes[:'primaryLanguageTag'] if attributes[:'primaryLanguageTag']

      raise 'You cannot provide both :primaryLanguageTag and :primary_language_tag' if attributes.key?(:'primaryLanguageTag') && attributes.key?(:'primary_language_tag')

      self.primary_language_tag = attributes[:'primary_language_tag'] if attributes[:'primary_language_tag']

      self.native_language_tags = attributes[:'nativeLanguageTags'] if attributes[:'nativeLanguageTags']

      raise 'You cannot provide both :nativeLanguageTags and :native_language_tags' if attributes.key?(:'nativeLanguageTags') && attributes.key?(:'native_language_tags')

      self.native_language_tags = attributes[:'native_language_tags'] if attributes[:'native_language_tags']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

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
    # @param [Object] lifecycle_state Object to be assigned
    def lifecycle_state=(lifecycle_state)
      # rubocop:disable Style/ConditionalAssignment
      if lifecycle_state && !LIFECYCLE_STATE_ENUM.include?(lifecycle_state)
        OCI.logger.debug("Unknown value for 'lifecycle_state' [" + lifecycle_state + "]. Mapping to 'LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @lifecycle_state = LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE
      else
        @lifecycle_state = lifecycle_state
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] lifecycle_details Object to be assigned
    def lifecycle_details=(lifecycle_details)
      # rubocop:disable Style/ConditionalAssignment
      if lifecycle_details && !LIFECYCLE_DETAILS_ENUM.include?(lifecycle_details)
        OCI.logger.debug("Unknown value for 'lifecycle_details' [" + lifecycle_details + "]. Mapping to 'LIFECYCLE_DETAILS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @lifecycle_details = LIFECYCLE_DETAILS_UNKNOWN_ENUM_VALUE
      else
        @lifecycle_details = lifecycle_details
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] multilingual_mode Object to be assigned
    def multilingual_mode=(multilingual_mode)
      # rubocop:disable Style/ConditionalAssignment
      if multilingual_mode && !MULTILINGUAL_MODE_ENUM.include?(multilingual_mode)
        OCI.logger.debug("Unknown value for 'multilingual_mode' [" + multilingual_mode + "]. Mapping to 'MULTILINGUAL_MODE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @multilingual_mode = MULTILINGUAL_MODE_UNKNOWN_ENUM_VALUE
      else
        @multilingual_mode = multilingual_mode
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
        version == other.version &&
        display_name == other.display_name &&
        category == other.category &&
        description == other.description &&
        namespace == other.namespace &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        platform_version == other.platform_version &&
        base_id == other.base_id &&
        multilingual_mode == other.multilingual_mode &&
        primary_language_tag == other.primary_language_tag &&
        native_language_tags == other.native_language_tags &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
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
      [id, name, version, display_name, category, description, namespace, lifecycle_state, lifecycle_details, platform_version, base_id, multilingual_mode, primary_language_tag, native_language_tags, time_created, time_updated, freeform_tags, defined_tags].hash
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
