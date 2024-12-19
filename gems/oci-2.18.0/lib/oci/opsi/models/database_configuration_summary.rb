# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Summary of a database configuration for a resource.
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class Opsi::Models::DatabaseConfigurationSummary
    ENTITY_SOURCE_ENUM = [
      ENTITY_SOURCE_AUTONOMOUS_DATABASE = 'AUTONOMOUS_DATABASE'.freeze,
      ENTITY_SOURCE_EM_MANAGED_EXTERNAL_DATABASE = 'EM_MANAGED_EXTERNAL_DATABASE'.freeze,
      ENTITY_SOURCE_MACS_MANAGED_EXTERNAL_DATABASE = 'MACS_MANAGED_EXTERNAL_DATABASE'.freeze,
      ENTITY_SOURCE_PE_COMANAGED_DATABASE = 'PE_COMANAGED_DATABASE'.freeze,
      ENTITY_SOURCE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the database insight resource.
    # @return [String]
    attr_accessor :database_insight_id

    # **[Required]** Source of the database entity.
    # @return [String]
    attr_reader :entity_source

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The database name. The database name is unique within the tenancy.
    # @return [String]
    attr_accessor :database_name

    # **[Required]** The user-friendly name for the database. The name does not have to be unique.
    # @return [String]
    attr_accessor :database_display_name

    # **[Required]** Operations Insights internal representation of the database type.
    # @return [String]
    attr_accessor :database_type

    # **[Required]** The version of the database.
    # @return [String]
    attr_accessor :database_version

    # **[Required]** Name of the CDB.Only applies to PDB.
    # @return [String]
    attr_accessor :cdb_name

    # **[Required]** Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # **[Required]** Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Processor count. This is the OCPU count for Autonomous Database and CPU core count for other database types.
    # @return [Integer]
    attr_accessor :processor_count

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'database_insight_id': :'databaseInsightId',
        'entity_source': :'entitySource',
        'compartment_id': :'compartmentId',
        'database_name': :'databaseName',
        'database_display_name': :'databaseDisplayName',
        'database_type': :'databaseType',
        'database_version': :'databaseVersion',
        'cdb_name': :'cdbName',
        'defined_tags': :'definedTags',
        'freeform_tags': :'freeformTags',
        'processor_count': :'processorCount'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'database_insight_id': :'String',
        'entity_source': :'String',
        'compartment_id': :'String',
        'database_name': :'String',
        'database_display_name': :'String',
        'database_type': :'String',
        'database_version': :'String',
        'cdb_name': :'String',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'freeform_tags': :'Hash<String, String>',
        'processor_count': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'entitySource'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::Opsi::Models::EmManagedExternalDatabaseConfigurationSummary' if type == 'EM_MANAGED_EXTERNAL_DATABASE'
      return 'OCI::Opsi::Models::AutonomousDatabaseConfigurationSummary' if type == 'AUTONOMOUS_DATABASE'
      return 'OCI::Opsi::Models::MacsManagedExternalDatabaseConfigurationSummary' if type == 'MACS_MANAGED_EXTERNAL_DATABASE'
      return 'OCI::Opsi::Models::PeComanagedManagedExternalDatabaseConfigurationSummary' if type == 'PE_COMANAGED_DATABASE'

      # TODO: Log a warning when the subtype is not found.
      'OCI::Opsi::Models::DatabaseConfigurationSummary'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :database_insight_id The value to assign to the {#database_insight_id} property
    # @option attributes [String] :entity_source The value to assign to the {#entity_source} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :database_name The value to assign to the {#database_name} property
    # @option attributes [String] :database_display_name The value to assign to the {#database_display_name} property
    # @option attributes [String] :database_type The value to assign to the {#database_type} property
    # @option attributes [String] :database_version The value to assign to the {#database_version} property
    # @option attributes [String] :cdb_name The value to assign to the {#cdb_name} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Integer] :processor_count The value to assign to the {#processor_count} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.database_insight_id = attributes[:'databaseInsightId'] if attributes[:'databaseInsightId']

      raise 'You cannot provide both :databaseInsightId and :database_insight_id' if attributes.key?(:'databaseInsightId') && attributes.key?(:'database_insight_id')

      self.database_insight_id = attributes[:'database_insight_id'] if attributes[:'database_insight_id']

      self.entity_source = attributes[:'entitySource'] if attributes[:'entitySource']

      raise 'You cannot provide both :entitySource and :entity_source' if attributes.key?(:'entitySource') && attributes.key?(:'entity_source')

      self.entity_source = attributes[:'entity_source'] if attributes[:'entity_source']

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

      self.cdb_name = attributes[:'cdbName'] if attributes[:'cdbName']

      raise 'You cannot provide both :cdbName and :cdb_name' if attributes.key?(:'cdbName') && attributes.key?(:'cdb_name')

      self.cdb_name = attributes[:'cdb_name'] if attributes[:'cdb_name']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.processor_count = attributes[:'processorCount'] if attributes[:'processorCount']

      raise 'You cannot provide both :processorCount and :processor_count' if attributes.key?(:'processorCount') && attributes.key?(:'processor_count')

      self.processor_count = attributes[:'processor_count'] if attributes[:'processor_count']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] entity_source Object to be assigned
    def entity_source=(entity_source)
      # rubocop:disable Style/ConditionalAssignment
      if entity_source && !ENTITY_SOURCE_ENUM.include?(entity_source)
        OCI.logger.debug("Unknown value for 'entity_source' [" + entity_source + "]. Mapping to 'ENTITY_SOURCE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @entity_source = ENTITY_SOURCE_UNKNOWN_ENUM_VALUE
      else
        @entity_source = entity_source
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        database_insight_id == other.database_insight_id &&
        entity_source == other.entity_source &&
        compartment_id == other.compartment_id &&
        database_name == other.database_name &&
        database_display_name == other.database_display_name &&
        database_type == other.database_type &&
        database_version == other.database_version &&
        cdb_name == other.cdb_name &&
        defined_tags == other.defined_tags &&
        freeform_tags == other.freeform_tags &&
        processor_count == other.processor_count
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
      [database_insight_id, entity_source, compartment_id, database_name, database_display_name, database_type, database_version, cdb_name, defined_tags, freeform_tags, processor_count].hash
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
