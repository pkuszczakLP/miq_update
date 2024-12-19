# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # LogAnalyticsSourceDataFilter
  class LogAnalytics::Models::LogAnalyticsSourceDataFilter
    FILTER_TYPE_ENUM = [
      FILTER_TYPE_MASK = 'MASK'.freeze,
      FILTER_TYPE_HASH_MASK = 'HASH_MASK'.freeze,
      FILTER_TYPE_DROP_LOG_ENTRY = 'DROP_LOG_ENTRY'.freeze,
      FILTER_TYPE_DROP_STRING = 'DROP_STRING'.freeze,
      FILTER_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The filter description.
    # @return [String]
    attr_accessor :description

    # The filter display name.
    # @return [String]
    attr_accessor :display_name

    # The filter edit version.
    # @return [Integer]
    attr_accessor :edit_version

    # A flag inidcating whether or not the filter is enabled.
    #
    # @return [BOOLEAN]
    attr_accessor :is_enabled

    # The field internal name.
    # @return [String]
    attr_accessor :field_name

    # The hash type.
    # @return [Integer]
    attr_accessor :hash_type

    # The filter unique identifier.
    # @return [Integer]
    attr_accessor :data_filter_id

    # The system flag.  A value of false denotes a custom, or user
    # defined object.  A value of true denotes a built in object.
    #
    # @return [BOOLEAN]
    attr_accessor :is_system

    # The regular expression for matching.
    # @return [String]
    attr_accessor :match_regular_expression

    # The filter order.
    # @return [Integer]
    attr_accessor :order

    # The filter path.
    # @return [String]
    attr_accessor :path

    # The replacement string.
    # @return [String]
    attr_accessor :replacement_string

    # The source unique identifier.
    # @return [Integer]
    attr_accessor :source_id

    # The filter type.
    # @return [String]
    attr_reader :filter_type

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'description': :'description',
        'display_name': :'displayName',
        'edit_version': :'editVersion',
        'is_enabled': :'isEnabled',
        'field_name': :'fieldName',
        'hash_type': :'hashType',
        'data_filter_id': :'dataFilterId',
        'is_system': :'isSystem',
        'match_regular_expression': :'matchRegularExpression',
        'order': :'order',
        'path': :'path',
        'replacement_string': :'replacementString',
        'source_id': :'sourceId',
        'filter_type': :'filterType'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'description': :'String',
        'display_name': :'String',
        'edit_version': :'Integer',
        'is_enabled': :'BOOLEAN',
        'field_name': :'String',
        'hash_type': :'Integer',
        'data_filter_id': :'Integer',
        'is_system': :'BOOLEAN',
        'match_regular_expression': :'String',
        'order': :'Integer',
        'path': :'String',
        'replacement_string': :'String',
        'source_id': :'Integer',
        'filter_type': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [Integer] :edit_version The value to assign to the {#edit_version} property
    # @option attributes [BOOLEAN] :is_enabled The value to assign to the {#is_enabled} property
    # @option attributes [String] :field_name The value to assign to the {#field_name} property
    # @option attributes [Integer] :hash_type The value to assign to the {#hash_type} property
    # @option attributes [Integer] :data_filter_id The value to assign to the {#data_filter_id} property
    # @option attributes [BOOLEAN] :is_system The value to assign to the {#is_system} property
    # @option attributes [String] :match_regular_expression The value to assign to the {#match_regular_expression} property
    # @option attributes [Integer] :order The value to assign to the {#order} property
    # @option attributes [String] :path The value to assign to the {#path} property
    # @option attributes [String] :replacement_string The value to assign to the {#replacement_string} property
    # @option attributes [Integer] :source_id The value to assign to the {#source_id} property
    # @option attributes [String] :filter_type The value to assign to the {#filter_type} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.description = attributes[:'description'] if attributes[:'description']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.edit_version = attributes[:'editVersion'] if attributes[:'editVersion']

      raise 'You cannot provide both :editVersion and :edit_version' if attributes.key?(:'editVersion') && attributes.key?(:'edit_version')

      self.edit_version = attributes[:'edit_version'] if attributes[:'edit_version']

      self.is_enabled = attributes[:'isEnabled'] unless attributes[:'isEnabled'].nil?

      raise 'You cannot provide both :isEnabled and :is_enabled' if attributes.key?(:'isEnabled') && attributes.key?(:'is_enabled')

      self.is_enabled = attributes[:'is_enabled'] unless attributes[:'is_enabled'].nil?

      self.field_name = attributes[:'fieldName'] if attributes[:'fieldName']

      raise 'You cannot provide both :fieldName and :field_name' if attributes.key?(:'fieldName') && attributes.key?(:'field_name')

      self.field_name = attributes[:'field_name'] if attributes[:'field_name']

      self.hash_type = attributes[:'hashType'] if attributes[:'hashType']

      raise 'You cannot provide both :hashType and :hash_type' if attributes.key?(:'hashType') && attributes.key?(:'hash_type')

      self.hash_type = attributes[:'hash_type'] if attributes[:'hash_type']

      self.data_filter_id = attributes[:'dataFilterId'] if attributes[:'dataFilterId']

      raise 'You cannot provide both :dataFilterId and :data_filter_id' if attributes.key?(:'dataFilterId') && attributes.key?(:'data_filter_id')

      self.data_filter_id = attributes[:'data_filter_id'] if attributes[:'data_filter_id']

      self.is_system = attributes[:'isSystem'] unless attributes[:'isSystem'].nil?

      raise 'You cannot provide both :isSystem and :is_system' if attributes.key?(:'isSystem') && attributes.key?(:'is_system')

      self.is_system = attributes[:'is_system'] unless attributes[:'is_system'].nil?

      self.match_regular_expression = attributes[:'matchRegularExpression'] if attributes[:'matchRegularExpression']

      raise 'You cannot provide both :matchRegularExpression and :match_regular_expression' if attributes.key?(:'matchRegularExpression') && attributes.key?(:'match_regular_expression')

      self.match_regular_expression = attributes[:'match_regular_expression'] if attributes[:'match_regular_expression']

      self.order = attributes[:'order'] if attributes[:'order']

      self.path = attributes[:'path'] if attributes[:'path']

      self.replacement_string = attributes[:'replacementString'] if attributes[:'replacementString']

      raise 'You cannot provide both :replacementString and :replacement_string' if attributes.key?(:'replacementString') && attributes.key?(:'replacement_string')

      self.replacement_string = attributes[:'replacement_string'] if attributes[:'replacement_string']

      self.source_id = attributes[:'sourceId'] if attributes[:'sourceId']

      raise 'You cannot provide both :sourceId and :source_id' if attributes.key?(:'sourceId') && attributes.key?(:'source_id')

      self.source_id = attributes[:'source_id'] if attributes[:'source_id']

      self.filter_type = attributes[:'filterType'] if attributes[:'filterType']
      self.filter_type = "MASK" if filter_type.nil? && !attributes.key?(:'filterType') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :filterType and :filter_type' if attributes.key?(:'filterType') && attributes.key?(:'filter_type')

      self.filter_type = attributes[:'filter_type'] if attributes[:'filter_type']
      self.filter_type = "MASK" if filter_type.nil? && !attributes.key?(:'filterType') && !attributes.key?(:'filter_type') # rubocop:disable Style/StringLiterals
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] filter_type Object to be assigned
    def filter_type=(filter_type)
      # rubocop:disable Style/ConditionalAssignment
      if filter_type && !FILTER_TYPE_ENUM.include?(filter_type)
        OCI.logger.debug("Unknown value for 'filter_type' [" + filter_type + "]. Mapping to 'FILTER_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @filter_type = FILTER_TYPE_UNKNOWN_ENUM_VALUE
      else
        @filter_type = filter_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        description == other.description &&
        display_name == other.display_name &&
        edit_version == other.edit_version &&
        is_enabled == other.is_enabled &&
        field_name == other.field_name &&
        hash_type == other.hash_type &&
        data_filter_id == other.data_filter_id &&
        is_system == other.is_system &&
        match_regular_expression == other.match_regular_expression &&
        order == other.order &&
        path == other.path &&
        replacement_string == other.replacement_string &&
        source_id == other.source_id &&
        filter_type == other.filter_type
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
      [description, display_name, edit_version, is_enabled, field_name, hash_type, data_filter_id, is_system, match_regular_expression, order, path, replacement_string, source_id, filter_type].hash
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
