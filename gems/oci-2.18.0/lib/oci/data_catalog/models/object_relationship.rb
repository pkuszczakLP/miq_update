# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details regarding a specific object and its relationship to the referencing object.
  class DataCatalog::Models::ObjectRelationship
    # Type of relationship with the referencing object.
    # @return [String]
    attr_accessor :relationship_type

    # Unique id of the object.
    # @return [String]
    attr_accessor :key

    # Name of the object.
    # @return [String]
    attr_accessor :name

    # Type name of the object. Type names can be found via the '/types' endpoint.
    # @return [String]
    attr_accessor :type_name

    # Type key of the object. Type keys can be found via the '/types' endpoint.
    # @return [String]
    attr_accessor :type_key

    # The date and time the relationship was created, in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    # Example: `2019-03-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # The last time a change was made to this reference. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    #
    # @return [DateTime]
    attr_accessor :time_updated

    # Full path of the object.
    # @return [String]
    attr_accessor :path

    # Key of the parent object for the resource.
    # @return [String]
    attr_accessor :parent_key

    # Full path of the parent object.
    # @return [String]
    attr_accessor :parent_path

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'relationship_type': :'relationshipType',
        'key': :'key',
        'name': :'name',
        'type_name': :'typeName',
        'type_key': :'typeKey',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'path': :'path',
        'parent_key': :'parentKey',
        'parent_path': :'parentPath'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'relationship_type': :'String',
        'key': :'String',
        'name': :'String',
        'type_name': :'String',
        'type_key': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'path': :'String',
        'parent_key': :'String',
        'parent_path': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :relationship_type The value to assign to the {#relationship_type} property
    # @option attributes [String] :key The value to assign to the {#key} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :type_name The value to assign to the {#type_name} property
    # @option attributes [String] :type_key The value to assign to the {#type_key} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :path The value to assign to the {#path} property
    # @option attributes [String] :parent_key The value to assign to the {#parent_key} property
    # @option attributes [String] :parent_path The value to assign to the {#parent_path} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.relationship_type = attributes[:'relationshipType'] if attributes[:'relationshipType']

      raise 'You cannot provide both :relationshipType and :relationship_type' if attributes.key?(:'relationshipType') && attributes.key?(:'relationship_type')

      self.relationship_type = attributes[:'relationship_type'] if attributes[:'relationship_type']

      self.key = attributes[:'key'] if attributes[:'key']

      self.name = attributes[:'name'] if attributes[:'name']

      self.type_name = attributes[:'typeName'] if attributes[:'typeName']

      raise 'You cannot provide both :typeName and :type_name' if attributes.key?(:'typeName') && attributes.key?(:'type_name')

      self.type_name = attributes[:'type_name'] if attributes[:'type_name']

      self.type_key = attributes[:'typeKey'] if attributes[:'typeKey']

      raise 'You cannot provide both :typeKey and :type_key' if attributes.key?(:'typeKey') && attributes.key?(:'type_key')

      self.type_key = attributes[:'type_key'] if attributes[:'type_key']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.path = attributes[:'path'] if attributes[:'path']

      self.parent_key = attributes[:'parentKey'] if attributes[:'parentKey']

      raise 'You cannot provide both :parentKey and :parent_key' if attributes.key?(:'parentKey') && attributes.key?(:'parent_key')

      self.parent_key = attributes[:'parent_key'] if attributes[:'parent_key']

      self.parent_path = attributes[:'parentPath'] if attributes[:'parentPath']

      raise 'You cannot provide both :parentPath and :parent_path' if attributes.key?(:'parentPath') && attributes.key?(:'parent_path')

      self.parent_path = attributes[:'parent_path'] if attributes[:'parent_path']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        relationship_type == other.relationship_type &&
        key == other.key &&
        name == other.name &&
        type_name == other.type_name &&
        type_key == other.type_key &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        path == other.path &&
        parent_key == other.parent_key &&
        parent_path == other.parent_path
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
      [relationship_type, key, name, type_name, type_key, time_created, time_updated, path, parent_key, parent_path].hash
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
