# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Statistics showing the number of findings with a particular risk level for each category.
  class DataSafe::Models::SectionStatistics
    # The number of targets that contributed to the counts at this risk level.
    # @return [Integer]
    attr_accessor :targets_count

    # The number of findings in the Auditing category.
    # @return [Integer]
    attr_accessor :auditing_findings_count

    # The number of findings in the Authorization Control category.
    # @return [Integer]
    attr_accessor :authorization_control_findings_count

    # The number of findings in the Data Encryption category.
    # @return [Integer]
    attr_accessor :data_encryption_findings_count

    # The number of findings in the Database Configuration category.
    # @return [Integer]
    attr_accessor :db_configuration_findings_count

    # The number of findings in the Fine-Grained Access Control category.
    # @return [Integer]
    attr_accessor :fine_grained_access_control_findings_count

    # The number of findings in the Privileges and Roles category.
    # @return [Integer]
    attr_accessor :privileges_and_roles_findings_count

    # The number of findings in the User Accounts category.
    # @return [Integer]
    attr_accessor :user_accounts_findings_count

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'targets_count': :'targetsCount',
        'auditing_findings_count': :'auditingFindingsCount',
        'authorization_control_findings_count': :'authorizationControlFindingsCount',
        'data_encryption_findings_count': :'dataEncryptionFindingsCount',
        'db_configuration_findings_count': :'dbConfigurationFindingsCount',
        'fine_grained_access_control_findings_count': :'fineGrainedAccessControlFindingsCount',
        'privileges_and_roles_findings_count': :'privilegesAndRolesFindingsCount',
        'user_accounts_findings_count': :'userAccountsFindingsCount'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'targets_count': :'Integer',
        'auditing_findings_count': :'Integer',
        'authorization_control_findings_count': :'Integer',
        'data_encryption_findings_count': :'Integer',
        'db_configuration_findings_count': :'Integer',
        'fine_grained_access_control_findings_count': :'Integer',
        'privileges_and_roles_findings_count': :'Integer',
        'user_accounts_findings_count': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :targets_count The value to assign to the {#targets_count} property
    # @option attributes [Integer] :auditing_findings_count The value to assign to the {#auditing_findings_count} property
    # @option attributes [Integer] :authorization_control_findings_count The value to assign to the {#authorization_control_findings_count} property
    # @option attributes [Integer] :data_encryption_findings_count The value to assign to the {#data_encryption_findings_count} property
    # @option attributes [Integer] :db_configuration_findings_count The value to assign to the {#db_configuration_findings_count} property
    # @option attributes [Integer] :fine_grained_access_control_findings_count The value to assign to the {#fine_grained_access_control_findings_count} property
    # @option attributes [Integer] :privileges_and_roles_findings_count The value to assign to the {#privileges_and_roles_findings_count} property
    # @option attributes [Integer] :user_accounts_findings_count The value to assign to the {#user_accounts_findings_count} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.targets_count = attributes[:'targetsCount'] if attributes[:'targetsCount']

      raise 'You cannot provide both :targetsCount and :targets_count' if attributes.key?(:'targetsCount') && attributes.key?(:'targets_count')

      self.targets_count = attributes[:'targets_count'] if attributes[:'targets_count']

      self.auditing_findings_count = attributes[:'auditingFindingsCount'] if attributes[:'auditingFindingsCount']

      raise 'You cannot provide both :auditingFindingsCount and :auditing_findings_count' if attributes.key?(:'auditingFindingsCount') && attributes.key?(:'auditing_findings_count')

      self.auditing_findings_count = attributes[:'auditing_findings_count'] if attributes[:'auditing_findings_count']

      self.authorization_control_findings_count = attributes[:'authorizationControlFindingsCount'] if attributes[:'authorizationControlFindingsCount']

      raise 'You cannot provide both :authorizationControlFindingsCount and :authorization_control_findings_count' if attributes.key?(:'authorizationControlFindingsCount') && attributes.key?(:'authorization_control_findings_count')

      self.authorization_control_findings_count = attributes[:'authorization_control_findings_count'] if attributes[:'authorization_control_findings_count']

      self.data_encryption_findings_count = attributes[:'dataEncryptionFindingsCount'] if attributes[:'dataEncryptionFindingsCount']

      raise 'You cannot provide both :dataEncryptionFindingsCount and :data_encryption_findings_count' if attributes.key?(:'dataEncryptionFindingsCount') && attributes.key?(:'data_encryption_findings_count')

      self.data_encryption_findings_count = attributes[:'data_encryption_findings_count'] if attributes[:'data_encryption_findings_count']

      self.db_configuration_findings_count = attributes[:'dbConfigurationFindingsCount'] if attributes[:'dbConfigurationFindingsCount']

      raise 'You cannot provide both :dbConfigurationFindingsCount and :db_configuration_findings_count' if attributes.key?(:'dbConfigurationFindingsCount') && attributes.key?(:'db_configuration_findings_count')

      self.db_configuration_findings_count = attributes[:'db_configuration_findings_count'] if attributes[:'db_configuration_findings_count']

      self.fine_grained_access_control_findings_count = attributes[:'fineGrainedAccessControlFindingsCount'] if attributes[:'fineGrainedAccessControlFindingsCount']

      raise 'You cannot provide both :fineGrainedAccessControlFindingsCount and :fine_grained_access_control_findings_count' if attributes.key?(:'fineGrainedAccessControlFindingsCount') && attributes.key?(:'fine_grained_access_control_findings_count')

      self.fine_grained_access_control_findings_count = attributes[:'fine_grained_access_control_findings_count'] if attributes[:'fine_grained_access_control_findings_count']

      self.privileges_and_roles_findings_count = attributes[:'privilegesAndRolesFindingsCount'] if attributes[:'privilegesAndRolesFindingsCount']

      raise 'You cannot provide both :privilegesAndRolesFindingsCount and :privileges_and_roles_findings_count' if attributes.key?(:'privilegesAndRolesFindingsCount') && attributes.key?(:'privileges_and_roles_findings_count')

      self.privileges_and_roles_findings_count = attributes[:'privileges_and_roles_findings_count'] if attributes[:'privileges_and_roles_findings_count']

      self.user_accounts_findings_count = attributes[:'userAccountsFindingsCount'] if attributes[:'userAccountsFindingsCount']

      raise 'You cannot provide both :userAccountsFindingsCount and :user_accounts_findings_count' if attributes.key?(:'userAccountsFindingsCount') && attributes.key?(:'user_accounts_findings_count')

      self.user_accounts_findings_count = attributes[:'user_accounts_findings_count'] if attributes[:'user_accounts_findings_count']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        targets_count == other.targets_count &&
        auditing_findings_count == other.auditing_findings_count &&
        authorization_control_findings_count == other.authorization_control_findings_count &&
        data_encryption_findings_count == other.data_encryption_findings_count &&
        db_configuration_findings_count == other.db_configuration_findings_count &&
        fine_grained_access_control_findings_count == other.fine_grained_access_control_findings_count &&
        privileges_and_roles_findings_count == other.privileges_and_roles_findings_count &&
        user_accounts_findings_count == other.user_accounts_findings_count
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
      [targets_count, auditing_findings_count, authorization_control_findings_count, data_encryption_findings_count, db_configuration_findings_count, fine_grained_access_control_findings_count, privileges_and_roles_findings_count, user_accounts_findings_count].hash
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
