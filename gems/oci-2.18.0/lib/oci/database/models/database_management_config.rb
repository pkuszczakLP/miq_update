# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The configuration of the Database Management service.
  class Database::Models::DatabaseManagementConfig
    DATABASE_MANAGEMENT_STATUS_ENUM = [
      DATABASE_MANAGEMENT_STATUS_ENABLING = 'ENABLING'.freeze,
      DATABASE_MANAGEMENT_STATUS_ENABLED = 'ENABLED'.freeze,
      DATABASE_MANAGEMENT_STATUS_DISABLING = 'DISABLING'.freeze,
      DATABASE_MANAGEMENT_STATUS_NOT_ENABLED = 'NOT_ENABLED'.freeze,
      DATABASE_MANAGEMENT_STATUS_FAILED_ENABLING = 'FAILED_ENABLING'.freeze,
      DATABASE_MANAGEMENT_STATUS_FAILED_DISABLING = 'FAILED_DISABLING'.freeze,
      DATABASE_MANAGEMENT_STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LICENSE_MODEL_ENUM = [
      LICENSE_MODEL_LICENSE_INCLUDED = 'LICENSE_INCLUDED'.freeze,
      LICENSE_MODEL_BRING_YOUR_OWN_LICENSE = 'BRING_YOUR_OWN_LICENSE'.freeze,
      LICENSE_MODEL_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The status of the Database Management service.
    # @return [String]
    attr_reader :database_management_status

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the
    # {#create_external_database_connector_details create_external_database_connector_details}.
    #
    # @return [String]
    attr_accessor :database_management_connection_id

    # The Oracle license model that applies to the external database.
    #
    # @return [String]
    attr_reader :license_model

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'database_management_status': :'databaseManagementStatus',
        'database_management_connection_id': :'databaseManagementConnectionId',
        'license_model': :'licenseModel'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'database_management_status': :'String',
        'database_management_connection_id': :'String',
        'license_model': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :database_management_status The value to assign to the {#database_management_status} property
    # @option attributes [String] :database_management_connection_id The value to assign to the {#database_management_connection_id} property
    # @option attributes [String] :license_model The value to assign to the {#license_model} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.database_management_status = attributes[:'databaseManagementStatus'] if attributes[:'databaseManagementStatus']

      raise 'You cannot provide both :databaseManagementStatus and :database_management_status' if attributes.key?(:'databaseManagementStatus') && attributes.key?(:'database_management_status')

      self.database_management_status = attributes[:'database_management_status'] if attributes[:'database_management_status']

      self.database_management_connection_id = attributes[:'databaseManagementConnectionId'] if attributes[:'databaseManagementConnectionId']

      raise 'You cannot provide both :databaseManagementConnectionId and :database_management_connection_id' if attributes.key?(:'databaseManagementConnectionId') && attributes.key?(:'database_management_connection_id')

      self.database_management_connection_id = attributes[:'database_management_connection_id'] if attributes[:'database_management_connection_id']

      self.license_model = attributes[:'licenseModel'] if attributes[:'licenseModel']

      raise 'You cannot provide both :licenseModel and :license_model' if attributes.key?(:'licenseModel') && attributes.key?(:'license_model')

      self.license_model = attributes[:'license_model'] if attributes[:'license_model']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] database_management_status Object to be assigned
    def database_management_status=(database_management_status)
      # rubocop:disable Style/ConditionalAssignment
      if database_management_status && !DATABASE_MANAGEMENT_STATUS_ENUM.include?(database_management_status)
        OCI.logger.debug("Unknown value for 'database_management_status' [" + database_management_status + "]. Mapping to 'DATABASE_MANAGEMENT_STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @database_management_status = DATABASE_MANAGEMENT_STATUS_UNKNOWN_ENUM_VALUE
      else
        @database_management_status = database_management_status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] license_model Object to be assigned
    def license_model=(license_model)
      # rubocop:disable Style/ConditionalAssignment
      if license_model && !LICENSE_MODEL_ENUM.include?(license_model)
        OCI.logger.debug("Unknown value for 'license_model' [" + license_model + "]. Mapping to 'LICENSE_MODEL_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @license_model = LICENSE_MODEL_UNKNOWN_ENUM_VALUE
      else
        @license_model = license_model
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        database_management_status == other.database_management_status &&
        database_management_connection_id == other.database_management_connection_id &&
        license_model == other.license_model
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
      [database_management_status, database_management_connection_id, license_model].hash
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
