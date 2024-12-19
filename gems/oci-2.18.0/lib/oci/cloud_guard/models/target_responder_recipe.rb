# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details of Target ResponderRecipe
  class CloudGuard::Models::TargetResponderRecipe
    OWNER_ENUM = [
      OWNER_CUSTOMER = 'CUSTOMER'.freeze,
      OWNER_ORACLE = 'ORACLE'.freeze,
      OWNER_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Unique identifier of TargetResponderRecipe that can't be changed after creation.
    # @return [String]
    attr_accessor :id

    # **[Required]** Unique identifier for Responder Recipe of which this is an extension.
    # @return [String]
    attr_accessor :responder_recipe_id

    # **[Required]** Compartment Identifier
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** ResponderRecipe display name.
    # @return [String]
    attr_accessor :display_name

    # **[Required]** ResponderRecipe description.
    # @return [String]
    attr_accessor :description

    # **[Required]** Owner of ResponderRecipe
    # @return [String]
    attr_reader :owner

    # The date and time the target responder recipe rule was created. Format defined by RFC3339.
    # @return [DateTime]
    attr_accessor :time_created

    # The date and time the target responder recipe rule was updated. Format defined by RFC3339.
    # @return [DateTime]
    attr_accessor :time_updated

    # List of responder rules associated with the recipe - user input
    # @return [Array<OCI::CloudGuard::Models::TargetResponderRecipeResponderRule>]
    attr_accessor :responder_rules

    # List of responder rules associated with the recipe after applying all defaults
    # @return [Array<OCI::CloudGuard::Models::TargetResponderRecipeResponderRule>]
    attr_accessor :effective_responder_rules

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'responder_recipe_id': :'responderRecipeId',
        'compartment_id': :'compartmentId',
        'display_name': :'displayName',
        'description': :'description',
        'owner': :'owner',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'responder_rules': :'responderRules',
        'effective_responder_rules': :'effectiveResponderRules'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'responder_recipe_id': :'String',
        'compartment_id': :'String',
        'display_name': :'String',
        'description': :'String',
        'owner': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'responder_rules': :'Array<OCI::CloudGuard::Models::TargetResponderRecipeResponderRule>',
        'effective_responder_rules': :'Array<OCI::CloudGuard::Models::TargetResponderRecipeResponderRule>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :responder_recipe_id The value to assign to the {#responder_recipe_id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :owner The value to assign to the {#owner} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [Array<OCI::CloudGuard::Models::TargetResponderRecipeResponderRule>] :responder_rules The value to assign to the {#responder_rules} property
    # @option attributes [Array<OCI::CloudGuard::Models::TargetResponderRecipeResponderRule>] :effective_responder_rules The value to assign to the {#effective_responder_rules} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.responder_recipe_id = attributes[:'responderRecipeId'] if attributes[:'responderRecipeId']

      raise 'You cannot provide both :responderRecipeId and :responder_recipe_id' if attributes.key?(:'responderRecipeId') && attributes.key?(:'responder_recipe_id')

      self.responder_recipe_id = attributes[:'responder_recipe_id'] if attributes[:'responder_recipe_id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.owner = attributes[:'owner'] if attributes[:'owner']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.responder_rules = attributes[:'responderRules'] if attributes[:'responderRules']

      raise 'You cannot provide both :responderRules and :responder_rules' if attributes.key?(:'responderRules') && attributes.key?(:'responder_rules')

      self.responder_rules = attributes[:'responder_rules'] if attributes[:'responder_rules']

      self.effective_responder_rules = attributes[:'effectiveResponderRules'] if attributes[:'effectiveResponderRules']

      raise 'You cannot provide both :effectiveResponderRules and :effective_responder_rules' if attributes.key?(:'effectiveResponderRules') && attributes.key?(:'effective_responder_rules')

      self.effective_responder_rules = attributes[:'effective_responder_rules'] if attributes[:'effective_responder_rules']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] owner Object to be assigned
    def owner=(owner)
      # rubocop:disable Style/ConditionalAssignment
      if owner && !OWNER_ENUM.include?(owner)
        OCI.logger.debug("Unknown value for 'owner' [" + owner + "]. Mapping to 'OWNER_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @owner = OWNER_UNKNOWN_ENUM_VALUE
      else
        @owner = owner
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
        responder_recipe_id == other.responder_recipe_id &&
        compartment_id == other.compartment_id &&
        display_name == other.display_name &&
        description == other.description &&
        owner == other.owner &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        responder_rules == other.responder_rules &&
        effective_responder_rules == other.effective_responder_rules
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
      [id, responder_recipe_id, compartment_id, display_name, description, owner, time_created, time_updated, responder_rules, effective_responder_rules].hash
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
