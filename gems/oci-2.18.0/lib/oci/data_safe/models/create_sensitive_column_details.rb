# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details to create a new sensitive column in a sensitive data model.
  class DataSafe::Models::CreateSensitiveColumnDetails
    OBJECT_TYPE_ENUM = [
      OBJECT_TYPE_TABLE = 'TABLE'.freeze,
      OBJECT_TYPE_EDITIONING_VIEW = 'EDITIONING_VIEW'.freeze
    ].freeze

    STATUS_ENUM = [
      STATUS_VALID = 'VALID'.freeze,
      STATUS_INVALID = 'INVALID'.freeze
    ].freeze

    RELATION_TYPE_ENUM = [
      RELATION_TYPE_NONE = 'NONE'.freeze,
      RELATION_TYPE_APP_DEFINED = 'APP_DEFINED'.freeze,
      RELATION_TYPE_DB_DEFINED = 'DB_DEFINED'.freeze
    ].freeze

    # The name of the application associated with the sensitive column. It's useful when the application name is
    # different from the schema name. Otherwise, it can be ignored. If this attribute is not provided, it's automatically
    # populated with the value provided for the schemaName attribute.
    #
    # @return [String]
    attr_accessor :app_name

    # **[Required]** The database schema that contains the sensitive column.
    # @return [String]
    attr_accessor :schema_name

    # **[Required]** The database object that contains the sensitive column.
    # @return [String]
    attr_accessor :object_name

    # **[Required]** The name of the sensitive column.
    # @return [String]
    attr_accessor :column_name

    # The type of the database object that contains the sensitive column.
    # @return [String]
    attr_reader :object_type

    # The data type of the sensitive column.
    # @return [String]
    attr_accessor :data_type

    # The status of the sensitive column. VALID means the column is considered sensitive. INVALID means the column
    # is not considered sensitive. Tracking invalid columns in a sensitive data model helps ensure that an incremental
    # data discovery job does not identify these columns as sensitive.
    #
    # @return [String]
    attr_reader :status

    # The OCID of the sensitive type to be associated with the sensitive column.
    # @return [String]
    attr_accessor :sensitive_type_id

    # Unique keys identifying the columns that are parents of the sensitive column. At present, it accepts only one
    # parent column key. This attribute can be used to establish relationship between columns in a sensitive data model.
    # Note that the parent column must be added to the sensitive data model before its key can be specified here.
    # If this attribute is provided, the appDefinedChildColumnKeys or dbDefinedChildColumnKeys attribute of the parent
    # column is automatically updated to reflect the relationship.
    #
    # @return [Array<String>]
    attr_accessor :parent_column_keys

    # The type of referential relationship the sensitive column has with its parent. NONE indicates that the sensitive
    # column does not have a parent. DB_DEFINED indicates that the relationship is defined in the database dictionary.
    # APP_DEFINED indicates that the relationship is defined at the application level and not in the database dictionary.
    #
    # @return [String]
    attr_reader :relation_type

    # Unique keys identifying the columns that are application-level (non-dictionary) children of the sensitive column.
    # This attribute can be used to establish relationship between columns in a sensitive data model. Note that the
    # child columns must be added to the sensitive data model before their keys can be specified here. If this attribute
    # is provided, the parentColumnKeys and relationType attributes of the child columns are automatically updated to reflect the relationship.
    #
    # @return [Array<String>]
    attr_accessor :app_defined_child_column_keys

    # Unique keys identifying the columns that are database-level (dictionary-defined) children of the sensitive column.
    # This attribute can be used to establish relationship between columns in a sensitive data model. Note that the
    # child columns must be added to the sensitive data model before their keys can be specified here. If this attribute
    # is provided, the parentColumnKeys and relationType attributes of the child columns are automatically updated to reflect the relationship.
    #
    # @return [Array<String>]
    attr_accessor :db_defined_child_column_keys

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'app_name': :'appName',
        'schema_name': :'schemaName',
        'object_name': :'objectName',
        'column_name': :'columnName',
        'object_type': :'objectType',
        'data_type': :'dataType',
        'status': :'status',
        'sensitive_type_id': :'sensitiveTypeId',
        'parent_column_keys': :'parentColumnKeys',
        'relation_type': :'relationType',
        'app_defined_child_column_keys': :'appDefinedChildColumnKeys',
        'db_defined_child_column_keys': :'dbDefinedChildColumnKeys'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'app_name': :'String',
        'schema_name': :'String',
        'object_name': :'String',
        'column_name': :'String',
        'object_type': :'String',
        'data_type': :'String',
        'status': :'String',
        'sensitive_type_id': :'String',
        'parent_column_keys': :'Array<String>',
        'relation_type': :'String',
        'app_defined_child_column_keys': :'Array<String>',
        'db_defined_child_column_keys': :'Array<String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :app_name The value to assign to the {#app_name} property
    # @option attributes [String] :schema_name The value to assign to the {#schema_name} property
    # @option attributes [String] :object_name The value to assign to the {#object_name} property
    # @option attributes [String] :column_name The value to assign to the {#column_name} property
    # @option attributes [String] :object_type The value to assign to the {#object_type} property
    # @option attributes [String] :data_type The value to assign to the {#data_type} property
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [String] :sensitive_type_id The value to assign to the {#sensitive_type_id} property
    # @option attributes [Array<String>] :parent_column_keys The value to assign to the {#parent_column_keys} property
    # @option attributes [String] :relation_type The value to assign to the {#relation_type} property
    # @option attributes [Array<String>] :app_defined_child_column_keys The value to assign to the {#app_defined_child_column_keys} property
    # @option attributes [Array<String>] :db_defined_child_column_keys The value to assign to the {#db_defined_child_column_keys} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.app_name = attributes[:'appName'] if attributes[:'appName']

      raise 'You cannot provide both :appName and :app_name' if attributes.key?(:'appName') && attributes.key?(:'app_name')

      self.app_name = attributes[:'app_name'] if attributes[:'app_name']

      self.schema_name = attributes[:'schemaName'] if attributes[:'schemaName']

      raise 'You cannot provide both :schemaName and :schema_name' if attributes.key?(:'schemaName') && attributes.key?(:'schema_name')

      self.schema_name = attributes[:'schema_name'] if attributes[:'schema_name']

      self.object_name = attributes[:'objectName'] if attributes[:'objectName']

      raise 'You cannot provide both :objectName and :object_name' if attributes.key?(:'objectName') && attributes.key?(:'object_name')

      self.object_name = attributes[:'object_name'] if attributes[:'object_name']

      self.column_name = attributes[:'columnName'] if attributes[:'columnName']

      raise 'You cannot provide both :columnName and :column_name' if attributes.key?(:'columnName') && attributes.key?(:'column_name')

      self.column_name = attributes[:'column_name'] if attributes[:'column_name']

      self.object_type = attributes[:'objectType'] if attributes[:'objectType']
      self.object_type = "TABLE" if object_type.nil? && !attributes.key?(:'objectType') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :objectType and :object_type' if attributes.key?(:'objectType') && attributes.key?(:'object_type')

      self.object_type = attributes[:'object_type'] if attributes[:'object_type']
      self.object_type = "TABLE" if object_type.nil? && !attributes.key?(:'objectType') && !attributes.key?(:'object_type') # rubocop:disable Style/StringLiterals

      self.data_type = attributes[:'dataType'] if attributes[:'dataType']

      raise 'You cannot provide both :dataType and :data_type' if attributes.key?(:'dataType') && attributes.key?(:'data_type')

      self.data_type = attributes[:'data_type'] if attributes[:'data_type']

      self.status = attributes[:'status'] if attributes[:'status']
      self.status = "VALID" if status.nil? && !attributes.key?(:'status') # rubocop:disable Style/StringLiterals

      self.sensitive_type_id = attributes[:'sensitiveTypeId'] if attributes[:'sensitiveTypeId']

      raise 'You cannot provide both :sensitiveTypeId and :sensitive_type_id' if attributes.key?(:'sensitiveTypeId') && attributes.key?(:'sensitive_type_id')

      self.sensitive_type_id = attributes[:'sensitive_type_id'] if attributes[:'sensitive_type_id']

      self.parent_column_keys = attributes[:'parentColumnKeys'] if attributes[:'parentColumnKeys']

      raise 'You cannot provide both :parentColumnKeys and :parent_column_keys' if attributes.key?(:'parentColumnKeys') && attributes.key?(:'parent_column_keys')

      self.parent_column_keys = attributes[:'parent_column_keys'] if attributes[:'parent_column_keys']

      self.relation_type = attributes[:'relationType'] if attributes[:'relationType']
      self.relation_type = "NONE" if relation_type.nil? && !attributes.key?(:'relationType') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :relationType and :relation_type' if attributes.key?(:'relationType') && attributes.key?(:'relation_type')

      self.relation_type = attributes[:'relation_type'] if attributes[:'relation_type']
      self.relation_type = "NONE" if relation_type.nil? && !attributes.key?(:'relationType') && !attributes.key?(:'relation_type') # rubocop:disable Style/StringLiterals

      self.app_defined_child_column_keys = attributes[:'appDefinedChildColumnKeys'] if attributes[:'appDefinedChildColumnKeys']

      raise 'You cannot provide both :appDefinedChildColumnKeys and :app_defined_child_column_keys' if attributes.key?(:'appDefinedChildColumnKeys') && attributes.key?(:'app_defined_child_column_keys')

      self.app_defined_child_column_keys = attributes[:'app_defined_child_column_keys'] if attributes[:'app_defined_child_column_keys']

      self.db_defined_child_column_keys = attributes[:'dbDefinedChildColumnKeys'] if attributes[:'dbDefinedChildColumnKeys']

      raise 'You cannot provide both :dbDefinedChildColumnKeys and :db_defined_child_column_keys' if attributes.key?(:'dbDefinedChildColumnKeys') && attributes.key?(:'db_defined_child_column_keys')

      self.db_defined_child_column_keys = attributes[:'db_defined_child_column_keys'] if attributes[:'db_defined_child_column_keys']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] object_type Object to be assigned
    def object_type=(object_type)
      raise "Invalid value for 'object_type': this must be one of the values in OBJECT_TYPE_ENUM." if object_type && !OBJECT_TYPE_ENUM.include?(object_type)

      @object_type = object_type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] status Object to be assigned
    def status=(status)
      raise "Invalid value for 'status': this must be one of the values in STATUS_ENUM." if status && !STATUS_ENUM.include?(status)

      @status = status
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] relation_type Object to be assigned
    def relation_type=(relation_type)
      raise "Invalid value for 'relation_type': this must be one of the values in RELATION_TYPE_ENUM." if relation_type && !RELATION_TYPE_ENUM.include?(relation_type)

      @relation_type = relation_type
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        app_name == other.app_name &&
        schema_name == other.schema_name &&
        object_name == other.object_name &&
        column_name == other.column_name &&
        object_type == other.object_type &&
        data_type == other.data_type &&
        status == other.status &&
        sensitive_type_id == other.sensitive_type_id &&
        parent_column_keys == other.parent_column_keys &&
        relation_type == other.relation_type &&
        app_defined_child_column_keys == other.app_defined_child_column_keys &&
        db_defined_child_column_keys == other.db_defined_child_column_keys
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
      [app_name, schema_name, object_name, column_name, object_type, data_type, status, sensitive_type_id, parent_column_keys, relation_type, app_defined_child_column_keys, db_defined_child_column_keys].hash
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
