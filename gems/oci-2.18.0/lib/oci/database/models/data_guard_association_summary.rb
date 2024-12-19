# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The properties that define a Data Guard association.
  #
  # To use any of the API operations, you must be authorized in an IAM policy. If you're not authorized, talk to an
  # administrator. If you're an administrator who needs to write policies to give users access, see
  # [Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).
  #
  # For information about endpoints and signing API requests, see
  # [About the API](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm). For information about available SDKs and tools, see
  # [SDKS and Other Tools](https://docs.cloud.oracle.com/Content/API/Concepts/sdks.htm).
  #
  class Database::Models::DataGuardAssociationSummary
    ROLE_ENUM = [
      ROLE_PRIMARY = 'PRIMARY'.freeze,
      ROLE_STANDBY = 'STANDBY'.freeze,
      ROLE_DISABLED_STANDBY = 'DISABLED_STANDBY'.freeze,
      ROLE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_PROVISIONING = 'PROVISIONING'.freeze,
      LIFECYCLE_STATE_AVAILABLE = 'AVAILABLE'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_TERMINATING = 'TERMINATING'.freeze,
      LIFECYCLE_STATE_TERMINATED = 'TERMINATED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UPGRADING = 'UPGRADING'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    PEER_ROLE_ENUM = [
      PEER_ROLE_PRIMARY = 'PRIMARY'.freeze,
      PEER_ROLE_STANDBY = 'STANDBY'.freeze,
      PEER_ROLE_DISABLED_STANDBY = 'DISABLED_STANDBY'.freeze,
      PEER_ROLE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    PROTECTION_MODE_ENUM = [
      PROTECTION_MODE_MAXIMUM_AVAILABILITY = 'MAXIMUM_AVAILABILITY'.freeze,
      PROTECTION_MODE_MAXIMUM_PERFORMANCE = 'MAXIMUM_PERFORMANCE'.freeze,
      PROTECTION_MODE_MAXIMUM_PROTECTION = 'MAXIMUM_PROTECTION'.freeze,
      PROTECTION_MODE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    TRANSPORT_TYPE_ENUM = [
      TRANSPORT_TYPE_SYNC = 'SYNC'.freeze,
      TRANSPORT_TYPE_ASYNC = 'ASYNC'.freeze,
      TRANSPORT_TYPE_FASTSYNC = 'FASTSYNC'.freeze,
      TRANSPORT_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Data Guard association.
    # @return [String]
    attr_accessor :id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the reporting database.
    # @return [String]
    attr_accessor :database_id

    # **[Required]** The role of the reporting database in this Data Guard association.
    # @return [String]
    attr_reader :role

    # **[Required]** The current state of the Data Guard association.
    # @return [String]
    attr_reader :lifecycle_state

    # Additional information about the current lifecycleState, if available.
    #
    # @return [String]
    attr_accessor :lifecycle_details

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the DB system containing the associated
    # peer database.
    #
    # @return [String]
    attr_accessor :peer_db_system_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Database Home containing the associated peer database.
    #
    # @return [String]
    attr_accessor :peer_db_home_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the associated peer database.
    # @return [String]
    attr_accessor :peer_database_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the peer database's Data Guard association.
    # @return [String]
    attr_accessor :peer_data_guard_association_id

    # **[Required]** The role of the peer database in this Data Guard association.
    # @return [String]
    attr_reader :peer_role

    # The lag time between updates to the primary database and application of the redo data on the standby database,
    # as computed by the reporting database.
    #
    # Example: `9 seconds`
    #
    # @return [String]
    attr_accessor :apply_lag

    # The rate at which redo logs are synced between the associated databases.
    #
    # Example: `180 Mb per second`
    #
    # @return [String]
    attr_accessor :apply_rate

    # **[Required]** The protection mode of this Data Guard association. For more information, see
    # [Oracle Data Guard Protection Modes](http://docs.oracle.com/database/122/SBYDB/oracle-data-guard-protection-modes.htm#SBYDB02000)
    # in the Oracle Data Guard documentation.
    #
    # @return [String]
    attr_reader :protection_mode

    # The redo transport type used by this Data Guard association.  For more information, see
    # [Redo Transport Services](http://docs.oracle.com/database/122/SBYDB/oracle-data-guard-redo-transport-services.htm#SBYDB00400)
    # in the Oracle Data Guard documentation.
    #
    # @return [String]
    attr_reader :transport_type

    # The date and time the Data Guard association was created.
    # @return [DateTime]
    attr_accessor :time_created

    # True if active Data Guard is enabled.
    # @return [BOOLEAN]
    attr_accessor :is_active_data_guard_enabled

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'database_id': :'databaseId',
        'role': :'role',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'peer_db_system_id': :'peerDbSystemId',
        'peer_db_home_id': :'peerDbHomeId',
        'peer_database_id': :'peerDatabaseId',
        'peer_data_guard_association_id': :'peerDataGuardAssociationId',
        'peer_role': :'peerRole',
        'apply_lag': :'applyLag',
        'apply_rate': :'applyRate',
        'protection_mode': :'protectionMode',
        'transport_type': :'transportType',
        'time_created': :'timeCreated',
        'is_active_data_guard_enabled': :'isActiveDataGuardEnabled'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'database_id': :'String',
        'role': :'String',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'peer_db_system_id': :'String',
        'peer_db_home_id': :'String',
        'peer_database_id': :'String',
        'peer_data_guard_association_id': :'String',
        'peer_role': :'String',
        'apply_lag': :'String',
        'apply_rate': :'String',
        'protection_mode': :'String',
        'transport_type': :'String',
        'time_created': :'DateTime',
        'is_active_data_guard_enabled': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :database_id The value to assign to the {#database_id} property
    # @option attributes [String] :role The value to assign to the {#role} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [String] :peer_db_system_id The value to assign to the {#peer_db_system_id} property
    # @option attributes [String] :peer_db_home_id The value to assign to the {#peer_db_home_id} property
    # @option attributes [String] :peer_database_id The value to assign to the {#peer_database_id} property
    # @option attributes [String] :peer_data_guard_association_id The value to assign to the {#peer_data_guard_association_id} property
    # @option attributes [String] :peer_role The value to assign to the {#peer_role} property
    # @option attributes [String] :apply_lag The value to assign to the {#apply_lag} property
    # @option attributes [String] :apply_rate The value to assign to the {#apply_rate} property
    # @option attributes [String] :protection_mode The value to assign to the {#protection_mode} property
    # @option attributes [String] :transport_type The value to assign to the {#transport_type} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [BOOLEAN] :is_active_data_guard_enabled The value to assign to the {#is_active_data_guard_enabled} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.database_id = attributes[:'databaseId'] if attributes[:'databaseId']

      raise 'You cannot provide both :databaseId and :database_id' if attributes.key?(:'databaseId') && attributes.key?(:'database_id')

      self.database_id = attributes[:'database_id'] if attributes[:'database_id']

      self.role = attributes[:'role'] if attributes[:'role']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.peer_db_system_id = attributes[:'peerDbSystemId'] if attributes[:'peerDbSystemId']

      raise 'You cannot provide both :peerDbSystemId and :peer_db_system_id' if attributes.key?(:'peerDbSystemId') && attributes.key?(:'peer_db_system_id')

      self.peer_db_system_id = attributes[:'peer_db_system_id'] if attributes[:'peer_db_system_id']

      self.peer_db_home_id = attributes[:'peerDbHomeId'] if attributes[:'peerDbHomeId']

      raise 'You cannot provide both :peerDbHomeId and :peer_db_home_id' if attributes.key?(:'peerDbHomeId') && attributes.key?(:'peer_db_home_id')

      self.peer_db_home_id = attributes[:'peer_db_home_id'] if attributes[:'peer_db_home_id']

      self.peer_database_id = attributes[:'peerDatabaseId'] if attributes[:'peerDatabaseId']

      raise 'You cannot provide both :peerDatabaseId and :peer_database_id' if attributes.key?(:'peerDatabaseId') && attributes.key?(:'peer_database_id')

      self.peer_database_id = attributes[:'peer_database_id'] if attributes[:'peer_database_id']

      self.peer_data_guard_association_id = attributes[:'peerDataGuardAssociationId'] if attributes[:'peerDataGuardAssociationId']

      raise 'You cannot provide both :peerDataGuardAssociationId and :peer_data_guard_association_id' if attributes.key?(:'peerDataGuardAssociationId') && attributes.key?(:'peer_data_guard_association_id')

      self.peer_data_guard_association_id = attributes[:'peer_data_guard_association_id'] if attributes[:'peer_data_guard_association_id']

      self.peer_role = attributes[:'peerRole'] if attributes[:'peerRole']

      raise 'You cannot provide both :peerRole and :peer_role' if attributes.key?(:'peerRole') && attributes.key?(:'peer_role')

      self.peer_role = attributes[:'peer_role'] if attributes[:'peer_role']

      self.apply_lag = attributes[:'applyLag'] if attributes[:'applyLag']

      raise 'You cannot provide both :applyLag and :apply_lag' if attributes.key?(:'applyLag') && attributes.key?(:'apply_lag')

      self.apply_lag = attributes[:'apply_lag'] if attributes[:'apply_lag']

      self.apply_rate = attributes[:'applyRate'] if attributes[:'applyRate']

      raise 'You cannot provide both :applyRate and :apply_rate' if attributes.key?(:'applyRate') && attributes.key?(:'apply_rate')

      self.apply_rate = attributes[:'apply_rate'] if attributes[:'apply_rate']

      self.protection_mode = attributes[:'protectionMode'] if attributes[:'protectionMode']

      raise 'You cannot provide both :protectionMode and :protection_mode' if attributes.key?(:'protectionMode') && attributes.key?(:'protection_mode')

      self.protection_mode = attributes[:'protection_mode'] if attributes[:'protection_mode']

      self.transport_type = attributes[:'transportType'] if attributes[:'transportType']

      raise 'You cannot provide both :transportType and :transport_type' if attributes.key?(:'transportType') && attributes.key?(:'transport_type')

      self.transport_type = attributes[:'transport_type'] if attributes[:'transport_type']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.is_active_data_guard_enabled = attributes[:'isActiveDataGuardEnabled'] unless attributes[:'isActiveDataGuardEnabled'].nil?

      raise 'You cannot provide both :isActiveDataGuardEnabled and :is_active_data_guard_enabled' if attributes.key?(:'isActiveDataGuardEnabled') && attributes.key?(:'is_active_data_guard_enabled')

      self.is_active_data_guard_enabled = attributes[:'is_active_data_guard_enabled'] unless attributes[:'is_active_data_guard_enabled'].nil?
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] role Object to be assigned
    def role=(role)
      # rubocop:disable Style/ConditionalAssignment
      if role && !ROLE_ENUM.include?(role)
        OCI.logger.debug("Unknown value for 'role' [" + role + "]. Mapping to 'ROLE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @role = ROLE_UNKNOWN_ENUM_VALUE
      else
        @role = role
      end
      # rubocop:enable Style/ConditionalAssignment
    end

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

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] peer_role Object to be assigned
    def peer_role=(peer_role)
      # rubocop:disable Style/ConditionalAssignment
      if peer_role && !PEER_ROLE_ENUM.include?(peer_role)
        OCI.logger.debug("Unknown value for 'peer_role' [" + peer_role + "]. Mapping to 'PEER_ROLE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @peer_role = PEER_ROLE_UNKNOWN_ENUM_VALUE
      else
        @peer_role = peer_role
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] protection_mode Object to be assigned
    def protection_mode=(protection_mode)
      # rubocop:disable Style/ConditionalAssignment
      if protection_mode && !PROTECTION_MODE_ENUM.include?(protection_mode)
        OCI.logger.debug("Unknown value for 'protection_mode' [" + protection_mode + "]. Mapping to 'PROTECTION_MODE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @protection_mode = PROTECTION_MODE_UNKNOWN_ENUM_VALUE
      else
        @protection_mode = protection_mode
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] transport_type Object to be assigned
    def transport_type=(transport_type)
      # rubocop:disable Style/ConditionalAssignment
      if transport_type && !TRANSPORT_TYPE_ENUM.include?(transport_type)
        OCI.logger.debug("Unknown value for 'transport_type' [" + transport_type + "]. Mapping to 'TRANSPORT_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @transport_type = TRANSPORT_TYPE_UNKNOWN_ENUM_VALUE
      else
        @transport_type = transport_type
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
        database_id == other.database_id &&
        role == other.role &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        peer_db_system_id == other.peer_db_system_id &&
        peer_db_home_id == other.peer_db_home_id &&
        peer_database_id == other.peer_database_id &&
        peer_data_guard_association_id == other.peer_data_guard_association_id &&
        peer_role == other.peer_role &&
        apply_lag == other.apply_lag &&
        apply_rate == other.apply_rate &&
        protection_mode == other.protection_mode &&
        transport_type == other.transport_type &&
        time_created == other.time_created &&
        is_active_data_guard_enabled == other.is_active_data_guard_enabled
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
      [id, database_id, role, lifecycle_state, lifecycle_details, peer_db_system_id, peer_db_home_id, peer_database_id, peer_data_guard_association_id, peer_role, apply_lag, apply_rate, protection_mode, transport_type, time_created, is_active_data_guard_enabled].hash
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