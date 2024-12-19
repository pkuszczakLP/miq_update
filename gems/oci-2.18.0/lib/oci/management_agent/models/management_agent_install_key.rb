# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The details of the Agent install Key
  class ManagementAgent::Models::ManagementAgentInstallKey
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATE_TERMINATED = 'TERMINATED'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Agent install Key identifier
    # @return [String]
    attr_accessor :id

    # Management Agent Install Key Name
    # @return [String]
    attr_accessor :display_name

    # Management Agent Install Key
    # @return [String]
    attr_accessor :key

    # Principal id of user who created the Agent Install key
    # @return [String]
    attr_accessor :created_by_principal_id

    # **[Required]** Compartment Identifier
    # @return [String]
    attr_accessor :compartment_id

    # Total number of install for this keys
    # @return [Integer]
    attr_accessor :allowed_key_install_count

    # Total number of install for this keys
    # @return [Integer]
    attr_accessor :current_key_install_count

    # Status of Key
    # @return [String]
    attr_reader :lifecycle_state

    # A message describing the current state in more detail. For example, can be used to provide actionable information for a resource in Failed state.
    # @return [String]
    attr_accessor :lifecycle_details

    # date after which key would expire after creation
    # @return [DateTime]
    attr_accessor :time_expires

    # The time when Management Agent install Key was created. An RFC3339 formatted date time string
    # @return [DateTime]
    attr_accessor :time_created

    # The time when Management Agent install Key was updated. An RFC3339 formatted date time string
    # @return [DateTime]
    attr_accessor :time_updated

    # If set to true, the install key has no expiration date or usage limit. Defaults to false
    # @return [BOOLEAN]
    attr_accessor :is_unlimited

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'display_name': :'displayName',
        'key': :'key',
        'created_by_principal_id': :'createdByPrincipalId',
        'compartment_id': :'compartmentId',
        'allowed_key_install_count': :'allowedKeyInstallCount',
        'current_key_install_count': :'currentKeyInstallCount',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'time_expires': :'timeExpires',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'is_unlimited': :'isUnlimited'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'display_name': :'String',
        'key': :'String',
        'created_by_principal_id': :'String',
        'compartment_id': :'String',
        'allowed_key_install_count': :'Integer',
        'current_key_install_count': :'Integer',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'time_expires': :'DateTime',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'is_unlimited': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :key The value to assign to the {#key} property
    # @option attributes [String] :created_by_principal_id The value to assign to the {#created_by_principal_id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [Integer] :allowed_key_install_count The value to assign to the {#allowed_key_install_count} property
    # @option attributes [Integer] :current_key_install_count The value to assign to the {#current_key_install_count} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [DateTime] :time_expires The value to assign to the {#time_expires} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [BOOLEAN] :is_unlimited The value to assign to the {#is_unlimited} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.key = attributes[:'key'] if attributes[:'key']

      self.created_by_principal_id = attributes[:'createdByPrincipalId'] if attributes[:'createdByPrincipalId']

      raise 'You cannot provide both :createdByPrincipalId and :created_by_principal_id' if attributes.key?(:'createdByPrincipalId') && attributes.key?(:'created_by_principal_id')

      self.created_by_principal_id = attributes[:'created_by_principal_id'] if attributes[:'created_by_principal_id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.allowed_key_install_count = attributes[:'allowedKeyInstallCount'] if attributes[:'allowedKeyInstallCount']

      raise 'You cannot provide both :allowedKeyInstallCount and :allowed_key_install_count' if attributes.key?(:'allowedKeyInstallCount') && attributes.key?(:'allowed_key_install_count')

      self.allowed_key_install_count = attributes[:'allowed_key_install_count'] if attributes[:'allowed_key_install_count']

      self.current_key_install_count = attributes[:'currentKeyInstallCount'] if attributes[:'currentKeyInstallCount']

      raise 'You cannot provide both :currentKeyInstallCount and :current_key_install_count' if attributes.key?(:'currentKeyInstallCount') && attributes.key?(:'current_key_install_count')

      self.current_key_install_count = attributes[:'current_key_install_count'] if attributes[:'current_key_install_count']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.time_expires = attributes[:'timeExpires'] if attributes[:'timeExpires']

      raise 'You cannot provide both :timeExpires and :time_expires' if attributes.key?(:'timeExpires') && attributes.key?(:'time_expires')

      self.time_expires = attributes[:'time_expires'] if attributes[:'time_expires']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.is_unlimited = attributes[:'isUnlimited'] unless attributes[:'isUnlimited'].nil?
      self.is_unlimited = false if is_unlimited.nil? && !attributes.key?(:'isUnlimited') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isUnlimited and :is_unlimited' if attributes.key?(:'isUnlimited') && attributes.key?(:'is_unlimited')

      self.is_unlimited = attributes[:'is_unlimited'] unless attributes[:'is_unlimited'].nil?
      self.is_unlimited = false if is_unlimited.nil? && !attributes.key?(:'isUnlimited') && !attributes.key?(:'is_unlimited') # rubocop:disable Style/StringLiterals
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] lifecycle_state Object to be assigned
    def lifecycle_state=(lifecycle_state)
      # rubocop:disable Style/ConditionalAssignment
      if lifecycle_state && !LIFECYCLE_STATE_ENUM.include?(lifecycle_state)
        OCI.logger.debug("Unknown value for 'lifecycle_state' [" + lifecycle_state + "]. Mapping to 'LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @lifecycle_state = LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE
      else
        @lifecycle_state = lifecycle_state
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        display_name == other.display_name &&
        key == other.key &&
        created_by_principal_id == other.created_by_principal_id &&
        compartment_id == other.compartment_id &&
        allowed_key_install_count == other.allowed_key_install_count &&
        current_key_install_count == other.current_key_install_count &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        time_expires == other.time_expires &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        is_unlimited == other.is_unlimited
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
      [id, display_name, key, created_by_principal_id, compartment_id, allowed_key_install_count, current_key_install_count, lifecycle_state, lifecycle_details, time_expires, time_created, time_updated, is_unlimited].hash
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
