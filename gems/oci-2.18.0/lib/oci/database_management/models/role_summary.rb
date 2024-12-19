# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A summary of each role.
  class DatabaseManagement::Models::RoleSummary
    ADMIN_OPTION_ENUM = [
      ADMIN_OPTION_YES = 'YES'.freeze,
      ADMIN_OPTION_NO = 'NO'.freeze,
      ADMIN_OPTION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    DELEGATE_OPTION_ENUM = [
      DELEGATE_OPTION_YES = 'YES'.freeze,
      DELEGATE_OPTION_NO = 'NO'.freeze,
      DELEGATE_OPTION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    DEFAULT_ROLE_ENUM = [
      DEFAULT_ROLE_YES = 'YES'.freeze,
      DEFAULT_ROLE_NO = 'NO'.freeze,
      DEFAULT_ROLE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    COMMON_ENUM = [
      COMMON_YES = 'YES'.freeze,
      COMMON_NO = 'NO'.freeze,
      COMMON_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    INHERITED_ENUM = [
      INHERITED_YES = 'YES'.freeze,
      INHERITED_NO = 'NO'.freeze,
      INHERITED_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The name of the role granted to the user.
    # @return [String]
    attr_accessor :name

    # Indicates whether the role is granted with the ADMIN OPTION (YES) or not (NO).
    # @return [String]
    attr_reader :admin_option

    # Indicates whether the role is granted with the DELEGATE OPTION (YES) or not (NO).
    # @return [String]
    attr_reader :delegate_option

    # Indicates whether the role is designated as a DEFAULT ROLE for the user (YES) or not (NO).
    # @return [String]
    attr_reader :default_role

    # Indicates how the role was granted. Possible values:
    # YES if the role is granted commonly (CONTAINER=ALL is used)
    # NO if the role is granted locally (CONTAINER=ALL is not used)
    #
    # @return [String]
    attr_reader :common

    # Indicates whether the granted role is inherited from another container (YES) or not (NO).
    # @return [String]
    attr_reader :inherited

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'admin_option': :'adminOption',
        'delegate_option': :'delegateOption',
        'default_role': :'defaultRole',
        'common': :'common',
        'inherited': :'inherited'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'admin_option': :'String',
        'delegate_option': :'String',
        'default_role': :'String',
        'common': :'String',
        'inherited': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :admin_option The value to assign to the {#admin_option} property
    # @option attributes [String] :delegate_option The value to assign to the {#delegate_option} property
    # @option attributes [String] :default_role The value to assign to the {#default_role} property
    # @option attributes [String] :common The value to assign to the {#common} property
    # @option attributes [String] :inherited The value to assign to the {#inherited} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.admin_option = attributes[:'adminOption'] if attributes[:'adminOption']

      raise 'You cannot provide both :adminOption and :admin_option' if attributes.key?(:'adminOption') && attributes.key?(:'admin_option')

      self.admin_option = attributes[:'admin_option'] if attributes[:'admin_option']

      self.delegate_option = attributes[:'delegateOption'] if attributes[:'delegateOption']

      raise 'You cannot provide both :delegateOption and :delegate_option' if attributes.key?(:'delegateOption') && attributes.key?(:'delegate_option')

      self.delegate_option = attributes[:'delegate_option'] if attributes[:'delegate_option']

      self.default_role = attributes[:'defaultRole'] if attributes[:'defaultRole']

      raise 'You cannot provide both :defaultRole and :default_role' if attributes.key?(:'defaultRole') && attributes.key?(:'default_role')

      self.default_role = attributes[:'default_role'] if attributes[:'default_role']

      self.common = attributes[:'common'] if attributes[:'common']

      self.inherited = attributes[:'inherited'] if attributes[:'inherited']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] admin_option Object to be assigned
    def admin_option=(admin_option)
      # rubocop:disable Style/ConditionalAssignment
      if admin_option && !ADMIN_OPTION_ENUM.include?(admin_option)
        OCI.logger.debug("Unknown value for 'admin_option' [" + admin_option + "]. Mapping to 'ADMIN_OPTION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @admin_option = ADMIN_OPTION_UNKNOWN_ENUM_VALUE
      else
        @admin_option = admin_option
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] delegate_option Object to be assigned
    def delegate_option=(delegate_option)
      # rubocop:disable Style/ConditionalAssignment
      if delegate_option && !DELEGATE_OPTION_ENUM.include?(delegate_option)
        OCI.logger.debug("Unknown value for 'delegate_option' [" + delegate_option + "]. Mapping to 'DELEGATE_OPTION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @delegate_option = DELEGATE_OPTION_UNKNOWN_ENUM_VALUE
      else
        @delegate_option = delegate_option
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] default_role Object to be assigned
    def default_role=(default_role)
      # rubocop:disable Style/ConditionalAssignment
      if default_role && !DEFAULT_ROLE_ENUM.include?(default_role)
        OCI.logger.debug("Unknown value for 'default_role' [" + default_role + "]. Mapping to 'DEFAULT_ROLE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @default_role = DEFAULT_ROLE_UNKNOWN_ENUM_VALUE
      else
        @default_role = default_role
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] common Object to be assigned
    def common=(common)
      # rubocop:disable Style/ConditionalAssignment
      if common && !COMMON_ENUM.include?(common)
        OCI.logger.debug("Unknown value for 'common' [" + common + "]. Mapping to 'COMMON_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @common = COMMON_UNKNOWN_ENUM_VALUE
      else
        @common = common
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] inherited Object to be assigned
    def inherited=(inherited)
      # rubocop:disable Style/ConditionalAssignment
      if inherited && !INHERITED_ENUM.include?(inherited)
        OCI.logger.debug("Unknown value for 'inherited' [" + inherited + "]. Mapping to 'INHERITED_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @inherited = INHERITED_UNKNOWN_ENUM_VALUE
      else
        @inherited = inherited
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        name == other.name &&
        admin_option == other.admin_option &&
        delegate_option == other.delegate_option &&
        default_role == other.default_role &&
        common == other.common &&
        inherited == other.inherited
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
      [name, admin_option, delegate_option, default_role, common, inherited].hash
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
