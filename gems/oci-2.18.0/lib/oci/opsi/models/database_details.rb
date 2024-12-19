# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Partial information about the database which includes id, name, type.
  class Opsi::Models::DatabaseDetails
    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the database insight resource.
    # @return [String]
    attr_accessor :id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the database.
    # @return [String]
    attr_accessor :database_id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The database name. The database name is unique within the tenancy.
    # @return [String]
    attr_accessor :database_name

    # The user-friendly name for the database. The name does not have to be unique.
    # @return [String]
    attr_accessor :database_display_name

    # **[Required]** Operations Insights internal representation of the database type.
    # @return [String]
    attr_accessor :database_type

    # The version of the database.
    # @return [String]
    attr_accessor :database_version

    # Array of hostname and instance name.
    # @return [Array<OCI::Opsi::Models::HostInstanceMap>]
    attr_accessor :instances

    # Name of the CDB.Only applies to PDB.
    # @return [String]
    attr_accessor :cdb_name

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'database_id': :'databaseId',
        'compartment_id': :'compartmentId',
        'database_name': :'databaseName',
        'database_display_name': :'databaseDisplayName',
        'database_type': :'databaseType',
        'database_version': :'databaseVersion',
        'instances': :'instances',
        'cdb_name': :'cdbName'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'database_id': :'String',
        'compartment_id': :'String',
        'database_name': :'String',
        'database_display_name': :'String',
        'database_type': :'String',
        'database_version': :'String',
        'instances': :'Array<OCI::Opsi::Models::HostInstanceMap>',
        'cdb_name': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :database_id The value to assign to the {#database_id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :database_name The value to assign to the {#database_name} property
    # @option attributes [String] :database_display_name The value to assign to the {#database_display_name} property
    # @option attributes [String] :database_type The value to assign to the {#database_type} property
    # @option attributes [String] :database_version The value to assign to the {#database_version} property
    # @option attributes [Array<OCI::Opsi::Models::HostInstanceMap>] :instances The value to assign to the {#instances} property
    # @option attributes [String] :cdb_name The value to assign to the {#cdb_name} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.database_id = attributes[:'databaseId'] if attributes[:'databaseId']

      raise 'You cannot provide both :databaseId and :database_id' if attributes.key?(:'databaseId') && attributes.key?(:'database_id')

      self.database_id = attributes[:'database_id'] if attributes[:'database_id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.database_name = attributes[:'databaseName'] if attributes[:'databaseName']

      raise 'You cannot provide both :databaseName and :database_name' if attributes.key?(:'databaseName') && attributes.key?(:'database_name')

      self.database_name = attributes[:'database_name'] if attributes[:'database_name']

      self.database_display_name = attributes[:'databaseDisplayName'] if attributes[:'databaseDisplayName']

      raise 'You cannot provide both :databaseDisplayName and :database_display_name' if attributes.key?(:'databaseDisplayName') && attributes.key?(:'database_display_name')

      self.database_display_name = attributes[:'database_display_name'] if attributes[:'database_display_name']

      self.database_type = attributes[:'databaseType'] if attributes[:'databaseType']

      raise 'You cannot provide both :databaseType and :database_type' if attributes.key?(:'databaseType') && attributes.key?(:'database_type')

      self.database_type = attributes[:'database_type'] if attributes[:'database_type']

      self.database_version = attributes[:'databaseVersion'] if attributes[:'databaseVersion']

      raise 'You cannot provide both :databaseVersion and :database_version' if attributes.key?(:'databaseVersion') && attributes.key?(:'database_version')

      self.database_version = attributes[:'database_version'] if attributes[:'database_version']

      self.instances = attributes[:'instances'] if attributes[:'instances']

      self.cdb_name = attributes[:'cdbName'] if attributes[:'cdbName']

      raise 'You cannot provide both :cdbName and :cdb_name' if attributes.key?(:'cdbName') && attributes.key?(:'cdb_name')

      self.cdb_name = attributes[:'cdb_name'] if attributes[:'cdb_name']
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
        database_id == other.database_id &&
        compartment_id == other.compartment_id &&
        database_name == other.database_name &&
        database_display_name == other.database_display_name &&
        database_type == other.database_type &&
        database_version == other.database_version &&
        instances == other.instances &&
        cdb_name == other.cdb_name
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
      [id, database_id, compartment_id, database_name, database_display_name, database_type, database_version, instances, cdb_name].hash
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
