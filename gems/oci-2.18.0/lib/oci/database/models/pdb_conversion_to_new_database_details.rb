# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'convert_to_pdb_target_base'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details of the new container database in which the converted pluggable database will be located.
  #
  class Database::Models::PdbConversionToNewDatabaseDetails < Database::Models::ConvertToPdbTargetBase
    # **[Required]** The database name. The name must begin with an alphabetic character and can contain a maximum of 8 alphanumeric characters. Special characters are not permitted. The database name must be unique in the tenancy.
    # @return [String]
    attr_accessor :cdb_name

    # **[Required]** A strong password for SYS, SYSTEM, and the plugbable database ADMIN user of the container database after conversion. The password must be at least nine characters and contain at least two uppercase, two lowercase, two numeric, and two special characters. The special characters must be _, \\#, or -.
    # @return [String]
    attr_accessor :cdb_admin_password

    # A strong password for plugbable database ADMIN user of the container database after conversion. The password must be at least nine characters and contain at least two uppercase, two lowercase, two numeric, and two special characters. The special characters must be _, \\#, or -.
    # @return [String]
    attr_accessor :pdb_admin_password

    # The password to open the TDE wallet of the container database after conversion. The password must be at least nine characters and contain at least two uppercase, two lowercase, two numeric, and two special characters. The special characters must be _, \\#, or -.
    # @return [String]
    attr_accessor :cdb_tde_wallet_password

    # **[Required]** The existing TDE wallet password of the non-container database.
    # @return [String]
    attr_accessor :non_cdb_tde_wallet_password

    # Additional container database parameters.
    # Example: \"_pdb_name_case_sensitive=true\"
    #
    # @return [String]
    attr_accessor :additional_cdb_params

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'target': :'target',
        'cdb_name': :'cdbName',
        'cdb_admin_password': :'cdbAdminPassword',
        'pdb_admin_password': :'pdbAdminPassword',
        'cdb_tde_wallet_password': :'cdbTdeWalletPassword',
        'non_cdb_tde_wallet_password': :'nonCdbTdeWalletPassword',
        'additional_cdb_params': :'additionalCdbParams'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'target': :'String',
        'cdb_name': :'String',
        'cdb_admin_password': :'String',
        'pdb_admin_password': :'String',
        'cdb_tde_wallet_password': :'String',
        'non_cdb_tde_wallet_password': :'String',
        'additional_cdb_params': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :cdb_name The value to assign to the {#cdb_name} property
    # @option attributes [String] :cdb_admin_password The value to assign to the {#cdb_admin_password} property
    # @option attributes [String] :pdb_admin_password The value to assign to the {#pdb_admin_password} property
    # @option attributes [String] :cdb_tde_wallet_password The value to assign to the {#cdb_tde_wallet_password} property
    # @option attributes [String] :non_cdb_tde_wallet_password The value to assign to the {#non_cdb_tde_wallet_password} property
    # @option attributes [String] :additional_cdb_params The value to assign to the {#additional_cdb_params} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['target'] = 'NEW_DATABASE'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.cdb_name = attributes[:'cdbName'] if attributes[:'cdbName']

      raise 'You cannot provide both :cdbName and :cdb_name' if attributes.key?(:'cdbName') && attributes.key?(:'cdb_name')

      self.cdb_name = attributes[:'cdb_name'] if attributes[:'cdb_name']

      self.cdb_admin_password = attributes[:'cdbAdminPassword'] if attributes[:'cdbAdminPassword']

      raise 'You cannot provide both :cdbAdminPassword and :cdb_admin_password' if attributes.key?(:'cdbAdminPassword') && attributes.key?(:'cdb_admin_password')

      self.cdb_admin_password = attributes[:'cdb_admin_password'] if attributes[:'cdb_admin_password']

      self.pdb_admin_password = attributes[:'pdbAdminPassword'] if attributes[:'pdbAdminPassword']

      raise 'You cannot provide both :pdbAdminPassword and :pdb_admin_password' if attributes.key?(:'pdbAdminPassword') && attributes.key?(:'pdb_admin_password')

      self.pdb_admin_password = attributes[:'pdb_admin_password'] if attributes[:'pdb_admin_password']

      self.cdb_tde_wallet_password = attributes[:'cdbTdeWalletPassword'] if attributes[:'cdbTdeWalletPassword']

      raise 'You cannot provide both :cdbTdeWalletPassword and :cdb_tde_wallet_password' if attributes.key?(:'cdbTdeWalletPassword') && attributes.key?(:'cdb_tde_wallet_password')

      self.cdb_tde_wallet_password = attributes[:'cdb_tde_wallet_password'] if attributes[:'cdb_tde_wallet_password']

      self.non_cdb_tde_wallet_password = attributes[:'nonCdbTdeWalletPassword'] if attributes[:'nonCdbTdeWalletPassword']

      raise 'You cannot provide both :nonCdbTdeWalletPassword and :non_cdb_tde_wallet_password' if attributes.key?(:'nonCdbTdeWalletPassword') && attributes.key?(:'non_cdb_tde_wallet_password')

      self.non_cdb_tde_wallet_password = attributes[:'non_cdb_tde_wallet_password'] if attributes[:'non_cdb_tde_wallet_password']

      self.additional_cdb_params = attributes[:'additionalCdbParams'] if attributes[:'additionalCdbParams']

      raise 'You cannot provide both :additionalCdbParams and :additional_cdb_params' if attributes.key?(:'additionalCdbParams') && attributes.key?(:'additional_cdb_params')

      self.additional_cdb_params = attributes[:'additional_cdb_params'] if attributes[:'additional_cdb_params']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        target == other.target &&
        cdb_name == other.cdb_name &&
        cdb_admin_password == other.cdb_admin_password &&
        pdb_admin_password == other.pdb_admin_password &&
        cdb_tde_wallet_password == other.cdb_tde_wallet_password &&
        non_cdb_tde_wallet_password == other.non_cdb_tde_wallet_password &&
        additional_cdb_params == other.additional_cdb_params
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
      [target, cdb_name, cdb_admin_password, pdb_admin_password, cdb_tde_wallet_password, non_cdb_tde_wallet_password, additional_cdb_params].hash
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