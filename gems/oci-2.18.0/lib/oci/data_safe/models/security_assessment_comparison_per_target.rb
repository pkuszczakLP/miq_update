# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The results of the comparison between two security assessment resources.
  #
  class DataSafe::Models::SecurityAssessmentComparisonPerTarget
    # The OCID of the target that is used as a baseline in this comparison.
    # @return [String]
    attr_accessor :baseline_target_id

    # The OCID of the target to be compared against the baseline target.
    # @return [String]
    attr_accessor :current_target_id

    # A comparison between findings belonging to Auditing category.
    # @return [Array<OCI::DataSafe::Models::Diffs>]
    attr_accessor :auditing

    # A comparison between findings belonging to Authorization Control category.
    # @return [Array<OCI::DataSafe::Models::Diffs>]
    attr_accessor :authorization_control

    # Comparison between findings belonging to Data Encryption category.
    # @return [Array<OCI::DataSafe::Models::Diffs>]
    attr_accessor :data_encryption

    # Comparison between findings belonging to Database Configuration category.
    # @return [Array<OCI::DataSafe::Models::Diffs>]
    attr_accessor :db_configuration

    # Comparison between findings belonging to Fine-Grained Access Control category.
    # @return [Array<OCI::DataSafe::Models::Diffs>]
    attr_accessor :fine_grained_access_control

    # Comparison between findings belonging to Privileges and Roles category.
    # @return [Array<OCI::DataSafe::Models::Diffs>]
    attr_accessor :privileges_and_roles

    # Comparison between findings belonging to User Accounts category.
    # @return [Array<OCI::DataSafe::Models::Diffs>]
    attr_accessor :user_accounts

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'baseline_target_id': :'baselineTargetId',
        'current_target_id': :'currentTargetId',
        'auditing': :'auditing',
        'authorization_control': :'authorizationControl',
        'data_encryption': :'dataEncryption',
        'db_configuration': :'dbConfiguration',
        'fine_grained_access_control': :'fineGrainedAccessControl',
        'privileges_and_roles': :'privilegesAndRoles',
        'user_accounts': :'userAccounts'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'baseline_target_id': :'String',
        'current_target_id': :'String',
        'auditing': :'Array<OCI::DataSafe::Models::Diffs>',
        'authorization_control': :'Array<OCI::DataSafe::Models::Diffs>',
        'data_encryption': :'Array<OCI::DataSafe::Models::Diffs>',
        'db_configuration': :'Array<OCI::DataSafe::Models::Diffs>',
        'fine_grained_access_control': :'Array<OCI::DataSafe::Models::Diffs>',
        'privileges_and_roles': :'Array<OCI::DataSafe::Models::Diffs>',
        'user_accounts': :'Array<OCI::DataSafe::Models::Diffs>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :baseline_target_id The value to assign to the {#baseline_target_id} property
    # @option attributes [String] :current_target_id The value to assign to the {#current_target_id} property
    # @option attributes [Array<OCI::DataSafe::Models::Diffs>] :auditing The value to assign to the {#auditing} property
    # @option attributes [Array<OCI::DataSafe::Models::Diffs>] :authorization_control The value to assign to the {#authorization_control} property
    # @option attributes [Array<OCI::DataSafe::Models::Diffs>] :data_encryption The value to assign to the {#data_encryption} property
    # @option attributes [Array<OCI::DataSafe::Models::Diffs>] :db_configuration The value to assign to the {#db_configuration} property
    # @option attributes [Array<OCI::DataSafe::Models::Diffs>] :fine_grained_access_control The value to assign to the {#fine_grained_access_control} property
    # @option attributes [Array<OCI::DataSafe::Models::Diffs>] :privileges_and_roles The value to assign to the {#privileges_and_roles} property
    # @option attributes [Array<OCI::DataSafe::Models::Diffs>] :user_accounts The value to assign to the {#user_accounts} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.baseline_target_id = attributes[:'baselineTargetId'] if attributes[:'baselineTargetId']

      raise 'You cannot provide both :baselineTargetId and :baseline_target_id' if attributes.key?(:'baselineTargetId') && attributes.key?(:'baseline_target_id')

      self.baseline_target_id = attributes[:'baseline_target_id'] if attributes[:'baseline_target_id']

      self.current_target_id = attributes[:'currentTargetId'] if attributes[:'currentTargetId']

      raise 'You cannot provide both :currentTargetId and :current_target_id' if attributes.key?(:'currentTargetId') && attributes.key?(:'current_target_id')

      self.current_target_id = attributes[:'current_target_id'] if attributes[:'current_target_id']

      self.auditing = attributes[:'auditing'] if attributes[:'auditing']

      self.authorization_control = attributes[:'authorizationControl'] if attributes[:'authorizationControl']

      raise 'You cannot provide both :authorizationControl and :authorization_control' if attributes.key?(:'authorizationControl') && attributes.key?(:'authorization_control')

      self.authorization_control = attributes[:'authorization_control'] if attributes[:'authorization_control']

      self.data_encryption = attributes[:'dataEncryption'] if attributes[:'dataEncryption']

      raise 'You cannot provide both :dataEncryption and :data_encryption' if attributes.key?(:'dataEncryption') && attributes.key?(:'data_encryption')

      self.data_encryption = attributes[:'data_encryption'] if attributes[:'data_encryption']

      self.db_configuration = attributes[:'dbConfiguration'] if attributes[:'dbConfiguration']

      raise 'You cannot provide both :dbConfiguration and :db_configuration' if attributes.key?(:'dbConfiguration') && attributes.key?(:'db_configuration')

      self.db_configuration = attributes[:'db_configuration'] if attributes[:'db_configuration']

      self.fine_grained_access_control = attributes[:'fineGrainedAccessControl'] if attributes[:'fineGrainedAccessControl']

      raise 'You cannot provide both :fineGrainedAccessControl and :fine_grained_access_control' if attributes.key?(:'fineGrainedAccessControl') && attributes.key?(:'fine_grained_access_control')

      self.fine_grained_access_control = attributes[:'fine_grained_access_control'] if attributes[:'fine_grained_access_control']

      self.privileges_and_roles = attributes[:'privilegesAndRoles'] if attributes[:'privilegesAndRoles']

      raise 'You cannot provide both :privilegesAndRoles and :privileges_and_roles' if attributes.key?(:'privilegesAndRoles') && attributes.key?(:'privileges_and_roles')

      self.privileges_and_roles = attributes[:'privileges_and_roles'] if attributes[:'privileges_and_roles']

      self.user_accounts = attributes[:'userAccounts'] if attributes[:'userAccounts']

      raise 'You cannot provide both :userAccounts and :user_accounts' if attributes.key?(:'userAccounts') && attributes.key?(:'user_accounts')

      self.user_accounts = attributes[:'user_accounts'] if attributes[:'user_accounts']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        baseline_target_id == other.baseline_target_id &&
        current_target_id == other.current_target_id &&
        auditing == other.auditing &&
        authorization_control == other.authorization_control &&
        data_encryption == other.data_encryption &&
        db_configuration == other.db_configuration &&
        fine_grained_access_control == other.fine_grained_access_control &&
        privileges_and_roles == other.privileges_and_roles &&
        user_accounts == other.user_accounts
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
      [baseline_target_id, current_target_id, auditing, authorization_control, data_encryption, db_configuration, fine_grained_access_control, privileges_and_roles, user_accounts].hash
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