# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details to update a database.
  #
  # **Warning:** Oracle recommends that you avoid using any confidential information when you supply string values using the API.
  #
  class Database::Models::UpdateDatabaseDetails
    # @return [OCI::Database::Models::DbBackupConfig]
    attr_accessor :db_backup_config

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Database Home.
    # @return [String]
    attr_accessor :db_home_id

    # A new strong password for SYS, SYSTEM, and the plugbable database ADMIN user. The password must be at least nine characters and contain at least two uppercase, two lowercase, two numeric, and two special characters. The special characters must be _, \\#, or -.
    # @return [String]
    attr_accessor :new_admin_password

    # The existing TDE wallet password. You must provide the existing password in order to set a new TDE wallet password.
    # @return [String]
    attr_accessor :old_tde_wallet_password

    # The new password to open the TDE wallet. The password must be at least nine characters and contain at least two uppercase, two lowercase, two numeric, and two special characters. The special characters must be _, \\#, or -.
    # @return [String]
    attr_accessor :new_tde_wallet_password

    # Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'db_backup_config': :'dbBackupConfig',
        'db_home_id': :'dbHomeId',
        'new_admin_password': :'newAdminPassword',
        'old_tde_wallet_password': :'oldTdeWalletPassword',
        'new_tde_wallet_password': :'newTdeWalletPassword',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'db_backup_config': :'OCI::Database::Models::DbBackupConfig',
        'db_home_id': :'String',
        'new_admin_password': :'String',
        'old_tde_wallet_password': :'String',
        'new_tde_wallet_password': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [OCI::Database::Models::DbBackupConfig] :db_backup_config The value to assign to the {#db_backup_config} property
    # @option attributes [String] :db_home_id The value to assign to the {#db_home_id} property
    # @option attributes [String] :new_admin_password The value to assign to the {#new_admin_password} property
    # @option attributes [String] :old_tde_wallet_password The value to assign to the {#old_tde_wallet_password} property
    # @option attributes [String] :new_tde_wallet_password The value to assign to the {#new_tde_wallet_password} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.db_backup_config = attributes[:'dbBackupConfig'] if attributes[:'dbBackupConfig']

      raise 'You cannot provide both :dbBackupConfig and :db_backup_config' if attributes.key?(:'dbBackupConfig') && attributes.key?(:'db_backup_config')

      self.db_backup_config = attributes[:'db_backup_config'] if attributes[:'db_backup_config']

      self.db_home_id = attributes[:'dbHomeId'] if attributes[:'dbHomeId']

      raise 'You cannot provide both :dbHomeId and :db_home_id' if attributes.key?(:'dbHomeId') && attributes.key?(:'db_home_id')

      self.db_home_id = attributes[:'db_home_id'] if attributes[:'db_home_id']

      self.new_admin_password = attributes[:'newAdminPassword'] if attributes[:'newAdminPassword']

      raise 'You cannot provide both :newAdminPassword and :new_admin_password' if attributes.key?(:'newAdminPassword') && attributes.key?(:'new_admin_password')

      self.new_admin_password = attributes[:'new_admin_password'] if attributes[:'new_admin_password']

      self.old_tde_wallet_password = attributes[:'oldTdeWalletPassword'] if attributes[:'oldTdeWalletPassword']

      raise 'You cannot provide both :oldTdeWalletPassword and :old_tde_wallet_password' if attributes.key?(:'oldTdeWalletPassword') && attributes.key?(:'old_tde_wallet_password')

      self.old_tde_wallet_password = attributes[:'old_tde_wallet_password'] if attributes[:'old_tde_wallet_password']

      self.new_tde_wallet_password = attributes[:'newTdeWalletPassword'] if attributes[:'newTdeWalletPassword']

      raise 'You cannot provide both :newTdeWalletPassword and :new_tde_wallet_password' if attributes.key?(:'newTdeWalletPassword') && attributes.key?(:'new_tde_wallet_password')

      self.new_tde_wallet_password = attributes[:'new_tde_wallet_password'] if attributes[:'new_tde_wallet_password']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        db_backup_config == other.db_backup_config &&
        db_home_id == other.db_home_id &&
        new_admin_password == other.new_admin_password &&
        old_tde_wallet_password == other.old_tde_wallet_password &&
        new_tde_wallet_password == other.new_tde_wallet_password &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags
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
      [db_backup_config, db_home_id, new_admin_password, old_tde_wallet_password, new_tde_wallet_password, freeform_tags, defined_tags].hash
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
