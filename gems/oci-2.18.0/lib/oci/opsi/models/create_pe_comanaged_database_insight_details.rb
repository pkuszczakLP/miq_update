# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'create_database_insight_details'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The information about database to be analyzed. Either an opsiPrivateEndpointId or dbmPrivateEndpointId must be specified. If the dbmPrivateEndpointId is specified, a new Operations Insights private endpoint will be created.
  class Opsi::Models::CreatePeComanagedDatabaseInsightDetails < Opsi::Models::CreateDatabaseInsightDetails
    DEPLOYMENT_TYPE_ENUM = [
      DEPLOYMENT_TYPE_VIRTUAL_MACHINE = 'VIRTUAL_MACHINE'.freeze,
      DEPLOYMENT_TYPE_BARE_METAL = 'BARE_METAL'.freeze,
      DEPLOYMENT_TYPE_EXACS = 'EXACS'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the database.
    # @return [String]
    attr_accessor :database_id

    # **[Required]** OCI database resource type
    # @return [String]
    attr_accessor :database_resource_type

    # The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the OPSI private endpoint
    # @return [String]
    attr_accessor :opsi_private_endpoint_id

    # The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the Database Management private endpoint
    # @return [String]
    attr_accessor :dbm_private_endpoint_id

    # **[Required]** Database service name used for connection requests.
    # @return [String]
    attr_accessor :service_name

    # This attribute is required.
    # @return [OCI::Opsi::Models::CredentialDetails]
    attr_accessor :credential_details

    # **[Required]** Database Deployment Type
    # @return [String]
    attr_reader :deployment_type

    # System tags for this resource. Each key is predefined and scoped to a namespace.
    # Example: `{\"orcl-cloud\": {\"free-tier-retained\": \"true\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :system_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'entity_source': :'entitySource',
        'compartment_id': :'compartmentId',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'database_id': :'databaseId',
        'database_resource_type': :'databaseResourceType',
        'opsi_private_endpoint_id': :'opsiPrivateEndpointId',
        'dbm_private_endpoint_id': :'dbmPrivateEndpointId',
        'service_name': :'serviceName',
        'credential_details': :'credentialDetails',
        'deployment_type': :'deploymentType',
        'system_tags': :'systemTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'entity_source': :'String',
        'compartment_id': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'database_id': :'String',
        'database_resource_type': :'String',
        'opsi_private_endpoint_id': :'String',
        'dbm_private_endpoint_id': :'String',
        'service_name': :'String',
        'credential_details': :'OCI::Opsi::Models::CredentialDetails',
        'deployment_type': :'String',
        'system_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :compartment_id The value to assign to the {OCI::Opsi::Models::CreateDatabaseInsightDetails#compartment_id #compartment_id} proprety
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {OCI::Opsi::Models::CreateDatabaseInsightDetails#freeform_tags #freeform_tags} proprety
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {OCI::Opsi::Models::CreateDatabaseInsightDetails#defined_tags #defined_tags} proprety
    # @option attributes [String] :database_id The value to assign to the {#database_id} property
    # @option attributes [String] :database_resource_type The value to assign to the {#database_resource_type} property
    # @option attributes [String] :opsi_private_endpoint_id The value to assign to the {#opsi_private_endpoint_id} property
    # @option attributes [String] :dbm_private_endpoint_id The value to assign to the {#dbm_private_endpoint_id} property
    # @option attributes [String] :service_name The value to assign to the {#service_name} property
    # @option attributes [OCI::Opsi::Models::CredentialDetails] :credential_details The value to assign to the {#credential_details} property
    # @option attributes [String] :deployment_type The value to assign to the {#deployment_type} property
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {#system_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['entitySource'] = 'PE_COMANAGED_DATABASE'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.database_id = attributes[:'databaseId'] if attributes[:'databaseId']

      raise 'You cannot provide both :databaseId and :database_id' if attributes.key?(:'databaseId') && attributes.key?(:'database_id')

      self.database_id = attributes[:'database_id'] if attributes[:'database_id']

      self.database_resource_type = attributes[:'databaseResourceType'] if attributes[:'databaseResourceType']

      raise 'You cannot provide both :databaseResourceType and :database_resource_type' if attributes.key?(:'databaseResourceType') && attributes.key?(:'database_resource_type')

      self.database_resource_type = attributes[:'database_resource_type'] if attributes[:'database_resource_type']

      self.opsi_private_endpoint_id = attributes[:'opsiPrivateEndpointId'] if attributes[:'opsiPrivateEndpointId']

      raise 'You cannot provide both :opsiPrivateEndpointId and :opsi_private_endpoint_id' if attributes.key?(:'opsiPrivateEndpointId') && attributes.key?(:'opsi_private_endpoint_id')

      self.opsi_private_endpoint_id = attributes[:'opsi_private_endpoint_id'] if attributes[:'opsi_private_endpoint_id']

      self.dbm_private_endpoint_id = attributes[:'dbmPrivateEndpointId'] if attributes[:'dbmPrivateEndpointId']

      raise 'You cannot provide both :dbmPrivateEndpointId and :dbm_private_endpoint_id' if attributes.key?(:'dbmPrivateEndpointId') && attributes.key?(:'dbm_private_endpoint_id')

      self.dbm_private_endpoint_id = attributes[:'dbm_private_endpoint_id'] if attributes[:'dbm_private_endpoint_id']

      self.service_name = attributes[:'serviceName'] if attributes[:'serviceName']

      raise 'You cannot provide both :serviceName and :service_name' if attributes.key?(:'serviceName') && attributes.key?(:'service_name')

      self.service_name = attributes[:'service_name'] if attributes[:'service_name']

      self.credential_details = attributes[:'credentialDetails'] if attributes[:'credentialDetails']

      raise 'You cannot provide both :credentialDetails and :credential_details' if attributes.key?(:'credentialDetails') && attributes.key?(:'credential_details')

      self.credential_details = attributes[:'credential_details'] if attributes[:'credential_details']

      self.deployment_type = attributes[:'deploymentType'] if attributes[:'deploymentType']

      raise 'You cannot provide both :deploymentType and :deployment_type' if attributes.key?(:'deploymentType') && attributes.key?(:'deployment_type')

      self.deployment_type = attributes[:'deployment_type'] if attributes[:'deployment_type']

      self.system_tags = attributes[:'systemTags'] if attributes[:'systemTags']

      raise 'You cannot provide both :systemTags and :system_tags' if attributes.key?(:'systemTags') && attributes.key?(:'system_tags')

      self.system_tags = attributes[:'system_tags'] if attributes[:'system_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] deployment_type Object to be assigned
    def deployment_type=(deployment_type)
      raise "Invalid value for 'deployment_type': this must be one of the values in DEPLOYMENT_TYPE_ENUM." if deployment_type && !DEPLOYMENT_TYPE_ENUM.include?(deployment_type)

      @deployment_type = deployment_type
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        entity_source == other.entity_source &&
        compartment_id == other.compartment_id &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        database_id == other.database_id &&
        database_resource_type == other.database_resource_type &&
        opsi_private_endpoint_id == other.opsi_private_endpoint_id &&
        dbm_private_endpoint_id == other.dbm_private_endpoint_id &&
        service_name == other.service_name &&
        credential_details == other.credential_details &&
        deployment_type == other.deployment_type &&
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
      [entity_source, compartment_id, freeform_tags, defined_tags, database_id, database_resource_type, opsi_private_endpoint_id, dbm_private_endpoint_id, service_name, credential_details, deployment_type, system_tags].hash
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
