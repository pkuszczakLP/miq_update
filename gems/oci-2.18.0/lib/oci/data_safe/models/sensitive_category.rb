# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'sensitive_type'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details of the sensitive category.
  class DataSafe::Models::SensitiveCategory < DataSafe::Models::SensitiveType
    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'entity_type': :'entityType',
        'display_name': :'displayName',
        'compartment_id': :'compartmentId',
        'lifecycle_state': :'lifecycleState',
        'short_name': :'shortName',
        'source': :'source',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'description': :'description',
        'parent_category_id': :'parentCategoryId',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'system_tags': :'systemTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'entity_type': :'String',
        'display_name': :'String',
        'compartment_id': :'String',
        'lifecycle_state': :'String',
        'short_name': :'String',
        'source': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'description': :'String',
        'parent_category_id': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'system_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {OCI::DataSafe::Models::SensitiveType#id #id} proprety
    # @option attributes [String] :display_name The value to assign to the {OCI::DataSafe::Models::SensitiveType#display_name #display_name} proprety
    # @option attributes [String] :compartment_id The value to assign to the {OCI::DataSafe::Models::SensitiveType#compartment_id #compartment_id} proprety
    # @option attributes [String] :lifecycle_state The value to assign to the {OCI::DataSafe::Models::SensitiveType#lifecycle_state #lifecycle_state} proprety
    # @option attributes [String] :short_name The value to assign to the {OCI::DataSafe::Models::SensitiveType#short_name #short_name} proprety
    # @option attributes [String] :source The value to assign to the {OCI::DataSafe::Models::SensitiveType#source #source} proprety
    # @option attributes [DateTime] :time_created The value to assign to the {OCI::DataSafe::Models::SensitiveType#time_created #time_created} proprety
    # @option attributes [DateTime] :time_updated The value to assign to the {OCI::DataSafe::Models::SensitiveType#time_updated #time_updated} proprety
    # @option attributes [String] :description The value to assign to the {OCI::DataSafe::Models::SensitiveType#description #description} proprety
    # @option attributes [String] :parent_category_id The value to assign to the {OCI::DataSafe::Models::SensitiveType#parent_category_id #parent_category_id} proprety
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {OCI::DataSafe::Models::SensitiveType#freeform_tags #freeform_tags} proprety
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {OCI::DataSafe::Models::SensitiveType#defined_tags #defined_tags} proprety
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {OCI::DataSafe::Models::SensitiveType#system_tags #system_tags} proprety
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['entityType'] = 'SENSITIVE_CATEGORY'

      super(attributes)
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
        entity_type == other.entity_type &&
        display_name == other.display_name &&
        compartment_id == other.compartment_id &&
        lifecycle_state == other.lifecycle_state &&
        short_name == other.short_name &&
        source == other.source &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        description == other.description &&
        parent_category_id == other.parent_category_id &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        system_tags == other.system_tags
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
      [id, entity_type, display_name, compartment_id, lifecycle_state, short_name, source, time_created, time_updated, description, parent_category_id, freeform_tags, defined_tags, system_tags].hash
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
