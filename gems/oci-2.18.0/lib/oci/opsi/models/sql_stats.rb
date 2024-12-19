# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Sql Stats type object.
  class Opsi::Models::SqlStats
    # **[Required]** Unique SQL_ID for a SQL Statement.
    #
    # @return [String]
    attr_accessor :sql_identifier

    # **[Required]** Plan hash value for the SQL Execution Plan
    # @return [Integer]
    attr_accessor :plan_hash_value

    # **[Required]** Collection timestamp
    # Example: `\"2020-03-31T00:00:00.000Z\"`
    #
    # @return [DateTime]
    attr_accessor :time_collected

    # **[Required]** Name of Database Instance
    # Example: `\"DB10902_1\"`
    #
    # @return [String]
    attr_accessor :instance_name

    # last_active_time
    # Example: `\"0000000099CCE300\"`
    #
    # @return [String]
    attr_accessor :last_active_time

    # Total integer of parse calls
    #  Example: `60`
    #
    # @return [Integer]
    attr_accessor :parse_calls

    # Number of disk reads
    # @return [Integer]
    attr_accessor :disk_reads

    # Number of direct reads
    # @return [Integer]
    attr_accessor :direct_reads

    # Number of Direct writes
    # @return [Integer]
    attr_accessor :direct_writes

    # Number of Buffer Gets
    # @return [Integer]
    attr_accessor :buffer_gets

    # Number of row processed
    # @return [Integer]
    attr_accessor :rows_processed

    # Number of serializable aborts
    # @return [Integer]
    attr_accessor :serializable_aborts

    # Number of fetches
    # @return [Integer]
    attr_accessor :fetches

    # Number of executions
    # @return [Integer]
    attr_accessor :executions

    # Number of executions attempted on this object, but prevented due to the SQL statement being in quarantine
    # @return [Integer]
    attr_accessor :avoided_executions

    # Number of times this cursor was fully executed since the cursor was brought into the library cache
    # @return [Integer]
    attr_accessor :end_of_fetch_count

    # Number of times the object was either loaded or reloaded
    # @return [Integer]
    attr_accessor :loads

    # Number of cursors present in the cache with this SQL text and plan
    # @return [Integer]
    attr_accessor :version_count

    # Number of times this child cursor has been invalidated
    # @return [Integer]
    attr_accessor :invalidations

    # Number of times that a parent cursor became obsolete
    # @return [Integer]
    attr_accessor :obsolete_count

    # Total number of executions performed by parallel execution servers (0 when the statement has never been executed in parallel)
    # @return [Integer]
    attr_accessor :px_servers_executions

    # CPU time (in microseconds) used by this cursor for parsing, executing, and fetching
    # @return [Integer]
    attr_accessor :cpu_time_in_us

    # Elapsed time (in microseconds) used by this cursor for parsing, executing, and fetching.
    # @return [Integer]
    attr_accessor :elapsed_time_in_us

    # Average hard parse time (in microseconds) used by this cursor
    # @return [Integer]
    attr_accessor :avg_hard_parse_time_in_us

    # Concurrency wait time (in microseconds)
    # @return [Integer]
    attr_accessor :concurrency_wait_time_in_us

    # Application wait time (in microseconds)
    # @return [Integer]
    attr_accessor :application_wait_time_in_us

    # Cluster wait time (in microseconds). This value is specific to Oracle RAC
    # @return [Integer]
    attr_accessor :cluster_wait_time_in_us

    # User I/O wait time (in microseconds)
    # @return [Integer]
    attr_accessor :user_io_wait_time_in_us

    # PL/SQL execution time (in microseconds)
    # @return [Integer]
    attr_accessor :plsql_exec_time_in_us

    # Java execution time (in microseconds)
    # @return [Integer]
    attr_accessor :java_exec_time_in_us

    # Number of sorts that were done for the child cursor
    # @return [Integer]
    attr_accessor :sorts

    # Total shared memory (in bytes) currently occupied by all cursors with this SQL text and plan
    # @return [Integer]
    attr_accessor :sharable_mem

    # Total shared memory (in bytes) occupied by all cursors with this SQL text and plan if they were to be fully loaded in the shared pool (that is, cursor size)
    # @return [Integer]
    attr_accessor :total_sharable_mem

    # Typecheck memory
    # @return [Integer]
    attr_accessor :type_check_mem

    # Number of I/O bytes which can be filtered by the Exadata storage system
    # @return [Integer]
    attr_accessor :io_cell_offload_eligible_bytes

    # Number of I/O bytes exchanged between Oracle Database and the storage system. Typically used for Cache Fusion or parallel queries
    # @return [Integer]
    attr_accessor :io_interconnect_bytes

    # Number of physical read I/O requests issued by the monitored SQL. The requests may not be disk reads
    # @return [Integer]
    attr_accessor :physical_read_requests

    # Number of bytes read from disks by the monitored SQL
    # @return [Integer]
    attr_accessor :physical_read_bytes

    # Number of physical write I/O requests issued by the monitored SQL
    # @return [Integer]
    attr_accessor :physical_write_requests

    # Number of bytes written to disks by the monitored SQL
    # @return [Integer]
    attr_accessor :physical_write_bytes

    # exact_matching_signature
    # Example: `\"18067345456756876713\"`
    #
    # @return [String]
    attr_accessor :exact_matching_signature

    # force_matching_signature
    # Example: `\"18067345456756876713\"`
    #
    # @return [String]
    attr_accessor :force_matching_signature

    # Number of uncompressed bytes (that is, size after decompression) that are offloaded to the Exadata cells
    # @return [Integer]
    attr_accessor :io_cell_uncompressed_bytes

    # Number of bytes that are returned by Exadata cell through the regular I/O path
    # @return [Integer]
    attr_accessor :io_cell_offload_returned_bytes

    # Number of this child cursor
    # @return [Integer]
    attr_accessor :child_number

    # Oracle command type definition
    # @return [Integer]
    attr_accessor :command_type

    # Number of users that have any of the child cursors open
    # @return [Integer]
    attr_accessor :users_opening

    # Number of users executing the statement
    # @return [Integer]
    attr_accessor :users_executing

    # Cost of this query given by the optimizer
    # @return [Integer]
    attr_accessor :optimizer_cost

    # Total Number of rows in SQLStats table
    # @return [String]
    attr_accessor :full_plan_hash_value

    # Module name
    # @return [String]
    attr_accessor :_module

    # Service name
    # @return [String]
    attr_accessor :service

    # Contains the name of the action that was executing when the SQL statement was first parsed, which is set by calling DBMS_APPLICATION_INFO.SET_ACTION
    # @return [String]
    attr_accessor :action

    # SQL profile used for this statement, if any
    # @return [String]
    attr_accessor :sql_profile

    # SQL patch used for this statement, if any
    # @return [String]
    attr_accessor :sql_patch

    # SQL plan baseline used for this statement, if any
    # @return [String]
    attr_accessor :sql_plan_baseline

    # Number of executions for the cursor since the last AWR snapshot
    # @return [Integer]
    attr_accessor :delta_execution_count

    # CPU time (in microseconds) for the cursor since the last AWR snapshot
    # @return [Integer]
    attr_accessor :delta_cpu_time

    # Number of I/O bytes exchanged between the Oracle database and the storage system for the cursor since the last AWR snapshot
    # @return [Integer]
    attr_accessor :delta_io_bytes

    # Rank based on CPU Consumption
    # @return [Integer]
    attr_accessor :delta_cpu_rank

    # Rank based on number of execution
    # @return [Integer]
    attr_accessor :delta_execs_rank

    # Rank based on sharable memory
    # @return [Integer]
    attr_accessor :sharable_mem_rank

    # Rank based on I/O Consumption
    # @return [Integer]
    attr_accessor :delta_io_rank

    # Harmonic sum based on ranking parameters
    # @return [Integer]
    attr_accessor :harmonic_sum

    # Weight based harmonic sum of ranking parameters
    # @return [Integer]
    attr_accessor :wt_harmonic_sum

    # Total number of rows in SQLStats table
    # @return [Integer]
    attr_accessor :total_sql_count

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'sql_identifier': :'sqlIdentifier',
        'plan_hash_value': :'planHashValue',
        'time_collected': :'timeCollected',
        'instance_name': :'instanceName',
        'last_active_time': :'lastActiveTime',
        'parse_calls': :'parseCalls',
        'disk_reads': :'diskReads',
        'direct_reads': :'directReads',
        'direct_writes': :'directWrites',
        'buffer_gets': :'bufferGets',
        'rows_processed': :'rowsProcessed',
        'serializable_aborts': :'serializableAborts',
        'fetches': :'fetches',
        'executions': :'executions',
        'avoided_executions': :'avoidedExecutions',
        'end_of_fetch_count': :'endOfFetchCount',
        'loads': :'loads',
        'version_count': :'versionCount',
        'invalidations': :'invalidations',
        'obsolete_count': :'obsoleteCount',
        'px_servers_executions': :'pxServersExecutions',
        'cpu_time_in_us': :'cpuTimeInUs',
        'elapsed_time_in_us': :'elapsedTimeInUs',
        'avg_hard_parse_time_in_us': :'avgHardParseTimeInUs',
        'concurrency_wait_time_in_us': :'concurrencyWaitTimeInUs',
        'application_wait_time_in_us': :'applicationWaitTimeInUs',
        'cluster_wait_time_in_us': :'clusterWaitTimeInUs',
        'user_io_wait_time_in_us': :'userIoWaitTimeInUs',
        'plsql_exec_time_in_us': :'plsqlExecTimeInUs',
        'java_exec_time_in_us': :'javaExecTimeInUs',
        'sorts': :'sorts',
        'sharable_mem': :'sharableMem',
        'total_sharable_mem': :'totalSharableMem',
        'type_check_mem': :'typeCheckMem',
        'io_cell_offload_eligible_bytes': :'ioCellOffloadEligibleBytes',
        'io_interconnect_bytes': :'ioInterconnectBytes',
        'physical_read_requests': :'physicalReadRequests',
        'physical_read_bytes': :'physicalReadBytes',
        'physical_write_requests': :'physicalWriteRequests',
        'physical_write_bytes': :'physicalWriteBytes',
        'exact_matching_signature': :'exactMatchingSignature',
        'force_matching_signature': :'forceMatchingSignature',
        'io_cell_uncompressed_bytes': :'ioCellUncompressedBytes',
        'io_cell_offload_returned_bytes': :'ioCellOffloadReturnedBytes',
        'child_number': :'childNumber',
        'command_type': :'commandType',
        'users_opening': :'usersOpening',
        'users_executing': :'usersExecuting',
        'optimizer_cost': :'optimizerCost',
        'full_plan_hash_value': :'fullPlanHashValue',
        '_module': :'module',
        'service': :'service',
        'action': :'action',
        'sql_profile': :'sqlProfile',
        'sql_patch': :'sqlPatch',
        'sql_plan_baseline': :'sqlPlanBaseline',
        'delta_execution_count': :'deltaExecutionCount',
        'delta_cpu_time': :'deltaCpuTime',
        'delta_io_bytes': :'deltaIoBytes',
        'delta_cpu_rank': :'deltaCpuRank',
        'delta_execs_rank': :'deltaExecsRank',
        'sharable_mem_rank': :'sharableMemRank',
        'delta_io_rank': :'deltaIoRank',
        'harmonic_sum': :'harmonicSum',
        'wt_harmonic_sum': :'wtHarmonicSum',
        'total_sql_count': :'totalSqlCount'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'sql_identifier': :'String',
        'plan_hash_value': :'Integer',
        'time_collected': :'DateTime',
        'instance_name': :'String',
        'last_active_time': :'String',
        'parse_calls': :'Integer',
        'disk_reads': :'Integer',
        'direct_reads': :'Integer',
        'direct_writes': :'Integer',
        'buffer_gets': :'Integer',
        'rows_processed': :'Integer',
        'serializable_aborts': :'Integer',
        'fetches': :'Integer',
        'executions': :'Integer',
        'avoided_executions': :'Integer',
        'end_of_fetch_count': :'Integer',
        'loads': :'Integer',
        'version_count': :'Integer',
        'invalidations': :'Integer',
        'obsolete_count': :'Integer',
        'px_servers_executions': :'Integer',
        'cpu_time_in_us': :'Integer',
        'elapsed_time_in_us': :'Integer',
        'avg_hard_parse_time_in_us': :'Integer',
        'concurrency_wait_time_in_us': :'Integer',
        'application_wait_time_in_us': :'Integer',
        'cluster_wait_time_in_us': :'Integer',
        'user_io_wait_time_in_us': :'Integer',
        'plsql_exec_time_in_us': :'Integer',
        'java_exec_time_in_us': :'Integer',
        'sorts': :'Integer',
        'sharable_mem': :'Integer',
        'total_sharable_mem': :'Integer',
        'type_check_mem': :'Integer',
        'io_cell_offload_eligible_bytes': :'Integer',
        'io_interconnect_bytes': :'Integer',
        'physical_read_requests': :'Integer',
        'physical_read_bytes': :'Integer',
        'physical_write_requests': :'Integer',
        'physical_write_bytes': :'Integer',
        'exact_matching_signature': :'String',
        'force_matching_signature': :'String',
        'io_cell_uncompressed_bytes': :'Integer',
        'io_cell_offload_returned_bytes': :'Integer',
        'child_number': :'Integer',
        'command_type': :'Integer',
        'users_opening': :'Integer',
        'users_executing': :'Integer',
        'optimizer_cost': :'Integer',
        'full_plan_hash_value': :'String',
        '_module': :'String',
        'service': :'String',
        'action': :'String',
        'sql_profile': :'String',
        'sql_patch': :'String',
        'sql_plan_baseline': :'String',
        'delta_execution_count': :'Integer',
        'delta_cpu_time': :'Integer',
        'delta_io_bytes': :'Integer',
        'delta_cpu_rank': :'Integer',
        'delta_execs_rank': :'Integer',
        'sharable_mem_rank': :'Integer',
        'delta_io_rank': :'Integer',
        'harmonic_sum': :'Integer',
        'wt_harmonic_sum': :'Integer',
        'total_sql_count': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :sql_identifier The value to assign to the {#sql_identifier} property
    # @option attributes [Integer] :plan_hash_value The value to assign to the {#plan_hash_value} property
    # @option attributes [DateTime] :time_collected The value to assign to the {#time_collected} property
    # @option attributes [String] :instance_name The value to assign to the {#instance_name} property
    # @option attributes [String] :last_active_time The value to assign to the {#last_active_time} property
    # @option attributes [Integer] :parse_calls The value to assign to the {#parse_calls} property
    # @option attributes [Integer] :disk_reads The value to assign to the {#disk_reads} property
    # @option attributes [Integer] :direct_reads The value to assign to the {#direct_reads} property
    # @option attributes [Integer] :direct_writes The value to assign to the {#direct_writes} property
    # @option attributes [Integer] :buffer_gets The value to assign to the {#buffer_gets} property
    # @option attributes [Integer] :rows_processed The value to assign to the {#rows_processed} property
    # @option attributes [Integer] :serializable_aborts The value to assign to the {#serializable_aborts} property
    # @option attributes [Integer] :fetches The value to assign to the {#fetches} property
    # @option attributes [Integer] :executions The value to assign to the {#executions} property
    # @option attributes [Integer] :avoided_executions The value to assign to the {#avoided_executions} property
    # @option attributes [Integer] :end_of_fetch_count The value to assign to the {#end_of_fetch_count} property
    # @option attributes [Integer] :loads The value to assign to the {#loads} property
    # @option attributes [Integer] :version_count The value to assign to the {#version_count} property
    # @option attributes [Integer] :invalidations The value to assign to the {#invalidations} property
    # @option attributes [Integer] :obsolete_count The value to assign to the {#obsolete_count} property
    # @option attributes [Integer] :px_servers_executions The value to assign to the {#px_servers_executions} property
    # @option attributes [Integer] :cpu_time_in_us The value to assign to the {#cpu_time_in_us} property
    # @option attributes [Integer] :elapsed_time_in_us The value to assign to the {#elapsed_time_in_us} property
    # @option attributes [Integer] :avg_hard_parse_time_in_us The value to assign to the {#avg_hard_parse_time_in_us} property
    # @option attributes [Integer] :concurrency_wait_time_in_us The value to assign to the {#concurrency_wait_time_in_us} property
    # @option attributes [Integer] :application_wait_time_in_us The value to assign to the {#application_wait_time_in_us} property
    # @option attributes [Integer] :cluster_wait_time_in_us The value to assign to the {#cluster_wait_time_in_us} property
    # @option attributes [Integer] :user_io_wait_time_in_us The value to assign to the {#user_io_wait_time_in_us} property
    # @option attributes [Integer] :plsql_exec_time_in_us The value to assign to the {#plsql_exec_time_in_us} property
    # @option attributes [Integer] :java_exec_time_in_us The value to assign to the {#java_exec_time_in_us} property
    # @option attributes [Integer] :sorts The value to assign to the {#sorts} property
    # @option attributes [Integer] :sharable_mem The value to assign to the {#sharable_mem} property
    # @option attributes [Integer] :total_sharable_mem The value to assign to the {#total_sharable_mem} property
    # @option attributes [Integer] :type_check_mem The value to assign to the {#type_check_mem} property
    # @option attributes [Integer] :io_cell_offload_eligible_bytes The value to assign to the {#io_cell_offload_eligible_bytes} property
    # @option attributes [Integer] :io_interconnect_bytes The value to assign to the {#io_interconnect_bytes} property
    # @option attributes [Integer] :physical_read_requests The value to assign to the {#physical_read_requests} property
    # @option attributes [Integer] :physical_read_bytes The value to assign to the {#physical_read_bytes} property
    # @option attributes [Integer] :physical_write_requests The value to assign to the {#physical_write_requests} property
    # @option attributes [Integer] :physical_write_bytes The value to assign to the {#physical_write_bytes} property
    # @option attributes [String] :exact_matching_signature The value to assign to the {#exact_matching_signature} property
    # @option attributes [String] :force_matching_signature The value to assign to the {#force_matching_signature} property
    # @option attributes [Integer] :io_cell_uncompressed_bytes The value to assign to the {#io_cell_uncompressed_bytes} property
    # @option attributes [Integer] :io_cell_offload_returned_bytes The value to assign to the {#io_cell_offload_returned_bytes} property
    # @option attributes [Integer] :child_number The value to assign to the {#child_number} property
    # @option attributes [Integer] :command_type The value to assign to the {#command_type} property
    # @option attributes [Integer] :users_opening The value to assign to the {#users_opening} property
    # @option attributes [Integer] :users_executing The value to assign to the {#users_executing} property
    # @option attributes [Integer] :optimizer_cost The value to assign to the {#optimizer_cost} property
    # @option attributes [String] :full_plan_hash_value The value to assign to the {#full_plan_hash_value} property
    # @option attributes [String] :_module The value to assign to the {#_module} property
    # @option attributes [String] :service The value to assign to the {#service} property
    # @option attributes [String] :action The value to assign to the {#action} property
    # @option attributes [String] :sql_profile The value to assign to the {#sql_profile} property
    # @option attributes [String] :sql_patch The value to assign to the {#sql_patch} property
    # @option attributes [String] :sql_plan_baseline The value to assign to the {#sql_plan_baseline} property
    # @option attributes [Integer] :delta_execution_count The value to assign to the {#delta_execution_count} property
    # @option attributes [Integer] :delta_cpu_time The value to assign to the {#delta_cpu_time} property
    # @option attributes [Integer] :delta_io_bytes The value to assign to the {#delta_io_bytes} property
    # @option attributes [Integer] :delta_cpu_rank The value to assign to the {#delta_cpu_rank} property
    # @option attributes [Integer] :delta_execs_rank The value to assign to the {#delta_execs_rank} property
    # @option attributes [Integer] :sharable_mem_rank The value to assign to the {#sharable_mem_rank} property
    # @option attributes [Integer] :delta_io_rank The value to assign to the {#delta_io_rank} property
    # @option attributes [Integer] :harmonic_sum The value to assign to the {#harmonic_sum} property
    # @option attributes [Integer] :wt_harmonic_sum The value to assign to the {#wt_harmonic_sum} property
    # @option attributes [Integer] :total_sql_count The value to assign to the {#total_sql_count} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.sql_identifier = attributes[:'sqlIdentifier'] if attributes[:'sqlIdentifier']

      raise 'You cannot provide both :sqlIdentifier and :sql_identifier' if attributes.key?(:'sqlIdentifier') && attributes.key?(:'sql_identifier')

      self.sql_identifier = attributes[:'sql_identifier'] if attributes[:'sql_identifier']

      self.plan_hash_value = attributes[:'planHashValue'] if attributes[:'planHashValue']

      raise 'You cannot provide both :planHashValue and :plan_hash_value' if attributes.key?(:'planHashValue') && attributes.key?(:'plan_hash_value')

      self.plan_hash_value = attributes[:'plan_hash_value'] if attributes[:'plan_hash_value']

      self.time_collected = attributes[:'timeCollected'] if attributes[:'timeCollected']

      raise 'You cannot provide both :timeCollected and :time_collected' if attributes.key?(:'timeCollected') && attributes.key?(:'time_collected')

      self.time_collected = attributes[:'time_collected'] if attributes[:'time_collected']

      self.instance_name = attributes[:'instanceName'] if attributes[:'instanceName']

      raise 'You cannot provide both :instanceName and :instance_name' if attributes.key?(:'instanceName') && attributes.key?(:'instance_name')

      self.instance_name = attributes[:'instance_name'] if attributes[:'instance_name']

      self.last_active_time = attributes[:'lastActiveTime'] if attributes[:'lastActiveTime']

      raise 'You cannot provide both :lastActiveTime and :last_active_time' if attributes.key?(:'lastActiveTime') && attributes.key?(:'last_active_time')

      self.last_active_time = attributes[:'last_active_time'] if attributes[:'last_active_time']

      self.parse_calls = attributes[:'parseCalls'] if attributes[:'parseCalls']

      raise 'You cannot provide both :parseCalls and :parse_calls' if attributes.key?(:'parseCalls') && attributes.key?(:'parse_calls')

      self.parse_calls = attributes[:'parse_calls'] if attributes[:'parse_calls']

      self.disk_reads = attributes[:'diskReads'] if attributes[:'diskReads']

      raise 'You cannot provide both :diskReads and :disk_reads' if attributes.key?(:'diskReads') && attributes.key?(:'disk_reads')

      self.disk_reads = attributes[:'disk_reads'] if attributes[:'disk_reads']

      self.direct_reads = attributes[:'directReads'] if attributes[:'directReads']

      raise 'You cannot provide both :directReads and :direct_reads' if attributes.key?(:'directReads') && attributes.key?(:'direct_reads')

      self.direct_reads = attributes[:'direct_reads'] if attributes[:'direct_reads']

      self.direct_writes = attributes[:'directWrites'] if attributes[:'directWrites']

      raise 'You cannot provide both :directWrites and :direct_writes' if attributes.key?(:'directWrites') && attributes.key?(:'direct_writes')

      self.direct_writes = attributes[:'direct_writes'] if attributes[:'direct_writes']

      self.buffer_gets = attributes[:'bufferGets'] if attributes[:'bufferGets']

      raise 'You cannot provide both :bufferGets and :buffer_gets' if attributes.key?(:'bufferGets') && attributes.key?(:'buffer_gets')

      self.buffer_gets = attributes[:'buffer_gets'] if attributes[:'buffer_gets']

      self.rows_processed = attributes[:'rowsProcessed'] if attributes[:'rowsProcessed']

      raise 'You cannot provide both :rowsProcessed and :rows_processed' if attributes.key?(:'rowsProcessed') && attributes.key?(:'rows_processed')

      self.rows_processed = attributes[:'rows_processed'] if attributes[:'rows_processed']

      self.serializable_aborts = attributes[:'serializableAborts'] if attributes[:'serializableAborts']

      raise 'You cannot provide both :serializableAborts and :serializable_aborts' if attributes.key?(:'serializableAborts') && attributes.key?(:'serializable_aborts')

      self.serializable_aborts = attributes[:'serializable_aborts'] if attributes[:'serializable_aborts']

      self.fetches = attributes[:'fetches'] if attributes[:'fetches']

      self.executions = attributes[:'executions'] if attributes[:'executions']

      self.avoided_executions = attributes[:'avoidedExecutions'] if attributes[:'avoidedExecutions']

      raise 'You cannot provide both :avoidedExecutions and :avoided_executions' if attributes.key?(:'avoidedExecutions') && attributes.key?(:'avoided_executions')

      self.avoided_executions = attributes[:'avoided_executions'] if attributes[:'avoided_executions']

      self.end_of_fetch_count = attributes[:'endOfFetchCount'] if attributes[:'endOfFetchCount']

      raise 'You cannot provide both :endOfFetchCount and :end_of_fetch_count' if attributes.key?(:'endOfFetchCount') && attributes.key?(:'end_of_fetch_count')

      self.end_of_fetch_count = attributes[:'end_of_fetch_count'] if attributes[:'end_of_fetch_count']

      self.loads = attributes[:'loads'] if attributes[:'loads']

      self.version_count = attributes[:'versionCount'] if attributes[:'versionCount']

      raise 'You cannot provide both :versionCount and :version_count' if attributes.key?(:'versionCount') && attributes.key?(:'version_count')

      self.version_count = attributes[:'version_count'] if attributes[:'version_count']

      self.invalidations = attributes[:'invalidations'] if attributes[:'invalidations']

      self.obsolete_count = attributes[:'obsoleteCount'] if attributes[:'obsoleteCount']

      raise 'You cannot provide both :obsoleteCount and :obsolete_count' if attributes.key?(:'obsoleteCount') && attributes.key?(:'obsolete_count')

      self.obsolete_count = attributes[:'obsolete_count'] if attributes[:'obsolete_count']

      self.px_servers_executions = attributes[:'pxServersExecutions'] if attributes[:'pxServersExecutions']

      raise 'You cannot provide both :pxServersExecutions and :px_servers_executions' if attributes.key?(:'pxServersExecutions') && attributes.key?(:'px_servers_executions')

      self.px_servers_executions = attributes[:'px_servers_executions'] if attributes[:'px_servers_executions']

      self.cpu_time_in_us = attributes[:'cpuTimeInUs'] if attributes[:'cpuTimeInUs']

      raise 'You cannot provide both :cpuTimeInUs and :cpu_time_in_us' if attributes.key?(:'cpuTimeInUs') && attributes.key?(:'cpu_time_in_us')

      self.cpu_time_in_us = attributes[:'cpu_time_in_us'] if attributes[:'cpu_time_in_us']

      self.elapsed_time_in_us = attributes[:'elapsedTimeInUs'] if attributes[:'elapsedTimeInUs']

      raise 'You cannot provide both :elapsedTimeInUs and :elapsed_time_in_us' if attributes.key?(:'elapsedTimeInUs') && attributes.key?(:'elapsed_time_in_us')

      self.elapsed_time_in_us = attributes[:'elapsed_time_in_us'] if attributes[:'elapsed_time_in_us']

      self.avg_hard_parse_time_in_us = attributes[:'avgHardParseTimeInUs'] if attributes[:'avgHardParseTimeInUs']

      raise 'You cannot provide both :avgHardParseTimeInUs and :avg_hard_parse_time_in_us' if attributes.key?(:'avgHardParseTimeInUs') && attributes.key?(:'avg_hard_parse_time_in_us')

      self.avg_hard_parse_time_in_us = attributes[:'avg_hard_parse_time_in_us'] if attributes[:'avg_hard_parse_time_in_us']

      self.concurrency_wait_time_in_us = attributes[:'concurrencyWaitTimeInUs'] if attributes[:'concurrencyWaitTimeInUs']

      raise 'You cannot provide both :concurrencyWaitTimeInUs and :concurrency_wait_time_in_us' if attributes.key?(:'concurrencyWaitTimeInUs') && attributes.key?(:'concurrency_wait_time_in_us')

      self.concurrency_wait_time_in_us = attributes[:'concurrency_wait_time_in_us'] if attributes[:'concurrency_wait_time_in_us']

      self.application_wait_time_in_us = attributes[:'applicationWaitTimeInUs'] if attributes[:'applicationWaitTimeInUs']

      raise 'You cannot provide both :applicationWaitTimeInUs and :application_wait_time_in_us' if attributes.key?(:'applicationWaitTimeInUs') && attributes.key?(:'application_wait_time_in_us')

      self.application_wait_time_in_us = attributes[:'application_wait_time_in_us'] if attributes[:'application_wait_time_in_us']

      self.cluster_wait_time_in_us = attributes[:'clusterWaitTimeInUs'] if attributes[:'clusterWaitTimeInUs']

      raise 'You cannot provide both :clusterWaitTimeInUs and :cluster_wait_time_in_us' if attributes.key?(:'clusterWaitTimeInUs') && attributes.key?(:'cluster_wait_time_in_us')

      self.cluster_wait_time_in_us = attributes[:'cluster_wait_time_in_us'] if attributes[:'cluster_wait_time_in_us']

      self.user_io_wait_time_in_us = attributes[:'userIoWaitTimeInUs'] if attributes[:'userIoWaitTimeInUs']

      raise 'You cannot provide both :userIoWaitTimeInUs and :user_io_wait_time_in_us' if attributes.key?(:'userIoWaitTimeInUs') && attributes.key?(:'user_io_wait_time_in_us')

      self.user_io_wait_time_in_us = attributes[:'user_io_wait_time_in_us'] if attributes[:'user_io_wait_time_in_us']

      self.plsql_exec_time_in_us = attributes[:'plsqlExecTimeInUs'] if attributes[:'plsqlExecTimeInUs']

      raise 'You cannot provide both :plsqlExecTimeInUs and :plsql_exec_time_in_us' if attributes.key?(:'plsqlExecTimeInUs') && attributes.key?(:'plsql_exec_time_in_us')

      self.plsql_exec_time_in_us = attributes[:'plsql_exec_time_in_us'] if attributes[:'plsql_exec_time_in_us']

      self.java_exec_time_in_us = attributes[:'javaExecTimeInUs'] if attributes[:'javaExecTimeInUs']

      raise 'You cannot provide both :javaExecTimeInUs and :java_exec_time_in_us' if attributes.key?(:'javaExecTimeInUs') && attributes.key?(:'java_exec_time_in_us')

      self.java_exec_time_in_us = attributes[:'java_exec_time_in_us'] if attributes[:'java_exec_time_in_us']

      self.sorts = attributes[:'sorts'] if attributes[:'sorts']

      self.sharable_mem = attributes[:'sharableMem'] if attributes[:'sharableMem']

      raise 'You cannot provide both :sharableMem and :sharable_mem' if attributes.key?(:'sharableMem') && attributes.key?(:'sharable_mem')

      self.sharable_mem = attributes[:'sharable_mem'] if attributes[:'sharable_mem']

      self.total_sharable_mem = attributes[:'totalSharableMem'] if attributes[:'totalSharableMem']

      raise 'You cannot provide both :totalSharableMem and :total_sharable_mem' if attributes.key?(:'totalSharableMem') && attributes.key?(:'total_sharable_mem')

      self.total_sharable_mem = attributes[:'total_sharable_mem'] if attributes[:'total_sharable_mem']

      self.type_check_mem = attributes[:'typeCheckMem'] if attributes[:'typeCheckMem']

      raise 'You cannot provide both :typeCheckMem and :type_check_mem' if attributes.key?(:'typeCheckMem') && attributes.key?(:'type_check_mem')

      self.type_check_mem = attributes[:'type_check_mem'] if attributes[:'type_check_mem']

      self.io_cell_offload_eligible_bytes = attributes[:'ioCellOffloadEligibleBytes'] if attributes[:'ioCellOffloadEligibleBytes']

      raise 'You cannot provide both :ioCellOffloadEligibleBytes and :io_cell_offload_eligible_bytes' if attributes.key?(:'ioCellOffloadEligibleBytes') && attributes.key?(:'io_cell_offload_eligible_bytes')

      self.io_cell_offload_eligible_bytes = attributes[:'io_cell_offload_eligible_bytes'] if attributes[:'io_cell_offload_eligible_bytes']

      self.io_interconnect_bytes = attributes[:'ioInterconnectBytes'] if attributes[:'ioInterconnectBytes']

      raise 'You cannot provide both :ioInterconnectBytes and :io_interconnect_bytes' if attributes.key?(:'ioInterconnectBytes') && attributes.key?(:'io_interconnect_bytes')

      self.io_interconnect_bytes = attributes[:'io_interconnect_bytes'] if attributes[:'io_interconnect_bytes']

      self.physical_read_requests = attributes[:'physicalReadRequests'] if attributes[:'physicalReadRequests']

      raise 'You cannot provide both :physicalReadRequests and :physical_read_requests' if attributes.key?(:'physicalReadRequests') && attributes.key?(:'physical_read_requests')

      self.physical_read_requests = attributes[:'physical_read_requests'] if attributes[:'physical_read_requests']

      self.physical_read_bytes = attributes[:'physicalReadBytes'] if attributes[:'physicalReadBytes']

      raise 'You cannot provide both :physicalReadBytes and :physical_read_bytes' if attributes.key?(:'physicalReadBytes') && attributes.key?(:'physical_read_bytes')

      self.physical_read_bytes = attributes[:'physical_read_bytes'] if attributes[:'physical_read_bytes']

      self.physical_write_requests = attributes[:'physicalWriteRequests'] if attributes[:'physicalWriteRequests']

      raise 'You cannot provide both :physicalWriteRequests and :physical_write_requests' if attributes.key?(:'physicalWriteRequests') && attributes.key?(:'physical_write_requests')

      self.physical_write_requests = attributes[:'physical_write_requests'] if attributes[:'physical_write_requests']

      self.physical_write_bytes = attributes[:'physicalWriteBytes'] if attributes[:'physicalWriteBytes']

      raise 'You cannot provide both :physicalWriteBytes and :physical_write_bytes' if attributes.key?(:'physicalWriteBytes') && attributes.key?(:'physical_write_bytes')

      self.physical_write_bytes = attributes[:'physical_write_bytes'] if attributes[:'physical_write_bytes']

      self.exact_matching_signature = attributes[:'exactMatchingSignature'] if attributes[:'exactMatchingSignature']

      raise 'You cannot provide both :exactMatchingSignature and :exact_matching_signature' if attributes.key?(:'exactMatchingSignature') && attributes.key?(:'exact_matching_signature')

      self.exact_matching_signature = attributes[:'exact_matching_signature'] if attributes[:'exact_matching_signature']

      self.force_matching_signature = attributes[:'forceMatchingSignature'] if attributes[:'forceMatchingSignature']

      raise 'You cannot provide both :forceMatchingSignature and :force_matching_signature' if attributes.key?(:'forceMatchingSignature') && attributes.key?(:'force_matching_signature')

      self.force_matching_signature = attributes[:'force_matching_signature'] if attributes[:'force_matching_signature']

      self.io_cell_uncompressed_bytes = attributes[:'ioCellUncompressedBytes'] if attributes[:'ioCellUncompressedBytes']

      raise 'You cannot provide both :ioCellUncompressedBytes and :io_cell_uncompressed_bytes' if attributes.key?(:'ioCellUncompressedBytes') && attributes.key?(:'io_cell_uncompressed_bytes')

      self.io_cell_uncompressed_bytes = attributes[:'io_cell_uncompressed_bytes'] if attributes[:'io_cell_uncompressed_bytes']

      self.io_cell_offload_returned_bytes = attributes[:'ioCellOffloadReturnedBytes'] if attributes[:'ioCellOffloadReturnedBytes']

      raise 'You cannot provide both :ioCellOffloadReturnedBytes and :io_cell_offload_returned_bytes' if attributes.key?(:'ioCellOffloadReturnedBytes') && attributes.key?(:'io_cell_offload_returned_bytes')

      self.io_cell_offload_returned_bytes = attributes[:'io_cell_offload_returned_bytes'] if attributes[:'io_cell_offload_returned_bytes']

      self.child_number = attributes[:'childNumber'] if attributes[:'childNumber']

      raise 'You cannot provide both :childNumber and :child_number' if attributes.key?(:'childNumber') && attributes.key?(:'child_number')

      self.child_number = attributes[:'child_number'] if attributes[:'child_number']

      self.command_type = attributes[:'commandType'] if attributes[:'commandType']

      raise 'You cannot provide both :commandType and :command_type' if attributes.key?(:'commandType') && attributes.key?(:'command_type')

      self.command_type = attributes[:'command_type'] if attributes[:'command_type']

      self.users_opening = attributes[:'usersOpening'] if attributes[:'usersOpening']

      raise 'You cannot provide both :usersOpening and :users_opening' if attributes.key?(:'usersOpening') && attributes.key?(:'users_opening')

      self.users_opening = attributes[:'users_opening'] if attributes[:'users_opening']

      self.users_executing = attributes[:'usersExecuting'] if attributes[:'usersExecuting']

      raise 'You cannot provide both :usersExecuting and :users_executing' if attributes.key?(:'usersExecuting') && attributes.key?(:'users_executing')

      self.users_executing = attributes[:'users_executing'] if attributes[:'users_executing']

      self.optimizer_cost = attributes[:'optimizerCost'] if attributes[:'optimizerCost']

      raise 'You cannot provide both :optimizerCost and :optimizer_cost' if attributes.key?(:'optimizerCost') && attributes.key?(:'optimizer_cost')

      self.optimizer_cost = attributes[:'optimizer_cost'] if attributes[:'optimizer_cost']

      self.full_plan_hash_value = attributes[:'fullPlanHashValue'] if attributes[:'fullPlanHashValue']

      raise 'You cannot provide both :fullPlanHashValue and :full_plan_hash_value' if attributes.key?(:'fullPlanHashValue') && attributes.key?(:'full_plan_hash_value')

      self.full_plan_hash_value = attributes[:'full_plan_hash_value'] if attributes[:'full_plan_hash_value']

      self._module = attributes[:'module'] if attributes[:'module']

      raise 'You cannot provide both :module and :_module' if attributes.key?(:'module') && attributes.key?(:'_module')

      self._module = attributes[:'_module'] if attributes[:'_module']

      self.service = attributes[:'service'] if attributes[:'service']

      self.action = attributes[:'action'] if attributes[:'action']

      self.sql_profile = attributes[:'sqlProfile'] if attributes[:'sqlProfile']

      raise 'You cannot provide both :sqlProfile and :sql_profile' if attributes.key?(:'sqlProfile') && attributes.key?(:'sql_profile')

      self.sql_profile = attributes[:'sql_profile'] if attributes[:'sql_profile']

      self.sql_patch = attributes[:'sqlPatch'] if attributes[:'sqlPatch']

      raise 'You cannot provide both :sqlPatch and :sql_patch' if attributes.key?(:'sqlPatch') && attributes.key?(:'sql_patch')

      self.sql_patch = attributes[:'sql_patch'] if attributes[:'sql_patch']

      self.sql_plan_baseline = attributes[:'sqlPlanBaseline'] if attributes[:'sqlPlanBaseline']

      raise 'You cannot provide both :sqlPlanBaseline and :sql_plan_baseline' if attributes.key?(:'sqlPlanBaseline') && attributes.key?(:'sql_plan_baseline')

      self.sql_plan_baseline = attributes[:'sql_plan_baseline'] if attributes[:'sql_plan_baseline']

      self.delta_execution_count = attributes[:'deltaExecutionCount'] if attributes[:'deltaExecutionCount']

      raise 'You cannot provide both :deltaExecutionCount and :delta_execution_count' if attributes.key?(:'deltaExecutionCount') && attributes.key?(:'delta_execution_count')

      self.delta_execution_count = attributes[:'delta_execution_count'] if attributes[:'delta_execution_count']

      self.delta_cpu_time = attributes[:'deltaCpuTime'] if attributes[:'deltaCpuTime']

      raise 'You cannot provide both :deltaCpuTime and :delta_cpu_time' if attributes.key?(:'deltaCpuTime') && attributes.key?(:'delta_cpu_time')

      self.delta_cpu_time = attributes[:'delta_cpu_time'] if attributes[:'delta_cpu_time']

      self.delta_io_bytes = attributes[:'deltaIoBytes'] if attributes[:'deltaIoBytes']

      raise 'You cannot provide both :deltaIoBytes and :delta_io_bytes' if attributes.key?(:'deltaIoBytes') && attributes.key?(:'delta_io_bytes')

      self.delta_io_bytes = attributes[:'delta_io_bytes'] if attributes[:'delta_io_bytes']

      self.delta_cpu_rank = attributes[:'deltaCpuRank'] if attributes[:'deltaCpuRank']

      raise 'You cannot provide both :deltaCpuRank and :delta_cpu_rank' if attributes.key?(:'deltaCpuRank') && attributes.key?(:'delta_cpu_rank')

      self.delta_cpu_rank = attributes[:'delta_cpu_rank'] if attributes[:'delta_cpu_rank']

      self.delta_execs_rank = attributes[:'deltaExecsRank'] if attributes[:'deltaExecsRank']

      raise 'You cannot provide both :deltaExecsRank and :delta_execs_rank' if attributes.key?(:'deltaExecsRank') && attributes.key?(:'delta_execs_rank')

      self.delta_execs_rank = attributes[:'delta_execs_rank'] if attributes[:'delta_execs_rank']

      self.sharable_mem_rank = attributes[:'sharableMemRank'] if attributes[:'sharableMemRank']

      raise 'You cannot provide both :sharableMemRank and :sharable_mem_rank' if attributes.key?(:'sharableMemRank') && attributes.key?(:'sharable_mem_rank')

      self.sharable_mem_rank = attributes[:'sharable_mem_rank'] if attributes[:'sharable_mem_rank']

      self.delta_io_rank = attributes[:'deltaIoRank'] if attributes[:'deltaIoRank']

      raise 'You cannot provide both :deltaIoRank and :delta_io_rank' if attributes.key?(:'deltaIoRank') && attributes.key?(:'delta_io_rank')

      self.delta_io_rank = attributes[:'delta_io_rank'] if attributes[:'delta_io_rank']

      self.harmonic_sum = attributes[:'harmonicSum'] if attributes[:'harmonicSum']

      raise 'You cannot provide both :harmonicSum and :harmonic_sum' if attributes.key?(:'harmonicSum') && attributes.key?(:'harmonic_sum')

      self.harmonic_sum = attributes[:'harmonic_sum'] if attributes[:'harmonic_sum']

      self.wt_harmonic_sum = attributes[:'wtHarmonicSum'] if attributes[:'wtHarmonicSum']

      raise 'You cannot provide both :wtHarmonicSum and :wt_harmonic_sum' if attributes.key?(:'wtHarmonicSum') && attributes.key?(:'wt_harmonic_sum')

      self.wt_harmonic_sum = attributes[:'wt_harmonic_sum'] if attributes[:'wt_harmonic_sum']

      self.total_sql_count = attributes[:'totalSqlCount'] if attributes[:'totalSqlCount']

      raise 'You cannot provide both :totalSqlCount and :total_sql_count' if attributes.key?(:'totalSqlCount') && attributes.key?(:'total_sql_count')

      self.total_sql_count = attributes[:'total_sql_count'] if attributes[:'total_sql_count']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        sql_identifier == other.sql_identifier &&
        plan_hash_value == other.plan_hash_value &&
        time_collected == other.time_collected &&
        instance_name == other.instance_name &&
        last_active_time == other.last_active_time &&
        parse_calls == other.parse_calls &&
        disk_reads == other.disk_reads &&
        direct_reads == other.direct_reads &&
        direct_writes == other.direct_writes &&
        buffer_gets == other.buffer_gets &&
        rows_processed == other.rows_processed &&
        serializable_aborts == other.serializable_aborts &&
        fetches == other.fetches &&
        executions == other.executions &&
        avoided_executions == other.avoided_executions &&
        end_of_fetch_count == other.end_of_fetch_count &&
        loads == other.loads &&
        version_count == other.version_count &&
        invalidations == other.invalidations &&
        obsolete_count == other.obsolete_count &&
        px_servers_executions == other.px_servers_executions &&
        cpu_time_in_us == other.cpu_time_in_us &&
        elapsed_time_in_us == other.elapsed_time_in_us &&
        avg_hard_parse_time_in_us == other.avg_hard_parse_time_in_us &&
        concurrency_wait_time_in_us == other.concurrency_wait_time_in_us &&
        application_wait_time_in_us == other.application_wait_time_in_us &&
        cluster_wait_time_in_us == other.cluster_wait_time_in_us &&
        user_io_wait_time_in_us == other.user_io_wait_time_in_us &&
        plsql_exec_time_in_us == other.plsql_exec_time_in_us &&
        java_exec_time_in_us == other.java_exec_time_in_us &&
        sorts == other.sorts &&
        sharable_mem == other.sharable_mem &&
        total_sharable_mem == other.total_sharable_mem &&
        type_check_mem == other.type_check_mem &&
        io_cell_offload_eligible_bytes == other.io_cell_offload_eligible_bytes &&
        io_interconnect_bytes == other.io_interconnect_bytes &&
        physical_read_requests == other.physical_read_requests &&
        physical_read_bytes == other.physical_read_bytes &&
        physical_write_requests == other.physical_write_requests &&
        physical_write_bytes == other.physical_write_bytes &&
        exact_matching_signature == other.exact_matching_signature &&
        force_matching_signature == other.force_matching_signature &&
        io_cell_uncompressed_bytes == other.io_cell_uncompressed_bytes &&
        io_cell_offload_returned_bytes == other.io_cell_offload_returned_bytes &&
        child_number == other.child_number &&
        command_type == other.command_type &&
        users_opening == other.users_opening &&
        users_executing == other.users_executing &&
        optimizer_cost == other.optimizer_cost &&
        full_plan_hash_value == other.full_plan_hash_value &&
        _module == other._module &&
        service == other.service &&
        action == other.action &&
        sql_profile == other.sql_profile &&
        sql_patch == other.sql_patch &&
        sql_plan_baseline == other.sql_plan_baseline &&
        delta_execution_count == other.delta_execution_count &&
        delta_cpu_time == other.delta_cpu_time &&
        delta_io_bytes == other.delta_io_bytes &&
        delta_cpu_rank == other.delta_cpu_rank &&
        delta_execs_rank == other.delta_execs_rank &&
        sharable_mem_rank == other.sharable_mem_rank &&
        delta_io_rank == other.delta_io_rank &&
        harmonic_sum == other.harmonic_sum &&
        wt_harmonic_sum == other.wt_harmonic_sum &&
        total_sql_count == other.total_sql_count
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
      [sql_identifier, plan_hash_value, time_collected, instance_name, last_active_time, parse_calls, disk_reads, direct_reads, direct_writes, buffer_gets, rows_processed, serializable_aborts, fetches, executions, avoided_executions, end_of_fetch_count, loads, version_count, invalidations, obsolete_count, px_servers_executions, cpu_time_in_us, elapsed_time_in_us, avg_hard_parse_time_in_us, concurrency_wait_time_in_us, application_wait_time_in_us, cluster_wait_time_in_us, user_io_wait_time_in_us, plsql_exec_time_in_us, java_exec_time_in_us, sorts, sharable_mem, total_sharable_mem, type_check_mem, io_cell_offload_eligible_bytes, io_interconnect_bytes, physical_read_requests, physical_read_bytes, physical_write_requests, physical_write_bytes, exact_matching_signature, force_matching_signature, io_cell_uncompressed_bytes, io_cell_offload_returned_bytes, child_number, command_type, users_opening, users_executing, optimizer_cost, full_plan_hash_value, _module, service, action, sql_profile, sql_patch, sql_plan_baseline, delta_execution_count, delta_cpu_time, delta_io_bytes, delta_cpu_rank, delta_execs_rank, sharable_mem_rank, delta_io_rank, harmonic_sum, wt_harmonic_sum, total_sql_count].hash
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
