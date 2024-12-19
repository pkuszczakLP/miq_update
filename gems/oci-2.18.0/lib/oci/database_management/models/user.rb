# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The summary of a specific user resource.
  class DatabaseManagement::Models::User
    STATUS_ENUM = [
      STATUS_OPEN = 'OPEN'.freeze,
      STATUS_EXPIRED = 'EXPIRED'.freeze,
      STATUS_EXPIRED_GRACE = 'EXPIRED_GRACE'.freeze,
      STATUS_LOCKED = 'LOCKED'.freeze,
      STATUS_LOCKED_TIMED = 'LOCKED_TIMED'.freeze,
      STATUS_EXPIRED_AND_LOCKED = 'EXPIRED_AND_LOCKED'.freeze,
      STATUS_EXPIRED_GRACE_AND_LOCKED = 'EXPIRED_GRACE_AND_LOCKED'.freeze,
      STATUS_EXPIRED_AND_LOCKED_TIMED = 'EXPIRED_AND_LOCKED_TIMED'.freeze,
      STATUS_EXPIRED_GRACE_AND_LOCKED_TIMED = 'EXPIRED_GRACE_AND_LOCKED_TIMED'.freeze,
      STATUS_OPEN_AND_IN_ROLLOVER = 'OPEN_AND_IN_ROLLOVER'.freeze,
      STATUS_EXPIRED_AND_IN_ROLLOVER = 'EXPIRED_AND_IN_ROLLOVER'.freeze,
      STATUS_LOCKED_AND_IN_ROLLOVER = 'LOCKED_AND_IN_ROLLOVER'.freeze,
      STATUS_EXPIRED_AND_LOCKED_AND_IN_ROLLOVER = 'EXPIRED_AND_LOCKED_AND_IN_ROLLOVER'.freeze,
      STATUS_LOCKED_TIMED_AND_IN_ROLLOVER = 'LOCKED_TIMED_AND_IN_ROLLOVER'.freeze,
      STATUS_EXPIRED_AND_LOCKED_TIMED_AND_IN_ROL = 'EXPIRED_AND_LOCKED_TIMED_AND_IN_ROL'.freeze,
      STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    EDITIONS_ENABLED_ENUM = [
      EDITIONS_ENABLED_YES = 'YES'.freeze,
      EDITIONS_ENABLED_NO = 'NO'.freeze,
      EDITIONS_ENABLED_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    AUTHENTICATION_ENUM = [
      AUTHENTICATION_NONE = 'NONE'.freeze,
      AUTHENTICATION_EXTERNAL = 'EXTERNAL'.freeze,
      AUTHENTICATION_GLOBAL = 'GLOBAL'.freeze,
      AUTHENTICATION_PASSWORD = 'PASSWORD'.freeze,
      AUTHENTICATION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    PROXY_CONNECT_ENUM = [
      PROXY_CONNECT_YES = 'YES'.freeze,
      PROXY_CONNECT_NO = 'NO'.freeze,
      PROXY_CONNECT_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    COMMON_ENUM = [
      COMMON_YES = 'YES'.freeze,
      COMMON_NO = 'NO'.freeze,
      COMMON_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    ORACLE_MAINTAINED_ENUM = [
      ORACLE_MAINTAINED_YES = 'YES'.freeze,
      ORACLE_MAINTAINED_NO = 'NO'.freeze,
      ORACLE_MAINTAINED_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    INHERITED_ENUM = [
      INHERITED_YES = 'YES'.freeze,
      INHERITED_NO = 'NO'.freeze,
      INHERITED_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    IMPLICIT_ENUM = [
      IMPLICIT_YES = 'YES'.freeze,
      IMPLICIT_NO = 'NO'.freeze,
      IMPLICIT_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    ALL_SHARED_ENUM = [
      ALL_SHARED_YES = 'YES'.freeze,
      ALL_SHARED_NO = 'NO'.freeze,
      ALL_SHARED_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    EXTERNAL_SHARED_ENUM = [
      EXTERNAL_SHARED_YES = 'YES'.freeze,
      EXTERNAL_SHARED_NO = 'NO'.freeze,
      EXTERNAL_SHARED_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The name of the User.
    # @return [String]
    attr_accessor :name

    # **[Required]** The status of the user account.
    # @return [String]
    attr_reader :status

    # The date the account was locked, if the status of the account is LOCKED.
    # @return [DateTime]
    attr_accessor :time_locked

    # The date and time of the expiration of the user account.
    # @return [DateTime]
    attr_accessor :time_expiring

    # **[Required]** The default tablespace for data.
    # @return [String]
    attr_accessor :default_tablespace

    # **[Required]** The name of the default tablespace for temporary tables or the name of a tablespace group.
    # @return [String]
    attr_accessor :temp_tablespace

    # The default local temporary tablespace for the user.
    # @return [String]
    attr_accessor :local_temp_tablespace

    # **[Required]** The date and time the user was created.
    # @return [DateTime]
    attr_accessor :time_created

    # **[Required]** The profile name of the user.
    # @return [String]
    attr_accessor :profile

    # The initial resource consumer group for the User.
    # @return [String]
    attr_accessor :consumer_group

    # The external name of the user.
    # @return [String]
    attr_accessor :external_name

    # The list of existing versions of the password hashes (also known as \"verifiers\") for the account.
    # @return [String]
    attr_accessor :password_versions

    # Indicates whether editions have been enabled for the corresponding user (Y) or not (N).
    # @return [String]
    attr_reader :editions_enabled

    # The authentication mechanism for the user.
    # @return [String]
    attr_reader :authentication

    # Indicates whether a user can connect directly (N) or whether the account can only be proxied (Y) by users who have proxy privileges
    # for this account (that is, by users who have been granted the \"connect through\" privilege for this account).
    #
    # @return [String]
    attr_reader :proxy_connect

    # Indicates whether a given user is common(Y) or local(N).
    # @return [String]
    attr_reader :common

    # The date and time of the last user login.
    # This column is not populated when a user connects to the database with administrative privileges, that is, AS { SYSASM | SYSBACKUP | SYSDBA | SYSDG | SYSOPER | SYSRAC | SYSKM }.
    #
    # @return [DateTime]
    attr_accessor :time_last_login

    # Indicates whether the user was created and is maintained by Oracle-supplied scripts (such as catalog.sql or catproc.sql).
    # @return [String]
    attr_reader :oracle_maintained

    # Indicates whether the user definition is inherited from another container (YES) or not (NO).
    # @return [String]
    attr_reader :inherited

    # The default collation for the user schema.
    # @return [String]
    attr_accessor :default_collation

    # Indicates whether the user is a common user created by an implicit application (YES) or not (NO).
    # @return [String]
    attr_reader :implicit

    # In a sharded database, indicates whether the user is created with shard DDL enabled (YES) or not (NO).
    # @return [String]
    attr_reader :all_shared

    # In a federated sharded database, indicates whether the user is an external shard user (YES) or not (NO).
    # @return [String]
    attr_reader :external_shared

    # The date and time when the user password was last set.
    # This column is populated only when the value of the AUTHENTICATION_TYPE column is PASSWORD. Otherwise, this column is null.
    #
    # @return [DateTime]
    attr_accessor :time_password_changed

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'status': :'status',
        'time_locked': :'timeLocked',
        'time_expiring': :'timeExpiring',
        'default_tablespace': :'defaultTablespace',
        'temp_tablespace': :'tempTablespace',
        'local_temp_tablespace': :'localTempTablespace',
        'time_created': :'timeCreated',
        'profile': :'profile',
        'consumer_group': :'consumerGroup',
        'external_name': :'externalName',
        'password_versions': :'passwordVersions',
        'editions_enabled': :'editionsEnabled',
        'authentication': :'authentication',
        'proxy_connect': :'proxyConnect',
        'common': :'common',
        'time_last_login': :'timeLastLogin',
        'oracle_maintained': :'oracleMaintained',
        'inherited': :'inherited',
        'default_collation': :'defaultCollation',
        'implicit': :'implicit',
        'all_shared': :'allShared',
        'external_shared': :'externalShared',
        'time_password_changed': :'timePasswordChanged'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'status': :'String',
        'time_locked': :'DateTime',
        'time_expiring': :'DateTime',
        'default_tablespace': :'String',
        'temp_tablespace': :'String',
        'local_temp_tablespace': :'String',
        'time_created': :'DateTime',
        'profile': :'String',
        'consumer_group': :'String',
        'external_name': :'String',
        'password_versions': :'String',
        'editions_enabled': :'String',
        'authentication': :'String',
        'proxy_connect': :'String',
        'common': :'String',
        'time_last_login': :'DateTime',
        'oracle_maintained': :'String',
        'inherited': :'String',
        'default_collation': :'String',
        'implicit': :'String',
        'all_shared': :'String',
        'external_shared': :'String',
        'time_password_changed': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [DateTime] :time_locked The value to assign to the {#time_locked} property
    # @option attributes [DateTime] :time_expiring The value to assign to the {#time_expiring} property
    # @option attributes [String] :default_tablespace The value to assign to the {#default_tablespace} property
    # @option attributes [String] :temp_tablespace The value to assign to the {#temp_tablespace} property
    # @option attributes [String] :local_temp_tablespace The value to assign to the {#local_temp_tablespace} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [String] :profile The value to assign to the {#profile} property
    # @option attributes [String] :consumer_group The value to assign to the {#consumer_group} property
    # @option attributes [String] :external_name The value to assign to the {#external_name} property
    # @option attributes [String] :password_versions The value to assign to the {#password_versions} property
    # @option attributes [String] :editions_enabled The value to assign to the {#editions_enabled} property
    # @option attributes [String] :authentication The value to assign to the {#authentication} property
    # @option attributes [String] :proxy_connect The value to assign to the {#proxy_connect} property
    # @option attributes [String] :common The value to assign to the {#common} property
    # @option attributes [DateTime] :time_last_login The value to assign to the {#time_last_login} property
    # @option attributes [String] :oracle_maintained The value to assign to the {#oracle_maintained} property
    # @option attributes [String] :inherited The value to assign to the {#inherited} property
    # @option attributes [String] :default_collation The value to assign to the {#default_collation} property
    # @option attributes [String] :implicit The value to assign to the {#implicit} property
    # @option attributes [String] :all_shared The value to assign to the {#all_shared} property
    # @option attributes [String] :external_shared The value to assign to the {#external_shared} property
    # @option attributes [DateTime] :time_password_changed The value to assign to the {#time_password_changed} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.status = attributes[:'status'] if attributes[:'status']

      self.time_locked = attributes[:'timeLocked'] if attributes[:'timeLocked']

      raise 'You cannot provide both :timeLocked and :time_locked' if attributes.key?(:'timeLocked') && attributes.key?(:'time_locked')

      self.time_locked = attributes[:'time_locked'] if attributes[:'time_locked']

      self.time_expiring = attributes[:'timeExpiring'] if attributes[:'timeExpiring']

      raise 'You cannot provide both :timeExpiring and :time_expiring' if attributes.key?(:'timeExpiring') && attributes.key?(:'time_expiring')

      self.time_expiring = attributes[:'time_expiring'] if attributes[:'time_expiring']

      self.default_tablespace = attributes[:'defaultTablespace'] if attributes[:'defaultTablespace']

      raise 'You cannot provide both :defaultTablespace and :default_tablespace' if attributes.key?(:'defaultTablespace') && attributes.key?(:'default_tablespace')

      self.default_tablespace = attributes[:'default_tablespace'] if attributes[:'default_tablespace']

      self.temp_tablespace = attributes[:'tempTablespace'] if attributes[:'tempTablespace']

      raise 'You cannot provide both :tempTablespace and :temp_tablespace' if attributes.key?(:'tempTablespace') && attributes.key?(:'temp_tablespace')

      self.temp_tablespace = attributes[:'temp_tablespace'] if attributes[:'temp_tablespace']

      self.local_temp_tablespace = attributes[:'localTempTablespace'] if attributes[:'localTempTablespace']

      raise 'You cannot provide both :localTempTablespace and :local_temp_tablespace' if attributes.key?(:'localTempTablespace') && attributes.key?(:'local_temp_tablespace')

      self.local_temp_tablespace = attributes[:'local_temp_tablespace'] if attributes[:'local_temp_tablespace']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.profile = attributes[:'profile'] if attributes[:'profile']

      self.consumer_group = attributes[:'consumerGroup'] if attributes[:'consumerGroup']

      raise 'You cannot provide both :consumerGroup and :consumer_group' if attributes.key?(:'consumerGroup') && attributes.key?(:'consumer_group')

      self.consumer_group = attributes[:'consumer_group'] if attributes[:'consumer_group']

      self.external_name = attributes[:'externalName'] if attributes[:'externalName']

      raise 'You cannot provide both :externalName and :external_name' if attributes.key?(:'externalName') && attributes.key?(:'external_name')

      self.external_name = attributes[:'external_name'] if attributes[:'external_name']

      self.password_versions = attributes[:'passwordVersions'] if attributes[:'passwordVersions']

      raise 'You cannot provide both :passwordVersions and :password_versions' if attributes.key?(:'passwordVersions') && attributes.key?(:'password_versions')

      self.password_versions = attributes[:'password_versions'] if attributes[:'password_versions']

      self.editions_enabled = attributes[:'editionsEnabled'] if attributes[:'editionsEnabled']

      raise 'You cannot provide both :editionsEnabled and :editions_enabled' if attributes.key?(:'editionsEnabled') && attributes.key?(:'editions_enabled')

      self.editions_enabled = attributes[:'editions_enabled'] if attributes[:'editions_enabled']

      self.authentication = attributes[:'authentication'] if attributes[:'authentication']

      self.proxy_connect = attributes[:'proxyConnect'] if attributes[:'proxyConnect']

      raise 'You cannot provide both :proxyConnect and :proxy_connect' if attributes.key?(:'proxyConnect') && attributes.key?(:'proxy_connect')

      self.proxy_connect = attributes[:'proxy_connect'] if attributes[:'proxy_connect']

      self.common = attributes[:'common'] if attributes[:'common']

      self.time_last_login = attributes[:'timeLastLogin'] if attributes[:'timeLastLogin']

      raise 'You cannot provide both :timeLastLogin and :time_last_login' if attributes.key?(:'timeLastLogin') && attributes.key?(:'time_last_login')

      self.time_last_login = attributes[:'time_last_login'] if attributes[:'time_last_login']

      self.oracle_maintained = attributes[:'oracleMaintained'] if attributes[:'oracleMaintained']

      raise 'You cannot provide both :oracleMaintained and :oracle_maintained' if attributes.key?(:'oracleMaintained') && attributes.key?(:'oracle_maintained')

      self.oracle_maintained = attributes[:'oracle_maintained'] if attributes[:'oracle_maintained']

      self.inherited = attributes[:'inherited'] if attributes[:'inherited']

      self.default_collation = attributes[:'defaultCollation'] if attributes[:'defaultCollation']

      raise 'You cannot provide both :defaultCollation and :default_collation' if attributes.key?(:'defaultCollation') && attributes.key?(:'default_collation')

      self.default_collation = attributes[:'default_collation'] if attributes[:'default_collation']

      self.implicit = attributes[:'implicit'] if attributes[:'implicit']

      self.all_shared = attributes[:'allShared'] if attributes[:'allShared']

      raise 'You cannot provide both :allShared and :all_shared' if attributes.key?(:'allShared') && attributes.key?(:'all_shared')

      self.all_shared = attributes[:'all_shared'] if attributes[:'all_shared']

      self.external_shared = attributes[:'externalShared'] if attributes[:'externalShared']

      raise 'You cannot provide both :externalShared and :external_shared' if attributes.key?(:'externalShared') && attributes.key?(:'external_shared')

      self.external_shared = attributes[:'external_shared'] if attributes[:'external_shared']

      self.time_password_changed = attributes[:'timePasswordChanged'] if attributes[:'timePasswordChanged']

      raise 'You cannot provide both :timePasswordChanged and :time_password_changed' if attributes.key?(:'timePasswordChanged') && attributes.key?(:'time_password_changed')

      self.time_password_changed = attributes[:'time_password_changed'] if attributes[:'time_password_changed']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] status Object to be assigned
    def status=(status)
      # rubocop:disable Style/ConditionalAssignment
      if status && !STATUS_ENUM.include?(status)
        OCI.logger.debug("Unknown value for 'status' [" + status + "]. Mapping to 'STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @status = STATUS_UNKNOWN_ENUM_VALUE
      else
        @status = status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] editions_enabled Object to be assigned
    def editions_enabled=(editions_enabled)
      # rubocop:disable Style/ConditionalAssignment
      if editions_enabled && !EDITIONS_ENABLED_ENUM.include?(editions_enabled)
        OCI.logger.debug("Unknown value for 'editions_enabled' [" + editions_enabled + "]. Mapping to 'EDITIONS_ENABLED_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @editions_enabled = EDITIONS_ENABLED_UNKNOWN_ENUM_VALUE
      else
        @editions_enabled = editions_enabled
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] authentication Object to be assigned
    def authentication=(authentication)
      # rubocop:disable Style/ConditionalAssignment
      if authentication && !AUTHENTICATION_ENUM.include?(authentication)
        OCI.logger.debug("Unknown value for 'authentication' [" + authentication + "]. Mapping to 'AUTHENTICATION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @authentication = AUTHENTICATION_UNKNOWN_ENUM_VALUE
      else
        @authentication = authentication
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] proxy_connect Object to be assigned
    def proxy_connect=(proxy_connect)
      # rubocop:disable Style/ConditionalAssignment
      if proxy_connect && !PROXY_CONNECT_ENUM.include?(proxy_connect)
        OCI.logger.debug("Unknown value for 'proxy_connect' [" + proxy_connect + "]. Mapping to 'PROXY_CONNECT_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @proxy_connect = PROXY_CONNECT_UNKNOWN_ENUM_VALUE
      else
        @proxy_connect = proxy_connect
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
    # @param [Object] oracle_maintained Object to be assigned
    def oracle_maintained=(oracle_maintained)
      # rubocop:disable Style/ConditionalAssignment
      if oracle_maintained && !ORACLE_MAINTAINED_ENUM.include?(oracle_maintained)
        OCI.logger.debug("Unknown value for 'oracle_maintained' [" + oracle_maintained + "]. Mapping to 'ORACLE_MAINTAINED_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @oracle_maintained = ORACLE_MAINTAINED_UNKNOWN_ENUM_VALUE
      else
        @oracle_maintained = oracle_maintained
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

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] implicit Object to be assigned
    def implicit=(implicit)
      # rubocop:disable Style/ConditionalAssignment
      if implicit && !IMPLICIT_ENUM.include?(implicit)
        OCI.logger.debug("Unknown value for 'implicit' [" + implicit + "]. Mapping to 'IMPLICIT_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @implicit = IMPLICIT_UNKNOWN_ENUM_VALUE
      else
        @implicit = implicit
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] all_shared Object to be assigned
    def all_shared=(all_shared)
      # rubocop:disable Style/ConditionalAssignment
      if all_shared && !ALL_SHARED_ENUM.include?(all_shared)
        OCI.logger.debug("Unknown value for 'all_shared' [" + all_shared + "]. Mapping to 'ALL_SHARED_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @all_shared = ALL_SHARED_UNKNOWN_ENUM_VALUE
      else
        @all_shared = all_shared
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] external_shared Object to be assigned
    def external_shared=(external_shared)
      # rubocop:disable Style/ConditionalAssignment
      if external_shared && !EXTERNAL_SHARED_ENUM.include?(external_shared)
        OCI.logger.debug("Unknown value for 'external_shared' [" + external_shared + "]. Mapping to 'EXTERNAL_SHARED_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @external_shared = EXTERNAL_SHARED_UNKNOWN_ENUM_VALUE
      else
        @external_shared = external_shared
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
        status == other.status &&
        time_locked == other.time_locked &&
        time_expiring == other.time_expiring &&
        default_tablespace == other.default_tablespace &&
        temp_tablespace == other.temp_tablespace &&
        local_temp_tablespace == other.local_temp_tablespace &&
        time_created == other.time_created &&
        profile == other.profile &&
        consumer_group == other.consumer_group &&
        external_name == other.external_name &&
        password_versions == other.password_versions &&
        editions_enabled == other.editions_enabled &&
        authentication == other.authentication &&
        proxy_connect == other.proxy_connect &&
        common == other.common &&
        time_last_login == other.time_last_login &&
        oracle_maintained == other.oracle_maintained &&
        inherited == other.inherited &&
        default_collation == other.default_collation &&
        implicit == other.implicit &&
        all_shared == other.all_shared &&
        external_shared == other.external_shared &&
        time_password_changed == other.time_password_changed
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
      [name, status, time_locked, time_expiring, default_tablespace, temp_tablespace, local_temp_tablespace, time_created, profile, consumer_group, external_name, password_versions, editions_enabled, authentication, proxy_connect, common, time_last_login, oracle_maintained, inherited, default_collation, implicit, all_shared, external_shared, time_password_changed].hash
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
