# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # LogAnalyticsMetaFunction
  class LogAnalytics::Models::LogAnalyticsMetaFunction
    # An array of meta function arguments.
    # @return [Array<OCI::LogAnalytics::Models::LogAnalyticsMetaFunctionArgument>]
    attr_accessor :meta_function_argument

    # The component.
    # @return [String]
    attr_accessor :component

    # The description.
    # @return [String]
    attr_accessor :description

    # The edit version.
    # @return [Integer]
    attr_accessor :edit_version

    # The meta function unique identifier.
    # @return [Integer]
    attr_accessor :meta_function_id

    # The java class name.
    # @return [String]
    attr_accessor :java_class_name

    # The meta function name.
    # @return [String]
    attr_accessor :name

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'meta_function_argument': :'metaFunctionArgument',
        'component': :'component',
        'description': :'description',
        'edit_version': :'editVersion',
        'meta_function_id': :'metaFunctionId',
        'java_class_name': :'javaClassName',
        'name': :'name'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'meta_function_argument': :'Array<OCI::LogAnalytics::Models::LogAnalyticsMetaFunctionArgument>',
        'component': :'String',
        'description': :'String',
        'edit_version': :'Integer',
        'meta_function_id': :'Integer',
        'java_class_name': :'String',
        'name': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Array<OCI::LogAnalytics::Models::LogAnalyticsMetaFunctionArgument>] :meta_function_argument The value to assign to the {#meta_function_argument} property
    # @option attributes [String] :component The value to assign to the {#component} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [Integer] :edit_version The value to assign to the {#edit_version} property
    # @option attributes [Integer] :meta_function_id The value to assign to the {#meta_function_id} property
    # @option attributes [String] :java_class_name The value to assign to the {#java_class_name} property
    # @option attributes [String] :name The value to assign to the {#name} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.meta_function_argument = attributes[:'metaFunctionArgument'] if attributes[:'metaFunctionArgument']

      raise 'You cannot provide both :metaFunctionArgument and :meta_function_argument' if attributes.key?(:'metaFunctionArgument') && attributes.key?(:'meta_function_argument')

      self.meta_function_argument = attributes[:'meta_function_argument'] if attributes[:'meta_function_argument']

      self.component = attributes[:'component'] if attributes[:'component']

      self.description = attributes[:'description'] if attributes[:'description']

      self.edit_version = attributes[:'editVersion'] if attributes[:'editVersion']

      raise 'You cannot provide both :editVersion and :edit_version' if attributes.key?(:'editVersion') && attributes.key?(:'edit_version')

      self.edit_version = attributes[:'edit_version'] if attributes[:'edit_version']

      self.meta_function_id = attributes[:'metaFunctionId'] if attributes[:'metaFunctionId']

      raise 'You cannot provide both :metaFunctionId and :meta_function_id' if attributes.key?(:'metaFunctionId') && attributes.key?(:'meta_function_id')

      self.meta_function_id = attributes[:'meta_function_id'] if attributes[:'meta_function_id']

      self.java_class_name = attributes[:'javaClassName'] if attributes[:'javaClassName']

      raise 'You cannot provide both :javaClassName and :java_class_name' if attributes.key?(:'javaClassName') && attributes.key?(:'java_class_name')

      self.java_class_name = attributes[:'java_class_name'] if attributes[:'java_class_name']

      self.name = attributes[:'name'] if attributes[:'name']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        meta_function_argument == other.meta_function_argument &&
        component == other.component &&
        description == other.description &&
        edit_version == other.edit_version &&
        meta_function_id == other.meta_function_id &&
        java_class_name == other.java_class_name &&
        name == other.name
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
      [meta_function_argument, component, description, edit_version, meta_function_id, java_class_name, name].hash
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
