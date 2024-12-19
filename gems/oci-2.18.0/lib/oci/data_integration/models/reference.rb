# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Reference contains application configuration information.
  class DataIntegration::Models::Reference
    TYPE_ENUM = [
      TYPE_ORACLE_DATA_ASSET = 'ORACLE_DATA_ASSET'.freeze,
      TYPE_ORACLE_OBJECT_STORAGE_DATA_ASSET = 'ORACLE_OBJECT_STORAGE_DATA_ASSET'.freeze,
      TYPE_ORACLE_ATP_DATA_ASSET = 'ORACLE_ATP_DATA_ASSET'.freeze,
      TYPE_ORACLE_ADWC_DATA_ASSET = 'ORACLE_ADWC_DATA_ASSET'.freeze,
      TYPE_MYSQL_DATA_ASSET = 'MYSQL_DATA_ASSET'.freeze,
      TYPE_GENERIC_JDBC_DATA_ASSET = 'GENERIC_JDBC_DATA_ASSET'.freeze,
      TYPE_FUSION_APP_DATA_ASSET = 'FUSION_APP_DATA_ASSET'.freeze,
      TYPE_AMAZON_S3_DATA_ASSET = 'AMAZON_S3_DATA_ASSET'.freeze,
      TYPE_SCHEMA = 'SCHEMA'.freeze,
      TYPE_INTEGRATION_TASK = 'INTEGRATION_TASK'.freeze,
      TYPE_DATA_LOADER_TASK = 'DATA_LOADER_TASK'.freeze,
      TYPE_SQL_TASK = 'SQL_TASK'.freeze,
      TYPE_OCI_DATAFLOW_TASK = 'OCI_DATAFLOW_TASK'.freeze,
      TYPE_PIPELINE_TASK = 'PIPELINE_TASK'.freeze,
      TYPE_REST_TASK = 'REST_TASK'.freeze,
      TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The reference's key, key of the object that is being used by a published object or its dependents.
    # @return [String]
    attr_accessor :key

    # The name of reference object.
    # @return [String]
    attr_accessor :name

    # The identifier of reference object.
    # @return [String]
    attr_accessor :identifier

    # The identifier path of reference object.
    # @return [String]
    attr_accessor :identifier_path

    # The description of reference object.
    # @return [String]
    attr_accessor :description

    # The type of reference object.
    # @return [String]
    attr_reader :type

    # The new reference object to use instead of the original reference. For example, this can be a data asset reference.
    # @return [Object]
    attr_accessor :target_object

    # The application key of the reference object.
    # @return [String]
    attr_accessor :application_key

    # List of published objects where this is used.
    # @return [Array<OCI::DataIntegration::Models::ReferenceUsedBy>]
    attr_accessor :used_by

    # List of references that are dependent on this reference.
    # @return [Array<OCI::DataIntegration::Models::ChildReference>]
    attr_accessor :child_references

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'key': :'key',
        'name': :'name',
        'identifier': :'identifier',
        'identifier_path': :'identifierPath',
        'description': :'description',
        'type': :'type',
        'target_object': :'targetObject',
        'application_key': :'applicationKey',
        'used_by': :'usedBy',
        'child_references': :'childReferences'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'key': :'String',
        'name': :'String',
        'identifier': :'String',
        'identifier_path': :'String',
        'description': :'String',
        'type': :'String',
        'target_object': :'Object',
        'application_key': :'String',
        'used_by': :'Array<OCI::DataIntegration::Models::ReferenceUsedBy>',
        'child_references': :'Array<OCI::DataIntegration::Models::ChildReference>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :key The value to assign to the {#key} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :identifier The value to assign to the {#identifier} property
    # @option attributes [String] :identifier_path The value to assign to the {#identifier_path} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :type The value to assign to the {#type} property
    # @option attributes [Object] :target_object The value to assign to the {#target_object} property
    # @option attributes [String] :application_key The value to assign to the {#application_key} property
    # @option attributes [Array<OCI::DataIntegration::Models::ReferenceUsedBy>] :used_by The value to assign to the {#used_by} property
    # @option attributes [Array<OCI::DataIntegration::Models::ChildReference>] :child_references The value to assign to the {#child_references} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.key = attributes[:'key'] if attributes[:'key']

      self.name = attributes[:'name'] if attributes[:'name']

      self.identifier = attributes[:'identifier'] if attributes[:'identifier']

      self.identifier_path = attributes[:'identifierPath'] if attributes[:'identifierPath']

      raise 'You cannot provide both :identifierPath and :identifier_path' if attributes.key?(:'identifierPath') && attributes.key?(:'identifier_path')

      self.identifier_path = attributes[:'identifier_path'] if attributes[:'identifier_path']

      self.description = attributes[:'description'] if attributes[:'description']

      self.type = attributes[:'type'] if attributes[:'type']

      self.target_object = attributes[:'targetObject'] if attributes[:'targetObject']

      raise 'You cannot provide both :targetObject and :target_object' if attributes.key?(:'targetObject') && attributes.key?(:'target_object')

      self.target_object = attributes[:'target_object'] if attributes[:'target_object']

      self.application_key = attributes[:'applicationKey'] if attributes[:'applicationKey']

      raise 'You cannot provide both :applicationKey and :application_key' if attributes.key?(:'applicationKey') && attributes.key?(:'application_key')

      self.application_key = attributes[:'application_key'] if attributes[:'application_key']

      self.used_by = attributes[:'usedBy'] if attributes[:'usedBy']

      raise 'You cannot provide both :usedBy and :used_by' if attributes.key?(:'usedBy') && attributes.key?(:'used_by')

      self.used_by = attributes[:'used_by'] if attributes[:'used_by']

      self.child_references = attributes[:'childReferences'] if attributes[:'childReferences']

      raise 'You cannot provide both :childReferences and :child_references' if attributes.key?(:'childReferences') && attributes.key?(:'child_references')

      self.child_references = attributes[:'child_references'] if attributes[:'child_references']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] type Object to be assigned
    def type=(type)
      # rubocop:disable Style/ConditionalAssignment
      if type && !TYPE_ENUM.include?(type)
        OCI.logger.debug("Unknown value for 'type' [" + type + "]. Mapping to 'TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @type = TYPE_UNKNOWN_ENUM_VALUE
      else
        @type = type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        key == other.key &&
        name == other.name &&
        identifier == other.identifier &&
        identifier_path == other.identifier_path &&
        description == other.description &&
        type == other.type &&
        target_object == other.target_object &&
        application_key == other.application_key &&
        used_by == other.used_by &&
        child_references == other.child_references
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
      [key, name, identifier, identifier_path, description, type, target_object, application_key, used_by, child_references].hash
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