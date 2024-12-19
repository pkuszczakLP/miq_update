# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Summary of a folder tag.
  class DataCatalog::Models::FolderTagSummary
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_MOVING = 'MOVING'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The unique key of the parent folder.
    # @return [String]
    attr_accessor :folder_key

    # **[Required]** Unique tag key that is immutable.
    # @return [String]
    attr_accessor :key

    # The date and time the tag was created, in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    # Example: `2019-03-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # Name of the tag that matches the term name.
    # @return [String]
    attr_accessor :name

    # URI to the tag instance in the API.
    # @return [String]
    attr_accessor :uri

    # Unique key of the related term.
    # @return [String]
    attr_accessor :term_key

    # Path of the related term.
    # @return [String]
    attr_accessor :term_path

    # Description of the related term.
    # @return [String]
    attr_accessor :term_description

    # Unique id of the parent glossary of the term.
    # @return [String]
    attr_accessor :glossary_key

    # State of the Tag.
    # @return [String]
    attr_reader :lifecycle_state

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'folder_key': :'folderKey',
        'key': :'key',
        'time_created': :'timeCreated',
        'name': :'name',
        'uri': :'uri',
        'term_key': :'termKey',
        'term_path': :'termPath',
        'term_description': :'termDescription',
        'glossary_key': :'glossaryKey',
        'lifecycle_state': :'lifecycleState'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'folder_key': :'String',
        'key': :'String',
        'time_created': :'DateTime',
        'name': :'String',
        'uri': :'String',
        'term_key': :'String',
        'term_path': :'String',
        'term_description': :'String',
        'glossary_key': :'String',
        'lifecycle_state': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :folder_key The value to assign to the {#folder_key} property
    # @option attributes [String] :key The value to assign to the {#key} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :uri The value to assign to the {#uri} property
    # @option attributes [String] :term_key The value to assign to the {#term_key} property
    # @option attributes [String] :term_path The value to assign to the {#term_path} property
    # @option attributes [String] :term_description The value to assign to the {#term_description} property
    # @option attributes [String] :glossary_key The value to assign to the {#glossary_key} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.folder_key = attributes[:'folderKey'] if attributes[:'folderKey']

      raise 'You cannot provide both :folderKey and :folder_key' if attributes.key?(:'folderKey') && attributes.key?(:'folder_key')

      self.folder_key = attributes[:'folder_key'] if attributes[:'folder_key']

      self.key = attributes[:'key'] if attributes[:'key']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.name = attributes[:'name'] if attributes[:'name']

      self.uri = attributes[:'uri'] if attributes[:'uri']

      self.term_key = attributes[:'termKey'] if attributes[:'termKey']

      raise 'You cannot provide both :termKey and :term_key' if attributes.key?(:'termKey') && attributes.key?(:'term_key')

      self.term_key = attributes[:'term_key'] if attributes[:'term_key']

      self.term_path = attributes[:'termPath'] if attributes[:'termPath']

      raise 'You cannot provide both :termPath and :term_path' if attributes.key?(:'termPath') && attributes.key?(:'term_path')

      self.term_path = attributes[:'term_path'] if attributes[:'term_path']

      self.term_description = attributes[:'termDescription'] if attributes[:'termDescription']

      raise 'You cannot provide both :termDescription and :term_description' if attributes.key?(:'termDescription') && attributes.key?(:'term_description')

      self.term_description = attributes[:'term_description'] if attributes[:'term_description']

      self.glossary_key = attributes[:'glossaryKey'] if attributes[:'glossaryKey']

      raise 'You cannot provide both :glossaryKey and :glossary_key' if attributes.key?(:'glossaryKey') && attributes.key?(:'glossary_key')

      self.glossary_key = attributes[:'glossary_key'] if attributes[:'glossary_key']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']
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

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        folder_key == other.folder_key &&
        key == other.key &&
        time_created == other.time_created &&
        name == other.name &&
        uri == other.uri &&
        term_key == other.term_key &&
        term_path == other.term_path &&
        term_description == other.term_description &&
        glossary_key == other.glossary_key &&
        lifecycle_state == other.lifecycle_state
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
      [folder_key, key, time_created, name, uri, term_key, term_path, term_description, glossary_key, lifecycle_state].hash
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