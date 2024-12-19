# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Represents audit policies with corresponding audit provisioning conditions.
  class DataSafe::Models::AuditConditions
    # **[Required]** Indicates the audit policy name. Refer to the [documentation](https://docs.oracle.com/en/cloud/paas/data-safe/udscs/audit-policies.html#GUID-361A9A9A-7C21-4F5A-8945-9B3A0C472827) for seeded audit policy names. For custom policies, refer to the user-defined policy name created in the target database.
    #
    # @return [String]
    attr_accessor :audit_policy_name

    # **[Required]** Indicates whether the privileged user list is managed by Data Safe.
    # @return [BOOLEAN]
    attr_accessor :is_priv_users_managed_by_data_safe

    # **[Required]** Indicates whether the Data Safe user activity on the target database will be audited by the policy.
    # @return [BOOLEAN]
    attr_accessor :is_data_safe_service_account_audited

    # Indicates the users/roles in the target database for which the audit policy is enforced, and the success/failure event condition to generate the audit event..
    # @return [Array<OCI::DataSafe::Models::EnableConditions>]
    attr_accessor :enable_conditions

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'audit_policy_name': :'auditPolicyName',
        'is_priv_users_managed_by_data_safe': :'isPrivUsersManagedByDataSafe',
        'is_data_safe_service_account_audited': :'isDataSafeServiceAccountAudited',
        'enable_conditions': :'enableConditions'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'audit_policy_name': :'String',
        'is_priv_users_managed_by_data_safe': :'BOOLEAN',
        'is_data_safe_service_account_audited': :'BOOLEAN',
        'enable_conditions': :'Array<OCI::DataSafe::Models::EnableConditions>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :audit_policy_name The value to assign to the {#audit_policy_name} property
    # @option attributes [BOOLEAN] :is_priv_users_managed_by_data_safe The value to assign to the {#is_priv_users_managed_by_data_safe} property
    # @option attributes [BOOLEAN] :is_data_safe_service_account_audited The value to assign to the {#is_data_safe_service_account_audited} property
    # @option attributes [Array<OCI::DataSafe::Models::EnableConditions>] :enable_conditions The value to assign to the {#enable_conditions} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.audit_policy_name = attributes[:'auditPolicyName'] if attributes[:'auditPolicyName']

      raise 'You cannot provide both :auditPolicyName and :audit_policy_name' if attributes.key?(:'auditPolicyName') && attributes.key?(:'audit_policy_name')

      self.audit_policy_name = attributes[:'audit_policy_name'] if attributes[:'audit_policy_name']

      self.is_priv_users_managed_by_data_safe = attributes[:'isPrivUsersManagedByDataSafe'] unless attributes[:'isPrivUsersManagedByDataSafe'].nil?

      raise 'You cannot provide both :isPrivUsersManagedByDataSafe and :is_priv_users_managed_by_data_safe' if attributes.key?(:'isPrivUsersManagedByDataSafe') && attributes.key?(:'is_priv_users_managed_by_data_safe')

      self.is_priv_users_managed_by_data_safe = attributes[:'is_priv_users_managed_by_data_safe'] unless attributes[:'is_priv_users_managed_by_data_safe'].nil?

      self.is_data_safe_service_account_audited = attributes[:'isDataSafeServiceAccountAudited'] unless attributes[:'isDataSafeServiceAccountAudited'].nil?

      raise 'You cannot provide both :isDataSafeServiceAccountAudited and :is_data_safe_service_account_audited' if attributes.key?(:'isDataSafeServiceAccountAudited') && attributes.key?(:'is_data_safe_service_account_audited')

      self.is_data_safe_service_account_audited = attributes[:'is_data_safe_service_account_audited'] unless attributes[:'is_data_safe_service_account_audited'].nil?

      self.enable_conditions = attributes[:'enableConditions'] if attributes[:'enableConditions']

      raise 'You cannot provide both :enableConditions and :enable_conditions' if attributes.key?(:'enableConditions') && attributes.key?(:'enable_conditions')

      self.enable_conditions = attributes[:'enable_conditions'] if attributes[:'enable_conditions']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        audit_policy_name == other.audit_policy_name &&
        is_priv_users_managed_by_data_safe == other.is_priv_users_managed_by_data_safe &&
        is_data_safe_service_account_audited == other.is_data_safe_service_account_audited &&
        enable_conditions == other.enable_conditions
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
      [audit_policy_name, is_priv_users_managed_by_data_safe, is_data_safe_service_account_audited, enable_conditions].hash
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